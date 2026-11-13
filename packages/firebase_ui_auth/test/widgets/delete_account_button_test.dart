// Copyright 2026, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_utils.dart';

class _FakeUser extends Fake implements fba.User {
  var deleteCompleter = Completer<void>();
  int deleteCalls = 0;

  @override
  Future<void> delete() {
    deleteCalls++;
    return deleteCompleter.future;
  }
}

class _FakeAuth extends Fake implements fba.FirebaseAuth {
  _FakeAuth(this.currentUser);

  @override
  final fba.User? currentUser;
}

void main() {
  group('$DeleteAccountButton', () {
    Future<void> removeButton(WidgetTester tester) async {
      await tester.pumpWidget(const TestMaterialApp(child: SizedBox()));
      expect(find.byType(DeleteAccountButton), findsNothing);
    }

    testWidgets(
      "doesn't call setState if disposed while the account is being deleted",
      (tester) async {
        final user = _FakeUser();
        final auth = _FakeAuth(user);

        await tester.pumpWidget(
          TestMaterialApp(child: DeleteAccountButton(auth: auth)),
        );
        await tester.tap(find.byType(DeleteAccountButton));
        await tester.pump();

        await removeButton(tester);

        user.deleteCompleter.complete();
        await tester.pump();

        expect(tester.takeException(), isNull);
      },
    );

    testWidgets("doesn't call setState or delete the account if disposed while "
        'waiting for confirmation', (tester) async {
      final user = _FakeUser();
      final auth = _FakeAuth(user);
      final confirmation = Completer<bool>();

      await tester.pumpWidget(
        TestMaterialApp(
          child: DeleteAccountButton(
            auth: auth,
            showDeleteConfirmationDialog: true,
            deleteConfirmation: (_) => confirmation.future,
          ),
        ),
      );
      await tester.tap(find.byType(DeleteAccountButton));
      await tester.pump();

      await removeButton(tester);

      confirmation.complete(true);
      await tester.pump();

      expect(tester.takeException(), isNull);
      expect(user.deleteCalls, 0);
    });

    testWidgets(
      "doesn't ask to re-authenticate if disposed before deleting fails with "
      'a recent login error',
      (tester) async {
        final user = _FakeUser();
        final auth = _FakeAuth(user);
        var signInRequiredCalls = 0;

        await tester.pumpWidget(
          TestMaterialApp(
            child: DeleteAccountButton(
              auth: auth,
              onSignInRequired: () async {
                signInRequiredCalls++;
                return true;
              },
            ),
          ),
        );
        await tester.tap(find.byType(DeleteAccountButton));
        await tester.pump();

        await removeButton(tester);

        user.deleteCompleter.completeError(
          fba.FirebaseAuthException(code: 'requires-recent-login'),
        );
        await tester.pump();

        expect(tester.takeException(), isNull);
        expect(signInRequiredCalls, 0);
        expect(user.deleteCalls, 1);
      },
    );

    testWidgets(
      "doesn't call setState or retry if disposed while re-authenticating",
      (tester) async {
        final user = _FakeUser();
        final auth = _FakeAuth(user);
        final signedIn = Completer<bool>();

        await tester.pumpWidget(
          TestMaterialApp(
            child: DeleteAccountButton(
              auth: auth,
              onSignInRequired: () => signedIn.future,
            ),
          ),
        );
        await tester.tap(find.byType(DeleteAccountButton));
        await tester.pump();

        user.deleteCompleter.completeError(
          fba.FirebaseAuthException(code: 'requires-recent-login'),
        );
        await tester.pump();

        await removeButton(tester);

        user.deleteCompleter = Completer<void>();
        signedIn.complete(true);
        await tester.pump();

        expect(tester.takeException(), isNull);
        expect(user.deleteCalls, 1);
      },
    );
  });
}
