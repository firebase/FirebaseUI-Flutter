// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'auth_result.dart';

/// Describes how to build the sign-in URL for a desktop OAuth flow, and how
/// to turn the resulting callback URL into an [AuthResult].
abstract class ProviderArgs {
  String get redirectUri;
  String get host;
  String get path;

  Map<String, String> buildQueryParameters();

  Future<String> buildSignInUri() async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: path,
      queryParameters: buildQueryParameters(),
    );

    return uri.toString();
  }

  bool usesFragment = true;

  Future<AuthResult?> authorizeFromCallback(String callbackUrl) async {
    final uri = Uri.parse(callbackUrl);
    late Map<String, String> args;

    if (usesFragment) {
      args = Uri.splitQueryString(uri.fragment);
    } else {
      args = uri.queryParameters;
    }

    if (args.containsKey('access_token') || args.containsKey('id_token')) {
      return AuthResult(
        accessToken: args['access_token'],
        idToken: args['id_token'],
      );
    }

    throw Exception('No access token found');
  }
}
