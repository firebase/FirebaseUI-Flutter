// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:mockito/mockito.dart';

import 'package:firebase_ui_auth/src/widgets/internal/universal_text_form_field.dart';

import '../test_utils.dart';

class MockFirebaseAuth extends Mock implements fba.FirebaseAuth {}

void main() {
  const labels = DefaultLocalizations();

  group('EmailForm', () {
    late Widget widget;

    setUp(() {
      widget = TestMaterialApp(
        child: EmailForm(
          auth: MockAuth(),
          action: AuthAction.signIn,
        ),
      );
    });

    testWidgets('has a Sign in button of outlined variant', (tester) async {
      await tester.pumpWidget(widget);
      final button = find.byType(OutlinedButton);

      expect(button, findsOneWidget);
    });

    testWidgets('has a Forgot password button of text variant', (tester) async {
      await tester.pumpWidget(widget);
      final button = find.byType(TextButton);

      expect(
        button,
        findsOneWidget,
      );
    });

    testWidgets(
      'respects EmailFormStyle passed to FirebaseUITheme',
      (tester) async {
        await tester.pumpWidget(
          FirebaseUITheme(
            styles: const {
              EmailFormStyle(signInButtonVariant: ButtonVariant.filled)
            },
            child: widget,
          ),
        );

        final button = find.byType(ElevatedButton);
        expect(button, findsOneWidget);
      },
    );

    testWidgets(
      'respects EmailFormStyle passed via property',
      (tester) async {
        await tester.pumpWidget(
          widget = TestMaterialApp(
            child: EmailForm(
              auth: MockAuth(),
              action: AuthAction.signIn,
              style: const EmailFormStyle(
                signInButtonVariant: ButtonVariant.filled,
              ),
            ),
          ),
        );

        final button = find.byType(ElevatedButton);
        expect(button, findsOneWidget);
      },
    );

    testWidgets(
      'EmailFormStyle passed via property is higher priority',
      (tester) async {
        await tester.pumpWidget(
          TestMaterialApp(
            child: FirebaseUITheme(
              styles: const {
                EmailFormStyle(signInButtonVariant: ButtonVariant.text)
              },
              child: EmailForm(
                auth: MockAuth(),
                action: AuthAction.signIn,
                style: const EmailFormStyle(
                  signInButtonVariant: ButtonVariant.filled,
                ),
              ),
            ),
          ),
        );

        final button = find.byType(ElevatedButton);
        expect(button, findsOneWidget);
      },
    );

    testWidgets('has password visibility toggle', (tester) async {
      await tester.pumpWidget(
        TestMaterialApp(
          child: EmailForm(
            auth: MockAuth(),
            action: AuthAction.signIn,
            showPasswordVisibilityToggle: true,
          ),
        ),
      );

      final toggleFinder = find.byIcon(Icons.visibility);
      expect(toggleFinder, findsOneWidget);
    });

    testWidgets('allows to toggle password visibility', (tester) async {
      await tester.pumpWidget(
        TestMaterialApp(
          child: EmailForm(
            auth: MockAuth(),
            action: AuthAction.signIn,
            showPasswordVisibilityToggle: true,
          ),
        ),
      );

      final passwordHost = find.byType(PasswordInput);
      final toggleFinder = find.byIcon(Icons.visibility);

      final textField = find.descendant(
        of: passwordHost,
        matching: find.byType(UniversalTextFormField),
      );

      expect(
        tester.widget<UniversalTextFormField>(textField).obscureText,
        isTrue,
      );

      await tester.tap(toggleFinder);
      await tester.pump();

      expect(
        tester.widget<UniversalTextFormField>(textField).obscureText,
        isFalse,
      );
    });

    testWidgets('validates email', (tester) async {
      await tester.pumpWidget(
        TestMaterialApp(
          child: EmailForm(
            auth: MockAuth(),
          ),
        ),
      );

      final inputs = find.byType(TextFormField);
      final emailInput = inputs.first;

      await tester.enterText(emailInput, 'not a vailid email');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.text(labels.isNotAValidEmailErrorText), findsOneWidget);
    });

    testWidgets('requires password', (tester) async {
      await tester.pumpWidget(
        TestMaterialApp(
          child: EmailForm(
            auth: MockAuth(),
          ),
        ),
      );

      final inputs = find.byType(TextFormField);
      final emailInput = inputs.first;
      final passwordInput = inputs.at(1);

      await tester.enterText(emailInput, 'test@test.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      await tester.enterText(passwordInput, '');
      await tester.pumpAndSettle();

      expect(find.text(labels.passwordIsRequiredErrorText), findsOneWidget);
    });

    testWidgets(
      'shows password confirmation if action is sign up',
      (tester) async {
        await tester.pumpWidget(
          TestMaterialApp(
            child: EmailForm(
              auth: MockAuth(),
              action: AuthAction.signUp,
            ),
          ),
        );

        final inputs = find.byType(TextFormField);
        expect(inputs, findsNWidgets(3));
      },
    );

    testWidgets(
      'requires password confirmation',
      (tester) async {
        await tester.pumpWidget(
          TestMaterialApp(
            child: EmailForm(
              auth: MockAuth(),
              action: AuthAction.signUp,
            ),
          ),
        );

        final inputs = find.byType(TextFormField);

        await tester.enterText(inputs.at(0), 'test@test.com');
        await tester.testTextInput.receiveAction(TextInputAction.done);

        await tester.enterText(inputs.at(1), 'password');
        await tester.testTextInput.receiveAction(TextInputAction.done);

        await tester.enterText(inputs.at(2), '');
        await tester.testTextInput.receiveAction(TextInputAction.done);

        await tester.pumpAndSettle();

        expect(
          find.text(labels.confirmPasswordIsRequiredErrorText),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'verifies that password confirmation matches password',
      (tester) async {
        await tester.pumpWidget(
          TestMaterialApp(
            child: EmailForm(
              auth: MockAuth(),
              action: AuthAction.signUp,
            ),
          ),
        );

        final inputs = find.byType(TextFormField);

        await tester.enterText(inputs.at(0), 'test@test.com');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        await tester.enterText(inputs.at(1), 'password');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        await tester.enterText(inputs.at(2), 'psasword');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        expect(
          find.text(labels.confirmPasswordDoesNotMatchErrorText),
          findsOneWidget,
        );
      },
    );
  });
}
