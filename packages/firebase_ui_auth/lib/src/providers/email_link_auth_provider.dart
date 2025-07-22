// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/foundation.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';

/// A listener of the [EmailLinkFlow] lifecycle.
abstract class EmailLinkAuthListener extends AuthListener {
  /// Called when the link being is sent to the user's [email].
  void onBeforeLinkSent(String email);

  /// Called when the link was successfully sent to the [email].
  void onLinkSent(String email);
}

/// {@template ui.auth.providers.email_link_auth_provider}
/// An [AuthProvider] that allows to authenticate using a link that is being
/// sent to the user's email.
/// {@endtemplate}
class EmailLinkAuthProvider
    extends AuthProvider<EmailLinkAuthListener, fba.AuthCredential> {
  /// A configuration of the dynamic link.
  final fba.ActionCodeSettings actionCodeSettings;

  final AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  late EmailLinkAuthListener authListener;

  @override
  final providerId = 'email_link';

  @override
  bool supportsPlatform(TargetPlatform platform) {
    if (kIsWeb) return false;
    return platform == TargetPlatform.android || platform == TargetPlatform.iOS;
  }

  /// {@macro ui.auth.providers.email_link_auth_provider}
  EmailLinkAuthProvider({
    required this.actionCodeSettings,

    /// An instance of the [AppLinks] that should be used to handle
    /// the link. By default [AppLinks()] is used.
    AppLinks? appLinks,
  }) : _appLinks = appLinks ?? AppLinks();

  /// Sends a link to the [email].
  void sendLink(String email) {
    authListener.onBeforeLinkSent(email);

    final future = auth.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: actionCodeSettings,
    );

    future
        .then((_) => authListener.onLinkSent(email))
        .catchError(authListener.onError);
  }

  void _onLinkReceived(String email, Uri uri) {
    final link = uri.toString();

    if (auth.isSignInWithEmailLink(link)) {
      authListener.onBeforeSignIn();
      _signInWithEmailLink(email, link);
    } else {
      authListener.onError(
        fba.FirebaseAuthException(
          code: 'invalid-email-signin-link',
          message: 'Invalid email sign in link',
        ),
      );
    }
  }

  /// Listens for incoming app links and handles email authentication.
  /// Should be called after [EmailLinkAuthListener.onLinkSent] was called.
  void awaitLink(String email) {
    _linkSubscription?.cancel();

    _linkSubscription = _appLinks.uriLinkStream.listen(
      (Uri uri) => _onLinkReceived(email, uri),
      onError: (error) => authListener.onError(error),
    );
  }

  void dispose() {
    _linkSubscription?.cancel();
    _linkSubscription = null;
  }

  void _signInWithEmailLink(String email, String link) {
    auth
        .signInWithEmailLink(email: email, emailLink: link)
        .then(authListener.onSignedIn)
        .catchError(authListener.onError);
  }
}
