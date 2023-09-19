// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import './firebase_ui_auth/firebase_ui_auth_e2e.dart' as firebase_ui_auth_e2e;
import './firebase_ui_firestore/firebase_ui_firestore_e2e.dart'
    as firebase_ui_firestore_e2e;
import './firebase_ui_oauth_apple/firebase_ui_oauth_apple_e2e.dart'
    as firebase_ui_oauth_apple_e2e;
import './firebase_ui_oauth_facebook/firebase_ui_oauth_facebook_e2e.dart'
    as firebase_ui_oauth_facebook_e2e;
import './firebase_ui_oauth_google/firebase_ui_oauth_google_e2e.dart'
    as firebase_ui_oauth_google_e2e;
import './firebase_ui_oauth_twitter/firebase_ui_oauth_twitter_e2e.dart'
    as firebase_ui_oauth_twitter_e2e;

void main() {
  firebase_ui_auth_e2e.main();
  firebase_ui_oauth_apple_e2e.main();
  firebase_ui_oauth_facebook_e2e.main();
  firebase_ui_oauth_google_e2e.main();
  firebase_ui_oauth_twitter_e2e.main();
  firebase_ui_firestore_e2e.main();
}
