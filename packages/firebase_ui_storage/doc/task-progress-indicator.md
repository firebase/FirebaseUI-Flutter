# TaskProgressIndicator

`TaskProgressIndicator` shows `LinearProgressIndicator` under `MaterialApp`, and a custom iOS-styled alternative under `CupertinoApp` while the file is being uploaded/downloaded, reflecting the amount of bytes transferred.

## Usage

```dart
FirebaseStorage storage = FirebaseStorage.instance;
Reference ref = storage.ref('my_file');

UploadTask task = ref.putFile(myFile);

TaskProgressIndicator(task: task);
```

> You can see how to use `TaskProgressIndicator` together with `UploadButton` [here](https://github.com/firebase/FirebaseUI-Flutter/tree/main/packages/firebase_ui_storage/doc/upload-button.md#showing-upload-progress).

`TaskProgressIndicator` also works for download tasks:

```dart
FirebaseStorage storage = FirebaseStorage.instance;
Reference ref = storage.ref('my_file');

DownloadTask task = ref.writeToFile(myFile);

TaskProgressIndicator(task: task);
```

## Building custom progress indicators

Firebase UI storage provides and abstract class, that simplifies building custom progress indicators. You can extend `TaskProgressWidget` and override `buildProgressIndicator` to build your own progress indicator:

```dart
class MyProgressIndicator extends TaskProgressWidget {
  final Task task;

  const MyProgressIndicator({super.key, required this.task});

  @override
  Widget buildProgressIndicator(BuildContext context, double progress) {
    return Text('Progress: ${progress.toStringAsFixed(2)}');
  }
}
```

---

See [API reference](https://pub.dev/documentation/firebase_ui_storage/latest/firebase_ui_storage/TaskProgressIndicator-class.html) for more details.
