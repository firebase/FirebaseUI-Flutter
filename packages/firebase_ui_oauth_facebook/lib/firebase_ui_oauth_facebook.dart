// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

export 'src/provider.dart' show FacebookProvider;
export 'src/theme.dart' show FacebookProviderButtonStyle;

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';

import 'src/provider.dart';

class FacebookSignInButton extends _FacebookSignInButton {
  const FacebookSignInButton({
    super.key,
    required super.loadingIndicator,
    required super.clientId,
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

class FacebookSignInIconButton extends _FacebookSignInButton {
  const FacebookSignInIconButton({
    super.key,
    required super.clientId,
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

FacebookProvider? _mockProvider;

@visibleForTesting
void setMockFacebookProvider(FacebookProvider provider) {
  _mockProvider = provider;
}

class _FacebookSignInButton extends StatelessWidget {
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
  final String clientId;
  final String? redirectUri;
  final void Function(Exception exception)? onError;
  final VoidCallback? onCanceled;

  const _FacebookSignInButton({
    super.key,
    required this.clientId,
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
  })  : label = label ?? 'Sign in with Facebook',
        overrideDefaultTapAction = overrideDefaultTapAction ?? false,
        size = size ?? 19;

  FacebookProvider get provider {
    if (_mockProvider != null) return _mockProvider!;

    return FacebookProvider(
      clientId: clientId,
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
