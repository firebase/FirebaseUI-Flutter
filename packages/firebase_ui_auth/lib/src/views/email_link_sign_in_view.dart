// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter/widgets.dart' hide Title;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';

import '../widgets/internal/title.dart';

/// {@template ui.auth.views.email_link_sign_in_view}
/// A view that could be used to build a custom [EmailLinkSignInScreen].
/// {@endtemplate}
class EmailLinkSignInView extends StatefulWidget {
  /// {@macro ui.auth.auth_controller.auth}
  final fba.FirebaseAuth? auth;

  /// An instance of the [EmailLinkAuthProvider] that should be used to
  /// authenticate.
  final EmailLinkAuthProvider provider;

  /// A focus node that could be used to control the focus state of the
  /// [EmailInput].
  final FocusNode? emailInputFocusNode;

  /// {@macro ui.auth.views.email_link_sign_in_view}
  const EmailLinkSignInView({
    super.key,
    this.auth,
    required this.provider,
    this.emailInputFocusNode,
  });

  @override
  State<EmailLinkSignInView> createState() => _EmailLinkSignInViewState();
}

class _EmailLinkSignInViewState extends State<EmailLinkSignInView> {
  final emailCtrl = TextEditingController();
  late final canPop = Navigator.canPop(context);

  // Stays true after a failed attempt, so the user can correct the email.
  bool isConfirmingEmail = false;

  @override
  Widget build(BuildContext context) {
    final l = FirebaseUILocalizations.labelsOf(context);
    final formKey = GlobalKey<FormState>();
    // SignedIn, UserCreated and CredentialLinked stay hidden until the app
    // navigates away, so the form does not flash after a successful sign in.
    const statesToHideForm = [
      AwaitingDynamicLink,
      SigningIn,
      SignedIn,
      UserCreated,
      CredentialLinked,
    ];

    return AuthFlowBuilder<EmailLinkAuthController>(
      auth: widget.auth,
      provider: widget.provider,
      listener: (oldState, newState, ctrl) {
        if (newState is EmailRequired) {
          setState(() => isConfirmingEmail = true);
        }
      },
      builder: (context, state, ctrl, child) {
        final isFormHidden = statesToHideForm.contains(state.runtimeType);
        // Also covers a flow that was already in EmailRequired when this view
        // was built, which the listener above does not see.
        if (state is EmailRequired) isConfirmingEmail = true;

        void submit() {
          if (isConfirmingEmail) {
            ctrl.confirmEmail(emailCtrl.text);
          } else {
            ctrl.sendLink(emailCtrl.text);
          }
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Title(text: l.signInWithEmailLinkViewTitleText),
            const SizedBox(height: 16),
            if (!isFormHidden && isConfirmingEmail) ...[
              Text(l.emailLinkConfirmEmailText),
              const SizedBox(height: 16),
            ],
            if (!isFormHidden)
              Form(
                key: formKey,
                child: EmailInput(
                  autofocus: true,
                  focusNode: widget.emailInputFocusNode,
                  controller: emailCtrl,
                  onSubmitted: (v) {
                    if (formKey.currentState?.validate() ?? false) {
                      submit();
                    }
                  },
                ),
              )
            else if (state is AwaitingDynamicLink) ...[
              Text(l.signInWithEmailLinkSentText),
              const SizedBox(height: 16),
            ] else ...[
              const Center(child: LoadingIndicator(size: 32, borderWidth: 2)),
              const SizedBox(height: 16),
            ],
            if (!isFormHidden) ...[
              const SizedBox(height: 8),
              LoadingButton(
                isLoading: state is SendingLink,
                label: isConfirmingEmail
                    ? l.continueText
                    : l.sendLinkButtonLabel,
                onTap: submit,
              ),
            ],
            if (canPop) ...[
              const SizedBox(height: 8),
              UniversalButton(
                text: l.goBackButtonLabel,
                variant: ButtonVariant.text,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            const SizedBox(height: 8),
            if (state is AuthFailed) ErrorText(exception: state.exception),
          ],
        );
      },
    );
  }
}
