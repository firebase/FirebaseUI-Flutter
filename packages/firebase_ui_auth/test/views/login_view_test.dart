// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_utils.dart';

void main() {
  group("$LoginView", () {
    testWidgets(
      'rebuilds the footer when the $AuthAction changes',
      (tester) async {
        const signInKey = ValueKey("Sign in");
        const registerKey = ValueKey("Register");

        const widgetSignIn = SizedBox(key: signInKey);
        const widgetRegister = SizedBox(key: registerKey);

        final view = TestMaterialApp(
          child: LoginView(
            providers: [EmailAuthProvider()],
            auth: MockAuth(),
            action: AuthAction.signIn,
            showAuthActionSwitch: true,
            footerBuilder: (context, action) {
              switch (action) {
                case AuthAction.signIn:
                  return widgetSignIn;
                case AuthAction.signUp:
                  return widgetRegister;
                default:
                  return const SizedBox();
              }
            },
          ),
        );
        await tester.pumpWidget(view);

        expect(find.byKey(signInKey), findsOneWidget);
        expect(find.byKey(registerKey), findsNothing);

        await _tapOnRegisterActionText(tester);

        expect(find.byKey(signInKey), findsNothing);
        expect(find.byKey(registerKey), findsOneWidget);
      },
    );
  });
}

/// Taps on the Register text in the action switch of the [LoginView].
///
/// We have to do this because the [WidgetTester] API does not enable the search
/// for a particular TextSpan.
/// See https://stackoverflow.com/a/60247474/19586032 for more details.
Future<void> _tapOnRegisterActionText(WidgetTester tester) async {
  final actionSwitchRichText = find
      .byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.text.toPlainText().contains("Register"),
      )
      .evaluate()
      .first
      .renderObject! as RenderParagraph;

  actionSwitchRichText.text.visitChildren((InlineSpan span) {
    if (span is! TextSpan) return true;

    span.visitChildren((InlineSpan span) {
      if (span is! TextSpan) return true;

      if (span.text != 'Register') return true;

      (span.recognizer! as TapGestureRecognizer).onTap!();
      return false;
    });

    return true;
  });

  await tester.pumpAndSettle();
}
