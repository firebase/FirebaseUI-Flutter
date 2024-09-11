// Copyright 2024, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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

  final iosSdkVersion = json[json.keys.first]["firebase_sdk"]["ios"] as String;

  final pubspecFilePaths = findPubspecFiles(Directory.current);

  final listOfFutures = <Future>[];
  for (final filePath in pubspecFilePaths) {
    final future = updatePubspecFile(filePath, latestVersions);
    listOfFutures.add(future);
  }

  listOfFutures.add(
    updatePodfileVersion(
      iosSdkVersion,
      './tests/ios/Podfile',
    ),
  );
  listOfFutures.add(
    updatePodfileVersion(
      iosSdkVersion,
      './tests/macos/Podfile',
    ),
  );

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

  if (dependencies != null) {
    dependencies.forEach((key, value) {
      if (latestVersions.containsKey(key)) {
        yamlEditor.update(['dependencies', key], '^${latestVersions[key]}');
      }
    });
  }

  await File(filePath).writeAsString(yamlEditor.toString());
}

List<String> findPubspecFiles(Directory root) {
  final pubspecFiles = <String>[];
  final directories = [
    Directory(p.join(root.path, 'packages')),
    Directory(p.join(root.path, 'tests'))
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

Future<void> updatePodfileVersion(
  String iosSdkVersion,
  String podfilePath,
) async {
  final podfile = File(podfilePath);
  if (!await podfile.exists()) {
    throw Exception('Podfile not found at $podfilePath');
  }

  String content = await podfile.readAsString();

  final updatedContent = content.replaceAllMapped(
    RegExp(
        r"pod 'FirebaseFirestore', :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => '\d+\.\d+\.\d+'"),
    (match) =>
        "pod 'FirebaseFirestore', :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => '$iosSdkVersion'",
  );

  await podfile.writeAsString(updatedContent);

  print(
      'Updated Podfile Firestore framework on path: $podfilePath to version: $iosSdkVersion');
}
