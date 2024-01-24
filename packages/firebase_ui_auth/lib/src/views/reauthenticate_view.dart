// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/widgets.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

/// {@template ui.auth.views.reauthenticate_view}
/// A view that could be used to build a custom [ReauthenticateDialog].
/// {@endtemplate}
class ReauthenticateView extends StatelessWidget {
  /// {@macro ui.auth.auth_controller.auth}
  final fba.FirebaseAuth? auth;

  /// A list of all supported auth providers.
  final List<AuthProvider> providers;

  /// A callback that is being called when the user has successfuly signed in.
  final VoidCallback? onSignedIn;

  /// {@template ui.auth.views.reauthenticate_view.on_phone_verified}
  /// A callback that is only called if a phone number is used to reauthenticate.
  /// Called before [onSignedIn].
  /// If not provided, [PhoneInputScreen] and [SMSCodeInputScreen] will be popped.
  /// Otherwise, it's up to the user to handle navigation logic.
  /// {@endtemplate}
  final VoidCallback? onPhoneVerfifed;

  /// A label that would be used for the "Sign in" button.
  final String? actionButtonLabelOverride;

  /// {@macro ui.auth.widgets.email_from.showPasswordVisibilityToggle}
  final bool showPasswordVisibilityToggle;

  /// {@macro ui.auth.views.reauthenticate_view}
  const ReauthenticateView({
    super.key,
    required this.providers,
    this.auth,
    this.onSignedIn,
    this.actionButtonLabelOverride,
    this.showPasswordVisibilityToggle = false,
    this.onPhoneVerfifed,
  });

  @override
  Widget build(BuildContext context) {
    final linkedProviders =
        (auth ?? fba.FirebaseAuth.instance).currentUser!.providerData;

    final providersMap = this.providers.fold<Map<String, AuthProvider>>(
      {},
      (map, provider) {
        return {
          ...map,
          provider.providerId: provider,
        };
      },
    );

    List<AuthProvider> providers = [];

    for (final p in linkedProviders) {
      final provider = providersMap[p.providerId];

      if (provider != null) {
        providers.add(provider);
      }
    }

    final m = ModalRoute.of(context);

    final onSignedInAction = AuthStateChangeAction<SignedIn>((context, state) {
      if (getControllerForState(state) is PhoneAuthController) {
        if (onPhoneVerfifed != null) {
          onPhoneVerfifed?.call();
        } else {
          // Phone verification flow pushes new routes, so we need to pop them.
          Navigator.of(context).popUntil((route) {
            return route == m;
          });
        }
      }

      onSignedIn?.call();
    });

    return FirebaseUIActions(
      actions: [
        onSignedInAction,
      ],
      child: LoginView(
        action: AuthAction.signIn,
        providers: providers,
        showTitle: false,
        showAuthActionSwitch: false,
        actionButtonLabelOverride: actionButtonLabelOverride,
        showPasswordVisibilityToggle: showPasswordVisibilityToggle,
      ),
    );
  }
}
