// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../test_utils.dart';

void main() {
  const labels = DefaultLocalizations();
  late MockAuth auth;
  late MockAppLinks appLinks;
  late EmailLinkAuthProvider emailLinkProvider;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    auth = MockAuth();
    appLinks = MockAppLinks();
    final actionCodeSettings = fba.ActionCodeSettings(
      url: 'https://example.com',
    );
    emailLinkProvider = EmailLinkAuthProvider(
      actionCodeSettings: actionCodeSettings,
      appLinks: appLinks,
    );
  });

  /// If EmailLinkSignInView is the root view, there should be
  /// no option to go back.
  testWidgets('no go back option if root view', (tester) async {
    await tester.pumpWidget(
      TestMaterialApp(
        child: EmailLinkSignInView(provider: emailLinkProvider, auth: auth),
      ),
    );

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
                    provider: emailLinkProvider,
                    auth: auth,
                  ),
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

  testWidgets('asks to confirm the email for a link from another device', (
    tester,
  ) async {
    await tester.pumpWidget(
      TestMaterialApp(
        child: EmailLinkSignInView(provider: emailLinkProvider, auth: auth),
      ),
    );

    emailLinkProvider.authListener.onEmailRequired('https://test.com/link');
    await tester.pump();

    expect(find.text(labels.emailLinkConfirmEmailText), findsOneWidget);
    expect(find.text(labels.sendLinkButtonLabel), findsNothing);

    await tester.enterText(find.byType(TextFormField), 'test@test.com');
    await tester.tap(find.text(labels.continueText));
    await tester.pump();

    verify(
      auth.signInWithEmailLink(
        email: 'test@test.com',
        emailLink: 'https://test.com/link',
      ),
    ).called(1);
    verifyNever(
      auth.sendSignInLinkToEmail(
        email: anyNamed('email'),
        actionCodeSettings: anyNamed('actionCodeSettings'),
      ),
    );
  });

  testWidgets('shows a loading indicator while signing in', (tester) async {
    await tester.pumpWidget(
      TestMaterialApp(
        child: EmailLinkSignInView(provider: emailLinkProvider, auth: auth),
      ),
    );

    emailLinkProvider.authListener.onBeforeSignIn();
    await tester.pump();

    expect(find.byType(LoadingIndicator), findsOneWidget);
    expect(find.text(labels.signInWithEmailLinkSentText), findsNothing);
    expect(find.byType(EmailInput), findsNothing);
  });

  testWidgets('keeps the form hidden after signing in', (tester) async {
    await tester.pumpWidget(
      TestMaterialApp(
        child: EmailLinkSignInView(provider: emailLinkProvider, auth: auth),
      ),
    );

    emailLinkProvider.authListener.onBeforeSignIn();
    emailLinkProvider.authListener.onSignedIn(MockCredential());
    await tester.pump();

    expect(find.byType(EmailInput), findsNothing);
    expect(find.byType(LoadingIndicator), findsOneWidget);
  });

  testWidgets('confirms the email for a link kept while it was closed', (
    tester,
  ) async {
    Widget view() => TestMaterialApp(
      child: EmailLinkSignInView(provider: emailLinkProvider, auth: auth),
    );

    // The screen is shown once, then closed.
    await tester.pumpWidget(view());
    await tester.pumpWidget(const SizedBox());

    // A link from another device arrives while no email link screen shows.
    MockUriStream.addLink(Uri.parse('https://test.com/link'));
    await tester.pump();

    await tester.pumpWidget(view());
    await tester.pump();

    expect(find.text(labels.emailLinkConfirmEmailText), findsOneWidget);
    expect(find.text(labels.continueText), findsOneWidget);
  });
}
