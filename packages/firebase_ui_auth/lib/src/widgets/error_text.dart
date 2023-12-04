// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException;

import '../flows/phone_auth_flow.dart';

String? localizedErrorText(
  String? errorCode,
  FirebaseUILocalizationLabels labels,
) {
  switch (errorCode) {
    case 'user-not-found':
      return labels.userNotFoundErrorText;
    case 'email-already-in-use':
      return labels.emailTakenErrorText;
    case 'too-many-requests':
      return labels.accessDisabledErrorText;
    case 'wrong-password':
      return labels.wrongOrNoPasswordErrorText;
    case 'credential-already-in-use':
      return labels.credentialAlreadyInUseErrorText;
    case 'invalid-verification-code':
      return labels.invalidVerificationCodeErrorText;
    case 'weak-password':
      return labels.weakPasswordErrorText;

    default:
      return null;
  }
}

/// {@template ui.auth.widgets.error_text}
/// A widget which displays error text for a given Firebase error code.
/// {@endtemplate}
class ErrorText extends StatelessWidget {
  /// A way to customize localized error messages for [FirebaseAuthException].
  ///
  /// Example usage:
  /// ```dart
  /// ErrorText.localizeError = (BuildContext context, FirebaseAuthException e) {
  ///   final defaultLabels = FirebaseUILocalizations.labelsOf(context);
  ///
  ///   return switch (e.code) {
  ///     'user-not-found' => 'Please create an account first.',
  ///     'credential-already-in-use' => 'This email is already in use.',
  ///     _ => localizedErrorText(e.code, defaultLabels) ?? 'Oh no! Something went wrong.',
  ///   }
  /// }
  static String Function(
    BuildContext context,
    fba.FirebaseAuthException exception,
  )? localizeError;

  /// A way to customize error message for [PlatformException]
  ///
  /// Example usage:
  /// ```dart
  /// ErrorText.localizePlatformError = (BuildContext context, PlatformException e) {
  ///   if (e.code == "network_error") return "Please check your internet connection.";
  ///   return "Oh no! Something went wrong.";
  /// }
  static String Function(
    BuildContext context,
    PlatformException exception,
  )? localizePlatformError;

  /// A way to customize the widget that is used across the library to show
  /// error hints. By default a localized text is used with a color set to
  /// [ColorScheme.error] under [MaterialApp] and
  /// [CupertinoColors.destructiveRed] under [CupertinoApp].
  static Widget Function(BuildContext context, String message)? builder;

  /// An exception that contains error details.
  /// Often this is a [FirebaseAuthException].
  final Exception exception;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// {@macro ui.auth.widgets.error_text}
  const ErrorText({
    super.key,
    required this.exception,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    late Color color;
    final isCupertino = CupertinoUserInterfaceLevel.maybeOf(context) != null;

    if (isCupertino) {
      color = CupertinoColors.destructiveRed;
    } else {
      color = Theme.of(context).colorScheme.error;
    }

    final l = FirebaseUILocalizations.labelsOf(context);
    String text = l.unknownError;

    if (exception is AutoresolutionFailedException) {
      text = l.smsAutoresolutionFailedError;
    }

    if (exception is fba.FirebaseAuthException) {
      if (localizeError != null) {
        text = localizeError!(context, exception as fba.FirebaseAuthException);
      } else {
        final e = exception as fba.FirebaseAuthException;
        final code = e.code;
        final newText = localizedErrorText(code, l) ?? e.message;

        if (newText != null) {
          text = newText;
        }
      }
    }

    if (exception is PlatformException && localizePlatformError != null) {
      text = localizePlatformError!(context, exception as PlatformException);
    }

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(color: color),
    );
  }
}
