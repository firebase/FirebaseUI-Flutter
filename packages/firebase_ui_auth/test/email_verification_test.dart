// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  // The controller registers a lifecycle observer in its constructor.
  TestWidgetsFlutterBinding.ensureInitialized();

  group('EmailVerificationController', () {
    test('reload does nothing when no user is signed in', () async {
      final auth = MockAuth();
      final controller = EmailVerificationController(
        auth,
        appLinks: MockAppLinks(),
      );

      // reload() runs on every app resume, including resumes that happen with
      // no user at all, such as returning from a cancelled OAuth sign in.
      // It used to read auth.currentUser! and throw an unhandled TypeError.
      await expectLater(controller.reload(), completes);
      expect(controller.state, EmailVerificationState.unresolved);
    });
  });
}
