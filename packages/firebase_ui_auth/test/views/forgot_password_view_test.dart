// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../test_utils.dart';

class MockFirebaseAuth extends Mock implements fba.FirebaseAuth {
  @override
  Future<void> sendPasswordResetEmail({
    String? email,
    fba.ActionCodeSettings? actionCodeSettings,
  }) {
    return super.noSuchMethod(
      Invocation.method(
        #sendPasswordResetEmail,
        [],
        {
          #email: email,
          #actionCodeSettings: actionCodeSettings,
        },
      ),
      returnValue: Future.value(),
      returnValueForMissingStub: Future.value(),
    );
  }
}

void main() {
  group('Forgot password view', () {
    late Widget widget;
    late MockFirebaseAuth auth;

    setUpAll(() {
      auth = MockFirebaseAuth();

      widget = TestMaterialApp(
        child: ForgotPasswordView(auth: auth),
      );

      when(auth.sendPasswordResetEmail(email: 'invalid@email')).thenThrow(
        fba.FirebaseAuthException(
          message: 'invalid-email',
          code: 'invalid-email',
        ),
      );

      when(auth.sendPasswordResetEmail(email: 'valid@email.com')).thenAnswer(
        (_) => Future.value(),
      );

      when(auth.sendPasswordResetEmail(email: 'delay@email.com')).thenAnswer(
        (_) => Future.delayed(const Duration(milliseconds: 200)),
      );
    });

    testWidgets('shows error if sendPasswordResetEmail failed', (tester) async {
      await tester.pumpWidget(widget);

      final input = find.byType(TextField);
      await tester.enterText(input, 'invalid@email');

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.text('invalid-email'), findsOneWidget);
    });

    testWidgets(
      "doesn't show ana error on next successful attempt after error",
      (tester) async {
        await tester.pumpWidget(widget);

        final input = find.byType(TextField);
        await tester.enterText(input, 'valid@email.com');

        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        expect(find.byType(ErrorText), findsNothing);
      },
    );

    testWidgets("doesn't sendPasswordResetEmail on loading", (tester) async {
      await tester.pumpWidget(widget);

      final input = find.byType(TextField);
      await tester.enterText(input, 'delay@email.com');

      final button = find.byType(LoadingButton);
      await tester.tap(button);
      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.byType(ErrorText), findsNothing);
      verify(auth.sendPasswordResetEmail(email: 'delay@email.com')).called(1);
    });
  });
}
