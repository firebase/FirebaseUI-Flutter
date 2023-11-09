// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter/material.dart' hide Title;
import 'package:flutter/scheduler.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';

import '../widgets/internal/title.dart';

import 'internal/responsive_page.dart';

/// An action that is being called when email was successfully verified.
class EmailVerifiedAction extends FirebaseUIAction {
  final VoidCallback callback;

  EmailVerifiedAction(this.callback);
}

/// {@template ui.auth.screens.email_verification_screen}
/// A screen that contains hints of how to verify the email.
/// A verification email is being sent automatically when this screen is opened.
/// {@endtemplate}
class EmailVerificationScreen extends StatelessWidget {
  /// {@macro ui.auth.auth_controller.auth}
  final fba.FirebaseAuth? auth;

  /// {@macro ui.auth.screens.responsive_page.header_builder}
  final HeaderBuilder? headerBuilder;

  /// EmailVerificationScreen could invoke these actions:
  ///
  /// * [AuthCancelledAction]
  /// * [EmailVerifiedAction]
  ///
  /// ```dart
  /// EmailVerificationScreen(
  ///   actions: [
  ///     EmailVerified(() {
  ///       Navigator.pushReplacementNamed(context, '/profile');
  ///     }),
  ///     Cancel((context) {
  ///       Navigator.of(context).pop();
  ///     }),
  ///   ],
  /// );
  /// ```
  final List<FirebaseUIAction> actions;

  /// {@macro ui.auth.screens.responsive_page.header_max_extent}
  final double? headerMaxExtent;

  /// {@macro ui.auth.screens.responsive_page.side_builder}
  final SideBuilder? sideBuilder;

  /// {@macro ui.auth.screens.responsive_page.desktop_layout_direction}
  final TextDirection? desktopLayoutDirection;

  /// {@macro ui.auth.screens.responsive_page.breakpoint}
  final double breakpoint;

  /// A configuration object used to construct a dynamic link.
  final fba.ActionCodeSettings? actionCodeSettings;

  /// {@macro ui.auth.screens.email_verification_screen}
  const EmailVerificationScreen({
    super.key,
    this.auth,
    this.actions = const [],
    this.headerBuilder,
    this.headerMaxExtent,
    this.sideBuilder,
    this.desktopLayoutDirection,
    this.breakpoint = 500,
    this.actionCodeSettings,
  });

  @override
  Widget build(BuildContext context) {
    return FirebaseUIActions(
      actions: actions,
      child: UniversalScaffold(
        body: ResponsivePage(
          breakpoint: breakpoint,
          desktopLayoutDirection: desktopLayoutDirection,
          headerBuilder: headerBuilder,
          headerMaxExtent: headerMaxExtent,
          sideBuilder: sideBuilder,
          maxWidth: 1200,
          contentFlex: 2,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: _EmailVerificationScreenContent(
              auth: auth,
              actionCodeSettings: actionCodeSettings,
            ),
          ),
        ),
      ),
    );
  }
}

/// This allows a value of type T or T?
/// to be treated as a value of type T?.
///
/// We use this so that APIs that have become
/// non-nullable can still be used with `!` and `?`
/// to support older versions of the API as well.
T? _ambiguate<T>(T? value) => value;

class _EmailVerificationScreenContent extends StatefulWidget {
  /// {@macro ui.auth.auth_controller.auth}
  final fba.FirebaseAuth? auth;
  final fba.ActionCodeSettings? actionCodeSettings;

  const _EmailVerificationScreenContent({
    required this.auth,
    required this.actionCodeSettings,
  });

  @override
  State<_EmailVerificationScreenContent> createState() =>
      __EmailVerificationScreenContentState();
}

class __EmailVerificationScreenContentState
    extends State<_EmailVerificationScreenContent> {
  late final controller = EmailVerificationController(auth);
  fba.FirebaseAuth get auth => widget.auth ?? fba.FirebaseAuth.instance;
  fba.User get user => auth.currentUser!;
  bool isLoading = false;

  @override
  void initState() {
    _ambiguate(SchedulerBinding.instance)!
        .addPostFrameCallback(_sendEmailVerification);
    super.initState();
  }

  void _sendEmailVerification(_) {
    controller
      ..addListener(() {
        setState(() {});

        if (state == EmailVerificationState.verified) {
          final action = FirebaseUIAction.ofType<EmailVerifiedAction>(context);
          action?.callback();
        }
      })
      ..sendVerificationEmail(
        Theme.of(context).platform,
        widget.actionCodeSettings,
      );
  }

  EmailVerificationState get state => controller.state;

  @override
  Widget build(BuildContext context) {
    final l = FirebaseUILocalizations.labelsOf(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          child: Title(text: l.verifyEmailTitle),
        ),
        const SizedBox(height: 32),
        Text(l.verificationEmailSentText),
        const SizedBox(height: 32),
        if (state == EmailVerificationState.pending)
          const Center(child: LoadingIndicator(size: 32, borderWidth: 2))
        else if (state == EmailVerificationState.sent) ...[
          LoadingButton(
            isLoading: isLoading,
            variant: ButtonVariant.filled,
            label: l.continueText,
            onTap: () async {
              await controller.reload();
            },
          ),
        ],
        if (state == EmailVerificationState.sending)
          const Center(child: LoadingIndicator(size: 32, borderWidth: 2)),
        if (state == EmailVerificationState.unverified) ...[
          Text(
            l.verificationFailedText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          const SizedBox(height: 16),
          UniversalButton(
            text: l.resendVerificationEmailButtonLabel,
            onPressed: () {
              controller.sendVerificationEmail(
                Theme.of(context).platform,
                widget.actionCodeSettings,
              );
            },
          )
        ],
        if (state == EmailVerificationState.failed) ...[
          const SizedBox(height: 16),
          ErrorText(exception: controller.error!),
        ],
        const SizedBox(height: 16),
        UniversalButton(
          variant: ButtonVariant.text,
          text: l.goBackButtonLabel,
          onPressed: () {
            FirebaseUIAction.ofType<AuthCancelledAction>(context)
                ?.callback(context);
          },
        )
      ],
    );
  }
}
