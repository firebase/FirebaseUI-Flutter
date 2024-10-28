// Copyright 2024, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_ui_database/firebase_ui_database.dart';
import 'package:mockito/mockito.dart';
import '../utils.dart';

const _kTestPath = 'flutter-tests';

void main() {
  group('DatabaseListViewBuilder', () {
    setUp(() async {
      await clearReference(
        rtdb.ref(_kTestPath),
      );
    });

    testWidgets(
      'Allows specifying custom error handler',
      (tester) async {
        final builderSpy = ListViewBuilderSpy();
        final ref = rtdb.ref('unknown');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FirebaseDatabaseListView(
                query: ref,
                errorBuilder: (context, error, stack) {
                  return Text('error: $error');
                },
                itemBuilder: builderSpy.call,
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
            'error: [firebase_database/permission-denied] '
            'Client doesn\'t have permission to access the desired data.',
          ),
          findsOneWidget,
        );
        expect(find.byType(ListView), findsNothing);
      },
      // Works locally but fails on CI
      skip: defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS,
    );

    testWidgets(
      'Allows specifying custom loading handler',
      (tester) async {
        final ref = rtdb.ref(_kTestPath);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FirebaseDatabaseListView(
                query: ref,
                loadingBuilder: (context) => const Text('loading...'),
                itemBuilder: (context, snapshot) => throw UnimplementedError(),
              ),
            ),
          ),
        );

        expect(find.text('loading...'), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.byType(ListView), findsNothing);
      },
      skip: isCI &&
          (defaultTargetPlatform == TargetPlatform.macOS ||
              defaultTargetPlatform == TargetPlatform.iOS),
    );

    testWidgets(
      'By default, shows a progress indicator when loading',
      (tester) async {
        final ref = rtdb.ref(_kTestPath);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FirebaseDatabaseListView(
                query: ref,
                itemBuilder: (context, snapshot) => throw UnimplementedError(),
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.byType(ListView), findsNothing);
      },
      skip: isCI &&
          (defaultTargetPlatform == TargetPlatform.macOS ||
              defaultTargetPlatform == TargetPlatform.iOS),
    );

    testWidgets(
      'By default, ignore errors',
      (tester) async {
        final builderSpy = ListViewBuilderSpy();
        final ref = rtdb.ref(_kTestPath);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FirebaseDatabaseListView(
                query: ref,
                cacheExtent: 0,
                itemBuilder: (context, snapshot) => throw UnimplementedError(),
              ),
            ),
          ),
        );

        verifyZeroInteractions(builderSpy);

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.byType(ListView), findsNothing);

        await ref.onValue.first.then((value) {}, onError: (_) {});

        await tester.pump();

        expect(find.byType(ListView), findsOneWidget);
      },
      skip: isCI &&
          (defaultTargetPlatform == TargetPlatform.macOS ||
              defaultTargetPlatform == TargetPlatform.iOS),
    );

    testWidgets(
      'When reaching the end of the list, loads more items',
      (tester) async {
        final ref = rtdb.ref().child(_kTestPath);

        await fillReference(ref, 25);
        late double size;

        await tester.pumpWidget(
          MaterialApp(
            home: Material(
              child: Builder(builder: (context) {
                final mq = MediaQuery.of(context);
                final h = mq.size.height;
                size = h / 5;

                return FirebaseDatabaseListView(
                  physics: const ClampingScrollPhysics(),
                  query: ref.orderByValue(),
                  cacheExtent: 0,
                  pageSize: 5,
                  itemExtent: size,
                  itemBuilder: (context, snapshot) {
                    final v = snapshot.value as int;

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

        // allow for more items to be fetcehed
        await Future.delayed(const Duration(milliseconds: 500));

        await tester.drag(
          find.byKey(const ValueKey('4')),
          Offset(0, -size * 5),
          touchSlopY: 0,
        );

        await tester.pumpAndSettle();

        for (int i = 5; i < 9; i++) {
          expect(find.byKey(ValueKey(i.toString())), findsOneWidget);
        }

        // allow for more items to be fetched
        await Future.delayed(const Duration(milliseconds: 500));

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
      skip: isCI &&
          (defaultTargetPlatform == TargetPlatform.macOS ||
              defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS),
    );

    testWidgets(
      'Allows reversing the database query',
      (tester) async {
        final ref = rtdb.ref().child(_kTestPath);

        await fillReference(ref, 25);
        late double size;

        await tester.pumpWidget(
          MaterialApp(
            home: Material(
              child: Builder(builder: (context) {
                final mq = MediaQuery.of(context);
                final h = mq.size.height;
                size = h / 5;

                return FirebaseDatabaseListView(
                  physics: const ClampingScrollPhysics(),
                  query: ref.orderByValue(),
                  reverseQuery: true,
                  cacheExtent: 0,
                  pageSize: 5,
                  itemExtent: size,
                  itemBuilder: (context, snapshot) {
                    final v = snapshot.value as int;

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

        for (int i = 24; i >= 20; i--) {
          expect(find.byKey(ValueKey(i.toString())), findsOneWidget);
        }
      },
      skip: isCI && (defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.iOS),
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

Future<void> fillReference(DatabaseReference ref, int length) {
  return Future.wait([
    for (var i = 0; i < length; i++) ref.push().set(i),
  ]);
}
