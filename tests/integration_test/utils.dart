// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:integration_test/integration_test.dart';
import 'package:tests/firebase_options.dart';

// Github Actions environment variable
final isCI = const String.fromEnvironment('CI').isNotEmpty;

String get testEmulatorHost {
  if (defaultTargetPlatform == TargetPlatform.android && !kIsWeb) {
    return '10.0.2.2';
  }
  return 'localhost';
}

bool get isMobile {
  return !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
}

late FirebaseFirestore db;
late fba.FirebaseAuth auth;
late FirebaseDatabase rtdb;

bool _prepared = false;

Future<void> prepare() async {
  if (_prepared) return;
  _prepared = true;

  if (!kIsWeb) {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await fba.FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  auth = fba.FirebaseAuth.instance;

  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  db = FirebaseFirestore.instance;

  FirebaseDatabase.instance.useDatabaseEmulator('localhost', 9000);

  rtdb = FirebaseDatabase.instance;

  await authCleanup();
}

Future<void> authCleanup() async {
  await auth.signOut();
  await deleteAllAccounts();
}

bool _testsSetUp = false;

void setUpTests() {
  if (_testsSetUp) return;

  setUpAll(prepare);
  tearDown(authCleanup);
  _testsSetUp = true;
}

Future<void> render(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: widget,
          ),
        ),
      ),
    ),
  );
}

Future<T> retry<T>(Future<T> Function() fn, [int maxAttempts = 5]) async {
  var delay = const Duration(milliseconds: 100);
  int attempts = 0;

  final completer = Completer<T>();

  await Future.doWhile(() async {
    try {
      final res = await fn();
      completer.complete(res);
      return false;
    } catch (e) {
      if (attempts >= maxAttempts) {
        completer.completeError(e);
        return false;
      }

      debugPrint('Request failed: $e');
      debugPrint('retrying in $delay');
      await Future.delayed(delay);
      delay *= 2;
      attempts++;
      return true;
    }
  });

  return completer.future;
}

Future<void> deleteAllAccounts() async {
  final id = DefaultFirebaseOptions.currentPlatform.projectId;
  final uriString =
      'http://$testEmulatorHost:9099/emulator/v1/projects/$id/accounts';
  final res = await retry(() => http.delete(Uri.parse(uriString)));

  if (res.statusCode != 200) throw Exception('Delete failed');
}

Future<String> getVerificationCode(String phoneNumber) async {
  final id = DefaultFirebaseOptions.currentPlatform.projectId;
  final uriString =
      'http://$testEmulatorHost:9099/emulator/v1/projects/$id/verificationCodes';
  final code = await retry(() async {
    final res = await http.get(Uri.parse(uriString));
    final body = json.decode(res.body);

    final codes = (body['verificationCodes'] as List).fold<Map<String, String>>(
      {},
      (acc, value) {
        return {
          ...acc,
          value['phoneNumber']: value['code'],
        };
      },
    );

    if (codes[phoneNumber] == null) {
      throw Exception('Code not found');
    }

    return codes[phoneNumber]!;
  }, 6);

  return code;
}

Future<CollectionReference<T>> clearCollection<T>(
  CollectionReference<T> ref,
) async {
  final snapshot = await ref.get();
  if (snapshot.docs.isEmpty) return ref;

  await Future.wait([
    for (final doc in snapshot.docs) doc.reference.delete(),
  ]);

  await ref.get(const GetOptions(source: Source.server));
  return ref;
}

Future<void> clearReference(
    DatabaseReference ref,
    ) async {
  final snapshot = await ref.get();
  if (!snapshot.exists) return;
  await ref.remove();
}

extension<T> on TypeMatcher<T> {
  TypeMatcher<T> applyHaving(
    String name,
    Object? Function(T value) selector,
    Object? value,
  ) {
    if (value != const _Sentinel()) {
      return having(selector, name, value);
    }

    return this;
  }
}

TypeMatcher<QueryDocumentSnapshot<T>> isQueryDocumentSnapshot<T>({
  Object? data = const _Sentinel(),
}) {
  var matcher = isA<QueryDocumentSnapshot<T>>();

  // ignore: join_return_with_assignment
  matcher = matcher.applyHaving('data', (value) => value.data(), data);

  return matcher;
}

TypeMatcher<FirestoreQueryBuilderSnapshot<T>> isQueryBuilderSnapshot<T>({
  Object? isFetching = const _Sentinel(),
  Object? isFetchingNextPage = const _Sentinel(),
  Object? error = const _Sentinel(),
  Object? stackTrace = const _Sentinel(),
  Object? docs = const _Sentinel(),
  Object? hasError = const _Sentinel(),
  Object? hasData = const _Sentinel(),
  Object? hasMore = const _Sentinel(),
}) {
  var matcher = isA<FirestoreQueryBuilderSnapshot<T>>();

  matcher = matcher.applyHaving(
    'isFetching',
    (value) => value.isFetching,
    isFetching,
  );
  matcher =
      matcher.applyHaving('hasError', (value) => value.hasError, hasError);
  matcher = matcher.applyHaving('hasData', (value) => value.hasData, hasData);
  matcher = matcher.applyHaving(
    'hasMore',
    (value) => value.hasMore,
    hasMore,
  );
  matcher = matcher.applyHaving(
    'isFetchingMore',
    (value) => value.isFetchingMore,
    isFetchingNextPage,
  );
  matcher = matcher.applyHaving('error', (value) => value.error, error);
  matcher = matcher.applyHaving(
    'stackTrace',
    (value) => value.stackTrace,
    stackTrace,
  );
  matcher = matcher.applyHaving('docs', (value) => value.docs, docs);

  return matcher;
}

class _Sentinel {
  const _Sentinel();
}
