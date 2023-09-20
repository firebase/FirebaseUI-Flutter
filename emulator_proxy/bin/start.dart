// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:emulator_proxy/emulator_proxy.dart';

Future<void> main(List<String> args) async {
  final authProxy = EmulatorProxy(proxyPort: 9098, emulatorPort: 9099);

  authProxy.serve();
}
