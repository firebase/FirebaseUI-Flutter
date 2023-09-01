# Getting started with Firebase UI Storage

Firebase UI Storage is a set of Flutter widgets and utilities designed to help you build and integrate your user interface with Firebase Storage.

## Installation

Install dependencies

```sh
flutter pub add firebase_core firebase_storage firebase_ui_storage
```

Install the FlutterFire CLI by running the following command from any directory:

```sh
flutter pub global activate flutterfire_cli
```

Use the FlutterFire CLI to configure your Flutter apps to connect to Firebase.

From your Flutter project directory, run the following command to start the app configuration workflow:

```sh
flutterfire configure
```

## Configuration

This section will walk you through the configuration process for Firebase UI Storage

### macOS

If you're building for macOS, you will need to add an entitlement. 

For read-only access if you only upload files:

```xml
  <key>com.apple.security.files.user-selected.read-only</key>
  <true/>
```

For read/write access if you want to be able to download files as well:

```xml
  <key>com.apple.security.files.user-selected.read-write</key>
  <true/>
```

Make sure to add network client entitlement as well:

```xml
<key>com.apple.security.network.client</key>
<true/>
```

### Initialize Firebase

```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
```

### Configure Firebase UI Storage

`FirebaseUIStorage` has a top-level configuration, that reduces amount of widget properties needed
to be passed to the widget constructors.

```dart
import 'package:firebase_storage/firebase_storage.dart';

Future<void> main() async {
  // configuration steps from above

  final storage = FirebaseStorage.instance;

  final config = FirebaseUIStorageConfiguration(
    storage: storage,
    uploadRoot: storage.ref('flutter-tests'),
    namingPolicy: UuidFileUploadNamingPolicy(), // optional, will generate a UUID for each uploaded file
  );

  await FirebaseUIStorage.configure(config);
}
```

Available file naming policies:

- [`KeepOriginalNameUploadPolicy`] – keeps the original file name (default)
- [`KeepPathUploadPolicy`] - keeps the original file path
- [`UuidFileUploadNamingPolicy`] – generates a UUID for each uploaded file

[`KeepOriginalNameUploadPolicy`]: https://pub.dev/documentation/firebase_ui_storage/latest/firebase_ui_storage/KeepOriginalNameUploadPolicy-class.html
[`KeepPathUploadPolicy`]: https://pub.dev/documentation/firebase_ui_storage/latest/firebase_ui_storage/KeepPathUploadPolicy-class.html
[`UuidFileUploadNamingPolicy`]: https://pub.dev/documentation/firebase_ui_storage/latest/firebase_ui_storage/UuidFileUploadNamingPolicy-class.html

If you ever need to override this top-level configuration, you can do so by using `FirebaseUIStorageConfigOverride`:

```dart
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebaseUIStorageConfigOverride(
      config: FirebaseUIStorageConfiguration(
        uploadRoot: FirebaseStorage.instance.ref('other-location'),
      ),
      child: const OtherWidget(),
    );
  }
}
```

### Firebase UI Storage widgets

- [`UploadButton`](https://github.com/firebase/FirebaseUI-Flutter/tree/main/packages/firebase_ui_storage/doc/upload-button.md)
- [`TaskProgressIndicator`](https://github.com/firebase/FirebaseUI-Flutter/tree/main/packages/firebase_ui_storage/doc/task-progress-indicator.md)
- [`StorageImage`](https://github.com/firebase/FirebaseUI-Flutter/tree/main/packages/firebase_ui_storage/doc/storage-image.md)
- [`StorageListView`](https://github.com/firebase/FirebaseUI-Flutter/tree/main/packages/firebase_ui_storage/doc/list-view.md)
- [`StorageGridView`](https://github.com/firebase/FirebaseUI-Flutter/tree/main/packages/firebase_ui_storage/doc/grid-view.md)
- [`PaginatedLoadingController`](https://github.com/firebase/FirebaseUI-Flutter/tree/main/packages/firebase_ui_storage/doc/paginated-loading-controller.md)

---

> See [API reference](https://pub.dev/documentation/firebase_ui_storage/latest/firebase_ui_storage/firebase_ui_storage-library.html) for more details.
