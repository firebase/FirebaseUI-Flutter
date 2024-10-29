// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils.dart';

void main() {
  setUpTests();
  group(
    'getControllerForType',
    () {
      setUp(() async {
        await auth.createUserWithEmailAndPassword(
          email: 'test@test.com',
          password: '123456',
        );
      });

      Future<void> authenticate(WidgetTester tester) async {
        final inputs = find.byType(TextFormField);

        await tester.enterText(inputs.at(0), 'test@test.com');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        await tester.enterText(inputs.at(1), '123456');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();
      }

      testWidgets(
        'getControllerForState returns correct controller type',
        (tester) async {
          late AuthController controller;

          await render(
            tester,
            FirebaseUIActions(
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  controller = getControllerForState(state);
                })
              ],
              child: const EmailForm(action: AuthAction.signIn),
            ),
          );

          await authenticate(tester);

          expect(controller, isA<EmailAuthController>());
        },
        skip: isCI && defaultTargetPlatform == TargetPlatform.macOS,
      );

      testWidgets('throws a StateError if used outside of the FirebaseUIAction',
          (tester) async {
        late AuthState state;

        await render(
          tester,
          AuthStateListener(
            listener: (oldState, newState, _) {
              state = newState;
              return null;
            },
            child: const EmailForm(action: AuthAction.signIn),
          ),
        );

        await authenticate(tester);

        expect(() => getControllerForState(state), throwsStateError);
      }, skip: isCI && defaultTargetPlatform == TargetPlatform.macOS);
    },
  );
}
