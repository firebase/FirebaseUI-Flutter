// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:vector_graphics/vector_graphics.dart';

/// {@template ui.oauth.themed_oauth_provider_button_style}
/// An object that is being used to resolve a style of the button.
/// {@endtemplate}
abstract class ThemedOAuthProviderButtonStyle {
  /// Asset paths (relative to [assetsPackage]) of the light and dark icons.
  ///
  /// Icons must be compiled into the `vector_graphics` binary format. Declare
  /// the SVG assets with the `vector_graphics_compiler` asset transformer:
  ///
  /// ```yaml
  /// flutter:
  ///   assets:
  ///     - path: assets/icon.svg
  ///       transformers:
  ///         - package: vector_graphics_compiler
  /// ```
  ///
  /// When the assets are declared by a package (see [assetsPackage]), that
  /// package must list `vector_graphics_compiler` under `dependencies` (not
  /// `dev_dependencies`) so that the transformer can be resolved when
  /// building the consuming app. When the assets are declared by the app
  /// itself, a `dev_dependencies` entry in the app is enough.
  ThemedIconSrc get iconSrc;
  ThemedColor get backgroundColor;
  ThemedColor get color;
  ThemedColor get iconBackgroundColor => backgroundColor;
  ThemedColor get borderColor => backgroundColor;
  double get iconPadding => 0;

  /// The name of the package that contains the [iconSrc] assets.
  ///
  /// Return `null` when the assets are bundled with the app itself, for
  /// example for a custom provider style defined in the app.
  String? get assetsPackage;

  /// A custom label string.
  ///
  /// Required for custom OAuth providers.
  String? get label => null;

  /// The widget to display for custom OAuth providers in pages such as the
  /// Profile Screen.
  ThemedValue<Widget> get iconWidget => ThemedValue(
    // Display the light icon on a dark background.
    OAuthProviderIcon(src: iconSrc.light, package: assetsPackage),
    // Display the dark icon on a light background.
    OAuthProviderIcon(src: iconSrc.dark, package: assetsPackage),
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
  final String? assetsPackage;
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

/// {@template ui.oauth.oauth_provider_icon}
/// Renders an SVG icon asset compiled by the `vector_graphics_compiler`
/// asset transformer.
/// {@endtemplate}
class OAuthProviderIcon extends StatelessWidget {
  /// The asset path of the precompiled icon.
  final String src;

  /// The package that contains the [src] asset.
  final String? package;

  final double? width;
  final double? height;

  /// {@macro ui.oauth.oauth_provider_icon}
  const OAuthProviderIcon({
    super.key,
    required this.src,
    this.package,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return VectorGraphic(
      loader: AssetBytesLoader(src, packageName: package),
      width: width,
      height: height,
    );
  }
}
