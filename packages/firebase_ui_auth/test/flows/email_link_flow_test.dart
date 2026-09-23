// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../test_utils.dart';

void main() {
  late EmailLinkAuthProvider provider;
  late MockListener listener;
  late MockAuth auth;
  late MockAppLinks appLinks;
  late EmailLinkFlow flow;
  late EmailLinkAuthController ctrl;

  final actionCodeSettings = fba.ActionCodeSettings(
    url: 'https://example.com',
    handleCodeInApp: true,
    androidPackageName: 'com.test.app',
  );

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    auth = MockAuth();
    listener = MockListener();
    appLinks = MockAppLinks();

    provider = EmailLinkAuthProvider(
      actionCodeSettings: actionCodeSettings,
      appLinks: appLinks,
    );

    flow = EmailLinkFlow(provider: provider, auth: auth);

    ctrl = flow;
  });

  tearDown(() {
    provider.dispose();
  });

  group('EmailLinkAuthProvider', () {
    test('has correct provider id', () {
      expect(provider.providerId, 'email_link');
    });

    group('#sendLink', () {
      test('calls onBeforeLinkSent', () {
        provider.authListener = listener;

        provider.sendLink('test@test.com');

        final result = verify(listener.onBeforeLinkSent(captureAny));
        result.called(1);
        expect(result.captured, ['test@test.com']);
      });

      test(
        'calls fba.FirebaseAuth#sendSignInLinkToEmail with a session id',
        () {
          provider.authListener = listener;
          provider.sendLink('test@test.com');

          final result = verify(
            auth.sendSignInLinkToEmail(
              actionCodeSettings: captureAnyNamed('actionCodeSettings'),
              email: captureAnyNamed('email'),
            ),
          );

          result.called(1);
          final settings = result.captured[0] as fba.ActionCodeSettings;
          final url = Uri.parse(settings.url);
          expect(url.host, 'example.com');
          expect(url.queryParameters['ui_sid'], hasLength(10));
          expect(url.queryParameters, isNot(contains('ui_auid')));
          expect(settings.handleCodeInApp, true);
          expect(settings.androidPackageName, 'com.test.app');
          expect(result.captured[1], 'test@test.com');
        },
      );

      test('adds the anonymous user id to the link', () {
        auth.user = AnonymousUser();
        provider.authListener = listener;
        provider.sendLink('test@test.com');

        final result = verify(
          auth.sendSignInLinkToEmail(
            actionCodeSettings: captureAnyNamed('actionCodeSettings'),
            email: anyNamed('email'),
          ),
        );

        final settings = result.captured[0] as fba.ActionCodeSettings;
        expect(Uri.parse(settings.url).queryParameters['ui_auid'], 'anon-uid');
      });

      test('stores the email and session id', () async {
        provider.authListener = listener;
        provider.sendLink('test@test.com');

        await untilCalled(listener.onLinkSent(any));

        final result = verify(
          auth.sendSignInLinkToEmail(
            actionCodeSettings: captureAnyNamed('actionCodeSettings'),
            email: anyNamed('email'),
          ),
        );
        final settings = result.captured[0] as fba.ActionCodeSettings;
        final sessionId = Uri.parse(settings.url).queryParameters['ui_sid'];

        final prefs = await SharedPreferences.getInstance();
        expect(
          prefs.getString('firebase_ui_auth.email_link.email'),
          'test@test.com',
        );
        expect(
          prefs.getString('firebase_ui_auth.email_link.session_id'),
          sessionId,
        );
      });

      test('calls onLinkSent', () async {
        provider.authListener = listener;

        provider.sendLink('test@test.com');

        await untilCalled(listener.onLinkSent(any));

        final result = verify(listener.onLinkSent(captureAny));
        result.called(1);
        expect(result.captured, ['test@test.com']);
      });

      test('calls onError if an error occured', () async {
        provider.authListener = listener;
        final exception = TestException();

        when(
          auth.sendSignInLinkToEmail(
            email: anyNamed('email'),
            actionCodeSettings: anyNamed('actionCodeSettings'),
          ),
        ).thenThrow(exception);

        provider.sendLink('test@test.com');

        await untilCalled(listener.onBeforeLinkSent(any));
        final result = verify(listener.onError(captureAny));

        result.called(1);
        expect(result.captured, [exception]);
      });
    });

    group('#awaitLink', () {
      setUp(() {
        storeSession(email: 'test@test.com', sessionId: 'session-1');
      });

      test(
        'waits for a link from app links and calls onBeforeSignIn',
        () async {
          provider.authListener = listener;
          provider.awaitLink('test@test.com');

          // Simulate receiving an app link
          MockUriStream.addLink(signInLink(sessionId: 'session-1'));

          await untilCalled(listener.onBeforeSignIn());

          verify(listener.onBeforeSignIn()).called(1);
        },
      );

      test('calls onError if got not a valid sign in link', () async {
        provider.authListener = listener;
        provider.awaitLink('test@test.com');

        when(auth.isSignInWithEmailLink(any)).thenReturn(false);

        // Simulate receiving an invalid app link
        MockUriStream.addLink(Uri.parse('https://invalid-link.com'));

        await untilCalled(listener.onError(any));

        final result = verify(listener.onError(captureAny));
        result.called(1);
        expect(result.captured[0], isA<fba.FirebaseAuthException>());
        expect(result.captured[0].code, 'invalid-email-signin-link');
      });

      test(
        'calls fba.FirebaseAuth#signInWithEmailLink with the stored email',
        () async {
          provider.authListener = listener;
          provider.awaitLink('test@test.com');

          final link = signInLink(sessionId: 'session-1');
          MockUriStream.addLink(link);

          await untilCalled(listener.onBeforeSignIn());

          final result = verify(
            auth.signInWithEmailLink(
              email: captureAnyNamed('email'),
              emailLink: captureAnyNamed('emailLink'),
            ),
          );

          result.called(1);

          expect(result.captured[0], 'test@test.com');
          expect(result.captured[1], link.toString());
        },
      );

      test('calls onSignedIn and clears the session', () async {
        provider.authListener = listener;
        provider.awaitLink('test@test.com');

        MockUriStream.addLink(signInLink(sessionId: 'session-1'));

        await untilCalled(listener.onSignedIn(any));
        final result = verify(listener.onSignedIn(captureAny));

        result.called(1);
        expect(result.captured[0], isA<MockCredential>());

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString('firebase_ui_auth.email_link.email'), isNull);
      });

      test('calls onError if sing in failed', () async {
        provider.authListener = listener;
        final exception = TestException();

        when(
          auth.signInWithEmailLink(
            email: anyNamed('email'),
            emailLink: anyNamed('emailLink'),
          ),
        ).thenThrow(exception);

        provider.awaitLink('test@test.com');

        MockUriStream.addLink(signInLink(sessionId: 'session-1'));

        await untilCalled(listener.onError(any));
        final result = verify(listener.onError(captureAny));

        result.called(1);
        expect(result.captured, [exception]);
      });

      test('receives a link after awaitLink was called again', () async {
        final closingAppLinks = ClosingAppLinks();
        provider = EmailLinkAuthProvider(
          actionCodeSettings: actionCodeSettings,
          appLinks: closingAppLinks,
        );
        provider.auth = auth;
        provider.authListener = listener;

        provider.awaitLink('test@test.com');
        provider.awaitLink('test@test.com');

        // Let app_links' asynchronous onCancel run, if it was triggered.
        await Future<void>.delayed(Duration.zero);

        closingAppLinks.addLink(signInLink(sessionId: 'session-1'));

        await untilCalled(listener.onSignedIn(any));

        verify(
          auth.signInWithEmailLink(
            email: anyNamed('email'),
            emailLink: anyNamed('emailLink'),
          ),
        ).called(1);
      });
    });

    group('link opened on a different device', () {
      test('calls onEmailRequired when no session is stored', () async {
        provider.authListener = listener;
        provider.awaitLink('test@test.com');

        final link = signInLink(sessionId: 'session-1');
        MockUriStream.addLink(link);

        await untilCalled(listener.onEmailRequired(any));

        final result = verify(listener.onEmailRequired(captureAny));
        result.called(1);
        expect(result.captured, [link.toString()]);
        verifyNever(
          auth.signInWithEmailLink(
            email: anyNamed('email'),
            emailLink: anyNamed('emailLink'),
          ),
        );
      });

      test('calls onEmailRequired when the session id differs', () async {
        storeSession(email: 'test@test.com', sessionId: 'session-1');
        provider.authListener = listener;
        provider.awaitLink('test@test.com');

        MockUriStream.addLink(signInLink(sessionId: 'session-2'));

        await untilCalled(listener.onEmailRequired(any));
        verify(listener.onEmailRequired(any)).called(1);
      });

      test('calls onError if the link upgrades an anonymous user', () async {
        provider.authListener = listener;
        provider.awaitLink('test@test.com');

        MockUriStream.addLink(
          signInLink(sessionId: 'session-1', anonymousUserId: 'anon-uid'),
        );

        await untilCalled(listener.onError(any));

        final result = verify(listener.onError(captureAny));
        expect(result.captured[0].code, 'email-link-wrong-device');
        verifyNever(listener.onEmailRequired(any));
      });

      test('#signInWithLink signs in with the confirmed email', () async {
        provider.authListener = listener;

        provider.signInWithLink('other@test.com', 'https://test.com/link');

        await untilCalled(listener.onSignedIn(any));

        final result = verify(
          auth.signInWithEmailLink(
            email: captureAnyNamed('email'),
            emailLink: captureAnyNamed('emailLink'),
          ),
        );
        expect(result.captured, ['other@test.com', 'https://test.com/link']);
      });
    });

    group('anonymous upgrade', () {
      setUp(() {
        storeSession(
          email: 'test@test.com',
          sessionId: 'session-1',
          anonymousUserId: 'anon-uid',
        );
      });

      test('links the credential to the anonymous user', () async {
        final user = AnonymousUser();
        auth.user = user;
        provider.authListener = listener;
        provider.awaitLink('test@test.com');

        MockUriStream.addLink(
          signInLink(sessionId: 'session-1', anonymousUserId: 'anon-uid'),
        );

        await untilCalled(listener.onCredentialLinked(any));

        final result = verify(user.linkWithCredential(captureAny));
        result.called(1);
        expect(result.captured[0], isA<fba.EmailAuthCredential>());
        verifyNever(
          auth.signInWithEmailLink(
            email: anyNamed('email'),
            emailLink: anyNamed('emailLink'),
          ),
        );
      });

      test('calls onError if the anonymous user changed', () async {
        auth.user = AnonymousUser(uid: 'other-uid');
        provider.authListener = listener;
        provider.awaitLink('test@test.com');

        MockUriStream.addLink(
          signInLink(sessionId: 'session-1', anonymousUserId: 'anon-uid'),
        );

        await untilCalled(listener.onError(any));

        final result = verify(listener.onError(captureAny));
        expect(result.captured[0].code, 'email-link-different-anonymous-user');
      });
    });

    group('#isLaunchedFromSignInLink', () {
      test('returns true for a sign in launch link', () async {
        when(
          appLinks.getInitialLink(),
        ).thenAnswer((_) async => signInLink(sessionId: 'session-1'));

        expect(await provider.isLaunchedFromSignInLink(auth: auth), true);
      });

      test('returns false without a launch link', () async {
        expect(await provider.isLaunchedFromSignInLink(auth: auth), false);
      });
    });

    group('#handleIncomingLinks', () {
      test(
        'completes the sign in with the link that launched the app',
        () async {
          storeSession(email: 'test@test.com', sessionId: 'session-1');
          final link = signInLink(sessionId: 'session-1');
          when(appLinks.getInitialLink()).thenAnswer((_) async => link);
          // The flow created in setUp already checked for a launch link.
          provider = EmailLinkAuthProvider(
            actionCodeSettings: actionCodeSettings,
            appLinks: appLinks,
          );
          provider.auth = auth;
          provider.authListener = listener;

          provider.handleIncomingLinks();
          provider.handleIncomingLinks();

          await untilCalled(listener.onSignedIn(any));

          // The same link delivered by uriLinkStream is ignored.
          MockUriStream.addLink(link);
          await Future<void>.delayed(Duration.zero);

          // Once by the flow in setUp, once by this provider.
          verify(appLinks.getInitialLink()).called(2);
          verify(
            auth.signInWithEmailLink(
              email: anyNamed('email'),
              emailLink: anyNamed('emailLink'),
            ),
          ).called(1);
        },
      );

      test('ignores a launch link that is not a sign in link', () async {
        when(
          appLinks.getInitialLink(),
        ).thenAnswer((_) async => Uri.parse('https://test.com/other'));
        when(auth.isSignInWithEmailLink(any)).thenReturn(false);
        // The flow created in setUp already checked for a launch link.
        provider = EmailLinkAuthProvider(
          actionCodeSettings: actionCodeSettings,
          appLinks: appLinks,
        );
        provider.auth = auth;
        provider.authListener = listener;

        provider.handleIncomingLinks();
        await Future<void>.delayed(Duration.zero);

        verifyNever(listener.onError(any));
        verifyNever(listener.onBeforeSignIn());
      });
    });
  });

  group('EmailLinkFlowController', () {
    test('#sendLink calls EmailLinkAuthProvider#sendLink', () {
      final provider = MockProvider();
      ctrl = EmailLinkFlow(provider: provider, auth: auth);

      ctrl.sendLink('test@test.com');

      final result = verify(provider.sendLink(captureAny));

      result.called(1);
      expect(result.captured, ['test@test.com']);
    });
  });

  group('EmailLinkFlow', () {
    test('handles incoming links when created', () {
      final provider = MockProvider();
      EmailLinkFlow(provider: provider, auth: auth);

      verify(provider.handleIncomingLinks()).called(1);
    });

    test('#onEmailRequired emits EmailRequired', () {
      flow.onEmailRequired('https://test.com/link');

      expect(flow.value, isA<EmailRequired>());
      expect((flow.value as EmailRequired).link, 'https://test.com/link');
    });

    test('#confirmEmail calls EmailLinkAuthProvider#signInWithLink', () {
      final provider = MockProvider();
      final flow = EmailLinkFlow(provider: provider, auth: auth);

      flow.onEmailRequired('https://test.com/link');
      flow.confirmEmail('test@test.com');

      final result = verify(provider.signInWithLink(captureAny, captureAny));
      result.called(1);
      expect(result.captured, ['test@test.com', 'https://test.com/link']);
    });

    test('#onLinkSent calls EmailLinkAuthProvider#awaitLink', () {
      final provider = MockProvider();
      flow = EmailLinkFlow(provider: provider, auth: auth);

      flow.onLinkSent('test@test.com');

      final result = verify(provider.awaitLink(captureAny));

      result.called(1);
      expect(result.captured, ['test@test.com']);
    });
  });

  group('AuthFlowBuilder<EmailLinkFlowController>', () {
    testWidgets('emits correct states', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuthFlowBuilder<EmailLinkAuthController>(
              auth: auth,
              provider: provider,
              listener: (prevState, state, ctrl) {
                if (prevState is Uninitialized) {
                  expect(state, isA<SendingLink>());
                }

                if (prevState is SendingLink) {
                  expect(state, isA<AwaitingDynamicLink>());
                }

                if (prevState is AwaitingDynamicLink) {
                  expect(state, isA<SigningIn>());
                }

                if (prevState is SignedIn) {
                  expect(state, isA<SignedIn>());
                }
              },
              builder: (context, state, ctrl, _) {
                return ElevatedButton(
                  child: const Text('Sign in'),
                  onPressed: () => ctrl.sendLink('tesT@test.com'),
                );
              },
            ),
          ),
        ),
      );

      final button = find.byType(ElevatedButton);
      await tester.tap(button);
      await tester.pump();
    });

    testWidgets('emits AuthFailed if an error occured', (tester) async {
      final exception = TestException();

      when(
        auth.signInWithEmailLink(
          email: anyNamed('email'),
          emailLink: anyNamed('emailLink'),
        ),
      ).thenThrow(exception);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuthFlowBuilder<EmailLinkAuthController>(
              auth: auth,
              provider: provider,
              listener: (prevState, state, ctrl) {
                if (prevState is Uninitialized) {
                  expect(state, isA<SendingLink>());
                }

                if (prevState is SendingLink) {
                  expect(state, isA<AwaitingDynamicLink>());
                }

                if (prevState is AwaitingDynamicLink) {
                  expect(state, isA<SigningIn>());
                }

                if (prevState is SigningIn) {
                  expect(state, isA<AuthFailed>());
                  expect((state as AuthFailed).exception, exception);
                }
              },
              builder: (context, state, ctrl, _) {
                return ElevatedButton(
                  child: const Text('Sign in'),
                  onPressed: () => ctrl.sendLink('tesT@test.com'),
                );
              },
            ),
          ),
        ),
      );

      final button = find.byType(ElevatedButton);
      await tester.tap(button);
      await tester.pump();
    });
  });
}

