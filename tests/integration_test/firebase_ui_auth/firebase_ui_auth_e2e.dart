// Copyright 2020, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';

import 'email_form_test.dart' as email_form;
import 'email_link_sign_in_view_test.dart' as email_link_sign_in_view;
import 'universal_email_sign_in_screen_test.dart'
    as universal_email_sign_in_screen;
import 'phone_verification_test.dart' as phone_verification;
import 'layout_test.dart' as layout;

Future<void> main() async {
  email_form.main();
  email_link_sign_in_view.main();
  universal_email_sign_in_screen.main();
  phone_verification.main();

  layout.main();
}
