// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/widgets.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

/// {@template ui.auth.views.different_method_sign_in_view}
/// A view that renders a list of providers that were previously used by the
/// user to authenticate.
/// {@endtemplate}
@Deprecated(
  'Email enumeration protection is on by default.'
  'Read more here https://cloud.google.com/identity-platform/docs/admin/email-enumeration-protection',
)
class DifferentMethodSignInView extends StatelessWidget {
  /// {@macro ui.auth.auth_controller.auth}
  final fba.FirebaseAuth? auth;

  /// A list of all providers that were previously used to authenticate.
  final List<String> availableProviders;

  /// A list of all supported auth providers.
  final List<AuthProvider> providers;

  /// A callback that is being called when the user has signed in using on of
  /// the [availableProviders].
  final VoidCallback? onSignedIn;

  /// {@macro ui.auth.widgets.email_from.showPasswordVisibilityToggle}
  final bool showPasswordVisibilityToggle;

  /// {@macro ui.auth.views.different_method_sign_in_view}
  const DifferentMethodSignInView({
    super.key,
    required this.availableProviders,
    required this.providers,
    this.auth,
    this.onSignedIn,
    this.showPasswordVisibilityToggle = false,
  });

  @override
  Widget build(BuildContext context) {
    final providersMap = this.providers.fold<Map<String, AuthProvider>>(
      {},
      (map, config) {
        return {
          ...map,
          config.providerId: config,
        };
      },
    );

    List<AuthProvider> providers = [];

    for (final p in availableProviders) {
      final providerConfig = providersMap[p];
      if (providerConfig != null) {
        providers.add(providerConfig);
      }
    }

    return AuthStateListener(
      child: LoginView(
        action: AuthAction.signIn,
        providers: providers,
        showTitle: false,
        showPasswordVisibilityToggle: showPasswordVisibilityToggle,
      ),
      listener: (oldState, newState, ctrl) {
        if (newState is SignedIn) {
          onSignedIn?.call();
        }

        return false;
      },
    );
  }
}
