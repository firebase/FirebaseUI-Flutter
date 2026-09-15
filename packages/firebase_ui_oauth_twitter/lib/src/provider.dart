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
/// provider except Apple on macOS, so the desktop flow stays in place there.
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

  /// Whether both OAuth 1.0a credentials are usable.
  ///
  /// `String.fromEnvironment` yields an empty string rather than null when the
  /// define is absent, and that is the documented way to supply these, so an
  /// empty value has to count as missing too.
  bool get _hasDesktopCredentials =>
      (apiKey?.isNotEmpty ?? false) && (apiSecretKey?.isNotEmpty ?? false);

  @override
  TwitterSignInArgs get desktopSignInArgs {
    final apiKey = this.apiKey;
    final apiSecretKey = this.apiSecretKey;

    if (apiKey == null ||
        apiKey.isEmpty ||
        apiSecretKey == null ||
        apiSecretKey.isEmpty) {
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
    if (!(apiKey?.isNotEmpty ?? false) && !(apiSecretKey?.isNotEmpty ?? false)) {
      return;
    }

    _warnedAboutIgnoredKeys = true;

    debugPrint(
      'TwitterProvider: apiKey and apiSecretKey are ignored on '
      '$defaultTargetPlatform. Sign in is now performed by Firebase, which '
      'reads the Twitter API key and secret from the Firebase console. They '
      'are still used on macOS and Windows.\n'
      'If sign in fails, check that the Twitter app callback URL is '
      '"$defaultRedirectUri", and that you have added the '
      'Encoded App ID URL scheme (iOS) or your SHA-1 fingerprint '
      '(Android). See '
      'https://github.com/firebase/FirebaseUI-Flutter/blob/main/docs/firebase-ui-auth/providers/oauth.md#twitter-login',
    );
  }

  /// Whether [error] is the user dismissing the sign in sheet.
  ///
  /// The native SDKs surface this as a `FirebaseAuthException` rather than a
  /// cancellation, so it has to be recognised by code. Android reports the
  /// underlying `ERROR_`-prefixed constant while Apple platforms report the
  /// hyphenated form, and both spellings of "cancelled" are in use.
  bool _isUserCancellation(Object error) {
    if (error is! FirebaseAuthException) return false;

    var code = error.code.toLowerCase().replaceAll('_', '-');
    if (code.startsWith('error-')) code = code.substring('error-'.length);

    return const {
      'web-context-cancelled',
      'web-context-canceled',
      'user-cancelled',
      'user-canceled',
    }.contains(code);
  }

  void _onError(Object error) {
    if (_isUserCancellation(error)) {
      authListener.onCanceled();
      return;
    }

    authListener.onError(error);
  }

  @override
  void mobileSignIn(AuthAction action) {
    if (action == AuthAction.none) {
      // Reported rather than thrown: signIn() has already moved the flow into
      // its loading state, and an Error raised here would escape both
      // AuthFlow.onError and the button's handler, which catch only Exception,
      // leaving the button spinning forever.
      authListener.onError(
        FirebaseAuthException(
          code: 'unsupported-auth-action',
          message:
              'AuthAction.none is not supported by TwitterProvider on '
              '$defaultTargetPlatform. Firebase signs the user in as part of '
              'obtaining the credential, so the credential cannot be returned '
              'without also creating a session.',
        ),
      );
      return;
    }

    _warnIfKeysAreIgnored();

    // Linking is also used to upgrade an anonymous user, so that the
    // anonymous uid survives the sign in.
    if (action == AuthAction.link || shouldUpgradeAnonymous) {
      final currentUser = auth.currentUser;

      // Only AuthAction.link can reach this with no user, since
      // shouldUpgradeAnonymous is false when currentUser is null. Reporting it
      // matters because a null-shorting call would leave the flow stuck in its
      // loading state with no error and no completion.
      if (currentUser == null) {
        authListener.onError(
          FirebaseAuthException(
            code: 'no-current-user',
            message:
                'AuthAction.link requires a signed in user to link the '
                'Twitter credential to, but FirebaseAuth.currentUser is null.',
          ),
        );
        return;
      }

      currentUser
          .linkWithProvider(firebaseAuthProvider)
          .then(_onLinked)
          .catchError(_onError);
      return;
    }

    auth
        .signInWithProvider(firebaseAuthProvider)
        .then(authListener.onSignedIn)
        .catchError(_onError);
  }

  @override
  void desktopSignIn(AuthAction action) {
    // desktopSignInArgs is read synchronously by the desktop flow, outside any
    // error handling, so a throw there would escape as an Error and hang the
    // UI. Check first and report through the listener instead.
    if (!_hasDesktopCredentials) {
      authListener.onError(
        FirebaseAuthException(
          code: 'missing-oauth-credentials',
          message:
              'TwitterProvider.apiKey and TwitterProvider.apiSecretKey are '
              'required on $defaultTargetPlatform, which signs in using the '
              'OAuth 1.0a flow. Android and iOS use the Firebase native '
              'provider flow and do not need them.',
        ),
      );
      return;
    }

    super.desktopSignIn(action);
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
    final credential = userCredential.credential;

    // Nullable on every platform, and a force unwrap here would throw inside
    // .then, reaching onError as an Error and hanging the flow.
    if (credential == null) {
      authListener.onError(
        FirebaseAuthException(
          code: 'missing-credential',
          message:
              'The Twitter account was linked, but Firebase returned no '
              'credential for it.',
        ),
      );
      return;
    }

    authListener.onCredentialLinked(credential);
  }
}
