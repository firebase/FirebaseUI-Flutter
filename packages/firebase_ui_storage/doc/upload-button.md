# UploadButton

UploadButton is a widget that will trigger a file picker and upload the selected file to Firebase Storage.

Example usage:

```dart
class MyUploadButton extends StatelessWidget {
  const MyUploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return UploadButton(
      onError: (e, s) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      ),
      onUploadComplete: (ref) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Upload complete: ${ref.fullPath}'),
        ),
      ),
      variant: ButtonVariant.filled,
    );
  }
}
```

`UploadButton` uses `uploadRoot` and `namingPolicy` from [`FirebaseUIStorageConfiguration`](https://pub.dev/documentation/firebase_ui_storage/latest/firebase_ui_storage/FirebaseUIStorageConfiguration-class.html) to determine the location and file name of the uploaded file.

## Showing upload progress

`UploadButton` shows `CircularProgressIndicator` under `MaterialApp`, and `CupertinoActivityIndicator` under `CupertinoApp` while the upload is in progress. For large uploads, you might want to show upload progress, so you could replace the button with a [`TaskProgressIndicator`](https://github.com/firebase/FirebaseUI-Flutter/tree/main/packages/firebase_ui_storage/doc/task-progress-indicator.md) in a stateful widget using `onUploadStarted`:

```dart
class MyUploadWidget extends StatelessWidget {
  const MyUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UploadTask? task;

    return StatefulBuilder(builder: (context, setState) {
      if (task != null) return TaskProgressIndicator(task: task!);

      return UploadButton(
        onUploadStarted: (t) => setState(() => task = t),
        onUploadComplete: (ref) {/* handle succesful upload */},
        onError: (e, stackTrace) {/* handle error */},
      );
    });
  }
}
```

## Filtering file types

By default, `UploadButton` will show all files in the file picker. You can filter the file types by setting `extensions` or `mimeTypes`:

```dart
UploadButton(
  extensions: ['jpg', 'png'],
  mimeTypes: ['image/jpeg', 'image/png'],
);
```

---

See [API reference](https://pub.dev/documentation/firebase_ui_storage/latest/firebase_ui_storage/UploadButton-class.html) for more details.
