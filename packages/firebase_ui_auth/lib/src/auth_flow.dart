// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_file: unnecessary_this

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

/// An exception that is being thrown when user cancels the authentication
/// process.
class AuthCancelledException implements Exception {
  AuthCancelledException([this.message = 'User has cancelled auth']);

  final String message;
}

/// {@template ui.auth.auth_flow}
/// A class that provides a current auth state given an [AuthProvider] and
/// implements shared authentication process logic.
///
/// Should be rarely used directly, use available implementations instead:
/// - [EmailAuthFlow]
/// - [EmailLinkFlow]
/// - [OAuthFlow]
/// - [PhoneAuthFlow]
///
/// See [AuthFlowBuilder] docs to learn how to wire up the auth flow with the
/// widget tree.
/// {@endtemplate}
class AuthFlow<T extends AuthProvider> extends ValueNotifier<AuthState>
    implements AuthController, AuthListener {
  @override
  fba.FirebaseAuth auth;

  /// An initial auth state. Usually [Uninitialized], but varies for different
  /// auth flows.
  final AuthState initialState;
  AuthAction? _action;
  final List<VoidCallback> _onDispose = [];

  final T _provider;

  @override
  T get provider => _provider..authListener = this;

  @override
  AuthAction get action {
    if (_action != null) {
      return _action!;
    }

    if (auth.currentUser != null) {
      return AuthAction.link;
    }

    return AuthAction.signIn;
  }

  /// Use this setter to override the autoresolved [AuthAction].
  /// Autoresolved action is [AuthAction.signIn] if there is no currently signed
  /// in user, [AuthAction.link] otherwise.
  set action(AuthAction value) {
    _action = value;
  }

  /// {@template ui.auth_flow.on_dispose}
  /// /// A callback that is being called when auth flow is complete and is being
  /// desposed (e.g. when [AuthFlowBuilder] widget is unmounteed from the widget
  /// tree).
  /// {@endtemplate}
  VoidCallback get onDispose {
    return () {
      for (var callback in _onDispose) {
        callback();
      }
    };
  }

  /// {@macro ui.auth_flow.on_dispose}
  set onDispose(VoidCallback callback) {
    _onDispose.add(callback);
  }

  /// {@macro ui.auth.auth_flow}
  AuthFlow({
    /// An initial [AuthState] of the auth flow
    required this.initialState,

    /// {@template ui.auth.auth_flow.ctor.provider}
    /// An [AuthProvider] that is used to authenticate the user.
    /// {@endtemplate}
    required T provider,

    /// {@macro ui.auth.auth_controller.auth}
    fba.FirebaseAuth? auth,

    /// {@macro ui.auth.auth_action}
    AuthAction? action,
  })  : auth = auth ?? fba.FirebaseAuth.instance,
        _action = action,
        _provider = provider,
        super(initialState) {
    _provider.authListener = this;
    _provider.auth = auth ?? fba.FirebaseAuth.instance;
  }

  @override
  void onCredentialReceived(fba.AuthCredential credential) {
    value = CredentialReceived(credential);
  }

  @override
  void onBeforeProvidersForEmailFetch() {
    value = const FetchingProvidersForEmail();
  }

  @override
  void onBeforeSignIn() {
    value = const SigningIn();
  }

  @override
  void onCredentialLinked(fba.AuthCredential credential) {
    value = CredentialLinked(credential, auth.currentUser!);
  }

  @override
  @Deprecated(
    'Email enumeration protection is on by default.'
    'Read more here https://cloud.google.com/identity-platform/docs/admin/email-enumeration-protection',
  )
  @override
  void onDifferentProvidersFound(
    String email,
    List<String> providers,
    fba.AuthCredential? credential,
  ) {
    value = DifferentSignInMethodsFound(
      email,
      providers,
      credential,
    );
  }

  @override
  void onSignedIn(fba.UserCredential credential) {
    if (credential.additionalUserInfo?.isNewUser ?? false) {
      value = UserCreated(credential);
    } else {
      value = SignedIn(credential.user);
    }
  }

  @override
  void reset() {
    value = initialState;
    onDispose();
  }

  @override
  void onError(Object error) {
    try {
      defaultOnAuthError(provider, error);
    } on AuthCancelledException {
      reset();
    } on Exception catch (err) {
      value = AuthFailed(err);
    }
  }

  @override
  void onCanceled() {
    value = initialState;
  }

  @override
  void onMFARequired(fba.MultiFactorResolver resolver) {
    value = MFARequired(resolver);
  }
}
