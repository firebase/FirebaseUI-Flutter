// Copyright 2024, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';

import 'database_list_view_test.dart' as database_list_view_test;

Future<void> main() async {
  group('Real-time Database', () {
    database_list_view_test.main();
  });
}