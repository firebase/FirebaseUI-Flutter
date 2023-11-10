// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

class EmulatorProxy {
  final int proxyPort;
  final int emulatorPort;
  final Duration latency;

  static final client = HttpClient();

  EmulatorProxy({
    required this.proxyPort,
    required this.emulatorPort,
    this.latency = const Duration(milliseconds: 100),
  });

  Future<void> serve() async {
    final server = await HttpServer.bind(
      InternetAddress.anyIPv4,
      proxyPort,
    );

    print('Listening on localhost:$proxyPort');

    await for (var req in server) {
      print('${req.method} ${req.uri}');
      await Future.delayed(latency);

      final dstReq = await client.openUrl(
        req.method,
        req.uri.replace(
          port: emulatorPort,
          host: '127.0.0.1',
          scheme: 'http',
        ),
      );

      req.headers.forEach((name, values) {
        for (final value in values) {
          dstReq.headers.add(name, value);
        }
      });

      await dstReq.addStream(req);
      final dstRes = await dstReq.close();

      req.response.statusCode = dstRes.statusCode;

      dstRes.headers.forEach((name, values) {
        for (final value in values) {
          req.response.headers.add(name, value);
        }
      });

      await req.response.addStream(dstRes);
      await req.response.close();
    }
  }
}
