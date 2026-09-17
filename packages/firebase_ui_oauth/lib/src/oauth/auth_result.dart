// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The result of a desktop OAuth sign-in flow.
class AuthResult {
  final String? accessToken;
  final String? idToken;
  final String? tokenSecret;

  const AuthResult({this.accessToken, this.idToken, this.tokenSecret});

  @override
  String toString() {
    return 'AuthResult(idToken: $idToken, accessToken: $accessToken, '
        'tokenSecret: $tokenSecret)';
  }
}
