// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final exception = fba.FirebaseAuthException(
    code: 'invalid-email',
    message: 'The email address is badly formatted.',
  );

  group('$ErrorText', () {
    tearDown(() {
      ErrorText.localizeError = null;
    });

    testWidgets('uses localizations', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ErrorText(exception: exception),
          localizationsDelegates: [
            FirebaseUILocalizations.delegate,
          ],
        ),
      );
      expect(
        find.text('The email address is badly formatted.'),
        findsOneWidget,
      );
    });

    testWidgets('allows to override error text', (tester) async {
      String localizeError(
        BuildContext context,
        fba.FirebaseAuthException exception,
      ) {
        expect(exception.code, 'invalid-email');
        return 'Custom error text';
      }

      ErrorText.localizeError = localizeError;

      await tester.pumpWidget(
        MaterialApp(
          home: ErrorText(exception: exception),
          localizationsDelegates: [
            FirebaseUILocalizations.delegate,
          ],
        ),
      );

      expect(
        find.text('Custom error text'),
        findsOneWidget,
      );
    });
  });
}
