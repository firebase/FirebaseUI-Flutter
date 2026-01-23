// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/widgets.dart';

/// {@template ui.auth.auth_action}
/// An authentication action to perform.
/// {@endtemplate}
enum AuthAction {
  /// Performs user sign in
  signIn,

  /// Creates a new account with for a provided credential
  signUp,

  /// Links a provided credential with currently signed in user account
  link,

  /// Disables automatic credential handling.
  /// It's up to the user to decide what to do with the obtained credential.
  none,
}

/// An abstract class that should be implemented by auth controllers of
/// respective auth providers.
///
/// See also:
/// * [EmailAuthController]
/// * [EmailLinkAuthController]
/// * [OAuthController]
/// * [PhoneAuthController]
/// * [UniversalEmailSignInController]
abstract class AuthController {
  /// Looks up an instance of controller of type T.
  /// This method should be called only inside widgets that have
  /// an [AuthFlowBuilder] as an ancestor.
  static T ofType<T extends AuthController>(BuildContext context) {
    final ctrl = context
        .dependOnInheritedWidgetOfExactType<AuthControllerProvider>()
        ?.ctrl;

    if (ctrl == null || ctrl is! T) {
      throw Exception(
        'No controller of type $T found. '
        'Make sure to wrap your code with AuthFlowBuilder<$T>',
      );
    }

    return ctrl;
  }

  /// {@macro ui.auth.auth_action}
  AuthAction get action;

  /// {@template ui.auth.auth_controller.auth}
  /// The [FirebaseAuth] instance used to perform authentication against.
  /// By default, [FirebaseAuth.instance] is used.
  /// {@endtemplate}
  fba.FirebaseAuth get auth;

  /// {@template ui.auth.auth_controller.reset}
  /// Resets the controller to initial state.
  /// Usuall called when user cancels the authentication flow.
  /// {@endtemplate}
  void reset();
}

class AuthControllerProvider extends InheritedWidget {
  /// {@macro ui.auth.auth_action}
  final AuthAction action;

  /// An instance of controller to provide down the widget tree.
  final AuthController ctrl;

  const AuthControllerProvider({
    super.key,

    /// {@macro flutter.widgets.ProxyWidget.child}
    required super.child,
    required this.action,
    required this.ctrl,
  });

  @override
  bool updateShouldNotify(AuthControllerProvider oldWidget) {
    return ctrl != oldWidget.ctrl || action != oldWidget.action;
  }
}

/// A widget that provides an instance of [fba.FirebaseAuth] down the widget tree.
class FirebaseAuthProvider extends InheritedWidget {
  /// An instance of [fba.FirebaseAuth] to provide.
  final fba.FirebaseAuth auth;

  const FirebaseAuthProvider({
    super.key,
    required this.auth,
    required super.child,
  });

  @override
  bool updateShouldNotify(FirebaseAuthProvider oldWidget) {
    return auth != oldWidget.auth;
  }

  /// Looks up an instance of [fba.FirebaseAuth] in the widget tree.
  static fba.FirebaseAuth? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FirebaseAuthProvider>()
        ?.auth;
  }

  /// Looks up an instance of [fba.FirebaseAuth] in the widget tree without
  /// registering a dependency.
  static fba.FirebaseAuth? findAuth(BuildContext context) {
    return context.getInheritedWidgetOfExactType<FirebaseAuthProvider>()?.auth;
  }

  /// Looks up an instance of [fba.FirebaseAuth] in the widget tree.
  /// Throws an [Exception] if no [FirebaseAuthProvider] was found.
  static fba.FirebaseAuth of(BuildContext context) {
    final auth = maybeOf(context);

    if (auth == null) {
      throw Exception(
        'No FirebaseAuthProvider found. '
        'Make sure to wrap your code with FirebaseAuthProvider',
      );
    }

    return auth;
  }
}
