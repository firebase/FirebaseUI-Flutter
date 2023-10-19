// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

late String cwd;
late Directory outDir;

void main() async {
  cwd = Directory.current.path;
  final l10nSrc = Directory(path.join(cwd, 'lib', 'l10n'));
  outDir = Directory(path.join(cwd, 'lib', 'src'));

  if (!outDir.existsSync()) {
    outDir.createSync(recursive: true);
  }

  final readFutures = await l10nSrc.list().map((event) {
    final file = File(event.path);
    return file.openRead().transform(const Utf8Decoder()).toList();
  }).toList();

  final sources = await Future.wait(readFutures);

  final labelsByLocale = sources.fold<Map<String, dynamic>>({}, (acc, lines) {
    final fullSrc = lines.join();
    final arbJson = jsonDecode(fullSrc);
    final localeString = arbJson['@@locale'];

    final parsed = localeString.split('_');

    return {
      ...acc,
      parsed[0]: {
        ...(acc[parsed[0]] ?? {}),
        if (parsed.length > 1) parsed[1]: arbJson else 'default': arbJson,
      }
    };
  });

  final licenseHeader = await getLicenseHeader();

  final genOps = labelsByLocale.entries.map((entry) {
    if (entry.value.length == 1) {
      return [
        generateLocalizationsClass(
          locale: entry.key,
          arb: entry.value['default'],
          licenseHeader: licenseHeader,
        )
      ];
    }

    return [
      generateLocalizationsClass(
        locale: entry.key,
        arb: entry.value['default'],
        licenseHeader: licenseHeader,
      ),
      ...entry.value.entries
          .where((element) => element.key != 'default')
          .map((e) {
        return generateLocalizationsClass(
          locale: entry.key,
          countryCode: e.key,
          arb: e.value,
          licenseHeader: licenseHeader,
        );
      }).toList(),
    ];
  }).expand((element) => element);

  await Future.wait([...genOps.cast<Future>()]);

  await generateDefaultLocalizations(
    labelsByLocale['en']['default'].cast<String, dynamic>(),
    licenseHeader,
  );

  Process.runSync('dart', ['format', outDir.path]);
}

bool isLabelEntry(MapEntry<String, dynamic> entry) {
  return !entry.key.startsWith('@');
}

String dartFilename(String locale, [String? countryCode]) {
  return '$locale'
      '${countryCode != null ? '_${countryCode.toLowerCase()}' : ''}'
      '.dart';
}

String dartClassName(String locale, [String? countryCode]) {
  return '${locale.capitalize()}'
      '${countryCode?.capitalize() ?? ''}Localizations';
}

Future<void> generateLocalizationsClass({
  required String locale,
  required Map<String, dynamic> arb,
  required String licenseHeader,
  String? countryCode,
}) async {
  final filename = dartFilename(locale, countryCode);
  final outFile = File(path.join(outDir.path, 'lang', filename));

  if (!outFile.existsSync()) {
    outFile.createSync(recursive: true);
  }

  final out = outFile.openWrite();

  out.writeln(licenseHeader);
  out.writeln("import '../default_localizations.dart';");

  final labels = arb.entries.where(isLabelEntry).map((e) {
    final meta = arb['@${e.key}'] ?? {};

    return Label(
      key: e.key,
      translation: e.value,
      description: meta['description'],
    );
  }).toList();

  out.writeln();

  final className = dartClassName(locale, countryCode);

  out.writeln('class $className extends FirebaseUILocalizationLabels {');
  out.writeln('  const $className();');

  for (var label in labels) {
    final escapedTranslation = label.translation.contains('"')
        ? '"""${label.translation}"""'
        : '"${label.translation}"';

    out.writeln();
    out.writeln('  @override');
    out.writeln('  String get ${label.key} => $escapedTranslation;');
  }

  out.writeln('}');

  await out.flush();
  await out.close();
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

class Label {
  final String key;
  final String translation;
  final String? description;

  Label({
    required this.key,
    required this.translation,
    this.description,
  });
}

Future<String> getLicenseHeader() async {
  final now = DateTime.now();

  final licenseFile = File(path.join(cwd, '../..', 'header_template.txt'));
  final template = await licenseFile.readAsString();

  return template
      .replaceAll('{{.Year}}', now.year.toString())
      .split('\n')
      .map((e) {
    return '// $e';
  }).join('\n');
}

Future<void> generateDefaultLocalizations(
  Map<String, dynamic> arb,
  String licenseHeader,
) async {
  final labels = arb.entries.where(isLabelEntry).map((e) {
    final meta = arb['@${e.key}'] ?? {};

    return Label(
      key: e.key,
      translation: e.value,
      description: meta['description'],
    );
  }).toList()
    ..sort((a, b) => a.key.compareTo(b.key));

  final content = await getDefaultLocalizationsContent(labels, licenseHeader);
  final outFile = File(path.join(outDir.path, 'default_localizations.dart'));

  if (!outFile.existsSync()) {
    outFile.createSync(recursive: true);
  }

  final out = outFile.openWrite();
  out.write(content);
  await out.flush();
  await out.close();
}

Future<String> getDefaultLocalizationsContent(
  List<Label> labels,
  String licenseHeader,
) async {
  final sb = StringBuffer();

  sb.writeln(licenseHeader);
  sb.writeln(defaultLocalizationsHeader);

  sb.writeln('abstract class FirebaseUILocalizationLabels {');
  sb.writeln('  const FirebaseUILocalizationLabels();');

  for (var label in labels) {
    sb.writeln();
    if (label.description != null && label.description!.isNotEmpty) {
      const prefix = '  /// ';
      for (var line in breakIntoLines(label.description!, 80 - prefix.length)) {
        sb.writeln('$prefix$line');
      }
    }
    sb.writeln('  String get ${label.key};');
  }

  sb.writeln('}');
  sb.writeln();

  sb.writeln(defaultLocalizationsFooter);

  return sb.toString();
}

const defaultLocalizationsHeader = '''

/*
 *  THIS FILE IS GENERATED.
 *  DO NOT MODIFY IT BY HAND UNLESS YOU KNOW WHAT YOU ARE DOING.
 * 
 *  See README.md for instructions on how to generate this file.
 */

import 'package:flutter/material.dart';

import 'lang/en.dart';

/// An abstract class containing all labels that concrete languages should
/// provide.
///
/// The easiest way to override some of these labels is to provide
/// an object that extends [DefaultLocalizations] and pass it to the
/// [MaterialApp.localizationsDelegates].
///
/// ```dart
/// import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
///
/// class LabelOverrides extends DefaultLocalizations {
///   const LabelOverrides();
///
///   @override
///   String get emailInputLabel => 'Enter your email';
/// }
///
/// MaterialApp(
///   // ...
///   localizationsDelegates: [
///     FirebaseUILocalizations.withDefaultOverrides(const LabelOverrides()),
///     GlobalMaterialLocalizations.delegate,
///     GlobalWidgetsLocalizations.delegate,
///     FirebaseUILocalizations.delegate,
///   ],
/// )
/// ```''';

const defaultLocalizationsFooter = '''
class DefaultLocalizations extends EnLocalizations {
  const DefaultLocalizations();
}
''';

List<String> breakIntoLines(String string, int lineLength) {
  final lines = <String>[];
  final words = string.split(' ');

  var currentLine = StringBuffer();
  for (var word in words) {
    if (currentLine.length + word.length > lineLength) {
      lines.add(currentLine.toString());
      currentLine = StringBuffer();
    }

    currentLine.write('$word ');
  }

  if (currentLine.isNotEmpty) {
    lines.add(currentLine.toString());
  }

  return lines;
}
