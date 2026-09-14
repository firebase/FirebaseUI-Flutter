// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';
import 'package:firebase_ui_oauth_twitter/firebase_ui_oauth_twitter.dart';
import 'package:mockito/mockito.dart';

import '../utils.dart';

void main() async {
  final provider = TwitterProvider();
  late MockAuth auth;
  late MockProvider fbProvider;

  const labels = DefaultLocalizations();

  setUp(() {
    auth = MockAuth();
    fbProvider = MockProvider();
    provider.firebaseAuthProvider = fbProvider;
    setMockTwitterProvider(provider);
  });

  group(
    'Sign in with Twitter button',
    () {
      testWidgets('has a correct button label', (tester) async {
        await render(
          tester,
          OAuthProviderButton(provider: provider, auth: auth),
        );
        expect(find.text(labels.signInWithTwitterButtonText), findsOneWidget);
      });

      testWidgets('calls sign in when tapped', (tester) async {
        await render(
          tester,
          OAuthProviderButton(provider: provider, auth: auth),
        );

        final button = find.byType(OAuthProviderButtonBase);
        await tester.tap(button);

        await tester.pumpAndSettle();
        verify(auth.signInWithProvider(fbProvider)).called(1);
      });

      testWidgets('shows loading indicator when sign in is in progress', (
        tester,
      ) async {
        await render(
          tester,
          OAuthProviderButton(provider: provider, auth: auth),
        );

        final button = find.byType(OAuthProviderButtonBase);
        await tester.tap(button);
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('signs the user in', (tester) async {
        final listener = MockListener();

        await render(
          tester,
          AuthStateListener<OAuthController>(
            listener: (oldState, state, controller) {
              listener(state);
              return null;
            },
            child: OAuthProviderButton(provider: provider, auth: auth),
          ),
        );

        final button = find.byType(OAuthProviderButtonBase);
        await tester.tap(button);
        await tester.pumpAndSettle();

        final result = verify(listener.call(captureAny));
        expect(result.captured[1], isA<SignedIn>());

        final user = (result.captured[1] as SignedIn).user!;
        expect(user.displayName, 'Test User');
        expect(user.email, 'test@test.com');
      });

      testWidgets('links the credential when the user is anonymous', (
        tester,
      ) async {
        final anonymousUser = MockAnonymousUser();
        auth.currentUserOverride = anonymousUser;

        await render(
          tester,
          OAuthProviderButton(provider: provider, auth: auth),
        );

        final button = find.byType(OAuthProviderButtonBase);
        await tester.tap(button);
        await tester.pumpAndSettle();

        verify(anonymousUser.linkWithProvider(fbProvider)).called(1);
        verifyNever(auth.signInWithProvider(fbProvider));
      });

      test('throws when AuthAction.none is used', () {
        provider.auth = auth;

        expect(
          () => provider.mobileSignIn(AuthAction.none),
          throwsUnsupportedError,
        );
      });
    },
    skip: !provider.supportsPlatform(defaultTargetPlatform),
  );

  group('TwitterProvider', () {
    test('throws from desktopSignInArgs when the API keys are missing', () {
      expect(() => TwitterProvider().desktopSignInArgs, throwsArgumentError);
    });
  });
}

class MockListener<T> extends Mock {
  void call(AuthState? state) {
    super.noSuchMethod(Invocation.method(#call, [state]));
  }
}

class MockUser extends Mock implements fba.User {
  @override
  String? get displayName => 'Test User';

  @override
  String? get email => 'test@test.com';

  @override
  bool get isAnonymous => false;
}

class MockAnonymousUser extends Mock implements fba.User {
  @override
  bool get isAnonymous => true;

  @override
  Future<fba.UserCredential> linkWithProvider(Object provider) async {
    return super.noSuchMethod(
      Invocation.method(#linkWithProvider, [provider]),
      returnValue: Future.value(MockCredential()),
      returnValueForMissingStub: Future.value(MockCredential()),
    );
  }
}

class MockAuthCredential extends Mock implements fba.AuthCredential {}

class MockCredential extends Mock implements fba.UserCredential {
  @override
  fba.User? get user => MockUser();

  @override
  fba.AuthCredential? get credential => MockAuthCredential();
}

class MockProvider extends Mock implements fba.TwitterAuthProvider {}

class MockApp extends Mock implements FirebaseApp {}

class MockAuth extends Mock implements fba.FirebaseAuth {
  fba.User? currentUserOverride;

  @override
  fba.User? get currentUser => currentUserOverride;

  @override
  Future<fba.UserCredential> signInWithProvider(Object provider) async {
    return super.noSuchMethod(
      Invocation.method(#signInWithProvider, [provider]),
      returnValue: Future.delayed(
        const Duration(milliseconds: 500),
      ).then((_) => MockCredential()),
      returnValueForMissingStub: Future.delayed(
        const Duration(milliseconds: 500),
      ).then((_) => MockCredential()),
    );
  }
}
