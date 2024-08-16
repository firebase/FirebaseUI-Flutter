// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:ui';

import "./default_localizations.dart";
import 'all_localizations.dart';

final Set<String> kSupportedLanguages = {
  'ar', // Arabic
  'de', // German
  'en', // English
  'es', // Spanish Castilian
  'fi', // Finnish
  'fr', // French
  'he', // Hebrew
  'hi', // Hindi
  'hu', // Hungarian
  'id', // Indonesian
  'it', // Italian
  'ja', // Japanese
  'ko', // Korean
  'nl', // Dutch Flemish
  'nb', // Norwegian Bokmål
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
    case 'fi':
      return const FiLocalizations();

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
