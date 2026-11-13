// Copyright 2026, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeTaskSnapshot extends Fake implements TaskSnapshot {}

class _FakeUploadTask extends Fake implements UploadTask {
  final _completer = Completer<TaskSnapshot>();

  void complete() => _completer.complete(_FakeTaskSnapshot());

  @override
  Future<R> then<R>(
    FutureOr<R> Function(TaskSnapshot value) onValue, {
    Function? onError,
  }) => _completer.future.then(onValue, onError: onError);
}

class _FakeReference extends Fake implements Reference {
  _FakeReference(this.task);

  final UploadTask task;

  @override
  Reference child(String path) => this;

  @override
  UploadTask putFile(File file, [SettableMetadata? metadata]) => task;
}

class _FakeStorage extends Fake implements FirebaseStorage {}

void main() {
  group('$UploadButton', () {
    const fileSelectorChannel = MethodChannel(
      'plugins.flutter.io/file_selector',
    );

    setUp(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(fileSelectorChannel, (call) async {
            if (call.method == 'openFile') return ['/path/to/file.txt'];
            return null;
          });
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(fileSelectorChannel, null);
    });

    testWidgets(
      "doesn't call setState if disposed while the upload is in progress",
      (tester) async {
        final storage = _FakeStorage();
        final task = _FakeUploadTask();
        Reference? uploaded;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FirebaseUIStorageConfigOverride(
                config: FirebaseUIStorageConfiguration(
                  storage: storage,
                  uploadRoot: _FakeReference(task),
                ),
                child: UploadButton(
                  storage: storage,
                  onError: (error, stackTrace) {},
                  onUploadComplete: (ref) => uploaded = ref,
                ),
              ),
            ),
          ),
        );
        await tester.tap(find.byType(UploadButton));
        await tester.pump();

        await tester.pumpWidget(const SizedBox());
        expect(find.byType(UploadButton), findsNothing);

        task.complete();
        await tester.pump();

        expect(tester.takeException(), isNull);
        expect(uploaded, isNotNull);
      },
      // On the web the picked file is read with XFile.readAsBytes, which
      // can't be faked through the file_selector method channel.
      skip: kIsWeb,
    );
  });
}
