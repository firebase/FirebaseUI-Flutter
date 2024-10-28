// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_utils.dart';

void main() {
  final auth = MockAuth();
  auth.user = MockUser(providerData: [
    MockUserInfo(providerId: 'email'),
    MockUserInfo(providerId: 'phone'),
  ]);

  group('$ReauthenticateDialog', () {
    testWidgets('has capitalized Cancel label', (tester) async {
      await tester.pumpWidget(
        TestMaterialApp(
          child: ReauthenticateDialog(
            auth: auth,
            providers: [
              EmailAuthProvider(),
              PhoneAuthProvider(),
            ],
          ),
        ),
      );

      expect(find.text('Cancel'), findsOneWidget);
    });
  });
}
