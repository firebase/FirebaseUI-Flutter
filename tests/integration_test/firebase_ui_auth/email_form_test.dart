// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';

import '../utils.dart';

void main() {
  const labels = DefaultLocalizations();

  group('EmailForm', () {
    testWidgets(
      'registers new user',
      (tester) async {
        await render(tester, const EmailForm(action: AuthAction.signUp));

        final inputs = find.byType(TextFormField);

        await tester.enterText(inputs.at(0), 'test@test.com');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        await tester.enterText(inputs.at(1), 'password');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();

        await tester.enterText(inputs.at(2), 'password');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        expect(find.byType(LoadingIndicator), findsOneWidget);
        await tester.pumpAndSettle();

        expect(auth.currentUser, isNotNull);
      },
      skip: isCI && (defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.android),
    );

    testWidgets(
      'shows wrong password error',
      (tester) async {
        await auth.createUserWithEmailAndPassword(
          email: 'test@test.com',
          password: 'password',
        );

        await auth.signOut();

        await render(tester, const EmailForm(action: AuthAction.signIn));

        final inputs = find.byType(TextFormField);

        await tester.enterText(inputs.at(0), 'test@test.com');
        await tester.testTextInput.receiveAction(TextInputAction.done);

        await tester.enterText(inputs.at(1), 'wrongpassword');
        await tester.testTextInput.receiveAction(TextInputAction.done);

        await tester.pumpAndSettle();

        expect(find.text(labels.wrongOrNoPasswordErrorText), findsOneWidget);
      },
      skip: isCI && defaultTargetPlatform == TargetPlatform.macOS,
    );

    testWidgets(
      'signs in the user',
      (tester) async {
        await auth.createUserWithEmailAndPassword(
          email: 'test@test.com',
          password: 'password',
        );

        await auth.signOut();

        await render(
          tester,
          FirebaseUIActions(
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                expect(state, isA<SignedIn>());
                expect(state.user, isNotNull);
                expect(state.user!.email, equals('test@test.com'));
              })
            ],
            child: const EmailForm(action: AuthAction.signIn),
          ),
        );

        final inputs = find.byType(TextFormField);

        await tester.enterText(inputs.at(0), 'test@test.com');
        await tester.testTextInput.receiveAction(TextInputAction.done);

        await tester.enterText(inputs.at(1), 'password');
        await tester.testTextInput.receiveAction(TextInputAction.done);

        await tester.pumpAndSettle();
      },
      skip: isCI && (defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.android),
    );

    testWidgets(
      'links email and password when auth action is link',
      (tester) async {
        await render(
          tester,
          const EmailForm(action: AuthAction.link),
        );

        await auth.signInAnonymously();
        final anonymousUid = auth.currentUser!.uid;

        final inputs = find.byType(TextFormField);

        await tester.enterText(inputs.at(0), 'test@test.com');
        await tester.testTextInput.receiveAction(TextInputAction.done);

        await tester.enterText(inputs.at(1), 'password');
        await tester.testTextInput.receiveAction(TextInputAction.done);

        await tester.enterText(inputs.at(2), 'password');
        await tester.testTextInput.receiveAction(TextInputAction.done);

        await tester.pumpAndSettle();

        expect(auth.currentUser!.email, 'test@test.com');
        expect(auth.currentUser!.uid, anonymousUid);
      },
      // see https://github.com/firebase/FirebaseUI-Flutter/issues/150
      skip: true,
    );
  });
}
