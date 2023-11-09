// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter/material.dart' hide Title;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';

import '../widgets/internal/title.dart';

/// A callback that is being called when providers fetch request is completed.
@Deprecated(
  'Email enumeration protection is on by default.'
  'Read more here https://cloud.google.com/identity-platform/docs/admin/email-enumeration-protection',
)
typedef ProvidersFoundCallback = void Function(
  String email,
  List<String> providers,
);

/// {@template ui.auth.views.find_providers_for_email_view}
/// A view that could be used to build a custom [UniversalEmailSignInScreen].
/// {@endtemplate}
@Deprecated(
  'Email enumeration protection is on by default.'
  'Read more here https://cloud.google.com/identity-platform/docs/admin/email-enumeration-protection',
)
class FindProvidersForEmailView extends StatefulWidget {
  final ProvidersFoundCallback? onProvidersFound;

  /// {@macro ui.auth.auth_controller.auth}
  final fba.FirebaseAuth? auth;

  /// {@macro ui.auth.views.find_providers_for_email_view}
  const FindProvidersForEmailView({
    super.key,
    this.onProvidersFound,
    this.auth,
  });

  @override
  State<FindProvidersForEmailView> createState() =>
      _FindProvidersForEmailViewState();
}

@Deprecated(
  'Email enumeration protection is on by default.'
  'Read more here https://cloud.google.com/identity-platform/docs/admin/email-enumeration-protection',
)
class _FindProvidersForEmailViewState extends State<FindProvidersForEmailView> {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();

  late final flow = UniversalEmailSignInFlow(
    provider: UniversalEmailSignInProvider(),
    auth: widget.auth,
  );

  void _submit(UniversalEmailSignInController ctrl, String email) {
    if (formKey.currentState!.validate()) {
      ctrl.findProvidersForEmail(email);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = FirebaseUILocalizations.labelsOf(context);
    const spacer = SizedBox(height: 24);

    return AuthFlowBuilder<UniversalEmailSignInController>(
      auth: widget.auth,
      flow: flow,
      listener: (oldState, newState, controller) {
        if (newState is DifferentSignInMethodsFound) {
          widget.onProvidersFound?.call(
            emailCtrl.text,
            newState.methods,
          );
        }
      },
      builder: (context, state, ctrl, child) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Title(
            text: l.findProviderForEmailTitleText,
          ),
          spacer,
          Form(
            key: formKey,
            child: EmailInput(
              controller: emailCtrl,
              onSubmitted: (_) {
                _submit(ctrl, emailCtrl.text);
              },
            ),
          ),
          spacer,
          LoadingButton(
            isLoading: state is FetchingProvidersForEmail,
            label: l.continueText,
            onTap: () {
              _submit(ctrl, emailCtrl.text);
            },
          )
        ],
      ),
    );
  }
}
