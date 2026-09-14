// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

import 'oauth/auth_result.dart';
import 'oauth/provider_args.dart';
import 'oauth_provider.dart';

/// flutter_web_auth_2 can only match an `https` callback URL by host/path
/// (rather than completing on the first `https` navigation it sees) from
/// macOS 14.4 onward. Below that, desktop OAuth sign-in via the Firebase
/// hosted auth handler is not reliable.
/// See https://pub.dev/packages/flutter_web_auth_2.
bool _macOSSupportsHttpsCallbackMatching() {
  final match = RegExp(
    r'(\d+)\.(\d+)',
  ).firstMatch(Platform.operatingSystemVersion);
  if (match == null) return false;

  final major = int.parse(match.group(1)!);
  final minor = int.parse(match.group(2)!);
  return major > 14 || (major == 14 && minor >= 4);
}

/// {@template ui.oauth.platform_sign_in_mixin}
/// A helper mixin that implements the platform-specific sign-in logic.
/// {@endtemplate}
mixin PlatformSignInMixin {
  OAuthListener get authListener;
  ProviderArgs get desktopSignInArgs;
  dynamic get firebaseAuthProvider;

  /// Creates [OAuthCredential] based on [AuthResult].
  fba.OAuthCredential fromDesktopAuthResult(AuthResult result);

  /// {@macro ui.auth.auth_provider.on_credential_received}
  void onCredentialReceived(fba.OAuthCredential credential, AuthAction action);

  /// {@template ui.oauth.platform_sign_in_mixin.platform_sign_in}
  /// Redirects the flow to the [mobileSignIn] or [desktopSignIn] based
  /// on current platform.
  /// {@endtemplate}
  void platformSignIn(TargetPlatform platform, AuthAction action) {
    if (platform == TargetPlatform.android || platform == TargetPlatform.iOS) {
      mobileSignIn(action);
    } else {
      desktopSignIn(action);
    }
  }

  /// Handles authentication logic on desktop platforms
  void desktopSignIn(AuthAction action) async {
    try {
      final args = desktopSignInArgs;
      final redirectUri = Uri.parse(args.redirectUri);
      final isHttpsCallback = redirectUri.scheme == 'https';

      if (isHttpsCallback &&
          defaultTargetPlatform == TargetPlatform.macOS &&
          !_macOSSupportsHttpsCallbackMatching()) {
        throw UnsupportedError(
          'Desktop OAuth sign-in requires macOS 14.4 or later. Below that '
          "version, flutter_web_auth_2 can't reliably match the OAuth "
          'callback URL and the sign-in flow would silently fail.',
        );
      }

      final signInUri = await args.buildSignInUri();

      final callbackUrl = await FlutterWebAuth2.authenticate(
        url: signInUri,
        callbackUrlScheme: redirectUri.scheme,
        options: FlutterWebAuth2Options(
          // httpsHost/httpsPath only apply to `https` callbacks (Universal
          // Links); passing them for a custom-scheme redirectUri would send
          // its (empty) host/path as if they were meaningful HTTPS values.
          httpsHost: isHttpsCallback ? redirectUri.host : null,
          httpsPath: isHttpsCallback ? redirectUri.path : null,
          useWebview: true,
        ),
      );

      final value = await args.authorizeFromCallback(callbackUrl);
      if (value == null) throw AuthCancelledException();

      final oauthCredential = fromDesktopAuthResult(value);
      onCredentialReceived(oauthCredential, action);
    } on PlatformException catch (err) {
      if (err.code == 'CANCELED') {
        authListener.onCanceled();
        return;
      }

      authListener.onError(err);
    } catch (err) {
      if (err is AuthCancelledException) {
        authListener.onCanceled();
        return;
      }

      authListener.onError(err);
    }
  }

  /// Handles authentication logic on mobile platforms.
  void mobileSignIn(AuthAction action);
}
