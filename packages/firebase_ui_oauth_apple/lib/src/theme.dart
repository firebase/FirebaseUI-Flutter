// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';

const _appleBlack = Color(0xff060708);
const _appleWhite = Color(0xffffffff);

const _backgroundColor = ThemedColor(_appleWhite, _appleBlack);
const _color = ThemedColor(_appleBlack, _appleWhite);

const _iconSrc = ThemedIconSrc(
  'assets/icons/apple_light.svg',
  'assets/icons/apple_dark.svg',
);

class AppleProviderButtonStyle extends ThemedOAuthProviderButtonStyle {
  const AppleProviderButtonStyle();

  @override
  ThemedColor get backgroundColor => _backgroundColor;

  @override
  ThemedColor get color => _color;

  @override
  ThemedIconSrc get iconSrc => _iconSrc;

  @override
  String get assetsPackage => 'firebase_ui_oauth_apple';
}
