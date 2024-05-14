## 2.0.4

 - Update a dependency to the latest release.

## 2.0.3

 - Update a dependency to the latest release.

## 2.0.2

 - Update a dependency to the latest release.

## 2.0.1

 - Update a dependency to the latest release.

## 2.0.0

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**(ui_storage): upgrade uuid dependency to ^4.0.0 ([#188](https://github.com/firebase/FirebaseUI-Flutter/issues/188)). ([e85c5166](https://github.com/firebase/FirebaseUI-Flutter/commit/e85c516697c850544b280e48e62dca788a4818ae))

    `UuidFileUploadNamingPolicy` and respective factory constructor `FileUploadNamingPolicy.uuid` now accept `V4Options?`, instead of `Map<String, dynamic>?`.
    
    Here's an example migration:
    
    ```diff
    final config = FirebaseUIStorageConfiguration(
      storage: storage,
    -  namingPolicy: FileUploadNamingPolicy.uuid({ 'rng': CryptoRNG() }),
    +  namingPolicy: FileUploadNamingPolicy.uuid(V4Options(null, CryptoRNG())),
    );
    
    await FirebaseUIStorage.configure(config);
    ```


## 1.0.4

 - Update a dependency to the latest release.

## 1.0.3

 - Update a dependency to the latest release.

## 1.0.2

 - Update a dependency to the latest release.

## 1.0.1

 - Update a dependency to the latest release.

## 1.0.0

 - Firebase UI Storage graduated to stable release

 - **FEAT**(ui_storage,ui_localizations): add UploadButton label ([#86](https://github.com/firebase/FirebaseUI-Flutter/issues/86)). ([e13a6b1e](https://github.com/firebase/FirebaseUI-Flutter/commit/e13a6b1ec00c576f95c4f0782e26e00340a8187d))
 - **DOCS**(ui_storage): add Firebase UI Storage docs ([#92](https://github.com/firebase/FirebaseUI-Flutter/issues/92)). ([4c4e3539](https://github.com/firebase/FirebaseUI-Flutter/commit/4c4e3539c64c7cc7728c6eea8ab91df5a47d5703))

## 0.1.0-dev.9

 - Migrate to a [new repo](https://github.com/firebase/FirebaseUI-Flutter)

## 0.1.0-dev.8

 - **FEAT**(ui_storage): add StorageGridView widget ([#11206](https://github.com/firebase/flutterfire/issues/11206)). ([48a3a396](https://github.com/firebase/flutterfire/commit/48a3a3960aa10e2d0850c9e6e2256a54c9f0cc4f))
 - **FEAT**(ui_storage): add shimmer for loading images ([#11237](https://github.com/firebase/flutterfire/issues/11237)). ([e2ad9004](https://github.com/firebase/flutterfire/commit/e2ad9004e2f1a31242df6ff12cf6dd46cfc63ff5))
 - **FEAT**(ui_storage): add StorageListView and PaginatedLoadingController ([#11170](https://github.com/firebase/flutterfire/issues/11170)). ([dcf1b22a](https://github.com/firebase/flutterfire/commit/dcf1b22aefa6b3846cff9604ab15fae36d847cd1))

## 0.1.0-dev.7

 - **FEAT**(ui_storage): add StorageImage widget ([#11080](https://github.com/firebase/flutterfire/issues/11080)). ([b592fb23](https://github.com/firebase/flutterfire/commit/b592fb23596b97e1b5c692c5c0b6fadaf852be28))

## 0.1.0-dev.6

 - Update a dependency to the latest release.

## 0.1.0-dev.5

 - Update a dependency to the latest release.

## 0.1.0-dev.4

 - Update a dependency to the latest release.

## 0.1.0-dev.3

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**(ui_storage): add TaskProgressIndicator ([#10859](https://github.com/firebase/flutterfire/issues/10859)). ([6ae57735](https://github.com/firebase/flutterfire/commit/6ae57735289cfa82322ee2259816a49cd605b784))

## 0.1.0-dev.2

 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/flutterfire/issues/10901)). ([a3b96735](https://github.com/firebase/flutterfire/commit/a3b967354294c295a9be8d699a6adb7f4b1dba7f))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/flutterfire/issues/10496)). ([c0b8ad56](https://github.com/firebase/flutterfire/commit/c0b8ad5605d1fda6d897ea625224b5e61c5826ad))

## 0.1.0-dev.1

 - **FEAT**(ui_storage): configuration API and UploadButton widget ([#10699](https://github.com/firebase/flutterfire/issues/10699)). ([e802b3dd](https://github.com/firebase/flutterfire/commit/e802b3dd4454fe797abe18bb584b4287b5be74da))

## 0.1.0-dev.0

- Initial Firebase UI Stroage release with top-level configuration and UploadButton
  - `i18n` is not yet supported and will be coming in future releases
