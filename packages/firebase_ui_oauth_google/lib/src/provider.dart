// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/foundation.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleProvider extends OAuthProvider {
  @override
  final providerId = 'google.com';

  /// The Google client ID.
  /// Primarily required for desktop platforms.
  /// Ignored on Android and iOS (if `iOSPreferPlist` is true).
  final String clientId;

  /// The client ID of the web OAuth client associated with the app's
  /// server-side component, if any.
  ///
  /// On Android this is required to receive an ID token, unless the app uses
  /// `google-services.json` and it contains a web OAuth client entry, in
  /// which case the plugin reads the value from there.
  final String? serverClientId;

  /// When true, the Google Sign In plugin will use the GoogleService-Info.plist
  /// for configuration instead of the `clientId` parameter.
  final bool iOSPreferPlist;

  /// The redirect URL to use for the Google Sign In plugin.
  /// Required on desktop platforms.
  final String? redirectUri;

  /// The list of requested authorization scopes requested when signing in.
  final List<String>? scopes;

  /// The plugin instance. google_sign_in 7 exposes a single shared instance.
  /// Assignable so that tests can inject a mock.
  GoogleSignIn provider = GoogleSignIn.instance;

  // google_sign_in 7 requires initialize to be called exactly once, while
  // multiple GoogleProvider instances may be created (for example one per
  // GoogleSignInButton). The first instance to sign in configures the plugin.
  static Future<void>? _initialization;

  /// Resets the one-time initialization state.
  ///
  /// The plugin is initialized exactly once per process, so tests that inject
  /// a fresh mock in `setUp` must clear the cached future to stay isolated.
  @visibleForTesting
  static void debugReset() {
    _initialization = null;
  }

  @override
  final fba.GoogleAuthProvider firebaseAuthProvider = fba.GoogleAuthProvider();

  @override
  late final desktopSignInArgs = GoogleSignInArgs(
    clientId: clientId,
    redirectUri: redirectUri ?? defaultRedirectUri,
    scope: scopes != null
        ? scopes!.join(' ')
        : 'https://www.googleapis.com/auth/plus.login',
  );

  GoogleProvider({
    required this.clientId,
    this.serverClientId,
    this.redirectUri,
    this.scopes,
    this.iOSPreferPlist = false,
  }) {
    firebaseAuthProvider.setCustomParameters(const {
      'prompt': 'select_account',
    });
  }

  bool _ignoreClientId() {
    if (defaultTargetPlatform == TargetPlatform.android) return true;
    if (defaultTargetPlatform == TargetPlatform.iOS && iOSPreferPlist) {
      return true;
    }

    return false;
  }

  Future<void> _ensureInitialized() {
    return _initialization ??= provider.initialize(
      clientId: _ignoreClientId() ? null : clientId,
      serverClientId: serverClientId,
    ).catchError((Object err) {
      // Allow a later sign-in attempt to retry initialization instead of
      // rethrowing the same stale error forever.
      _initialization = null;
      throw err;
    });
  }

  @override
  void mobileSignIn(AuthAction action) async {
    final requestedScopes = scopes ?? const <String>[];

    try {
      await _ensureInitialized();

      final account = await provider.authenticate(scopeHint: requestedScopes);

      // Authentication and authorization are separate steps in
      // google_sign_in 7. Reuse an existing authorization when one is
      // available, otherwise prompt for the requested scopes so that the
      // credential carries an access token, matching the previous behavior.
      String? accessToken;
      if (requestedScopes.isNotEmpty) {
        final client = account.authorizationClient;
        final authorization =
            await client.authorizationForScopes(requestedScopes) ??
            await client.authorizeScopes(requestedScopes);
        accessToken = authorization.accessToken;
      }

      final credential = fba.GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: account.authentication.idToken,
      );

      onCredentialReceived(credential, action);
    } on GoogleSignInException catch (err) {
      if (err.code == GoogleSignInExceptionCode.canceled) {
        authListener.onError(AuthCancelledException());
      } else {
        authListener.onError(err);
      }
    } catch (err) {
      authListener.onError(err);
    }
  }

  @override
  void desktopSignIn(AuthAction action) {
    // google_sign_in supports macOS, so mobile auth flow works.
    if (defaultTargetPlatform == TargetPlatform.macOS) {
      mobileSignIn(action);
    } else {
      super.desktopSignIn(action);
    }
  }

  @override
  OAuthCredential fromDesktopAuthResult(AuthResult result) {
    return fba.GoogleAuthProvider.credential(
      idToken: result.idToken,
      accessToken: result.accessToken,
    );
  }

  @override
  Future<void> logOutProvider() async {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      await _ensureInitialized();
      await provider.signOut();
    }
  }

  @override
  final style = const GoogleProviderButtonStyle();

  @override
  bool supportsPlatform(TargetPlatform platform) {
    return true;
  }
}
