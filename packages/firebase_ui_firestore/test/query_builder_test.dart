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

  Future<void> pumpBuilder(WidgetTester tester, {Query<Json>? otherQuery}) {
    return tester.pumpWidget(
      FirestoreQueryBuilder<Json>(
        query: otherQuery ?? query,
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

  testWidgets(
    'renders a partial cache snapshot that does not shrink the list',
    (tester) async {
      await pumpBuilder(tester);

      query.emit(3, size: 3, fromCache: false);
      await tester.pump();

      snapshot.fetchMore();
      await tester.pump();

      // e.g. offline, or the cache already holds the end of the collection.
      query.emit(5, size: 3, fromCache: true);
      await tester.pump();
      expect(snapshot.docs, hasLength(3));
      expect(snapshot.hasMore, isFalse);
      expect(snapshot.isFetchingMore, isFalse);
    },
  );

  testWidgets('listens to metadata changes while waiting for the server', (
    tester,
  ) async {
    await pumpBuilder(tester);
    expect(query.includeMetadataChanges[3], isFalse);

    query.emit(3, size: 3, fromCache: false);
    await tester.pump();

    snapshot.fetchMore();
    await tester.pump();
    expect(query.includeMetadataChanges[5], isTrue);

    query.emit(5, size: 1, fromCache: true);
    await tester.pump();

    // The server confirms the cached result, which the SDK only reports as
    // a metadata change.
    query.emit(5, size: 1, fromCache: false);
    await tester.pump();
    expect(snapshot.docs, hasLength(1));
    expect(snapshot.isFetchingMore, isFalse);
  });

  testWidgets(
    'clears isFetchingMore on an error while waiting for the server',
    (tester) async {
      await pumpBuilder(tester);

      query.emit(3, size: 3, fromCache: false);
      await tester.pump();

      snapshot.fetchMore();
      await tester.pump();

      query.emit(5, size: 1, fromCache: true);
      query.emitError(5);
      await tester.pump();
      expect(snapshot.hasError, isTrue);
      expect(snapshot.isFetchingMore, isFalse);
    },
  );

  testWidgets('clears isFetchingMore when the query changes mid-fetch', (
    tester,
  ) async {
    await pumpBuilder(tester);

    query.emit(3, size: 3, fromCache: false);
    await tester.pump();

    snapshot.fetchMore();
    await tester.pump();
    await tester.pump();
    expect(snapshot.isFetchingMore, isTrue);

    final otherQuery = FakeQuery();
    await pumpBuilder(tester, otherQuery: otherQuery);

    otherQuery.emit(3, size: 1, fromCache: true);
    await tester.pump();
    expect(snapshot.docs, hasLength(1));
    expect(snapshot.isFetchingMore, isFalse);
  });

  testWidgets('renders local writes while waiting for the server', (
    tester,
  ) async {
    await pumpBuilder(tester);

    query.emit(3, size: 3, fromCache: false);
    await tester.pump();

    snapshot.fetchMore();
    await tester.pump();

    // e.g. offline, the user deletes a doc after the cache evicted the rest.
    query.emit(5, size: 1, fromCache: true, hasPendingWrites: true);
    await tester.pump();
    expect(snapshot.docs, hasLength(1));
    expect(snapshot.isFetchingMore, isFalse);
  });
}

class FakeQuery extends Fake implements Query<Json> {
  final _controllers = <int, StreamController<QuerySnapshot<Json>>>{};
  final includeMetadataChanges = <int, bool>{};

  void emit(
    int limit, {
    required int size,
    required bool fromCache,
    bool hasPendingWrites = false,
  }) {
    _controllers[limit]!.add(
      FakeQuerySnapshot(size, FakeMetadata(fromCache, hasPendingWrites)),
    );
  }

  void emitError(int limit) {
    _controllers[limit]!.addError(Exception('permission-denied'));
  }

  @override
  Query<Json> limit(int limit) => FakeLimitedQuery(this, limit);
}

class FakeLimitedQuery extends Fake implements Query<Json> {
  FakeLimitedQuery(this._parent, this._limit);

  final FakeQuery _parent;
  final int _limit;

  @override
  Stream<QuerySnapshot<Json>> snapshots({
    bool includeMetadataChanges = false,
    ListenSource source = ListenSource.defaultSource,
  }) {
    _parent.includeMetadataChanges[_limit] = includeMetadataChanges;
    return _parent._controllers
        .putIfAbsent(_limit, () => StreamController.broadcast(sync: true))
        .stream;
  }
}

class FakeQuerySnapshot extends Fake implements QuerySnapshot<Json> {
  FakeQuerySnapshot(this.size, this.metadata);

  @override
  final int size;

  @override
  final SnapshotMetadata metadata;

  @override
  List<QueryDocumentSnapshot<Json>> get docs =>
      List.generate(size, (_) => FakeDocumentSnapshot());
}

class FakeMetadata extends Fake implements SnapshotMetadata {
  FakeMetadata(this.isFromCache, this.hasPendingWrites);

  @override
  final bool isFromCache;

  @override
  final bool hasPendingWrites;
}

class FakeDocumentSnapshot extends Fake
    implements QueryDocumentSnapshot<Json> {}
