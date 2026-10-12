// Copyright 2026, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_utils.dart';

class _FakeUserInfo extends Fake implements fba.UserInfo {
  _FakeUserInfo(this.providerId);

  @override
  final String providerId;
}

class _FakeMultiFactorInfo extends Fake implements fba.MultiFactorInfo {}

class _FakeMultiFactor extends Fake implements fba.MultiFactor {
  Future<List<fba.MultiFactorInfo>> Function() enrolledFactors = () async => [
    _FakeMultiFactorInfo(),
  ];
  final unenrollCompleter = Completer<void>();
  int unenrollCalls = 0;
  final enrollCompleter = Completer<void>();

  @override
  Future<List<fba.MultiFactorInfo>> getEnrolledFactors() => enrolledFactors();

  @override
  Future<void> unenroll({
    String? factorUid,
    fba.MultiFactorInfo? multiFactorInfo,
  }) {
    unenrollCalls++;
    return unenrollCompleter.future;
  }

  @override
  Future<fba.MultiFactorSession> getSession() async =>
      _FakeMultiFactorSession();

  @override
  Future<void> enroll(
    fba.MultiFactorAssertion assertion, {
    String? displayName,
  }) => enrollCompleter.future;
}

class _FakeMultiFactorSession extends Fake implements fba.MultiFactorSession {}

class _FakeUser extends Fake implements fba.User {
  final unlinkCompleter = Completer<fba.User>();

  @override
  final _FakeMultiFactor multiFactor = _FakeMultiFactor();

  @override
  bool get emailVerified => true;

  @override
  String? get displayName => 'Test User';

  @override
  String? get photoURL => null;

  @override
  List<fba.UserInfo> get providerData => [
    _FakeUserInfo('password'),
    _FakeUserInfo('phone'),
  ];

  @override
  Future<fba.User> unlink(String providerId) => unlinkCompleter.future;

  @override
  Future<void> reload() async {}
}

class _FakeAuth extends Fake implements fba.FirebaseAuth {
  _FakeAuth(this.currentUser);

  @override
  final fba.User? currentUser;

  @override
  final app = MockApp();
}

