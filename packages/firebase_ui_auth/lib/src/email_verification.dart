// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'dart:async';

/// All possible states of the email verification process.
enum EmailVerificationState {
  /// An initial state of the email verification process.
  unresolved,

  /// A state that indicates that the user has not yet verified the email.
  unverified,

  /// A state that indicates that the user has cancelled the email verification
  /// process.
  dismissed,

  /// A state that indicates that email is being sent.
  sending,

  /// A state that indicates that user needs to follow the link and the app
  /// awaits a valid deep link.
  pending,

  /// A state that indicates that the verification email was successfully sent.
  sent,

  /// A state that indicates that the user has verified its email.
  verified,

  /// A state that indiicates that email verification failed. Likely the
  /// received link is invalid and verification email should be sent again.
  failed,
}

/// A [ValueNotifier] that manages the email verification process.
class EmailVerificationController extends ValueNotifier<EmailVerificationState>
    with WidgetsBindingObserver {
  /// {@macro ui.auth.auth_controller.auth}
  final fba.FirebaseAuth auth;

  final AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  EmailVerificationController(this.auth, {AppLinks? appLinks})
      : _appLinks = appLinks ?? AppLinks(),
        super(EmailVerificationState.unresolved) {
    final user = auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        value = EmailVerificationState.verified;
      } else {
        value = EmailVerificationState.unverified;
      }
    }

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      reload();
    }
  }

  /// An instance of user that is currently signed in.
  fba.User get user => auth.currentUser!;

  /// Current [EmailVerificationState].
  EmailVerificationState get state => value;

  /// Contains an [Exception] if [state] is [EmailVerificationState.failed].
  Exception? error;

  bool _isMobile(TargetPlatform platform) {
    return platform == TargetPlatform.android || platform == TargetPlatform.iOS;
  }

  /// Reloads firebase user and updates the [state].
  Future<void> reload() async {
    await user.reload();

    if (user.email == null) {
      value = EmailVerificationState.unresolved;
    } else if (user.emailVerified) {
      value = EmailVerificationState.verified;
    } else {
      value = EmailVerificationState.unverified;
    }
  }

  /// Indicates that email verification process was cancelled.
  void dismiss() {
    value = EmailVerificationState.dismissed;
    _linkSubscription?.cancel();
  }

  /// Sends an email with a link to verify the user's email address.
  Future<void> sendVerificationEmail(
    TargetPlatform platform,
    fba.ActionCodeSettings? actionCodeSettings,
  ) async {
    value = EmailVerificationState.sending;
    try {
      await user.sendEmailVerification(actionCodeSettings);
    } on Exception catch (e) {
      error = e;
      value = EmailVerificationState.failed;
      return;
    }

    if (_isMobile(platform)) {
      value = EmailVerificationState.pending;

      _linkSubscription?.cancel();

      _linkSubscription = _appLinks.uriLinkStream.listen(
        (Uri uri) async {
          try {
            final code = uri.queryParameters['oobCode'];
            if (code != null) {
              await auth.checkActionCode(code);
              await auth.applyActionCode(code);
              await user.reload();
              value = EmailVerificationState.verified;
              _linkSubscription?.cancel();
            }
          } on Exception catch (err) {
            error = err;
            value = EmailVerificationState.failed;
            _linkSubscription?.cancel();
          }
        },
        onError: (error) {
          this.error = error is Exception ? error : Exception(error.toString());
          value = EmailVerificationState.failed;
          _linkSubscription?.cancel();
        },
      );
    } else {
      value = EmailVerificationState.sent;
    }
  }
}
