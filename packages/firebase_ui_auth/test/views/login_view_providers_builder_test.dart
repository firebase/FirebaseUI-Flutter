// Copyright 2024, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_utils.dart';

void main() {
  group('LoginView providersBuilder', () {
    testWidgets('uses custom providersBuilder when provided', (tester) async {
      await tester.pumpWidget(
        TestMaterialApp(
          child: LoginView(
            auth: MockAuth(),
            action: AuthAction.signIn,
            providers: [
              EmailAuthProvider(),
              PhoneAuthProvider(),
            ],
            providersBuilder: (context, providers, action) {
              return [
                const Text('Custom Header'),
                for (final provider in providers)
                  if (provider is EmailAuthProvider)
                    const Text('Custom Email Form'),
              ];
            },
          ),
        ),
      );

      expect(find.text('Custom Header'), findsOneWidget);
      expect(find.text('Custom Email Form'), findsOneWidget);
      // Phone provider should be ignored as per our custom builder logic
      expect(find.byType(PhoneVerificationButton), findsNothing);
    });

    testWidgets('uses default explicit order when no builder provided',
        (tester) async {
      await tester.pumpWidget(
        TestMaterialApp(
          child: LoginView(
            auth: MockAuth(),
            action: AuthAction.signIn,
            providers: [
              PhoneAuthProvider(), // Phone first in list
              EmailAuthProvider(), // Email second
            ],
          ),
        ),
      );

      final emailFinder = find.byType(EmailForm);
      final phoneFinder = find.byType(PhoneVerificationButton);

      expect(emailFinder, findsOneWidget);
      expect(phoneFinder, findsOneWidget);

      final emailTop = tester.getTopLeft(emailFinder).dy;
      final phoneTop = tester.getTopLeft(phoneFinder).dy;

      // Verify explicit default order: Email should be above Phone
      expect(emailTop, lessThan(phoneTop));
    });

    testWidgets('shows confirm password field in signUp mode', (tester) async {
      await tester.pumpWidget(
        TestMaterialApp(
          child: LoginView(
            auth: MockAuth(),
            action: AuthAction.signUp,
            providers: [EmailAuthProvider()],
          ),
        ),
      );

      // In signUp mode, EmailForm should show confirm password field.
      expect(find.text('Confirm password'), findsOneWidget);
    });
  });
}