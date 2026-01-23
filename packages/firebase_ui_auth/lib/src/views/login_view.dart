// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart'
    hide OAuthProviderButtonBase;
import 'package:flutter/cupertino.dart' hide Title;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Title;

import '../widgets/internal/title.dart';

typedef AuthViewContentBuilder = Widget Function(
  BuildContext context,
  AuthAction action,
);

typedef ProvidersBuilder = List<Widget> Function(
  BuildContext context,
  List<AuthProvider> providers,
  AuthAction action,
);

/// {@template ui.auth.views.login_view}
/// A view that could be used to build a custom [SignInScreen] or
/// [RegisterScreen].
/// {@endtemplate}
class LoginView extends StatefulWidget {
  /// {@macro ui.auth.auth_controller.auth}
  final fba.FirebaseAuth? auth;

  /// {@macro ui.auth.auth_action}
  final AuthAction action;

  /// Indicates whether icon-only or icon and text OAuth buttons should be used.
  /// Icon-only buttons are placed in a row.
  final OAuthButtonVariant? oauthButtonVariant;
  final bool? showTitle;
  final String? email;

  /// Whether the "Login/Register" link should be displayed. The link changes
  /// the type of the [AuthAction] from [AuthAction.signIn]
  /// and [AuthAction.signUp] and vice versa.
  final bool? showAuthActionSwitch;

  /// {@template ui.auth.views.login_view.footer_builder}
  /// A returned widget would be placed down the authentication related widgets.
  /// {@endtemplate}
  final AuthViewContentBuilder? footerBuilder;

  /// {@template ui.auth.views.login_view.subtitle_builder}
  /// A returned widget would be placed up the authentication related widgets.
  /// {@endtemplate}
  final AuthViewContentBuilder? subtitleBuilder;

  final List<AuthProvider> providers;

  /// A label that would be used for the "Sign in" button.
  final String? actionButtonLabelOverride;

  /// {@macro ui.auth.widgets.email_from.showPasswordVisibilityToggle}
  final bool showPasswordVisibilityToggle;

  /// A builder that allows to customize the order and appearance of the providers.
  ///
  /// If not provided, the default explicit order is used:
  /// Email, Phone, Email Link, OAuth.
  final ProvidersBuilder? providersBuilder;

  /// {@macro ui.auth.views.login_view}
  const LoginView({
    super.key,
    required this.action,
    required this.providers,
    this.oauthButtonVariant = OAuthButtonVariant.icon_and_text,
    this.auth,
    this.showTitle = true,
    this.email,
    this.showAuthActionSwitch,
    this.footerBuilder,
    this.subtitleBuilder,
    this.actionButtonLabelOverride,
    this.showPasswordVisibilityToggle = false,
    this.providersBuilder,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late AuthAction _action = widget.action;
  bool get _showTitle => widget.showTitle ?? true;
  bool get _showAuthActionSwitch => widget.showAuthActionSwitch ?? true;
  bool _buttonsBuilt = false;

  void setAction(AuthAction action) {
    setState(() {
      _action = action;
    });
  }

  Widget _buildOAuthButtons(TargetPlatform platform) {
    final oauthProviders = widget.providers
        .whereType<OAuthProvider>()
        .where((element) => element.supportsPlatform(platform));

    _buttonsBuilt = true;

    final oauthButtonsList = oauthProviders.map((provider) {
      return OAuthProviderButton(
        provider: provider,
        auth: widget.auth,
        action: _action,
        variant: widget.oauthButtonVariant,
      );
    }).toList();

    if (widget.oauthButtonVariant == OAuthButtonVariant.icon_and_text) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: oauthButtonsList,
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: oauthButtonsList,
      );
    }
  }

  void _handleDifferentAuthAction(BuildContext context) {
    if (_action == AuthAction.signIn) {
      setState(() {
        _action = AuthAction.signUp;
      });
    } else {
      setState(() {
        _action = AuthAction.signIn;
      });
    }
  }

