// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: constant_identifier_names

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const GOOGLE_PROVIDER_ID = 'google.com';
const APPLE_PROVIDER_ID = 'apple.com';
const TWITTER_PROVIDER_ID = 'twitter.com';
const FACEBOOK_PROVIDER_ID = 'facebook.com';
const PHONE_PROVIDER_ID = 'phone';
const PASSWORD_PROVIDER_ID = 'password';

/// Resolves an icon given a [providerId].
///
/// ```dart
/// final icon = providerIcon(context, 'google.com');
/// Icon(icon);
/// ```
Widget providerIcon(BuildContext context, AuthProvider provider) {
  final providerId = provider.providerId;
  final isCupertino = CupertinoUserInterfaceLevel.maybeOf(context) != null;

  final IconData? data;
  switch (providerId) {
    case GOOGLE_PROVIDER_ID:
      data = SocialIcons.google;
      break;
    case APPLE_PROVIDER_ID:
      data = SocialIcons.apple;
      break;
    case TWITTER_PROVIDER_ID:
      data = SocialIcons.twitter;
      break;
    case FACEBOOK_PROVIDER_ID:
      data = SocialIcons.facebook;
      break;
    case PHONE_PROVIDER_ID:
      if (isCupertino) {
        data = CupertinoIcons.phone;
      } else {
        data = Icons.phone;
      }
      break;
    case PASSWORD_PROVIDER_ID:
      if (isCupertino) {
        data = CupertinoIcons.mail;
      } else {
        data = Icons.email_outlined;
      }
      break;
    default:
      data = null;
  }

  if (data != null) {
    return Icon(data);
  }

  if (provider is OAuthProvider) {
    final brightness =
        CupertinoTheme.of(context).brightness ?? Theme.of(context).brightness;
    return provider.style.iconWidget.getValue(brightness);
  }

  throw Exception('Unknown provider: $providerId');
}
