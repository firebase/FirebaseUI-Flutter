// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'get_localization.dart';
import 'default_localizations.dart';

const kDefaultLocale = Locale('en');

/// {@template ui.i10n.localizations}
/// Could be used to obtain Firebase UI localization labels
/// via [BuildContext] (using [labelsOf] )and to override default localizations
/// (using [withDefaultOverrides]).
/// {@endtemplate}
class FirebaseUILocalizations<T extends FirebaseUILocalizationLabels> {
  final Locale locale;
  final T labels;

  /// {@macro ui.i10n.localizations}
  const FirebaseUILocalizations(this.locale, this.labels);

  /// Looks up an instance of the [FirebaseUILocalizations] on the
  /// [BuildContext].
  ///
  /// To obtain labels, use [labelsOf].
  static FirebaseUILocalizations of(BuildContext context) {
    final l = Localizations.of<FirebaseUILocalizations>(
      context,
      FirebaseUILocalizations,
    );

    if (l != null) {
      return l;
    }

    final defaultTranslation = getFirebaseUITranslation(kDefaultLocale);
    return FirebaseUILocalizations(kDefaultLocale, defaultTranslation);
  }

  /// Returns localization labels.
  static FirebaseUILocalizationLabels labelsOf(BuildContext context) {
    return FirebaseUILocalizations.of(context).labels;
  }

  /// Localization delegate that could be provided to the
  /// [MaterialApp.localizationsDelegates].
  static FirebaseUILocalizationDelegate delegate =
      const FirebaseUILocalizationDelegate();

  /// Should be used to override labels provided by the library.
  ///
  /// See [FirebaseUILocalizationLabels].
  static FirebaseUILocalizationDelegate
      withDefaultOverrides<T extends FirebaseUILocalizationLabels>(
          T overrides) {
    return FirebaseUILocalizationDelegate<T>(overrides);
  }
}

/// See [LocalizationsDelegate]
class FirebaseUILocalizationDelegate<T extends FirebaseUILocalizationLabels>
    extends LocalizationsDelegate<FirebaseUILocalizations> {
  /// An instance of the class that overrides some labels.
  /// See [FirebaseUILocalizationLabels].
  final T? overrides;
  final bool _forceSupportAllLocales;

  /// See [LocalizationsDelegate].
  const FirebaseUILocalizationDelegate([
    this.overrides,
    this._forceSupportAllLocales = false,
  ]);

  @override
  bool isSupported(Locale locale) =>
      _forceSupportAllLocales ||
      kSupportedLanguages.contains(locale.languageCode);

  @override
  Future<FirebaseUILocalizations> load(Locale locale) {
    final translation = getFirebaseUITranslation(locale, kDefaultLocale);

    final localizations = FirebaseUILocalizations(
      locale,
      overrides ?? translation,
    );

    return SynchronousFuture<FirebaseUILocalizations>(localizations);
  }

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<FirebaseUILocalizations> old,
  ) {
    return false;
  }
}
