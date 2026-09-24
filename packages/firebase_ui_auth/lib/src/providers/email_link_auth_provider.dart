// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/foundation.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';

import 'email_link_session.dart';

/// A listener of the [EmailLinkFlow] lifecycle.
abstract class EmailLinkAuthListener extends AuthListener {
  /// Called when the link being is sent to the user's [email].
  void onBeforeLinkSent(String email);

  /// Called when the link was successfully sent to the [email].
  void onLinkSent(String email);

  /// Called when a sign in [link] was opened on a device that did not request
  /// it, so the email it was sent to is unknown. Complete the sign in with
  /// [EmailLinkAuthProvider.signInWithLink] and the email the user confirms.
  void onEmailRequired(String link);
}

/// {@template ui.auth.providers.email_link_auth_provider}
/// An [AuthProvider] that allows to authenticate using a link that is being
/// sent to the user's email.
///
/// The email is stored on the device when the link is sent, so a link that
/// launches the app completes the sign in. If the link is opened on another
/// device, the user is asked to confirm their email instead.
/// {@endtemplate}
class EmailLinkAuthProvider
    extends AuthProvider<EmailLinkAuthListener, fba.AuthCredential> {
  /// A configuration of the dynamic link.
  final fba.ActionCodeSettings actionCodeSettings;

  /// Whether a link requested by an anonymous user should be linked to that
  /// user instead of signing in. Defaults to `false`.
  ///
  /// When enabled, the link must be opened on the device that requested it,
  /// and signing in to an email that already has an account fails.
  final bool upgradeAnonymousUsers;

  final AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;
  bool _initialLinkChecked = false;
  bool _isAwaitingLink = false;

  // Whether a flow (an email link screen) is showing. A sign in link that
  // arrives while none is kept in _pendingLink until the next one opens, so
  // its result is not reported to a screen that is gone.
  bool _hasActiveFlow = false;
  String? _pendingLink;

  // Links being handled or already used, so the link that launched the app is
  // not handled twice when it arrives from both getInitialLink and
  // uriLinkStream. A link is removed if it fails, so it can be opened again.
  final Set<String> _handledLinks = {};

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
    this.upgradeAnonymousUsers = false,

    /// An instance of the [AppLinks] that should be used to handle
    /// the link. By default [AppLinks()] is used.
    AppLinks? appLinks,
  }) : _appLinks = appLinks ?? AppLinks();

  /// Sends a link to the [email].
  ///
  /// If [upgradeAnonymousUsers] is enabled and the current user is anonymous,
  /// the link upgrades that user instead of signing in a new one.
  void sendLink(String email) {
    authListener.onBeforeLinkSent(email);

    final session = EmailLinkSession(
      email: email,
      sessionId: EmailLinkSession.generateSessionId(),
      anonymousUserId: upgradeAnonymousUsers && shouldUpgradeAnonymous
          ? auth.currentUser!.uid
          : null,
    );

    auth
        .sendSignInLinkToEmail(
          email: email,
          actionCodeSettings: _withSession(session),
        )
        .then((_) => session.save())
        .then((_) => authListener.onLinkSent(email))
        .catchError(authListener.onError);
  }

  fba.ActionCodeSettings _withSession(EmailLinkSession session) {
    final settings = actionCodeSettings;

    return fba.ActionCodeSettings(
      url: session.appendTo(settings.url),
      handleCodeInApp: settings.handleCodeInApp,
      iOSBundleId: settings.iOSBundleId,
      androidPackageName: settings.androidPackageName,
      androidInstallApp: settings.androidInstallApp,
      androidMinimumVersion: settings.androidMinimumVersion,
      linkDomain: settings.linkDomain,
    );
  }

  /// Listens for incoming app links and handles email authentication.
  /// Should be called after [EmailLinkAuthListener.onLinkSent] was called.
  ///
  /// The [email] is read from the device storage written by [sendLink].
  void awaitLink(String email) {
    _isAwaitingLink = true;
    _hasActiveFlow = true;
    _listen();
  }

  /// Whether the app was launched from an email sign in link.
  ///
  /// Use it on startup to show [EmailLinkSignInScreen], which completes the
  /// sign in with that link.
  ///
  /// Pass [auth] when using a non-default Firebase app. The provider's own
  /// auth instance is only set once a flow is created.
  Future<bool> isLaunchedFromSignInLink({fba.FirebaseAuth? auth}) async {
    final uri = await _appLinks.getInitialLink();
    if (uri == null) return false;

    final firebaseAuth = auth ?? fba.FirebaseAuth.instance;
    return firebaseAuth.isSignInWithEmailLink(uri.toString());
  }

  /// Handles the sign in link that launched the app, if any, and starts
  /// listening for links opened while the app is running.
  ///
  /// A link that arrived while no flow was showing is handled now.
  void handleIncomingLinks() {
    _hasActiveFlow = true;
    _listen();

    final pendingLink = _pendingLink;
    if (pendingLink != null) {
      _pendingLink = null;
      _handleLink(pendingLink);
    }

    if (_initialLinkChecked) return;
    _initialLinkChecked = true;

    _appLinks
        .getInitialLink()
        .then<void>((uri) {
          if (uri == null) return;
          final link = uri.toString();
          if (auth.isSignInWithEmailLink(link)) _handleLink(link);
        })
        .catchError(authListener.onError);
  }

  void _listen() {
    // Keep a single subscription: app_links closes its shared stream when the
    // last listener cancels, so re-subscribing would drop the next link.
    _linkSubscription ??= _appLinks.uriLinkStream.listen(
      _onLinkReceived,
      onError: (error) => authListener.onError(error),
    );
  }

  void _onLinkReceived(Uri uri) {
    final link = uri.toString();

    if (auth.isSignInWithEmailLink(link)) {
      if (_hasActiveFlow) {
        _handleLink(link);
      } else {
        _pendingLink = link;
      }
    } else if (_isAwaitingLink) {
      // Other deep links are only reported once a sign in link was requested.
      authListener.onError(
        fba.FirebaseAuthException(
          code: 'invalid-email-signin-link',
          message: 'Invalid email sign in link',
        ),
      );
    }
  }

  Future<void> _handleLink(String link) async {
    if (!_handledLinks.add(link)) return;

    try {
      final params = parseEmailLinkParams(link);
      final anonymousUserId = params[anonymousUserIdParam];
      final session = await EmailLinkSession.find(params[sessionIdParam]);

      if (session == null) {
        if (anonymousUserId != null) {
          throw fba.FirebaseAuthException(
            code: 'email-link-wrong-device',
            message:
                'The sign in link must be opened on the device that '
                'requested it',
          );
        }

        // Not kept as handled, so the link can be opened again if the user
        // leaves the confirm email step.
        _handledLinks.remove(link);
        authListener.onEmailRequired(link);
        return;
      }

      _completeSignIn(
        session.email,
        link,
        anonymousUserId: anonymousUserId,
        session: session,
      );
    } catch (err) {
      _onSignInFailed(link, err);
    }
  }

  void _onSignInFailed(String link, Object error) {
    _handledLinks.remove(link);
    _isAwaitingLink = false;
    authListener.onError(error);
  }

  /// Completes the sign in with a [link] from
  /// [EmailLinkAuthListener.onEmailRequired] and the [email] it was sent to.
  ///
  /// The session stored for this device's own pending link is kept.
  void signInWithLink(String email, String link) {
    _handledLinks.add(link);
    _completeSignIn(email, link);
  }

  void _completeSignIn(
    String email,
    String link, {
    String? anonymousUserId,
    EmailLinkSession? session,
  }) {
    void onCompleted() {
      _isAwaitingLink = false;
      // A session left behind only means its link would ask for the email
      // again, so a storage error must not turn a sign in into a failure.
      session?.remove().catchError((_) {});
    }

    if (anonymousUserId == null) {
      authListener.onBeforeSignIn();
      auth
          .signInWithEmailLink(email: email, emailLink: link)
          .then<void>((credential) {
            onCompleted();
            authListener.onSignedIn(credential);
          })
          .catchError((Object err) => _onSignInFailed(link, err));
      return;
    }

    final user = auth.currentUser;
    if (user == null || !user.isAnonymous || user.uid != anonymousUserId) {
      _onSignInFailed(
        link,
        fba.FirebaseAuthException(
          code: 'email-link-different-anonymous-user',
          message:
              'The anonymous user that requested the link is no longer '
              'signed in',
        ),
      );
      return;
    }

    final credential = fba.EmailAuthProvider.credentialWithLink(
      email: email,
      emailLink: link,
    );

    authListener.onBeforeSignIn();
    user
        .linkWithCredential(credential)
        .then<void>((_) {
          onCompleted();
          authListener.onCredentialLinked(credential);
        })
        .catchError((Object err) => _onSignInFailed(link, err));
  }

  /// Called when the flow that handles links is disposed, for example when
  /// its screen is closed.
  ///
  /// Deep links that are not sign in links are no longer reported as errors,
  /// and a sign in link is kept until [handleIncomingLinks] is called again.
  void stopAwaitingLink() {
    _isAwaitingLink = false;
    _hasActiveFlow = false;
  }

  void dispose() {
    _linkSubscription?.cancel();
    _linkSubscription = null;
    _isAwaitingLink = false;
    _hasActiveFlow = false;
    _pendingLink = null;
  }
}
