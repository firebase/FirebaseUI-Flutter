// Copyright 2020, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'email_form_test.dart' as email_form;
import 'email_link_sign_in_view_test.dart' as email_link_sign_in_view;

import 'phone_verification_test.dart' as phone_verification;
import 'layout_test.dart' as layout;
import 'actions_test.dart' as actions;

Future<void> main() async {
  group('Auth', () {
    email_form.main();
    email_link_sign_in_view.main();
    actions.main();

    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.android:
      case _ when kIsWeb:
        phone_verification.main();
        layout.main();
      case _: // no-op
    }
  });
}
