// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' hide OAuthProvider;
import 'package:flutter/foundation.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';

import 'theme.dart';

/// A Firebase UI Auth provider which should be used to add Twitter Sign In
/// to your app.
///
/// On Android and iOS the sign in flow is handled by Firebase itself via
/// [FirebaseAuth.signInWithProvider], so [apiKey] and [apiSecretKey] are not
/// needed: configure the Twitter provider in the Firebase console instead.
///
/// macOS and Windows still perform the OAuth 1.0a flow in-process and do
/// require [apiKey] and [apiSecretKey]. `signInWithProvider` rejects every
/// provider except Apple and Game Center on macOS, so the desktop flow stays
/// in place there.
class TwitterProvider extends OAuthProvider {
  @override
  final providerId = 'twitter.com';

  /// The Twitter API key.
  ///
  /// Only required on macOS and Windows, which perform the OAuth 1.0a flow
  /// in-process.
  final String? apiKey;

  /// The Twitter API secret key.
  ///
  /// Only required on macOS and Windows, which perform the OAuth 1.0a flow
  /// in-process.
  final String? apiSecretKey;

  final String? redirectUri;

  @override
  final style = const TwitterProviderButtonStyle();

  @override
  TwitterAuthProvider firebaseAuthProvider = TwitterAuthProvider();

  @override
  TwitterSignInArgs get desktopSignInArgs {
    final apiKey = this.apiKey;
    final apiSecretKey = this.apiSecretKey;

    if (apiKey == null || apiSecretKey == null) {
      throw ArgumentError(
        'TwitterProvider.apiKey and TwitterProvider.apiSecretKey are required '
        'on $defaultTargetPlatform, which signs in using the OAuth 1.0a flow. '
        'Android and iOS use the Firebase native provider flow and do not '
        'need them.',
      );
    }

    return TwitterSignInArgs(
      apiKey: apiKey,
      apiSecretKey: apiSecretKey,
      redirectUri: redirectUri ?? defaultRedirectUri,
    );
  }

  TwitterProvider({this.apiKey, this.apiSecretKey, this.redirectUri});

  bool _warnedAboutIgnoredKeys = false;

  /// Warns once, in debug builds, that [apiKey] and [apiSecretKey] no longer
  /// take part in sign in on the platforms that use the Firebase provider
  /// flow. Without this the change is silent: the app still compiles, and the
  /// first signal the developer gets is a sign in that fails in the browser.
  void _warnIfKeysAreIgnored() {
    if (!kDebugMode || _warnedAboutIgnoredKeys) return;
    if (apiKey == null && apiSecretKey == null) return;

    _warnedAboutIgnoredKeys = true;

    debugPrint(
      'TwitterProvider: apiKey and apiSecretKey are ignored on '
      '$defaultTargetPlatform. Sign in is now performed by Firebase, which '
      'reads the Twitter API key and secret from the Firebase console. They '
      'are still used on macOS and Windows.\n'
      'If sign in fails, check that the Twitter app callback URL is '
      '"${redirectUri ?? defaultRedirectUri}", and that you have added the '
      'Encoded App ID URL scheme (iOS) or your SHA-1 fingerprint '
      '(Android). See '
      'https://github.com/firebase/FirebaseUI-Flutter/blob/main/docs/firebase-ui-auth/providers/oauth.md#twitter-login',
    );
  }

  @override
  void mobileSignIn(AuthAction action) {
    if (action == AuthAction.none) {
      throw UnsupportedError(
        'AuthAction.none is not supported by TwitterProvider on '
        '$defaultTargetPlatform. Firebase signs the user in as part of '
        'obtaining the credential, so the credential cannot be returned '
        'without also creating a session.',
      );
    }

    _warnIfKeysAreIgnored();

    // Linking is also used to upgrade an anonymous user, so that the
    // anonymous uid survives the sign in.
    if (action == AuthAction.link || shouldUpgradeAnonymous) {
      auth.currentUser
          ?.linkWithProvider(firebaseAuthProvider)
          .then(_onLinked)
          .catchError(authListener.onError);
      return;
    }

    auth
        .signInWithProvider(firebaseAuthProvider)
        .then(authListener.onSignedIn)
        .catchError(authListener.onError);
  }

  @override
  OAuthCredential fromDesktopAuthResult(AuthResult result) {
    return TwitterAuthProvider.credential(
      accessToken: result.accessToken!,
      secret: result.tokenSecret!,
    );
  }

  @override
  Future<void> logOutProvider() {
    return SynchronousFuture(null);
  }

  @override
  bool supportsPlatform(TargetPlatform platform) {
    return true;
  }

  void _onLinked(UserCredential userCredential) {
    authListener.onCredentialLinked(userCredential.credential!);
  }
}
