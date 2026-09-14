// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

export 'package:firebase_auth/firebase_auth.dart' show OAuthCredential;

export './src/oauth/auth_result.dart';
export './src/oauth/provider_args.dart';
export './src/oauth/google_sign_in_args.dart';
export './src/oauth/facebook_sign_in_args.dart';
export './src/oauth/twitter_sign_in_args.dart';

export './src/oauth_provider.dart';
export './src/oauth_provider_button_base.dart';
export './src/oauth_provider_button_style.dart';

export 'package:firebase_ui_auth/firebase_ui_auth.dart'
    show AuthAction, AuthCancelledException;

export 'package:firebase_ui_shared/firebase_ui_shared.dart'
    show ThemedColor, ThemedIconSrc;
