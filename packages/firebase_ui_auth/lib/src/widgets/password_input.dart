// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';

import '../validators.dart';

import 'internal/universal_icon_button.dart';
import 'internal/universal_text_form_field.dart';

/// {@template ui.auth.widgets.password_input}
/// An input that allows to enter a password.
///
/// {@macro ui.auth.widgets.internal.universal_text_form_field}
/// {@endtemplate}
class PasswordInput extends StatefulWidget {
  /// Allows to control the focus state of the input.
  final FocusNode focusNode;

  /// Allows to respond to changes in the input's value.
  final TextEditingController controller;

  /// A callback that is being called when the input is submitted.
  final void Function(String value) onSubmit;

  /// A placeholder of the input's value.
  final String placeholder;

  /// Used to validate the input's value.
  ///
  /// Returned string will be shown as an error message.
  final String? Function(String? value)? validator;

  /// {@macro flutter.widgets.editableText.autofillHints}
  /// {@macro flutter.services.AutofillConfiguration.autofillHints}
  final Iterable<String> autofillHints;

  /// Whether to show the visibility toggle button.
  /// Defaults to `false`.
  final bool showVisibilityToggle;

  /// {@macro ui.auth.widgets.password_input}
  const PasswordInput({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.onSubmit,
    required this.placeholder,
    this.autofillHints = const [AutofillHints.password],
    this.validator,
    this.showVisibilityToggle = false,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  var obscureText = true;

  Widget buildSuffixIcon() {
    final mIcon = obscureText ? Icons.visibility : Icons.visibility_off;
    final cIcon = obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash;

    return UniversalIconButton(
      materialIcon: mIcon,
      cupertinoIcon: cIcon,
      onPressed: () => setState(() => obscureText = !obscureText),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = FirebaseUILocalizations.labelsOf(context);

    Widget? suffixIcon;

    if (widget.showVisibilityToggle) {
      suffixIcon = buildSuffixIcon();
    }

    return UniversalTextFormField(
      autofillHints: widget.autofillHints,
      focusNode: widget.focusNode,
      controller: widget.controller,
      obscureText: obscureText,
      enableSuggestions: false,
      validator:
          widget.validator ?? NotEmpty(l.passwordIsRequiredErrorText).validate,
      onSubmitted: (v) => widget.onSubmit(v!),
      placeholder: widget.placeholder,
      suffixIcon: suffixIcon,
    );
  }
}
