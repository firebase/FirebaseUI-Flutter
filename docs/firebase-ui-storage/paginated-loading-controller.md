# PaginatedLoadingController

When loading large amounts of objects from Firebase Storage, it makes sense to load them in batches, but requires handling of the pagination logic.

Firebase UI Storage provides [`StorageListView`] and [`StorageGridView`] widgets that implement pagination logic for you, and allows objects to be loaded from Firebase Storage in batches while scrolling.

In cases where you want to build a completely custom scroll view, but still have pagination logic handled – you can use `PaginatedLoadingController`.

[`StorageListView`]: https://github.com/firebase/FirebaseUI-Flutter/tree/main/docs/firebase-ui-storage/list-view.md
[`StorageGridView`]: https://github.com/firebase/FirebaseUI-Flutter/tree/main/docs/firebase-ui-storage/grid-view.md

```dart
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final ctrl = PaginatedLoadingController(
    ref: FirebaseStorage.instance.ref('images'),
    pageSize: 100,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ctrl,
      builder: (context, _) {
        return switch (ctrl.state) {
          InitialPageLoading() => const Text('Loading...'),
          PageLoadError(error: final error) => Text('Error: $error'),
          PageLoading() => const Text('Loading...'),
          PageLoadComplete(items: final items) => ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              if (ctrl.shouldLoadNextPage(index)) {
                ctrl.load();
              }

              return StorageImage(ref: items[index]);
            },
          ),
        };
      },
    );
  }
}
```

---

See [API reference](https://pub.dev/documentation/firebase_ui_storage/latest/firebase_ui_storage/PaginatedLoadingController-class.html) for more details.
