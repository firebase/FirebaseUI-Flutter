// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'test_utils.dart';

class MockPhoneMultiFactorInfo extends Mock
    implements fba.PhoneMultiFactorInfo {
  @override
  String get phoneNumber => '+1234567890';
}

class MockTotpMultiFactorInfo extends Mock implements fba.TotpMultiFactorInfo {}

class MockMultiFactorSession extends Mock implements fba.MultiFactorSession {}

class MockMultiFactorResolver extends Mock implements fba.MultiFactorResolver {
  final MockMultiFactorSession _session = MockMultiFactorSession();
  final List<fba.MultiFactorInfo> _hints = [MockPhoneMultiFactorInfo()];

  @override
  fba.MultiFactorSession get session => _session;

  @override
  List<fba.MultiFactorInfo> get hints => _hints;

  @override
  Future<fba.UserCredential> resolveSignIn(
    fba.MultiFactorAssertion? assertion,
  ) {
    return super.noSuchMethod(
      Invocation.method(#resolveSignIn, [assertion]),
      returnValue: Future.value(MockCredential()),
      returnValueForMissingStub: Future.value(MockCredential()),
    );
  }
}

class MockUnsupportedMultiFactorResolver extends Mock
    implements fba.MultiFactorResolver {
  @override
  List<fba.MultiFactorInfo> get hints => [MockTotpMultiFactorInfo()];
}

class MockPhoneAuthCredential extends Mock implements fba.PhoneAuthCredential {}

void main() {
  group('startMFAVerification', () {
    late MockAuth auth;
    late MockMultiFactorResolver resolver;

    setUpAll(() {
      setFirebaseUiIsTestMode(true);
    });

    setUp(() {
      auth = MockAuth();
      resolver = MockMultiFactorResolver();
    });

    testWidgets('throws on unsupported MFA type', (tester) async {
      final unsupportedResolver = MockUnsupportedMultiFactorResolver();
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  expect(
                    () => startMFAVerification(
                      context: context,
                      resolver: unsupportedResolver,
                      auth: auth,
                    ),
                    throwsA(isA<Exception>()),
                  );
                },
                child: const Text('Start MFA'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Start MFA'));
    });

    testWidgets(
      'handles resolveSignIn error, calls onError, propagates to flow, and succeeds on retry',
      (tester) async {
        final expectedCredential = MockCredential();
        final testException = fba.FirebaseAuthException(
          code: 'invalid-verification-code',
          message: 'Invalid code',
        );

        int resolveCallCount = 0;
        when(resolver.resolveSignIn(any)).thenAnswer((_) async {
          resolveCallCount++;
          if (resolveCallCount == 1) {
            throw testException;
          }
          return expectedCredential;
        });

        FirebaseException? capturedError;
        late List<FirebaseUIAction> capturedActions;
        late Object capturedFlowKey;

        Future<fba.UserCredential>? verificationFuture;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    verificationFuture = startMFAVerification(
                      context: context,
                      resolver: resolver,
                      auth: auth,
                      onError: (e) {
                        capturedError = e;
                      },
                      smsCodeInputScreenBuilder:
                          (context, actions, flowKey, action) {
                            capturedActions = actions;
                            capturedFlowKey = flowKey;
                            return const Scaffold(
                              body: Text('Custom SMS Code Input Screen'),
                            );
                          },
                    );
                  },
                  child: const Text('Start MFA'),
                );
              },
            ),
          ),
        );

        // Tap the button to start MFA verification
        await tester.tap(find.text('Start MFA'));
        await tester.pumpAndSettle();

        expect(find.text('Custom SMS Code Input Screen'), findsOneWidget);
        expect(capturedActions, isNotEmpty);

        final credentialAction = capturedActions
            .whereType<AuthStateChangeAction<CredentialReceived>>()
            .first;

        final mockPhoneCred = MockPhoneAuthCredential();

        // 1st attempt: throws error
        credentialAction.callback(
          tester.element(find.text('Custom SMS Code Input Screen')),
          CredentialReceived(mockPhoneCred),
        );
        await tester.pumpAndSettle();

        expect(resolveCallCount, 1);
        expect(capturedError, equals(testException));

        // Verify flow state transitioned to AuthFailed
        final state = AuthFlowBuilder.getState(capturedFlowKey);
        expect(state, isA<AuthFailed>());
        expect((state as AuthFailed).exception, equals(testException));

        // Screen should still be visible because we did not pop on error
        expect(find.text('Custom SMS Code Input Screen'), findsOneWidget);

        // 2nd attempt: succeeds
        credentialAction.callback(
          tester.element(find.text('Custom SMS Code Input Screen')),
          CredentialReceived(mockPhoneCred),
        );
        await tester.pumpAndSettle();

        expect(resolveCallCount, 2);
        // Screen should now be popped
        expect(find.text('Custom SMS Code Input Screen'), findsNothing);

        expect(verificationFuture, isNotNull);
        final result = await verificationFuture!;
        expect(result, equals(expectedCredential));
      },
    );
  });
}
