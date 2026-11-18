// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';

const _twitterBlue = Color(0xff009EF7);
const _twitterWhite = Color(0xffffffff);

const _backgroundColor = ThemedColor(_twitterBlue, _twitterBlue);
const _color = ThemedColor(_twitterWhite, _twitterWhite);

const _iconAsset = 'assets/icons/twitter.svg';
const _iconSrc = ThemedIconSrc(_iconAsset, _iconAsset);

class TwitterProviderButtonStyle extends ThemedOAuthProviderButtonStyle {
  const TwitterProviderButtonStyle();

  @override
  ThemedColor get backgroundColor => _backgroundColor;

  @override
  ThemedColor get color => _color;

  @override
  ThemedIconSrc get iconSrc => _iconSrc;

  @override
  String get assetsPackage => 'firebase_ui_oauth_twitter';
}
