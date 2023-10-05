// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_localizations/src/lang/zh_tw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  const localeZh = Locale('zh');
  const localeTW = Locale('zh', 'TW');

  late FirebaseUILocalizationDelegate delegate;

  group(
    'FirebaseUILocalization loads the appropriate Chinese translation',
    () {
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

      test(
        'Loads the correct translation with the language tag "${localeTW.toLanguageTag()}"',
        () async {
          final localizations = await delegate.load(localeTW);
          expect(localizations.labels.signInWithPhoneButtonText, '使用電話號碼登入');
        },
      );
    },
  );

  group(
    'Localization override',
    () {
      test(
        'Overrides the DefaultLocalizations',
        () async {
          final localizations = await const FirebaseUILocalizationDelegate(
            DefaultLocalizationsOverrides(),
          ).load(localeTW);
          expect(localizations.labels.verifyEmailTitle, 'Overwritten');
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
