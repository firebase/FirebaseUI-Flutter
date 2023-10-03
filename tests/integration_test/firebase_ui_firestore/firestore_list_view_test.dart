// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:mockito/mockito.dart';
import '../utils.dart';

void main() {
  group('FirestoreListViewBuilder', () {
    setUp(() async {
      await clearCollection(
        db.collection('flutter-tests/list-view-builder/works'),
      );
    });

    testWidgets('Allows specifying custom error handler', (tester) async {
      final builderSpy = ListViewBuilderSpy();
      final collection = db.collection('unknown');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FirestoreListView<Map>(
              query: collection,
              errorBuilder: (context, error, stack) {
                return Text('error: $error');
              },
              itemBuilder: builderSpy,
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(ListView), findsNothing);

      await tester.pumpAndSettle();

      verifyZeroInteractions(builderSpy);

      expect(
        find.text(
          'error: [cloud_firestore/permission-denied] '
          'The caller does not have permission to execute the specified operation.',
        ),
        findsOneWidget,
      );
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('Allows specifying custom loading handler', (tester) async {
      final collection = db.collection('flutter-tests/list-view-builder/works');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FirestoreListView<Map>(
              query: collection.orderBy('value'),
              loadingBuilder: (context) => const Text('loading...'),
              itemBuilder: (context, snapshot) => throw UnimplementedError(),
            ),
          ),
        ),
      );

      expect(find.text('loading...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets(
      'By default, shows a progress indicator when loading',
      (tester) async {
        final collection = db.collection(
          'flutter-tests/list-view-builder/works',
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FirestoreListView<Map>(
                query: collection.orderBy('value'),
                itemBuilder: (context, snapshot) => throw UnimplementedError(),
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.byType(ListView), findsNothing);
      },
    );

    testWidgets('By default, ignore errors', (tester) async {
      final builderSpy = ListViewBuilderSpy();
      final collection = db.collection('unknown');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FirestoreListView<Map>(
              query: collection,
              cacheExtent: 0,
              itemBuilder: (context, snapshot) => throw UnimplementedError(),
            ),
          ),
        ),
      );

      verifyZeroInteractions(builderSpy);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(ListView), findsNothing);

      await collection.snapshots().first.then((value) {}, onError: (_) {});
      await tester.pump();

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets(
      'When reaching the end of the list, loads more items',
      (tester) async {
        final ref = db.collection('flutter-tests/list-view-builder/works');

        await fillCollection(ref, 25);
        late double size;

        await tester.pumpWidget(
          MaterialApp(
            home: Material(
              child: Builder(builder: (context) {
                final mq = MediaQuery.of(context);
                final h = mq.size.height;
                size = h / 5;

                return FirestoreListView<Map>(
                  physics: const ClampingScrollPhysics(),
                  query: ref.orderBy('value'),
                  cacheExtent: 0,
                  pageSize: 5,
                  itemExtent: size,
                  itemBuilder: (context, snapshot) {
                    final v = snapshot.data()['value'] as int;

                    return Container(
                      alignment: Alignment.center,
                      color: Colors.black.withAlpha(v % 2 == 0 ? 50 : 100),
                      key: ValueKey(v.toString()),
                      child: Text(
                        v.toString(),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        );

        await tester.pumpAndSettle();

        for (int i = 0; i < 5; i++) {
          expect(find.byKey(ValueKey(i.toString())), findsOneWidget);
        }

        await tester.drag(
          find.byKey(const ValueKey('4')),
          Offset(0, -size * 5),
          touchSlopY: 0,
        );

        await tester.pumpAndSettle();

        for (int i = 5; i < 9; i++) {
          expect(find.byKey(ValueKey(i.toString())), findsOneWidget);
        }

        await tester.drag(
          find.byKey(const ValueKey('9')),
          Offset(0, -size * 5),
          touchSlopY: 0,
        );

        await tester.pumpAndSettle();

        for (int i = 10; i < 15; i++) {
          expect(find.byKey(ValueKey(i.toString())), findsOneWidget);
        }
      },
    );
  });
}

class ListViewBuilderSpy<T> extends Mock {
  Widget call(
    BuildContext? context,
    T? snapshot,
  ) {
    return super.noSuchMethod(
      Invocation.method(#call, [context, snapshot]),
      returnValueForMissingStub: Container(),
      returnValue: Container(),
    );
  }
}

Future<void> fillCollection(CollectionReference ref, int length) {
  return Future.wait([
    for (var i = 0; i < length; i++) ref.add({'value': i}),
  ]);
}
