// Copyright 2026, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: subtype_of_sealed_class

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

typedef Json = Map<String, Object?>;

void main() {
  late FakeQuery query;
  late FirestoreQueryBuilderSnapshot<Json> snapshot;

  Future<void> pumpBuilder(WidgetTester tester) {
    return tester.pumpWidget(
      FirestoreQueryBuilder<Json>(
        query: query,
        pageSize: 2,
        builder: (context, s, _) {
          snapshot = s;
          return const SizedBox();
        },
      ),
    );
  }

  setUp(() => query = FakeQuery());

  testWidgets('keeps loaded pages while the next page is only in cache', (
    tester,
  ) async {
    await pumpBuilder(tester);

    query.emit(3, size: 3, fromCache: false);
    await tester.pump();
    expect(snapshot.docs, hasLength(2));
    expect(snapshot.hasMore, isTrue);

    snapshot.fetchMore();
    await tester.pump();

    // The new listener's cache only holds one doc.
    query.emit(5, size: 1, fromCache: true);
    await tester.pump();
    expect(snapshot.docs, hasLength(2));
    expect(snapshot.hasMore, isTrue);
    expect(snapshot.isFetchingMore, isTrue);

    query.emit(5, size: 5, fromCache: false);
    await tester.pump();
    expect(snapshot.docs, hasLength(4));
    expect(snapshot.hasMore, isTrue);
    expect(snapshot.isFetchingMore, isFalse);
  });

  testWidgets('renders a full cache snapshot while fetching the next page', (
    tester,
  ) async {
    await pumpBuilder(tester);

    query.emit(3, size: 3, fromCache: false);
    await tester.pump();

    snapshot.fetchMore();
    await tester.pump();

    query.emit(5, size: 5, fromCache: true);
    await tester.pump();
    expect(snapshot.docs, hasLength(4));
    expect(snapshot.isFetchingMore, isFalse);
  });

  testWidgets('renders cache updates after the server snapshot', (
    tester,
  ) async {
    await pumpBuilder(tester);

    query.emit(3, size: 3, fromCache: false);
    await tester.pump();

    snapshot.fetchMore();
    await tester.pump();

    query.emit(5, size: 5, fromCache: false);
    await tester.pump();

    // e.g. a doc deleted while offline.
    query.emit(5, size: 3, fromCache: true);
    await tester.pump();
    expect(snapshot.docs, hasLength(3));
    expect(snapshot.hasMore, isFalse);
  });
}

class FakeQuery extends Fake implements Query<Json> {
  final _controllers = <int, StreamController<QuerySnapshot<Json>>>{};

  void emit(int limit, {required int size, required bool fromCache}) {
    _controllers[limit]!.add(FakeQuerySnapshot(size, fromCache));
  }

  @override
  Query<Json> limit(int limit) => FakeLimitedQuery(
    _controllers
        .putIfAbsent(limit, () => StreamController.broadcast(sync: true))
        .stream,
  );
}

class FakeLimitedQuery extends Fake implements Query<Json> {
  FakeLimitedQuery(this._stream);

  final Stream<QuerySnapshot<Json>> _stream;

  @override
  Stream<QuerySnapshot<Json>> snapshots({
    bool includeMetadataChanges = false,
    ListenSource source = ListenSource.defaultSource,
  }) => _stream;
}

class FakeQuerySnapshot extends Fake implements QuerySnapshot<Json> {
  FakeQuerySnapshot(this.size, bool fromCache)
    : metadata = FakeMetadata(fromCache);

  @override
  final int size;

  @override
  final SnapshotMetadata metadata;

  @override
  List<QueryDocumentSnapshot<Json>> get docs =>
      List.generate(size, (_) => FakeDocumentSnapshot());
}

class FakeMetadata extends Fake implements SnapshotMetadata {
  FakeMetadata(this.isFromCache);

  @override
  final bool isFromCache;
}

class FakeDocumentSnapshot extends Fake
    implements QueryDocumentSnapshot<Json> {}
