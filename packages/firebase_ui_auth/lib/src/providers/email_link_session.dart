// Copyright 2026, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

const _emailKey = 'firebase_ui_auth.email_link.email';
const _sessionIdKey = 'firebase_ui_auth.email_link.session_id';
const _anonymousUserIdKey = 'firebase_ui_auth.email_link.anonymous_user_id';

/// Link parameter names shared with FirebaseUI-Android.
const sessionIdParam = 'ui_sid';
const anonymousUserIdParam = 'ui_auid';

/// A pending email link sign in, persisted so that it survives the app being
/// killed while the user opens their email.
class EmailLinkSession {
  final String email;
  final String sessionId;
  final String? anonymousUserId;

  const EmailLinkSession({
    required this.email,
    required this.sessionId,
    this.anonymousUserId,
  });

  static String generateSessionId() {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    return List.generate(10, (_) => chars[random.nextInt(chars.length)]).join();
  }

  static Future<EmailLinkSession?> load() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(_emailKey);
    final sessionId = prefs.getString(_sessionIdKey);
    if (email == null || sessionId == null) return null;

    return EmailLinkSession(
      email: email,
      sessionId: sessionId,
      anonymousUserId: prefs.getString(_anonymousUserIdKey),
    );
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
    await prefs.setString(_sessionIdKey, sessionId);
    if (anonymousUserId case final uid?) {
      await prefs.setString(_anonymousUserIdKey, uid);
    } else {
      await prefs.remove(_anonymousUserIdKey);
    }
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_emailKey);
    await prefs.remove(_sessionIdKey);
    await prefs.remove(_anonymousUserIdKey);
  }

  /// Returns [url] with the session parameters added to its query.
  String appendTo(String url) {
    final uri = Uri.parse(url);
    return uri
        .replace(
          queryParameters: {
            ...uri.queryParameters,
            sessionIdParam: sessionId,
            anonymousUserIdParam: ?anonymousUserId,
          },
        )
        .toString();
  }
}

/// Collects query parameters from an email sign in link, including those
/// nested in its `link` and `continueUrl` parameters.
Map<String, String> parseEmailLinkParams(String link) {
  final params = <String, String>{};

  void parse(String value) {
    final uri = Uri.tryParse(value);
    if (uri == null) return;

    uri.queryParameters.forEach((key, value) {
      if (key == 'link' || key == 'continueUrl') {
        parse(value);
      } else {
        params[key] = value;
      }
    });
  }

  parse(link);
  return params;
}
