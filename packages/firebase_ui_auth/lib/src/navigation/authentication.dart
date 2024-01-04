// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

/// Shows [ReauthenticateDialog].
Future<bool> showReauthenticateDialog({
  required BuildContext context,

  /// A list of all supported auth providers
  required List<AuthProvider> providers,

  /// {@macro ui.auth.auth_controller.auth}
  fba.FirebaseAuth? auth,

  /// A callback that is being called after user has successfully signed in.
  VoidCallback? onSignedIn,

  /// {@macro ui.auth.views.reauthenticate_view.on_phone_verified}
  VoidCallback? onPhoneVerfifed,

  /// A label that would be used for the "Sign in" button.
  String? actionButtonLabelOverride,
}) async {
  final l = FirebaseUILocalizations.labelsOf(context);

  final reauthenticated = await showGeneralDialog<bool>(
    context: context,
    barrierDismissible: true,
    barrierLabel: l.cancelButtonLabel,
    pageBuilder: (_, __, ___) => FirebaseUIActions.inherit(
      from: context,
      child: ReauthenticateDialog(
        providers: providers,
        auth: auth,
        onSignedIn: onSignedIn ?? () => Navigator.of(context).pop(true),
        actionButtonLabelOverride: actionButtonLabelOverride,
        onPhoneVerfifed: onPhoneVerfifed,
      ),
    ),
  );

  if (reauthenticated == null) return false;
  return reauthenticated;
}

/// Shows [DifferentMethodSignInDialog].
@Deprecated(
  'Email enumeration protection is on by default.'
  'Read more here https://cloud.google.com/identity-platform/docs/admin/email-enumeration-protection',
)
Future<void> showDifferentMethodSignInDialog({
  required BuildContext context,

  /// A list of providers associated with the user account
  required List<String> availableProviders,

  /// A list of all supported providers
  required List<AuthProvider> providers,

  /// {@macro ui.auth.auth_controller.auth}
  fba.FirebaseAuth? auth,

  /// A callback that is being called after user has successfully signed in.
  VoidCallback? onSignedIn,
}) async {
  final l = FirebaseUILocalizations.labelsOf(context);

  await showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: l.cancelButtonLabel,
    pageBuilder: (context, _, __) => DifferentMethodSignInDialog(
      availableProviders: availableProviders,
      providers: providers,
      auth: auth,
      onSignedIn: () {
        Navigator.of(context).pop();
      },
    ),
  );
}
