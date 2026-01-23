// Copyright 2024, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../test_utils.dart';

void main() {
  group('AuthStateChangeAction Debugging', () {
    late MockAuth auth;

    setUpAll(() {
      setFirebaseUiIsTestMode(true);
    });

    setUp(() {
      auth = MockAuth();
    });

    testWidgets(
      'notification bubbles up from providersBuilder',
      (tester) async {
        final notifications = [];

        await tester.pumpWidget(
          TestMaterialApp(
            child: NotificationListener<Notification>(
              onNotification: (n) {
                if (n.runtimeType.toString().contains('AuthStateTransition')) {
                  notifications.add(n);
                }
                return false;
              },
              child: SignInScreen(
                auth: auth,
                providers: [EmailAuthProvider()],
                providersBuilder: (context, providers, action) {
                  return [
                    EmailForm(
                      auth: auth,
                      action: action,
                      provider: providers.first as EmailAuthProvider,
                    ),
                  ];
                },
              ),
            ),
          ),
        );

        when(auth.signInWithCredential(any)).thenAnswer((_) async {
          return MockCredential();
        });

        await tester.enterText(find.byType(EmailInput), 'test@example.com');
        await tester.enterText(find.byType(PasswordInput), 'password');
        await tester.pump();
        await tester.tap(find.byType(LoadingButton));
        await tester.pumpAndSettle();

        expect(notifications, isNotEmpty, reason: 'Notification should have bubbled up to the top');
      },
    );
  });
}