class MockProvider extends Mock implements EmailLinkAuthProvider {
  @override
  void sendLink(String? email) {
    super.noSuchMethod(Invocation.method(#sendLink, [email]));
  }

  @override
  void awaitLink(String? email) {
    super.noSuchMethod(Invocation.method(#awaitLink, [email]));
  }

  @override
  void signInWithLink(String? email, String? link) {
    super.noSuchMethod(Invocation.method(#signInWithLink, [email, link]));
  }
}

class MockListener extends Mock implements EmailLinkAuthListener {
  @override
  void onSignedIn(fba.UserCredential? credential) {
    super.noSuchMethod(Invocation.method(#onSignedIn, [credential]));
  }

  @override
  void onBeforeLinkSent(String? email) {
    super.noSuchMethod(Invocation.method(#onBeforeLinkSent, [email]));
  }

  @override
  void onLinkSent(String? email) {
    super.noSuchMethod(Invocation.method(#onLinkSent, [email]));
  }

  @override
  void onError(Object? error) {
    super.noSuchMethod(Invocation.method(#onError, [error]));
  }

  @override
  void onEmailRequired(String? link) {
    super.noSuchMethod(Invocation.method(#onEmailRequired, [link]));
  }

  @override
  void onCredentialLinked(fba.AuthCredential? credential) {
    super.noSuchMethod(Invocation.method(#onCredentialLinked, [credential]));
  }
}

class AnonymousUser extends MockUser {
  @override
  final String uid;

  AnonymousUser({this.uid = 'anon-uid'});

  @override
  bool get isAnonymous => true;
}

void storeSession({
  required String email,
  required String sessionId,
  String? anonymousUserId,
}) {
  SharedPreferences.setMockInitialValues({
    'firebase_ui_auth.email_link.email': email,
    'firebase_ui_auth.email_link.session_id': sessionId,
    'firebase_ui_auth.email_link.anonymous_user_id': ?anonymousUserId,
  });
}

/// A sign in link in the Firebase Hosting format, with the session
/// parameters in the nested continue URL.
Uri signInLink({required String sessionId, String? anonymousUserId}) {
  final continueUrl = Uri.https('example.com', '/', {
    'ui_sid': sessionId,
    'ui_auid': ?anonymousUserId,
  });
  final action = Uri.https('test.com', '/__/auth/action', {
    'mode': 'signIn',
    'oobCode': 'code',
    'continueUrl': continueUrl.toString(),
  });
  return Uri.https('test.com', '/__/auth/links', {'link': action.toString()});
}

/// Mimics app_links 6.x, which closes its shared broadcast controller
/// asynchronously once the last listener cancels.
class ClosingAppLinks extends Mock implements AppLinks {
  StreamController<Uri>? _controller;

  @override
  Stream<Uri> get uriLinkStream {
    return (_controller ??= StreamController<Uri>.broadcast(
      onCancel: () async {
        await Future<void>.delayed(Duration.zero);
        await _controller?.close();
        _controller = null;
      },
    )).stream;
  }

  void addLink(Uri uri) {
    _controller?.add(uri);
  }
}
