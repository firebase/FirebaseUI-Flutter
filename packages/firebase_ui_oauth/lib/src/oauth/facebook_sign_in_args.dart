// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'oauth_util.dart';
import 'provider_args.dart';

const _responseType = 'token';

class FacebookSignInArgs extends ProviderArgs {
  final String clientId;

  @override
  final String redirectUri;

  @override
  final host = 'www.facebook.com';

  @override
  final path = '/v12.0/dialog/oauth';

  FacebookSignInArgs({required this.clientId, required this.redirectUri});

  String state = '';

  @override
  Map<String, String> buildQueryParameters() {
    state = generateNonce();

    return {
      'client_id': clientId,
      'redirect_uri': redirectUri,
      'state': state,
      'response_type': _responseType,
    };
  }
}
