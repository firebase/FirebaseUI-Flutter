// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

String prompt(String tag) {
  stdout.write('$tag?: ');
  final answer = stdin.readLineSync();

  if (answer == null || answer.isEmpty) {
    throw Exception('$tag is required');
  }

  return answer;
}

Future<void> main(List<String> args) async {
  final name = prompt('Label name');

  final cwd = Directory.current.path;
  final l10nSrc = Directory(path.join(cwd, 'lib', 'l10n'));

  final enArb = File(path.join(l10nSrc.path, 'firebase_ui_en.arb'));
  final enContent =
      jsonDecode(await enArb.readAsString()) as Map<String, dynamic>;

  if (enContent.containsKey(name)) {
    stderr.writeln('Label "$name" already exists');
    exit(1);
  }

  final description = prompt('Label description');
  final englishTranslation = prompt('English translation');

  final files = l10nSrc.listSync().whereType<File>().toList();
  final futures = files.map((e) async {
    final newContent = await addLabel(e, name, description, englishTranslation);
    final b = StringBuffer();
    final string = const JsonEncoder.withIndent('  ').convert(newContent);
    b.write(string);
    b.write('\n');

    await e.writeAsString(b.toString());
  });

  await Future.wait(futures);
  stdout.writeln('Done!');
}

Future<Map<String, dynamic>> addLabel(
  File file,
  String name,
  String description,
  String englishTranslation,
) async {
  final content = jsonDecode(await file.readAsString()) as Map<String, dynamic>;

  return {
    ...content,
    "@@last_modified": DateTime.now().toIso8601String(),
    name: englishTranslation,
    "@$name": {
      "description": description,
      "placeholders": {},
    },
  };
}
