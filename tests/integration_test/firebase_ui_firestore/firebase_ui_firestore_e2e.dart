// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';

import 'firestore_list_view_test.dart' as firestore_list_view_test;
// import 'firestore_query_builder_test.dart' as firestore_query_builder_test;

Future<void> main() async {
  firestore_list_view_test.main();
  // TODO: fix query builder tests
  // They run ok when run individually, but fail when run together
  // firestore_query_builder_test.main();
}