  List<Widget> _buildHeader(BuildContext context) {
    final l = FirebaseUILocalizations.labelsOf(context);

    late String title;
    late String hint;
    late String actionText;

    if (_action == AuthAction.signIn) {
      title = l.signInText;
      hint = l.registerHintText;
      actionText = l.registerText;
    } else if (_action == AuthAction.signUp) {
      title = l.registerText;
      hint = l.signInHintText;
      actionText = l.signInText;
    }

    final isCupertino = CupertinoUserInterfaceLevel.maybeOf(context) != null;
    TextStyle? hintStyle;
    late Color registerTextColor;

    if (isCupertino) {
      final theme = CupertinoTheme.of(context);
      registerTextColor = theme.primaryColor;
      hintStyle = theme.textTheme.textStyle.copyWith(fontSize: 12);
    } else {
      final theme = Theme.of(context);
      hintStyle = Theme.of(context).textTheme.bodySmall;
      registerTextColor = theme.colorScheme.primary;
    }

    return [
      Title(text: title),
      const SizedBox(height: 16),
      if (widget.subtitleBuilder != null)
        widget.subtitleBuilder!(
          context,
          _action,
        ),
      if (_showAuthActionSwitch) ...[
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$hint ',
                style: hintStyle,
              ),
              TextSpan(
                text: actionText,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: registerTextColor,
                    ),
                mouseCursor: SystemMouseCursors.click,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _handleDifferentAuthAction(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ]
    ];
  }

  @override
  void didUpdateWidget(covariant LoginView oldWidget) {
    if (oldWidget.action != widget.action) {
      _action = widget.action;
    }
    super.didUpdateWidget(oldWidget);
  }

  Widget? _buildProviderWidget(TargetPlatform platform, AuthProvider provider) {
    final l = FirebaseUILocalizations.labelsOf(context);

    if (provider is EmailAuthProvider) {
      return EmailForm(
        key: ValueKey(_action),
        auth: widget.auth,
        action: _action,
        provider: provider,
        email: widget.email,
        actionButtonLabelOverride: widget.actionButtonLabelOverride,
        showPasswordVisibilityToggle: widget.showPasswordVisibilityToggle,
      );
    } else if (provider is PhoneAuthProvider) {
      return PhoneVerificationButton(
        label: l.signInWithPhoneButtonText,
        action: _action,
        auth: widget.auth,
      );
    } else if (provider is EmailLinkAuthProvider) {
      return EmailLinkSignInButton(
        auth: widget.auth,
        provider: provider,
      );
    } else if (provider is OAuthProvider && !_buttonsBuilt) {
      return _buildOAuthButtons(platform);
    }
    return null;
  }

  List<Widget> _defaultProvidersBuilder(
    BuildContext context,
    List<AuthProvider> providers,
    AuthAction action,
  ) {
    final platform = Theme.of(context).platform;
    final children = <Widget>[];

    void addForType<T>() {
      for (var provider in providers) {
        if (provider is T && provider.supportsPlatform(platform)) {
          final w = _buildProviderWidget(platform, provider);

          if (w != null) {
            if (provider is OAuthProvider) {
              children.add(w);
            } else {
              children.add(const SizedBox(height: 8));
              children.add(w);
              if (provider is PhoneAuthProvider) {
                children.add(const SizedBox(height: 8));
              }
            }
          }
        }
      }
    }

    addForType<EmailAuthProvider>();
    addForType<PhoneAuthProvider>();
    addForType<EmailLinkAuthProvider>();
    addForType<OAuthProvider>();

    return children;
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    _buttonsBuilt = false;

    final children = <Widget>[
      if (_showTitle) ..._buildHeader(context),
    ];

    final builder = widget.providersBuilder ?? _defaultProvidersBuilder;
    children.addAll(builder(context, widget.providers, _action));

    if (widget.footerBuilder != null) {
      children.add(widget.footerBuilder!(context, _action));
    }

    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
