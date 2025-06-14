// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter_svg/svg.dart';

/// {@template ui.oauth.themed_oauth_provider_button_style}
/// An object that is being used to resolve a style of the button.
/// {@endtemplate}
abstract class ThemedOAuthProviderButtonStyle {
  ThemedIconSrc get iconSrc;
  ThemedColor get backgroundColor;
  ThemedColor get color;
  ThemedColor get iconBackgroundColor => backgroundColor;
  ThemedColor get borderColor => backgroundColor;
  double get iconPadding => 0;
  String get assetsPackage;

  /// A custom label string.
  ///
  /// Required for custom OAuth providers.
  String? get label => null;

  /// The widget to display for custom OAuth providers in pages such as the
  /// Profile Screen.
  ThemedValue<Widget> get iconWidget => ThemedValue(
        // Display the light icon on a dark background.
        SvgPicture.string(iconSrc.light),
        // Display the dark icon on a light background.
        SvgPicture.string(iconSrc.dark),
      );

  /// {@macro ui.oauth.themed_oauth_provider_button_style}
  const ThemedOAuthProviderButtonStyle();

  OAuthProviderButtonStyle withBrightness(Brightness brightness) {
    return OAuthProviderButtonStyle(
      iconSrc: iconSrc.getValue(brightness),
      iconPadding: iconPadding,
      backgroundColor: backgroundColor.getValue(brightness),
      color: color.getValue(brightness),
      borderColor: borderColor.getValue(brightness),
      assetsPackage: assetsPackage,
      iconBackgroundColor: iconBackgroundColor.getValue(brightness),
    );
  }
}

class OAuthProviderButtonStyle {
  final String iconSrc;
  final double iconPadding;
  final Color backgroundColor;
  final Color color;
  final Color borderColor;
  final String assetsPackage;
  final Color iconBackgroundColor;

  OAuthProviderButtonStyle({
    required this.iconSrc,
    required this.iconPadding,
    required this.backgroundColor,
    required this.color,
    required this.borderColor,
    required this.assetsPackage,
    required this.iconBackgroundColor,
  });
}
