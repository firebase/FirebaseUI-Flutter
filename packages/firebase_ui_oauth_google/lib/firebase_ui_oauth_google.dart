// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

export 'src/provider.dart' show GoogleProvider;
export 'src/theme.dart' show GoogleProviderButtonStyle;

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/widgets.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';

import 'src/provider.dart';

class GoogleSignInButton extends _GoogleSignInButton {
  const GoogleSignInButton({
    super.key,
    required super.loadingIndicator,
    required super.clientId,
    super.redirectUri,
    super.scopes,
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

class GoogleSignInIconButton extends _GoogleSignInButton {
  const GoogleSignInIconButton({
    super.key,
    required super.clientId,
    required super.loadingIndicator,
    super.scopes,
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

GoogleProvider? _mockProvider;

@visibleForTesting
void setMockGoogleProvider(GoogleProvider provider) {
  _mockProvider = provider;
}

class _GoogleSignInButton extends StatelessWidget {
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
  final List<String>? scopes;
  final void Function(Exception exception)? onError;
  final VoidCallback? onCanceled;

  const _GoogleSignInButton({
    super.key,
    required this.clientId,
    required this.loadingIndicator,
    this.scopes,
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
  })  : label = label ?? 'Sign in with Google',
        overrideDefaultTapAction = overrideDefaultTapAction ?? false,
        size = size ?? 19;

  GoogleProvider get provider {
    if (_mockProvider != null) return _mockProvider!;

    return GoogleProvider(
      clientId: clientId,
      redirectUri: redirectUri,
      scopes: scopes ?? [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return OAuthProviderButtonBase(
      provider: provider,
      label: label,
      onTap: onTap,
      loadingIndicator: loadingIndicator,
      isLoading: isLoading,
      action: action,
      auth: auth ?? fba.FirebaseAuth.instance,
      onDifferentProvidersFound: onDifferentProvidersFound,
      onSignedIn: onSignedIn,
      overrideDefaultTapAction: overrideDefaultTapAction,
      size: size,
      onError: onError,
      onCancelled: onCanceled,
    );
  }
}
