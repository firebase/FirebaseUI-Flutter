// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';

const _googleBlue = Color(0xff4285f4);
const _googleWhite = Color(0xffffffff);
const _googleDark = Color(0xff757575);

const _backgroundColor = ThemedColor(_googleBlue, _googleWhite);
const _color = ThemedColor(_googleWhite, _googleDark);
const _iconBackgroundColor = ThemedColor(_googleWhite, _googleWhite);

const _iconAsset = 'assets/icons/google.svg';
const _iconSrc = ThemedIconSrc(_iconAsset, _iconAsset);

class GoogleProviderButtonStyle extends ThemedOAuthProviderButtonStyle {
  const GoogleProviderButtonStyle();

  @override
  ThemedColor get backgroundColor => _backgroundColor;

  @override
  ThemedColor get color => _color;

  @override
  ThemedIconSrc get iconSrc => _iconSrc;

  @override
  ThemedColor get iconBackgroundColor => _iconBackgroundColor;

  @override
  double get iconPadding => 1;

  @override
  String get assetsPackage => 'firebase_ui_oauth_google';
}
