// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_auth/src/widgets/internal/universal_page_route.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

typedef SMSCodeInputScreenBuilder = Widget Function(
  BuildContext context,
  List<FirebaseUIAction> actions,
  Object flowKey,
  AuthAction action,
);

Future<fba.UserCredential> startMFAVerification({
  required BuildContext context,
  required fba.MultiFactorResolver resolver,
  fba.FirebaseAuth? auth,
  SMSCodeInputScreenBuilder? smsCodeInputScreenBuilder,
}) async {
  if (resolver.hints.first is fba.PhoneMultiFactorInfo) {
    return startPhoneMFAVerification(
      context: context,
      resolver: resolver,
      auth: auth,
    );
  } else {
    throw Exception('Unsupported MFA type');
  }
}

Future<fba.UserCredential> startPhoneMFAVerification({
  required BuildContext context,
  required fba.MultiFactorResolver resolver,
  fba.FirebaseAuth? auth,
  SMSCodeInputScreenBuilder? smsCodeInputScreenBuilder,
}) async {
  final session = resolver.session;
  final hint = resolver.hints.first;
  final completer = Completer<fba.UserCredential>();
  final navigator = Navigator.of(context);

  final provider = PhoneAuthProvider();
  provider.auth = auth ?? fba.FirebaseAuth.instance;

  final flow = PhoneAuthFlow(
    auth: auth ?? fba.FirebaseAuth.instance,
    action: AuthAction.none,
    provider: PhoneAuthProvider(),
  );

  provider.authListener = flow;

  final flowKey = Object();

  final actions = [
    AuthStateChangeAction<CredentialReceived>((context, inner) {
      final cred = inner.credential as fba.PhoneAuthCredential;
      final assertion = fba.PhoneMultiFactorGenerator.getAssertion(cred);
      try {
        final cred = resolver.resolveSignIn(assertion);
        completer.complete(cred);
      } catch (e) {
        completer.completeError(e);
      }
    }),
  ];

  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    provider.sendVerificationCode(
      hint: hint as fba.PhoneMultiFactorInfo,
      multiFactorSession: session,
      action: AuthAction.none,
    );
  });

  Widget builder(BuildContext context) {
    Widget child;

    if (smsCodeInputScreenBuilder != null) {
      child = smsCodeInputScreenBuilder.call(
        context,
        actions,
        flowKey,
        AuthAction.none,
      );
    } else {
      child = SMSCodeInputScreen(
        flowKey: flowKey,
        action: AuthAction.none,
        auth: auth,
        actions: actions,
      );
    }

    return AuthFlowBuilder<PhoneAuthController>(
      flow: flow,
      flowKey: flowKey,
      child: child,
    );
  }

  final pageRoute = createPageRoute(
    context: context,
    builder: builder,
  );

  navigator.push(pageRoute);

  final cred = await completer.future;

  navigator.pop();
  return cred;
}
