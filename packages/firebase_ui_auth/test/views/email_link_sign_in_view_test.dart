// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_utils.dart';

void main() {
  const labels = DefaultLocalizations();
  late MockAuth auth;
  late MockDynamicLinks dynamicLinks;
  late EmailLinkAuthProvider emailLinkProvider;

  setUp(() {
    auth = MockAuth();
    dynamicLinks = MockDynamicLinks();
    final actionCodeSettings = fba.ActionCodeSettings(
      url: 'https://example.com',
    );
    emailLinkProvider = EmailLinkAuthProvider(
      actionCodeSettings: actionCodeSettings,
      dynamicLinks: dynamicLinks,
    );
  });

  /// If EmailLinkSignInView is the root view, there should be
  /// no option to go back.
  testWidgets('no go back option if root view', (tester) async {
    await tester.pumpWidget(TestMaterialApp(
      child: EmailLinkSignInView(
        provider: emailLinkProvider,
        auth: auth,
      ),
    ));

    final button = find.text(labels.goBackButtonLabel);
    expect(button, findsNothing);
  });

  /// If EmailLinkSignInView is pushed from another view, there
  /// should be a button allowing a user to go back.
  testWidgets('show go back option if not root', (tester) async {
    await tester.pumpWidget(
      TestMaterialApp(
        child: Builder(
          builder: (context) => TextButton(
            child: const Text("Push"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: EmailLinkSignInView(
                      provider: emailLinkProvider, auth: auth),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.textContaining("Push"));
    await tester.pumpAndSettle();
    final button = find.text(labels.goBackButtonLabel);
    expect(button, findsOneWidget);
  });
}
