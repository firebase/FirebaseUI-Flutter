// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

export 'src/provider.dart' show TwitterProvider;
export 'src/theme.dart' show TwitterProviderButtonStyle;

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';

import 'src/provider.dart';

class TwitterSignInButton extends _TwitterSignInButton {
  const TwitterSignInButton({
    super.key,
    required super.loadingIndicator,
    required super.apiKey,
    required super.apiSecretKey,
    super.redirectUri,
    super.action = null,
    super.auth,
    bool? isLoading,
    super.label,
    super.onDifferentProvidersFound,
    super.onSignedIn,
    super.onTap,
    super.overrideDefaultTapAction,
    super.size,
    super.onError,
    super.onCanceled,
  }) : super(
          isLoading: isLoading ?? false,
        );
}

class TwitterSignInIconButton extends _TwitterSignInButton {
  const TwitterSignInIconButton({
    super.key,
    required super.apiKey,
    required super.apiSecretKey,
    required super.loadingIndicator,
    super.action = null,
    super.auth,
    bool? isLoading,
    super.onDifferentProvidersFound,
    super.onSignedIn,
    super.onTap,
    super.overrideDefaultTapAction,
    super.size,
    super.redirectUri,
    super.onError,
    super.onCanceled,
  }) : super(
          isLoading: isLoading ?? false,
          label: '',
        );
}

TwitterProvider? _mockProvider;

@visibleForTesting
void setMockTwitterProvider(TwitterProvider provider) {
  _mockProvider = provider;
}

class _TwitterSignInButton extends StatelessWidget {
  final String label;
  final Widget loadingIndicator;
  final void Function()? onTap;
  final bool overrideDefaultTapAction;
  final bool isLoading;

  /// {@macro ui.auth.auth_action}
  final AuthAction? action;

  /// {@macro ui.auth.auth_controller.auth}
  final fba.FirebaseAuth? auth;
  final DifferentProvidersFoundCallback? onDifferentProvidersFound;
  final SignedInCallback? onSignedIn;
  final double size;
  final String apiKey;
  final String apiSecretKey;
  final String? redirectUri;
  final void Function(Exception exception)? onError;
  final VoidCallback? onCanceled;

  const _TwitterSignInButton({
    super.key,
    required this.apiKey,
    required this.apiSecretKey,
    required this.loadingIndicator,
    String? label,
    bool? overrideDefaultTapAction,
    this.onTap,
    this.isLoading = false,
    this.action = AuthAction.signIn,
    this.auth,
    this.onDifferentProvidersFound,
    this.onSignedIn,
    double? size,
    this.redirectUri,
    this.onError,
    this.onCanceled,
  })  : label = label ?? 'Sign in with Twitter',
        overrideDefaultTapAction = overrideDefaultTapAction ?? false,
        size = size ?? 19;

  TwitterProvider get provider {
    if (_mockProvider != null) return _mockProvider!;

    return TwitterProvider(
      apiKey: apiKey,
      apiSecretKey: apiSecretKey,
      redirectUri: redirectUri,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthFlowBuilder<OAuthController>(
      provider: provider,
      action: action,
      auth: auth,
      builder: (context, state, ctrl, child) {
        return OAuthProviderButtonBase(
          provider: provider,
          label: label,
          onTap: () => ctrl.signIn(Theme.of(context).platform),
          loadingIndicator: loadingIndicator,
          isLoading: state is SigningIn || state is CredentialReceived,
          action: action,
          auth: auth ?? fba.FirebaseAuth.instance,
          onDifferentProvidersFound: onDifferentProvidersFound,
          onSignedIn: onSignedIn,
          overrideDefaultTapAction: true,
          size: size,
          onError: onError,
          onCancelled: onCanceled,
        );
      },
    );
  }
}
