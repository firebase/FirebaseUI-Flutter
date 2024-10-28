// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';

import '../utils.dart';

Future<void> sendSMS(WidgetTester tester, String phoneNumber) async {
  await tester.pump();

  final phoneInput = find.byType(TextField).at(1);
  await tester.enterText(phoneInput, phoneNumber);

  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pumpAndSettle();
}

void main() {
  const labels = DefaultLocalizations();
  setUpTests();

  group('PhoneInputScreen', () {
    testWidgets('allows to pick country code', (tester) async {
      await render(tester, const PhoneInputScreen());
      await tester.pump();

      final popUpMenu = find.byWidgetPredicate((widget) {
        return widget is PopupMenuButton;
      });

      expect(popUpMenu, findsOneWidget);

      await tester.tap(popUpMenu);
      await tester.pumpAndSettle();

      final australia = find.text('Australia (+61)');
      expect(australia, findsOneWidget);

      await tester.tap(australia);
      await tester.pumpAndSettle();

      final inputs = find.byType(TextField);
      expect(inputs, findsNWidgets(2));

      final elements = inputs.evaluate();

      final codeInput = elements.first.widget as TextField;

      expect(codeInput.decoration!.labelText, labels.countryCode);
      expect((codeInput.decoration!.prefix! as Text).data, '+');
      expect(codeInput.controller!.text, '61');
    });

    testWidgets('validates phone number', (tester) async {
      await render(
        tester,
        const PhoneInputScreen(),
      );

      await tester.pump();

      final phoneInput = find.byType(TextField).at(1);
      await tester.enterText(phoneInput, '12345');

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final errorText = find.text(labels.phoneNumberInvalidErrorText);
      expect(errorText, findsOneWidget);
    });

    testWidgets(
      'sends sms verification code when next is clicked',
      (tester) async {
        final completer = Completer<void>();

        await render(
          tester,
          PhoneInputScreen(
            actions: [
              AuthStateChangeAction<SMSCodeSent>((context, state) {
                completer.complete();
              }),
              AuthStateChangeAction<AuthFailed>((context, state) {
                fail('should not fail');
              }),
            ],
          ),
        );

        await sendSMS(tester, '555555555');

        await completer.future;

        final code = await getVerificationCode('+1555555555');
        expect(code, isNotEmpty);
      },
    );

    testWidgets(
      'opens sms verification screen when code is requested',
      (tester) async {
        await render(tester, const PhoneInputScreen());
        await sendSMS(tester, '123456789');

        expect(find.text(labels.enterSMSCodeText), findsOneWidget);
      },
    );
  });

  group('SMSCodeInputScreen', () {
    testWidgets('allows to go back to phone input screen', (tester) async {
      await render(tester, const PhoneInputScreen());
      await sendSMS(tester, '123456789');

      final button = find.text(labels.goBackButtonLabel);
      expect(button, findsOneWidget);
      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.byType(PhoneInputScreen), findsOneWidget);
    });

    testWidgets(
      'shows error message if invalid code was entered',
      (tester) async {
        final completer = Completer<void>();

        await render(
          tester,
          AuthStateListener<PhoneAuthController>(
            listener: (oldState, newState, _) {
              if (newState is! AuthFailed) return;
              completer.complete();

              return null;
            },
            child: const PhoneInputScreen(),
          ),
        );
        await sendSMS(tester, '555555556');

        final smsCodeInput = find.byType(SMSCodeInput);
        expect(smsCodeInput, findsOneWidget);

        final code = await getVerificationCode('+1555555556');
        final invalidCode =
            code.split('').map(int.parse).map((v) => (v + 1) % 10).join();

        await tester.tap(smsCodeInput);

        await tester.enterText(smsCodeInput, invalidCode);
        await tester.pumpAndSettle();
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await completer.future;

        await tester.pump();

        expect(find.byType(ErrorText), findsOneWidget);
        expect(
          find.text(labels.invalidVerificationCodeErrorText),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'signs in if the code is correct',
      (tester) async {
        final completer = Completer<fba.User>();

        await render(
          tester,
          FirebaseUIActions(
            actions: [
              AuthStateChangeAction<UserCreated>((context, state) {
                completer.complete(state.credential.user!);
              }),
              AuthStateChangeAction<AuthFailed>((context, state) {
                fail("shouldn't fail");
              }),
            ],
            child: const PhoneInputScreen(),
          ),
        );
        await sendSMS(tester, '555555557');

        final smsCodeInput = find.byType(SMSCodeInput);
        final code = await getVerificationCode('+1555555557');

        await tester.tap(smsCodeInput);

        await tester.enterText(smsCodeInput, code);
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        final user = await completer.future.timeout(
          const Duration(seconds: 10),
        );

        expect(user.phoneNumber, '+1555555557');
      },
    );
  });

  group('showReauthenticateDialog', () {
    testWidgets(
      'can reauthenticate using phone number',
      (tester) async {
        final credCompleter = Completer<fba.PhoneAuthCredential>();

        await auth.verifyPhoneNumber(
          phoneNumber: '+1555555558',
          verificationCompleted: credCompleter.complete,
          verificationFailed: credCompleter.completeError,
          codeSent: (verificationId, _) async {
            final code = await getVerificationCode('+1555555558');

            final credential = fba.PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: code,
            );

            credCompleter.complete(credential);
          },
          codeAutoRetrievalTimeout: (_) {},
        );

        final cred = await credCompleter.future;
        await auth.signInWithCredential(cred);

        final reauthenticationCompleter = Completer<void>();
        // emulator doesn't return a new sms code if the same phone number is
        // used within 30(?) seconds.
        await Future.delayed(const Duration(seconds: 30));
        bool onPhoneVerifiedCalled = false;

        await render(
          tester,
          Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                showReauthenticateDialog(
                  context: context,
                  providers: [PhoneAuthProvider()],
                  onSignedIn: () => reauthenticationCompleter.complete(),
                  onPhoneVerfifed: () => onPhoneVerifiedCalled = true,
                );
              },
              child: const Text('Reauthenticate'),
            );
          }),
        );

        await tester.tap(find.byType(ElevatedButton));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Sign in with phone'));
        await tester.pumpAndSettle();

        await sendSMS(tester, '555555558');

        final smsCodeInput = find.byType(SMSCodeInput);
        final code = await getVerificationCode('+1555555558');

        await tester.tap(smsCodeInput);
        await tester.enterText(smsCodeInput, code);
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        final future = reauthenticationCompleter.future.timeout(
          const Duration(seconds: 5),
        );

        expect(future, completes);
        expect(onPhoneVerifiedCalled, isTrue);
      },
      // passes locally but fails in CI
      skip:  isCI && (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS),
    );
  });
}
