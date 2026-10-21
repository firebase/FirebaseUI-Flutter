// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/foundation.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';

import 'theme.dart';

/// A Firebase UI Auth provider which should be used to add Apple Sign In
/// to your app.
///
/// It is recommended to check if the current platform supports Apple Sign In.
/// This could be achieved with `device_info_plus` package.
///
/// ```dart
/// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
/// import 'package:device_info_plus/device_info_plus.dart';
///
/// Future<void> main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///
///   final deviceInfo = DeviceInfoPlugin();
///   final iosInfo = await deviceInfo.iosInfo;
///
///   FirebaseUIAuth.configureProviders([
///     if ((double.tryParse(iosInfo.systemVersion) ?? 0) >= 13) AppleProvider(),
///   ]);
///
///   runApp(MyApp());
/// }
class AppleProvider extends OAuthProvider {
  @override
  final providerId = 'apple.com';

  @override
  final style = const AppleProviderButtonStyle();

  /// {@template ui.auth.oauth.apple_provider.scopes}
  /// The scopes that will be passed down to the [fba.AppleAuthProvider].
  /// {@endtemplate}
  final Set<String> scopes;

  @override
  fba.AppleAuthProvider firebaseAuthProvider = fba.AppleAuthProvider();

  AppleProvider({
    /// {@macro ui.auth.oauth.apple_provider.scopes}
    this.scopes = const <String>{'email'},
  }) {
    scopes.forEach(firebaseAuthProvider.addScope);
  }

  @override
  void mobileSignIn(AuthAction action) {
    authListener.onBeforeSignIn();

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
          fba.FirebaseAuthException(
            code: 'no-current-user',
            message:
                'AuthAction.link requires a signed in user to link the '
                'Apple credential to, but FirebaseAuth.currentUser is null.',
          ),
        );
        return;
      }

      currentUser
          .linkWithProvider(firebaseAuthProvider)
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
  void desktopSignIn(AuthAction action) {
    mobileSignIn(action);
  }

  @override
  ProviderArgs get desktopSignInArgs => throw UnimplementedError();

  @override
  fba.OAuthCredential fromDesktopAuthResult(AuthResult result) {
    throw UnimplementedError();
  }

  @override
  Future<void> logOutProvider() {
    return SynchronousFuture(null);
  }

  @override
  bool supportsPlatform(TargetPlatform platform) {
    return kIsWeb ||
        platform == TargetPlatform.android ||
        platform == TargetPlatform.iOS ||
        platform == TargetPlatform.macOS;
  }

  void _onLinked(fba.UserCredential userCredential) {
    final credential = userCredential.credential;

    // Nullable on every platform, and a force unwrap here would throw inside
    // .then, reaching onError as an Error and hanging the flow.
    if (credential == null) {
      authListener.onError(
        fba.FirebaseAuthException(
          code: 'missing-credential',
          message:
              'The Apple account was linked, but Firebase returned no '
              'credential for it.',
        ),
      );
      return;
    }

    authListener.onCredentialLinked(credential);
  }
}
