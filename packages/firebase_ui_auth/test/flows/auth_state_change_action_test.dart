// Copyright 2024, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../test_utils.dart';

void main() {
  group('AuthStateChangeAction', () {
    late MockAuth auth;

    setUpAll(() {
      setFirebaseUiIsTestMode(true);
    });

    setUp(() {
      auth = MockAuth();
    });

    testWidgets(
      'is triggered when signing in via EmailForm inside providersBuilder',
      (tester) async {
        final actionCalled = <SignedIn>[];

        await tester.pumpWidget(
          TestMaterialApp(
            child: SignInScreen(
              auth: auth,
              providers: [EmailAuthProvider()],
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  actionCalled.add(state);
                }),
              ],
              providersBuilder: (context, providers, action) {
                return [
                  EmailForm(
                    auth: auth,
                    action: action,
                    provider: providers.first as EmailAuthProvider,
                  ),
                ];
              },
            ),
          ),
        );

        // Stub successful sign in
        when(auth.signInWithCredential(any)).thenAnswer((_) async {
          return MockCredential();
        });

        // Fill form
        await tester.enterText(
          find.byType(EmailInput),
          'test@example.com',
        );
        await tester.enterText(
          find.byType(PasswordInput),
          'password',
        );
        await tester.pump();

        // Tap sign in
        await tester.tap(find.byType(LoadingButton));
        await tester.pump();

        // Expect action to be called
        expect(actionCalled, hasLength(1));
      },
    );

    testWidgets(
      'is triggered when signing up via EmailForm inside providersBuilder',
      (tester) async {
        final actionCalled = <UserCreated>[];

        await tester.pumpWidget(
          TestMaterialApp(
            child: RegisterScreen(
              auth: auth,
              providers: [EmailAuthProvider()],
              actions: [
                AuthStateChangeAction<UserCreated>((context, state) {
                  actionCalled.add(state);
                }),
              ],
              providersBuilder: (context, providers, action) {
                return [
                  EmailForm(
                    auth: auth,
                    action: action,
                    provider: providers.first as EmailAuthProvider,
                  ),
                ];
              },
            ),
          ),
        );

        // Stub successful sign up
        final credential = MockCredential();
        when(credential.user).thenReturn(MockUser());

        when(auth.createUserWithEmailAndPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        )).thenAnswer((_) async {
          return credential;
        });

        // Fill form
        await tester.enterText(
          find.byType(EmailInput),
          'newuser@example.com',
        );
        await tester.enterText(
          find.byType(PasswordInput).first,
          'password123',
        );
        await tester.enterText(
          find.byType(PasswordInput).at(1),
          'password123',
        );
        await tester.pump();

        // Tap register
        await tester.tap(find.byType(LoadingButton));
        await tester.pumpAndSettle();

        verify(auth.createUserWithEmailAndPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        )).called(1);

        // Expect action to be called
        expect(actionCalled, hasLength(1));
      },
    );

    testWidgets(
      'is triggered when signing in via EmailForm inside providersBuilder without passing auth explicitly',
      (tester) async {
        final actionCalled = <SignedIn>[];

        await tester.pumpWidget(
          TestMaterialApp(
            child: SignInScreen(
              auth: auth,
              providers: [EmailAuthProvider()],
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  actionCalled.add(state);
                }),
              ],
              providersBuilder: (context, providers, action) {
                return [
                  EmailForm(
                    action: action,
                    provider: providers.first as EmailAuthProvider,
                  ),
                ];
              },
            ),
          ),
        );

        // Stub successful sign in on the shared MockAuth
        when(auth.signInWithCredential(any)).thenAnswer((_) async {
          return MockCredential();
        });

        // Fill form
        await tester.enterText(find.byType(EmailInput), 'test@example.com');
        await tester.enterText(find.byType(PasswordInput), 'password');
        await tester.pump();

        // Tap sign in
        await tester.tap(find.byType(LoadingButton));
        await tester.pump();

        // Expect action to be called
        expect(actionCalled, hasLength(1));
      },
    );

    testWidgets(
      'generic AuthStateChangeAction is triggered when custom providersBuilder is used',
      (tester) async {
        final actionCalled = <AuthState>[];

        await tester.pumpWidget(
          TestMaterialApp(
            child: SignInScreen(
              auth: auth,
              providers: [EmailAuthProvider()],
              actions: [
                AuthStateChangeAction<AuthState>((context, state) {
                  actionCalled.add(state);
                }),
              ],
              providersBuilder: (context, providers, action) {
                return [
                  EmailForm(
                    auth: auth,
                    action: action,
                    provider: providers.first as EmailAuthProvider,
                  ),
                ];
              },
            ),
          ),
        );

        when(auth.signInWithCredential(any)).thenAnswer((_) async {
          return MockCredential();
        });

        await tester.enterText(find.byType(EmailInput), 'test@example.com');
        await tester.enterText(find.byType(PasswordInput), 'password');
        await tester.pump();
        await tester.tap(find.byType(LoadingButton));
        await tester.pumpAndSettle();

        // Should be called at least for SigningIn and SignedIn
        expect(actionCalled, isNotEmpty);
        expect(actionCalled.any((s) => s is SignedIn), isTrue);
      },
    );
  });
}