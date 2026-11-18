// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';

const _facebookBlue = Color(0xff1878F2);
const _facebookWhite = Color(0xffffffff);

const _backgroundColor = ThemedColor(_facebookBlue, _facebookBlue);
const _color = ThemedColor(_facebookWhite, _facebookWhite);

const _iconAsset = 'assets/icons/facebook.svg';
const _iconSrc = ThemedIconSrc(_iconAsset, _iconAsset);

class FacebookProviderButtonStyle extends ThemedOAuthProviderButtonStyle {
  const FacebookProviderButtonStyle();

  @override
  ThemedColor get backgroundColor => _backgroundColor;

  @override
  ThemedColor get color => _color;

  @override
  ThemedIconSrc get iconSrc => _iconSrc;

  @override
  String get assetsPackage => 'firebase_ui_oauth_facebook';
}
