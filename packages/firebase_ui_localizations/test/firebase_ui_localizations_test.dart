// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_localizations/src/lang/zh_tw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

const localeZh = Locale('zh');
const localeTW = Locale('zh', 'TW');

Future<void> main() async {
  late FirebaseUILocalizationDelegate delegate;

  group(
    'FirebaseUILocalization loads the appropriate Chinese translation',
    () {
      localizedText(BuildContext context) =>
          FirebaseUILocalizations.labelsOf(context).signInWithPhoneButtonText;

      setUp(() async {
        delegate = const FirebaseUILocalizationDelegate();
      });

      test(
        'Loads the correct translation with the language tag "${localeZh.toLanguageTag()}"',
        () async {
          final localizations = await delegate.load(localeZh);
          expect(localizations.labels.signInWithPhoneButtonText, '使用电话号码登录');
        },
      );

      testWidgets(
        'UI test for the "${localeZh.toLanguageTag()}" translation',
        (tester) async {
          await tester.pumpWidget(
            TestMaterialApp(
              locale: localeZh,
              localizeText: localizedText,
            ),
          );
          expect(find.text('使用电话号码登录'), findsOneWidget);
        },
      );

      test(
        'Loads the correct translation with the language tag "${localeTW.toLanguageTag()}"',
        () async {
          final localizations = await delegate.load(localeTW);
          expect(localizations.labels.signInWithPhoneButtonText, '使用電話號碼登入');
        },
      );

      testWidgets(
        'UI test for the "${localeTW.toLanguageTag()}" translation',
        (tester) async {
          await tester.pumpWidget(
            TestMaterialApp(
              locale: localeTW,
              localizeText: localizedText,
            ),
          );
          expect(find.text('使用電話號碼登入'), findsOneWidget);
        },
      );
    },
  );

  group(
    'Localization override',
    () {
      localizedText(BuildContext context) =>
          FirebaseUILocalizations.labelsOf(context).verifyEmailTitle;

      test(
        'Overrides the DefaultLocalizations',
        () async {
          final localizations = await const FirebaseUILocalizationDelegate(
            DefaultLocalizationsOverrides(),
          ).load(localeTW);
          expect(localizations.labels.verifyEmailTitle, 'Overwritten');
        },
      );

      testWidgets(
        'UI test for the default translation override',
        (tester) async {
          await tester.pumpWidget(
            TestMaterialApp(
              locale: localeZh,
              localizationsOverride: const FirebaseUILocalizationDelegate(
                DefaultLocalizationsOverrides(),
              ),
              localizeText: localizedText,
            ),
          );
          expect(find.text('Overwritten'), findsOneWidget);
        },
      );

      test(
        'Overrides the DefaultLocalizations',
        () async {
          final localizations = await const FirebaseUILocalizationDelegate(
            ZhTWLocalizationsOverrides(),
          ).load(localeTW);
          expect(localizations.labels.verifyEmailTitle, '覆寫標題');
        },
      );

      testWidgets(
        'UI test for the "${localeTW.toLanguageTag()}" translation override',
        (tester) async {
          await tester.pumpWidget(
            TestMaterialApp(
              locale: localeTW,
              localizationsOverride: const FirebaseUILocalizationDelegate(
                ZhTWLocalizationsOverrides(),
              ),
              localizeText: localizedText,
            ),
          );
          expect(find.text('覆寫標題'), findsOneWidget);
        },
      );
    },
  );
}

class DefaultLocalizationsOverrides extends DefaultLocalizations {
  const DefaultLocalizationsOverrides();

  @override
  String get verifyEmailTitle => 'Overwritten';
}

class ZhTWLocalizationsOverrides extends ZhTWLocalizations {
  const ZhTWLocalizationsOverrides();

  @override
  String get verifyEmailTitle => '覆寫標題';
}

class TestMaterialApp extends StatelessWidget {
  final Locale locale;
  final LocalizationsDelegate? localizationsOverride;
  final String Function(BuildContext context) localizeText;

  const TestMaterialApp({
    super.key,
    required this.locale,
    this.localizationsOverride,
    required this.localizeText,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [localeZh, localeTW],
      locale: locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        localizationsOverride == null
            ? FirebaseUILocalizations.delegate
            : localizationsOverride!,
      ],
      home: Builder(
        builder: (context) => Text(
          localizeText.call(context),
        ),
      ),
    );
  }
}
