// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'internal/provider_screen.dart';
import 'internal/responsive_page.dart';

/// {@template ui.auth.screens.email_link_sign_in_screen}
/// A screen that provides a UI for authentication using email link.
/// {@endtemplate}
class EmailLinkSignInScreen extends ProviderScreen<EmailLinkAuthProvider> {
  /// {@macro ui.auth.screens.responsive_page.header_builder}
  final HeaderBuilder? headerBuilder;

  /// {@macro ui.auth.screens.responsive_page.header_max_extent}
  final double? headerMaxExtent;

  /// {@macro ui.auth.screens.responsive_page.side_builder}
  final SideBuilder? sideBuilder;

  /// {@macro ui.auth.screens.responsive_page.desktop_layout_direction}
  final TextDirection? desktopLayoutDirection;

  /// EmailLinkSignInScreen could invoke these actions:
  ///
  /// * [AuthStateChangeAction]
  ///
  /// ```dart
  /// EmailLinkSignInScreen(
  ///   actions: [
  ///     AuthStateChangeAction<SignedIn>((context, state) {
  ///       Navigator.pushReplacementNamed(context, '/');
  ///     }),
  ///   ],
  /// );
  /// ```
  final List<FirebaseUIAction>? actions;

  /// {@macro ui.auth.screens.responsive_page.breakpoint}
  final double breakpoint;

  /// {@macro ui.auth.screens.responsive_page.max_width}
  final double? maxWidth;

  const EmailLinkSignInScreen({
    super.key,
    super.auth,
    super.provider,
    this.actions,
    this.headerBuilder,
    this.headerMaxExtent,
    this.sideBuilder,
    this.desktopLayoutDirection,
    this.breakpoint = 500,
    this.maxWidth = 1200,
  });

  @override
  Widget build(BuildContext context) {
    return FirebaseUIActions(
      actions: actions ?? const [],
      child: UniversalScaffold(
      body: ResponsivePage(
        breakpoint: breakpoint,
        headerBuilder: headerBuilder,
        headerMaxExtent: headerMaxExtent,
        maxWidth: maxWidth,
        sideBuilder: sideBuilder,
        desktopLayoutDirection: desktopLayoutDirection,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: EmailLinkSignInView(
            auth: auth,
            provider: provider,
          ),
        ),
      ),
    )
    );
  }
}
