// Copyright 2025, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';
import 'package:firebase_ui_oauth_facebook/firebase_ui_oauth_facebook.dart';
import 'package:firebase_ui_oauth_facebook/src/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_test/flutter_test.dart';

// Manual mocks
class MockFirebaseAuth extends Fake implements fba.FirebaseAuth {
  @override
  fba.User? get currentUser => null;

  @override
  Future<fba.UserCredential> signInWithCredential(
    fba.AuthCredential credential,
  ) async {
    // Return a fake UserCredential
    return MockUserCredential();
  }
}

class MockUserCredential extends Fake implements fba.UserCredential {
  @override
  fba.User? get user => null;

  @override
  fba.AuthCredential? get credential => null;
}

class MockFacebookAuth extends Fake implements FacebookAuth {
  LoginResult? loginResult;
  bool logoutCalled = false;

  @override
  Future<LoginResult> login({
    List<String>? permissions,
    LoginBehavior? loginBehavior,
    LoginTracking? loginTracking,
    String? nonce,
  }) async {
    return loginResult ?? MockLoginResult(status: LoginStatus.failed);
  }

  @override
  Future<void> logOut() async {
    logoutCalled = true;
  }
}

class MockOAuthListener extends Fake implements OAuthListener {
  final List<Object> errors = [];
  final List<fba.AuthCredential> receivedCredentials = [];
  final List<fba.UserCredential> signedInResults = [];
  bool beforeSignInCalled = false;

  @override
  void onError(Object error) {
    errors.add(error);
  }

  @override
  void onCredentialReceived(fba.AuthCredential credential) {
    receivedCredentials.add(credential);
  }

  @override
  void onBeforeSignIn() {
    beforeSignInCalled = true;
  }

