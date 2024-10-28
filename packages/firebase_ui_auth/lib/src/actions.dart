// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

/// An abstract class that all actions implement.
/// The following actions are available:
/// - [AuthStateChangeAction]
/// - [SignedOutAction]
/// - [AuthCancelledAction]
/// - [EmailLinkSignInAction]
/// - [VerifyPhoneAction]
/// - [SMSCodeRequestedAction]
/// - [EmailVerifiedAction]
/// - [ForgotPasswordAction]
/// = [AccountDeletedAction]
/// - [DisplayNameChangedAction]
abstract class FirebaseUIAction {
  /// Looks up an instance of an action of the type [T] provided
  /// via [FirebaseUIActions].
  static T? ofType<T extends FirebaseUIAction>(BuildContext context) {
    final w = FirebaseUIActions.maybeOf(context);

    if (w == null) return null;

    for (final action in w.actions) {
      if (action is T) return action;
    }

    return null;
  }
}

/// {@template ui.auth.actions.auth_state_change_action}
/// An action that is called when auth state changes.
/// You can capture any type of [AuthState] using this action.
///
/// For example, you can perform navigation after user has signed in:
///
/// ```dart
/// SignInScreen(
///   actions: [
///     AuthStateChangeAction<SignedIn>((context, state) {
///       Navigator.pushReplacementNamed(context, '/home');
///     }),
///   ],
/// );
/// ```
/// {@endtemplate}
class AuthStateChangeAction<T extends AuthState> extends FirebaseUIAction {
  /// A callback that is being called when underlying auth flow transitioned to
  /// a state of type [T].
  final void Function(BuildContext context, T state) callback;

  /// {@macro ui.auth.actions.auth_state_change_action}
  AuthStateChangeAction(this.callback);

  /// Verifies that a current [state] is a [T]
  bool matches(AuthState state) => state is T;

  /// Invokes the callback with the provided [context] and [state].
  void invoke(BuildContext context, T state) => callback(context, state);
}

/// {@template ui.auth.actions.signed_out_action}
/// An action that is being called when user has signed out.
/// {@endtemplate}
class SignedOutAction extends FirebaseUIAction {
  /// A callback that is being called when user has signed out.
  final void Function(BuildContext context) callback;

  /// {@macro ui.auth.actions.signed_out_action}
  SignedOutAction(this.callback);
}

/// {@template ui.auth.actions.cancel}
/// An action that is being called when user has cancelled an auth action.
/// {@endtemplate}
class AuthCancelledAction extends FirebaseUIAction {
  /// A callback that is being called when user has cancelled an auth action.
  final void Function(BuildContext context) callback;

  /// {@macro ui.auth.actions.cancel}
  AuthCancelledAction(this.callback);
}

/// {@template ui.auth.actions.account_deleted}
/// An action that is being called when user has deleted their account.
/// {@endtemplate}
class AccountDeletedAction extends FirebaseUIAction {
  /// A callback that is being called when user has deleted their account.
  final void Function(BuildContext context, fba.User user) callback;

  /// {@macro ui.auth.actions.account_deleted}
  AccountDeletedAction(this.callback);
}

/// {@template ui.auth.actions.display_name_changed}
/// An action that is being called when user has changed their display name.
/// {@endtemplate}
class DisplayNameChangedAction extends FirebaseUIAction {
  /// A callback that is being called when user has changed their display name.
  final void Function(
    BuildContext context,
    String? oldName,
    String newName,
  ) callback;

  /// {@macro ui.auth.actions.display_name_changed}
  DisplayNameChangedAction(this.callback);
}

/// {@template ui.auth.actions.flutter_fire_ui_actions}
/// An inherited widget that provides a list of actions down the widget tree.
/// {@endtemplate}
class FirebaseUIActions extends InheritedWidget {
  /// A list of [FirebaseUIAction]s that will be provided to the descendant
  /// widgets.
  final List<FirebaseUIAction> actions;

  /// Looks up an instance of [FirebaseUIActions] in the widget tree.
  static FirebaseUIActions? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FirebaseUIActions>();
  }

  /// Inherits a list of actions from the context and provides those to the
  /// [child].
  static Widget inherit({
    /// A [BuildContext] to inherit from.
    required BuildContext from,

    /// A [Widget] to wrap with [FirebaseUIActions].
    required Widget child,

    /// A list of [FirebaseUIAction]s to provide to the [child].
    List<FirebaseUIAction> actions = const [],
  }) {
    final w = maybeOf(from);

    if (w != null) {
      return FirebaseUIActions(
        actions: [...w.actions, ...actions],
        child: child,
      );
    }

    return child;
  }

  /// {@macro ui.auth.actions.flutter_fire_ui_actions}
  const FirebaseUIActions({
    super.key,
    required super.child,
    required this.actions,
  });

  @override
  bool updateShouldNotify(FirebaseUIActions oldWidget) {
    return oldWidget.actions != actions;
  }

  @override
  InheritedElement createElement() {
    return _FlutterfireUIAuthActionsElement(this);
  }
}

class _FlutterfireUIAuthActionsElement extends InheritedElement {
  _FlutterfireUIAuthActionsElement(super.widget);

  @override
  FirebaseUIActions get widget => super.widget as FirebaseUIActions;

  @override
  Widget build() {
    return AuthStateListener<AuthController>(
      listener: (oldState, newState, controller) {
        for (final action in widget.actions) {
          if (action is AuthStateChangeAction && action.matches(newState)) {
            _controllerRegistry[newState] = controller;
            action.invoke(this, newState);
            _controllerRegistry.remove(newState);
          }
        }

        return null;
      },
      child: super.build(),
    );
  }
}

final _controllerRegistry = <AuthState, AuthController>{};

/// Allows getting an [AuthController] that caused an [AuthState] transition.
/// Calling [getControllerForState] is only allowed from a [FirebaseUIAction]
/// callback:
///
/// ```dart
/// SignInScreen(
///   actions: [
///     AuthStateChangeAction<SignedIn>((context, state) {
///       final ctrl = getControllerForState(state);
///
///       if (ctrl is EmailAuthController) {
///          print('email was used for authentication');
///       }
///
///
///       Navigator.of(context).pushReplacementNamed('/profile');
///     }
///   ]
/// );
/// ```
AuthController getControllerForState(AuthState state) {
  final ctrl = _controllerRegistry[state];

  if (ctrl == null) {
    throw StateError(
      'Quering controller for an auth state is only allowed '
      'from FirebaseUIAction callback',
    );
  }

  return ctrl;
}
