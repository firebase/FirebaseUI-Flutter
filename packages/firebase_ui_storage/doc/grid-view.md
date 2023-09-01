# StorageGridView

When loading large amounts of objects from Firebase Storage, it makes sense to load them in batches, but requires handling of the pagination logic.

`StorageGridView` implements pagination logic for you, and allows to load objects from Firebase Storage in batches while scrolling.

## Usage

```dart
StorageGridView(
  ref: FirebaseStorage.instance.ref('images'),
  itemBuilder: (context, ref) {
    return AspectRatio(
      aspectRatio: 1,
      child: StorageImage(ref: ref),
    );
  },
);
```

By default, `StorageGridView` uses `const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3)` grid delegate, but you can pass your own `gridDelegate`:

```dart
StorageGridView(
  ref: FirebaseStorage.instance.ref('images'),
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
  ),
  itemBuilder: (context, ref) {
    return AspectRatio(
      aspectRatio: 1,
      child: StorageImage(ref: ref),
    );
  },
);
```

### Custom inital page loading state

When the first page of objects is loading, `StorageGridView` will show a `CircularProgressIndicator` under `MaterialApp`, and `CupertinoActivityIndicator` under `CupertinoApp`.

You can pass `loadingBuilder` to customize the loading state:

```dart
StorageGridView(
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

By default, `StorageGridView` will load 50 objects per page. You can customize the page size by passing `pageSize`:

```dart
StorageGridView(
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
[`PaginatedLoadingController`](https://github.com/firebase/FirebaseUI-Flutter/tree/main/packages/firebase_ui_storage/doc/paginated-loading-controller.md)

---

See [API reference](https://pub.dev/documentation/firebase_ui_storage/latest/firebase_ui_storage/GridView-class.html) for more details.