  @override
  void onSignedIn(fba.UserCredential userCredential) {
    signedInResults.add(userCredential);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FacebookProvider', () {
    late FacebookProvider provider;
    late MockFacebookAuth mockFacebookAuth;
    late MockOAuthListener mockListener;
    late MockFirebaseAuth mockFirebaseAuth;

    setUp(() {
      mockFacebookAuth = MockFacebookAuth();
      mockListener = MockOAuthListener();
      mockFirebaseAuth = MockFirebaseAuth();

      provider = FacebookProvider(clientId: 'test-client-id');
      provider.provider = mockFacebookAuth;
      provider.authListener = mockListener;
      provider.auth = mockFirebaseAuth;
    });

    group('Nonce generation', () {
      test('generates nonce with correct length', () {
        final nonce = provider.generateNonceForTest();
        expect(nonce.length, equals(32));
      });

      test('generates different nonces on each call', () {
        final nonce1 = provider.generateNonceForTest();
        final nonce2 = provider.generateNonceForTest();
        expect(nonce1, isNot(equals(nonce2)));
      });

      test('generates nonce with valid characters', () {
        final nonce = provider.generateNonceForTest();
        final validChars = RegExp(r'^[0-9A-Za-z\-._]+$');
        expect(validChars.hasMatch(nonce), isTrue);
      });
    });

    group('SHA256 hashing', () {
      test('generates consistent hash for same input', () {
        const input = 'test-nonce-123';
        final hash1 = provider.sha256ForTest(input);
        final hash2 = provider.sha256ForTest(input);
        expect(hash1, equals(hash2));
      });

      test('generates different hashes for different inputs', () {
        final hash1 = provider.sha256ForTest('input1');
        final hash2 = provider.sha256ForTest('input2');
        expect(hash1, isNot(equals(hash2)));
      });

      test('generates valid SHA256 hash', () {
        final hash = provider.sha256ForTest('test');
        // SHA256 hash should be 64 characters long (256 bits in hex)
        expect(hash.length, equals(64));
        // Should only contain hex characters
        expect(RegExp(r'^[0-9a-f]+$').hasMatch(hash), isTrue);
      });
    });

    group('Classic login (with tracking permission)', () {
      test('handles classic login success', () async {
        // Arrange
        final mockAccessToken = MockAccessToken(
          tokenString: 'test-access-token',
          type: AccessTokenType.classic,
        );
        final mockResult = MockLoginResult(
          status: LoginStatus.success,
          accessToken: mockAccessToken,
        );

        // Act - call the internal handler directly
        provider.handleResultForTest(mockResult, AuthAction.signIn);

        // Wait for async operations to complete
        await Future.delayed(Duration.zero);

        // Assert - signInWithCredential was called and completed successfully
        expect(mockListener.signedInResults.length, equals(1));
        expect(mockListener.errors.isEmpty, isTrue);
      });

      test('uses classic login on Android', () async {
        // Android should always use classic login
        debugDefaultTargetPlatformOverride = TargetPlatform.android;

        final hasPermission = await provider.hasTrackingPermissionForTest();
        expect(hasPermission, isTrue);

        debugDefaultTargetPlatformOverride = null;
      });
    });

    group('Limited login (without tracking permission)', () {
      test('handles limited login success with nonce', () async {
        // Arrange
        const rawNonce = 'test-raw-nonce';
        provider.setRawNonceForTest(rawNonce);

        final mockAccessToken = MockAccessToken(
          tokenString: 'test-id-token',
          type: AccessTokenType.limited,
        );
        final mockResult = MockLoginResult(
          status: LoginStatus.success,
          accessToken: mockAccessToken,
        );

        // Act
        provider.handleResultForTest(mockResult, AuthAction.signIn);

        // Wait for async operations to complete
        await Future.delayed(Duration.zero);

        // Assert - signInWithCredential was called and completed successfully
        expect(mockListener.signedInResults.length, equals(1));
        expect(mockListener.errors.isEmpty, isTrue);
      });

      test('returns error when nonce is missing for limited login', () {
        // Arrange
        provider.setRawNonceForTest(null); // Clear nonce

        final mockAccessToken = MockAccessToken(
          tokenString: 'test-id-token',
          type: AccessTokenType.limited,
        );
        final mockResult = MockLoginResult(
          status: LoginStatus.success,
          accessToken: mockAccessToken,
        );

        // Act
        provider.handleResultForTest(mockResult, AuthAction.signIn);

        // Assert
        expect(mockListener.errors.length, equals(1));
        expect(mockListener.signedInResults.isEmpty, isTrue);
      });
    });

    group('Error handling', () {
      test('handles login cancellation', () {
        // Arrange
        final mockResult = MockLoginResult(
          status: LoginStatus.cancelled,
          accessToken: null,
        );

        // Act
        provider.handleResultForTest(mockResult, AuthAction.signIn);

        // Assert
        expect(mockListener.errors.length, equals(1));
        expect(mockListener.errors.first, isA<AuthCancelledException>());
      });

      test('handles login failure', () {
        // Arrange
        final mockResult = MockLoginResult(
          status: LoginStatus.failed,
          accessToken: null,
          message: 'Login failed',
        );

        // Act
        provider.handleResultForTest(mockResult, AuthAction.signIn);

        // Assert
        expect(mockListener.errors.length, equals(1));
      });

      test('handles operation in progress error', () {
        // Arrange
        final mockResult = MockLoginResult(
          status: LoginStatus.operationInProgress,
          accessToken: null,
        );

        // Act
        provider.handleResultForTest(mockResult, AuthAction.signIn);

        // Assert
        expect(mockListener.errors.length, equals(1));
      });

      test('handles null access token', () {
        // Arrange
        final mockResult = MockLoginResult(
          status: LoginStatus.success,
          accessToken: null,
        );

        // Act
        provider.handleResultForTest(mockResult, AuthAction.signIn);

        // Assert
        expect(mockListener.errors.length, equals(1));
      });

      // Note: Cannot test unknown token type as AccessTokenType is an enum
      // with only classic and limited values
    });

    group('Provider configuration', () {
      test('has correct provider ID', () {
        expect(provider.providerId, equals('facebook.com'));
      });

      test('supports all platforms', () {
        expect(provider.supportsPlatform(TargetPlatform.android), isTrue);
        expect(provider.supportsPlatform(TargetPlatform.iOS), isTrue);
        expect(provider.supportsPlatform(TargetPlatform.macOS), isTrue);
        expect(provider.supportsPlatform(TargetPlatform.windows), isTrue);
        expect(provider.supportsPlatform(TargetPlatform.linux), isTrue);
      });

      test('has correct style', () {
        expect(provider.style, isA<FacebookProviderButtonStyle>());
      });

      test('configures desktop sign-in args', () {
        final provider = FacebookProvider(
          clientId: 'test-client-id',
          redirectUri: 'https://example.com/callback',
        );

        expect(provider.desktopSignInArgs, isA<FacebookSignInArgs>());
        final args = provider.desktopSignInArgs as FacebookSignInArgs;
        expect(args.clientId, equals('test-client-id'));
        expect(args.redirectUri, equals('https://example.com/callback'));
      });
    });

    group('Logout', () {
      test('calls logout on mobile platforms', () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

        await provider.logOutProvider();

        expect(mockFacebookAuth.logoutCalled, isTrue);

        debugDefaultTargetPlatformOverride = null;
      });
    });
  });
}

// Mock classes
class MockAccessToken implements AccessToken {
  @override
  final String tokenString;

  @override
  final AccessTokenType type;

  MockAccessToken({
    required this.tokenString,
    required this.type,
  });

  String get applicationId => 'test-app-id';

  String? get dataAccessExpirationTime => null;

  List<String> get declinedPermissions => [];

  List<String> get expiredPermissions => [];

  DateTime get expires => DateTime.now().add(const Duration(hours: 1));

  String? get graphDomain => null;

  bool get isExpired => false;

  DateTime get lastRefresh => DateTime.now();

  List<String> get grantedPermissions => ['email', 'public_profile'];

  String get userId => 'test-user-id';

  @override
  Map<String, dynamic> toJson() => {};

  String get token => tokenString;

  // Add any other required fields from AccessToken interface
}

class MockLoginResult implements LoginResult {
  @override
  final LoginStatus status;

  @override
  final AccessToken? accessToken;

  @override
  final String? message;

  MockLoginResult({
    required this.status,
    this.accessToken,
    this.message,
  });

  Map<String, dynamic> toJson() => {};
}
