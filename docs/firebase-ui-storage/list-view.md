# StorageListView

When loading large amounts of objects from the Firebase Storage, it makes sense to load them in batches, but requires handling of the pagination logic.

`StorageListView` implements pagination logic for you, and allows to load objects from Firebase Storage in batches while scrolling.

## Usage

```dart
StorageListView(
  ref: FirebaseStorage.instance.ref('images'),
  itemBuilder: (context, ref) {
    return AspectRatio(
      aspectRatio: 1,
      child: StorageImage(ref: ref),
    );
  },
);
```

### Custom inital page loading state

When the first page of objects is loading, `StorageListView` will show a `CircularProgressIndicator` under `MaterialApp`, and `CupertinoActivityIndicator` under `CupertinoApp`.

You can pass `loadingBuilder` to customize the loading state:

```dart
StorageListView(
  ref: FirebaseStorage.instance.ref('images'),
  loadingBuilder: (context) {
    return Center(
      child: Text('Loading...'),
    );
  },
  itemBuilder: (context, ref) {
    return AspectRatio(
      aspectRatio: 1,
      child: StorageImage(ref: ref),
    );
  },
);
```

### Controlling page size

By default, `StorageListView` will load 50 objects per page. You can customize the page size by passing `pageSize`:

```dart
StorageListView(
  ref: FirebaseStorage.instance.ref('images'),
  pageSize: 100,
  itemBuilder: (context, ref) {
    return AspectRatio(
      aspectRatio: 1,
      child: StorageImage(ref: ref),
    );
  },
);
```

### Custom scroll views with pagination logic

If you need something more customizable, but still want pagination logic handled for you, you can use
[`PaginatedLoadingController`](https://github.com/firebase/FirebaseUI-Flutter/tree/main/docs/firebase-ui-storage/paginated-loading-controller.md)

---

See [API reference](https://pub.dev/documentation/firebase_ui_storage/latest/firebase_ui_storage/ListView-class.html) for more details.
