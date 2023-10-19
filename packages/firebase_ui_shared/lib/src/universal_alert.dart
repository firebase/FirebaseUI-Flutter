// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_shared/firebase_ui_shared.dart';

class UniversalAlert extends PlatformWidget {
  final void Function() onConfirm;
  final void Function() onCancel;

  final String title;
  final String message;

  final String confirmButtonText;
  final String cancelButtonText;

  const UniversalAlert({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    required this.title,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.message,
  });

  Widget adaptiveAction({
    required BuildContext context,
    required VoidCallback onPressed,
    required Widget child,
    bool isDestructiveAction = false,
  }) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(
          onPressed: onPressed,
          isDestructiveAction: isDestructiveAction,
          child: child,
        );
    }
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        adaptiveAction(
          context: context,
          onPressed: onConfirm,
          child: Text(confirmButtonText),
          isDestructiveAction: true,
        ),
        adaptiveAction(
          context: context,
          onPressed: onCancel,
          child: Text(cancelButtonText),
        ),
      ],
    );
  }

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        adaptiveAction(
          context: context,
          onPressed: onConfirm,
          child: Text(confirmButtonText),
          isDestructiveAction: true,
        ),
        adaptiveAction(
          context: context,
          onPressed: onCancel,
          child: Text(cancelButtonText),
        ),
      ],
    );
  }
}
