// Copyright 2026, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

const _sessionsKey = 'firebase_ui_auth.email_link.sessions';

/// How many requested links are remembered, so an older email still signs in
/// on this device after the user asked for another link.
const _maxSessions = 5;

/// Link parameter names shared with FirebaseUI-Android.
const sessionIdParam = 'ui_sid';
const anonymousUserIdParam = 'ui_auid';

/// A pending email link sign in, persisted so that it survives the app being
/// killed while the user opens their email.
///
/// [anonymousUserId] is only added to the link; the check when the link is
/// opened compares it with the current user.
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

  static List<Map<String, dynamic>> _readAll(SharedPreferences prefs) {
    final stored = prefs.getStringList(_sessionsKey) ?? const [];
    return [
      for (final entry in stored) jsonDecode(entry) as Map<String, dynamic>,
    ];
  }

  static Future<void> _writeAll(
    SharedPreferences prefs,
    List<Map<String, dynamic>> sessions,
  ) async {
    if (sessions.isEmpty) {
      await prefs.remove(_sessionsKey);
    } else {
      await prefs.setStringList(_sessionsKey, [
        for (final session in sessions) jsonEncode(session),
      ]);
    }
  }

  /// Returns the stored session that requested the link with [sessionId].
  static Future<EmailLinkSession?> find(String? sessionId) async {
    if (sessionId == null) return null;

    final prefs = await SharedPreferences.getInstance();
    for (final session in _readAll(prefs)) {
      if (session['sessionId'] == sessionId) {
        return EmailLinkSession(
          email: session['email'] as String,
          sessionId: sessionId,
        );
      }
    }
    return null;
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    final sessions = _readAll(prefs);
    sessions.add({'sessionId': sessionId, 'email': email});
    final start = max(0, sessions.length - _maxSessions);
    await _writeAll(prefs, sessions.sublist(start));
  }

  /// Removes this session once its link was used.
  Future<void> remove() async {
    final prefs = await SharedPreferences.getInstance();
    final sessions = _readAll(prefs);
    sessions.removeWhere((session) => session['sessionId'] == sessionId);
    await _writeAll(prefs, sessions);
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