void main() {
  group('$ProfileScreen', () {
    setUpAll(() {
      setFirebaseUiIsTestMode(true);
    });

    Future<void> pumpProfileScreen(
      WidgetTester tester,
      fba.FirebaseAuth auth, {
      bool showMFATile = false,
      List<AuthProvider>? providers,
    }) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProfileScreen(
            auth: auth,
            providers: providers ?? [EmailAuthProvider(), PhoneAuthProvider()],
            showMFATile: showMFATile,
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    Future<void> removeProfileScreen(WidgetTester tester) async {
      await tester.pumpWidget(const SizedBox());
      expect(find.byType(ProfileScreen), findsNothing);
    }

    group('unlinking a provider', () {
      Future<void> startUnlinking(WidgetTester tester) async {
        final linkedProviders = find
            .ancestor(
              of: find.text('Sign-in methods'),
              matching: find.byType(Column),
            )
            .first;
        await tester.tap(
          find.descendant(
            of: linkedProviders,
            matching: find.byIcon(Icons.edit),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byIcon(Icons.remove_circle).first);
        await tester.pump();
      }

      testWidgets("doesn't call setState if disposed before it succeeds", (
        tester,
      ) async {
        final user = _FakeUser();
        await pumpProfileScreen(tester, _FakeAuth(user));
        await startUnlinking(tester);

        await removeProfileScreen(tester);

        user.unlinkCompleter.complete(user);
        await tester.pump();

        expect(tester.takeException(), isNull);
      });

      testWidgets("doesn't call setState if disposed before it fails", (
        tester,
      ) async {
        final user = _FakeUser();
        await pumpProfileScreen(tester, _FakeAuth(user));
        await startUnlinking(tester);

        await removeProfileScreen(tester);

        user.unlinkCompleter.completeError(
          fba.FirebaseAuthException(code: 'no-such-provider'),
        );
        await tester.pump();

        expect(tester.takeException(), isNull);
      });
    });

    group('disabling MFA', () {
      testWidgets(
        "doesn't call setState or unenroll if disposed while loading the "
        'enrolled factors',
        (tester) async {
          final user = _FakeUser();
          await pumpProfileScreen(tester, _FakeAuth(user), showMFATile: true);

          final factors = Completer<List<fba.MultiFactorInfo>>();
          user.multiFactor.enrolledFactors = () => factors.future;
          await tester.tap(find.text('Disable'));
          await tester.pump();

          await removeProfileScreen(tester);

          factors.complete([_FakeMultiFactorInfo()]);
          await tester.pump();

          expect(tester.takeException(), isNull);
          expect(user.multiFactor.unenrollCalls, 0);
        },
      );

      testWidgets(
        "doesn't call setState or onToggled if disposed before unenrolling "
        'succeeds',
        (tester) async {
          final user = _FakeUser();
          await pumpProfileScreen(tester, _FakeAuth(user), showMFATile: true);
          await tester.tap(find.text('Disable'));
          await tester.pump();

          await removeProfileScreen(tester);

          user.multiFactor.unenrollCompleter.complete();
          await tester.pump();

          expect(tester.takeException(), isNull);
        },
      );

      testWidgets("doesn't call setState or re-authenticate if disposed before "
          'unenrolling fails with a recent login error', (tester) async {
        final user = _FakeUser();
        await pumpProfileScreen(tester, _FakeAuth(user), showMFATile: true);
        await tester.tap(find.text('Disable'));
        await tester.pump();

        await removeProfileScreen(tester);

        user.multiFactor.unenrollCompleter.completeError(
          PlatformException(code: 'FirebaseAuthRecentLoginRequiredException'),
        );
        await tester.pump();

        expect(tester.takeException(), isNull);
      });

      testWidgets(
        "doesn't call setState if disposed before unenrolling fails",
        (tester) async {
          final user = _FakeUser();
          await pumpProfileScreen(tester, _FakeAuth(user), showMFATile: true);
          await tester.tap(find.text('Disable'));
          await tester.pump();

          await removeProfileScreen(tester);

          user.multiFactor.unenrollCompleter.completeError(
            fba.FirebaseAuthException(code: 'network-request-failed'),
          );
          await tester.pump();

          expect(tester.takeException(), isNull);
        },
      );

      testWidgets(
        "doesn't call setState or retry if disposed while re-authenticating",
        (tester) async {
          final user = _FakeUser();
          final auth = _FakeAuth(user);
          // The email form in the re-authentication dialog needs a real
          // Firebase app, so only offer phone re-authentication.
          final providers = [PhoneAuthProvider()];
          await pumpProfileScreen(
            tester,
            auth,
            showMFATile: true,
            providers: providers,
          );
          await tester.tap(find.text('Disable'));
          await tester.pump();

          user.multiFactor.unenrollCompleter.completeError(
            PlatformException(code: 'FirebaseAuthRecentLoginRequiredException'),
          );
          // The toggle's loading indicator never settles, so pump through
          // the dialog's entrance transition instead.
          await tester.pump();
          await tester.pump(const Duration(seconds: 1));
          expect(find.byType(ReauthenticateDialog), findsOneWidget);

          // Rebuilding without the MFA tile disposes it under the dialog.
          await pumpProfileScreen(tester, auth, providers: providers);

          Navigator.of(
            tester.element(find.byType(ReauthenticateDialog)),
          ).pop(true);
          await tester.pumpAndSettle();

          expect(tester.takeException(), isNull);
          expect(user.multiFactor.unenrollCalls, 1);
        },
      );
    });

    group('enabling MFA', () {
      Future<void> startEnabling(
        WidgetTester tester,
        fba.FirebaseAuth auth,
      ) async {
        await pumpProfileScreen(tester, auth, showMFATile: true);
        await tester.tap(find.text('Enable'));
        await tester.pumpAndSettle();
        expect(find.byType(PhoneInputScreen), findsOneWidget);

        // Rebuilding without the MFA tile disposes it under the phone
        // verification screen.
        await pumpProfileScreen(tester, auth);
      }

      Future<void> receiveCredential(WidgetTester tester) async {
        final context = tester.element(find.byType(PhoneInputScreen));
        FirebaseUIAction.ofType<AuthStateChangeAction<CredentialReceived>>(
          context,
        )!.invoke(
          context,
          CredentialReceived(
            fba.PhoneAuthProvider.credential(
              verificationId: 'verification-id',
              smsCode: '123456',
            ),
          ),
        );
        await tester.pump();
      }

      testWidgets(
        "doesn't call setState if disposed before phone verification is "
        'closed',
        (tester) async {
          final user = _FakeUser();
          user.multiFactor.enrolledFactors = () async => [];
          await startEnabling(tester, _FakeAuth(user));

          Navigator.of(tester.element(find.byType(PhoneInputScreen))).pop();
          await tester.pumpAndSettle();

          expect(tester.takeException(), isNull);
        },
      );

      testWidgets(
        "doesn't call setState or onToggled if disposed before enrolling "
        'completes',
        (tester) async {
          final user = _FakeUser();
          user.multiFactor.enrolledFactors = () async => [];
          await startEnabling(tester, _FakeAuth(user));

          await receiveCredential(tester);

          user.multiFactor.enrollCompleter.complete();
          await tester.pumpAndSettle();

          expect(tester.takeException(), isNull);
          expect(find.byType(PhoneInputScreen), findsNothing);
        },
      );

      testWidgets("doesn't call setState if disposed before enrolling fails", (
        tester,
      ) async {
        final user = _FakeUser();
        user.multiFactor.enrolledFactors = () async => [];
        await startEnabling(tester, _FakeAuth(user));
        await receiveCredential(tester);

        user.multiFactor.enrollCompleter.completeError(
          fba.FirebaseAuthException(code: 'invalid-verification-code'),
        );
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
        expect(find.byType(PhoneInputScreen), findsNothing);
      });
    });
  });
}
