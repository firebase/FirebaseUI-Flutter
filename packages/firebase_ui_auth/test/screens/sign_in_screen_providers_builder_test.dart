// Copyright 2024, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_utils.dart';

void main() {
  group('SignInScreen providersBuilder', () {
    setUpAll(() {
      setFirebaseUiIsTestMode(true);
    });

    testWidgets('propagates providersBuilder to LoginView', (tester) async {
      await tester.pumpWidget(
        TestMaterialApp(
          child: SignInScreen(
            auth: MockAuth(),
            providers: [EmailAuthProvider()],
            providersBuilder: (context, providers, action) {
              return [const Text('Custom SignIn Builder')];
            },
          ),
        ),
      );

      expect(find.text('Custom SignIn Builder'), findsOneWidget);
    });
  });
}
