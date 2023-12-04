// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';

/// A controller interface of the [OAuthFlow].
abstract class OAuthController extends AuthController {
  /// Triggers a sign in.
  void signIn(TargetPlatform platform);
}

/// {@template ui.auth.flows.oauth_flow}
/// A flow that allows to authenticate using OAuth providers.
/// {@endtemplate}
class OAuthFlow extends AuthFlow<OAuthProvider>
    implements OAuthController, OAuthListener {
  /// {@macro ui.auth.flows.oauth_flow}
  OAuthFlow({
    /// {@macro ui.auth.auth_flow.ctor.provider}
    required super.provider,

    /// {@macro ui.auth.auth_action}
    super.action,

    /// {@macro ui.auth.auth_controller.auth}
    super.auth,
  }) : super(
          initialState: const Uninitialized(),
        );

  @override
  void signIn(TargetPlatform platform) {
    provider.signIn(platform, action);
  }
}
