// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/foundation.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_ui_oauth_facebook/firebase_ui_oauth_facebook.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

class FacebookProvider extends OAuthProvider {
  @override
  final providerId = 'facebook.com';

  FacebookAuth provider = FacebookAuth.instance;
  final String clientId;
  final String? redirectUri;
  String? _rawNonce;

  @override
  final style = const FacebookProviderButtonStyle();

  @override
  late final ProviderArgs desktopSignInArgs = FacebookSignInArgs(
    clientId: clientId,
    redirectUri: redirectUri ?? defaultRedirectUri,
  );

  FacebookProvider({
    required this.clientId,
    this.redirectUri,
  });

  /// Generates a cryptographically secure random nonce for limited login
  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the SHA256 hash of the given string
  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Checks if tracking permission has been granted on iOS
  Future<bool> _hasTrackingPermission() async {
    // Only check on iOS
    if (defaultTargetPlatform != TargetPlatform.iOS) {
      return true; // Classic login available on Android
    }

    try {
      final status = await AppTrackingTransparency.trackingAuthorizationStatus;
      return status == TrackingStatus.authorized;
    } catch (e) {
      // If there's an error checking permission, default to limited login
      return false;
    }
  }

  void _handleResult(LoginResult result, AuthAction action) {
    switch (result.status) {
      case LoginStatus.success:
        final accessToken = result.accessToken;
        if (accessToken == null) {
          authListener.onError(Exception('Access token is null'));
          return;
        }

        fba.OAuthCredential credential;

        // Check the token type to determine if it's classic or limited login
        if (accessToken.type == AccessTokenType.classic) {
          // Classic login - use access token
          credential =
              fba.FacebookAuthProvider.credential(accessToken.tokenString);
        } else if (accessToken.type == AccessTokenType.limited) {
          // Limited login - use ID token with nonce
          if (_rawNonce == null) {
            authListener.onError(
              Exception('Nonce not generated for limited login'),
            );
            return;
          }
          credential = fba.OAuthProvider(providerId).credential(
            idToken: accessToken.tokenString,
            rawNonce: _rawNonce,
          );
        } else {
          authListener.onError(
            Exception('Unknown access token type: ${accessToken.type}'),
          );
          return;
        }

        onCredentialReceived(credential, action);
        break;
      case LoginStatus.cancelled:
        authListener.onError(AuthCancelledException());
        break;
      case LoginStatus.failed:
        authListener.onError(Exception(result.message));
        break;
      case LoginStatus.operationInProgress:
        authListener.onError(
          Exception('Previous login request is not complete'),
        );
    }
  }

  @override
  OAuthCredential fromDesktopAuthResult(AuthResult result) {
    return fba.FacebookAuthProvider.credential(result.accessToken!);
  }

  @override
  fba.FacebookAuthProvider get firebaseAuthProvider =>
      fba.FacebookAuthProvider();

  @override
  Future<void> logOutProvider() async {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      await provider.logOut();
    }
  }

  @override
  void mobileSignIn(AuthAction action) async {
    try {
      // Check if tracking permission is granted
      final hasPermission = await _hasTrackingPermission();

      // Determine login tracking mode
      final loginTracking =
          hasPermission ? LoginTracking.enabled : LoginTracking.limited;

      // Generate nonce for limited login
      if (loginTracking == LoginTracking.limited) {
        _rawNonce = _generateNonce();
        final hashedNonce = _sha256ofString(_rawNonce!);

        // Perform login with nonce
        final result = await provider.login(
          permissions: ['email', 'public_profile'],
          loginTracking: loginTracking,
          nonce: hashedNonce,
        );
        _handleResult(result, action);
      } else {
        // Perform classic login without nonce
        final result = await provider.login(
          permissions: ['email', 'public_profile'],
          loginTracking: loginTracking,
        );
        _handleResult(result, action);
      }
    } catch (error) {
      authListener.onError(error);
    }
  }

  @override
  bool supportsPlatform(TargetPlatform platform) {
    return true;
  }
}

// Extension to expose private methods and fields for testing
extension FacebookProviderTestExtension on FacebookProvider {
  String generateNonceForTest([int length = 32]) {
    return _generateNonce(length);
  }

  String sha256ForTest(String input) {
    return _sha256ofString(input);
  }

  Future<bool> hasTrackingPermissionForTest() {
    return _hasTrackingPermission();
  }

  void handleResultForTest(LoginResult result, AuthAction action) {
    _handleResult(result, action);
  }

  void setRawNonceForTest(String? nonce) {
    _rawNonce = nonce;
  }
}
