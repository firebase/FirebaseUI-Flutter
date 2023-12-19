// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:ui';

import "./default_localizations.dart";
import 'lang/ar.dart';
import 'lang/de.dart';
import 'lang/en.dart';
import 'lang/es.dart';
import 'lang/es_419.dart';
import 'lang/fr.dart';
import 'lang/he.dart';
import 'lang/hi.dart';
import 'lang/hu.dart';
import 'lang/id.dart';
import 'lang/it.dart';
import 'lang/ja.dart';
import 'lang/ko.dart';
import 'lang/nb.dart';
import 'lang/nl.dart';
import 'lang/pl.dart';
import 'lang/pt.dart';
import 'lang/ro.dart';
import 'lang/ru.dart';
import 'lang/th.dart';
import 'lang/tr.dart';
import 'lang/uk.dart';
import 'lang/zh.dart';
import 'lang/zh_tw.dart';

final Set<String> kSupportedLanguages = {
  'ar', // Arabic
  'de', // German
  'en', // English
  'es', // Spanish Castilian
  'fr', // French
  'he', // Hebrew
  'hi', // Hindi
  'hu', // Hungarian
  'id', // Indonesian
  'it', // Italian
  'ja', // Japanese
  'ko', // Korean
  'nl', // Dutch Flemish
  'pl', // Polish
  'pt', // Portuguese
  'ro', // Romanian
  'ru', // Russian
  'th', // Thai
  'tr', // Turkish
  'uk', // Ukrainian
  'zh', // Chinese
};

FirebaseUILocalizationLabels getFirebaseUITranslation(
  Locale useLocale, [
  Locale? defaultLocale,
]) {
  final Locale locale;
  if (kSupportedLanguages.contains(useLocale.languageCode)) {
    locale = useLocale;
  } else {
    locale = defaultLocale ?? useLocale;
  }

  switch (locale.languageCode) {
    case 'ar':
      return const ArLocalizations();
    case 'de':
      return const DeLocalizations();
    case 'en':
      return const EnLocalizations();
    case 'es':
      switch (locale.countryCode) {
        case '419':
          return const Es419Localizations();
      }
      return const EsLocalizations();
    case 'fr':
      return const FrLocalizations();
    case 'he':
      return const HeLocalizations();
    case 'hi':
      return const HiLocalizations();
    case 'hu':
      return const HuLocalizations();
    case 'id':
      return const IdLocalizations();
    case 'it':
      return const ItLocalizations();
    case 'ja':
      return const JaLocalizations();
    case 'ko':
      return const KoLocalizations();
    case 'nb':
      return const NbLocalizations();
    case 'nl':
      return const NlLocalizations();
    case 'pl':
      return const PlLocalizations();
    case 'pt':
      return const PtLocalizations();
    case 'ro':
      return const RoLocalizations();
    case 'ru':
      return const RuLocalizations();
    case 'th':
      return const ThLocalizations();
    case 'tr':
      return const TrLocalizations();
    case 'uk':
      return const UkLocalizations();
    case 'zh':
      switch (locale.scriptCode) {
        case 'Hant':
          return const ZhTWLocalizations();
      }
      switch (locale.countryCode) {
        case 'HK':
        case 'TW':
          return const ZhTWLocalizations();
      }
      return const ZhLocalizations();
  }

  throw ('getTranslationLabels() called for unsupported locale "$locale"');
}
