// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';

import './facebook_sign_in_test.dart' as facebook_sign_in;

import '../utils.dart';

void main() {
  setUpAll(prepare);
  facebook_sign_in.main();
}
