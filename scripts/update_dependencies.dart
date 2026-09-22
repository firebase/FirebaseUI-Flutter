// Copyright 2024, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

Future<void> main(List<String> args) async {
  const bomPath =
      'https://raw.githubusercontent.com/firebase/flutterfire/main/scripts/versions.json';
  final http = HttpClient();
  final request = await http.getUrl(Uri.parse(bomPath));
  final response = await request.close(); // sends the request
  final jsonString = await response.transform(utf8.decoder).join();
  final json = jsonDecode(jsonString) as Map<String, dynamic>;

  final latestVersions =
      json[json.keys.first]["packages"] as Map<String, dynamic>;

  final pubspecFilePaths = findPubspecFiles(Directory.current);

  final listOfFutures = <Future>[];
  for (final filePath in pubspecFilePaths) {
    final future = updatePubspecFile(filePath, latestVersions);
    listOfFutures.add(future);
  }

  await Future.wait(listOfFutures);

  print(
    'All dependencies updated, please double check they are the latest, commit and push the changes.',
  );
}

Future<void> updatePubspecFile(
  String filePath,
  Map<String, dynamic> latestVersions,
) async {
  final content = await File(filePath).readAsString();
  final yamlEditor = YamlEditor(content);
  final pubspec = loadYaml(content) as YamlMap;

  final dependencies = pubspec['dependencies'] as YamlMap?;

  // The tests app pins FlutterFire packages exactly. Their Package.swift files
  // bake in an `exact:` firebase-ios-sdk version, so a caret that lets one
  // package drift ahead of the others makes SPM resolution fail outright.
  // Every other package keeps the caret.
  final pinExact = p.basename(p.dirname(filePath)) == 'tests';

  if (dependencies != null) {
    dependencies.forEach((key, value) {
      if (latestVersions.containsKey(key)) {
        final version = latestVersions[key];
        yamlEditor.update(
          ['dependencies', key],
          pinExact ? '$version' : '^$version',
        );
      }
    });
  }

  await File(filePath).writeAsString(yamlEditor.toString());
}

List<String> findPubspecFiles(Directory root) {
  final pubspecFiles = <String>[];
  final directories = [
    Directory(p.join(root.path, 'packages')),
    Directory(p.join(root.path, 'tests')),
  ];

  for (final dir in directories) {
    if (dir.existsSync()) {
      dir.listSync(recursive: true).forEach((entity) {
        if (entity is File && p.basename(entity.path) == 'pubspec.yaml') {
          if (!entity.path.contains('.symlinks') &&
              !entity.path.contains('.plugin_symlinks')) {
            pubspecFiles.add(entity.path);
          }
        }
      });
    }
  }

  return pubspecFiles;
}
