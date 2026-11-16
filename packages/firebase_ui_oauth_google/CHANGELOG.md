## 3.0.0

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**: update FlutterFire dependencies and drop CocoaPods ([#731](https://github.com/firebase/FirebaseUI-Flutter/issues/731)). ([c95b0991](https://github.com/firebase/FirebaseUI-Flutter/commit/c95b0991fa350f420863ab603b0c220ba53f8699))

    * feat!: update FlutterFire dependencies and drop CocoaPods
    
    Runs scripts/update_dependencies.dart, moving to firebase_core 5, firebase_auth 7, cloud_firestore 7, firebase_database 13 and firebase_storage 14 (Firebase Apple SDK 13, Android BoM 35).
    
    - Enable Swift Package Manager in every app pubspec and the workspace root.
    - Remove CocoaPods from all iOS apps and the macOS apps that don't depend on facebook_auth_desktop.
    - Raise example minimums to iOS 15, macOS 12 and Android minSdk 24.
    - tests/android: Gradle 8.14.3 and AGP 8.11.1, the minimums for current Flutter stable.
    
    
    
    * ci: run iOS and macOS e2e on the xcode-27 runner
    
    firebase-ios-sdk 13 uses Swift tools 6.2, which the macos-15 image's Xcode can't read. Match FlutterFire's runner and simulator. Also opt the oauth example's macOS AppDelegate into secure state restoration like the other examples.
    
    ---------

 - **BREAKING** **FEAT**(ui_oauth_google): migrate to google_sign_in 7 ([#700](https://github.com/firebase/FirebaseUI-Flutter/issues/700)). ([7fd741c9](https://github.com/firebase/FirebaseUI-Flutter/commit/7fd741c9bb4db30a0525f24b1cdbc003d320228c))

    * feat(ui_oauth_google)!: migrate to google_sign_in 7
    
    Migrates GoogleProvider to the google_sign_in 7 API, which adopts the
    UIScene lifecycle on iOS (google_sign_in_ios 6.3.0) and Swift Package
    Manager (6.3.3). Fixes the deprecated application lifecycle warning
    tracked in #673.
    
    - GoogleSignIn is now the shared instance and is initialized once
      before the first sign-in.
    - Authentication and authorization are separate steps. The provider
      reuses an existing authorization for the requested scopes and prompts
      for consent when one is not available, so the credential still
      carries an access token when scopes are requested.
    - A cancelled sign-in surfaces as AuthCancelledException, matching the
      previous flow reset behaviour.
    - Adds an optional serverClientId parameter to GoogleProvider,
      GoogleSignInButton and GoogleSignInIconButton for Android apps that
      do not use google-services.json.
    - Updates the integration test mocks to the new API.
    
    
    integration steps: GIDClientID in Info.plist on iOS, and on Android a
    web OAuth client entry in google-services.json or an explicit
    serverClientId. When no scopes are requested the credential now
    contains only an ID token.
    
    * refactor(ui_oauth_google): simplify init and isolate it in tests
    
    Chain the retry-reset catchError directly onto initialize() instead of
    threading an intermediate local, and add a @visibleForTesting
    debugReset() that clears the static one-time-init future so each test
    starts from a clean state with its freshly injected mock.
    
    Addresses review feedback on #689.
    
    * chore(ui_oauth_google): format provider.dart
    
    * fix(ui_oauth_google): preserve stack trace on init retry
    
    Use Error.throwWithStackTrace in the initialize() catchError so a failed initialization keeps its original stack trace instead of resetting it with a bare throw.


## 2.1.1

 - Update a dependency to the latest release.

## 2.1.0

 - **FEAT**: Require Dart 3.9 ([#618](https://github.com/firebase/FirebaseUI-Flutter/issues/618)). ([80a27122](https://github.com/firebase/FirebaseUI-Flutter/commit/80a27122e1008b76c3cb505f8140195f6dd52648))
 - **FEAT**: upgrade all packages min SDK to Dart 3.5 ([#616](https://github.com/firebase/FirebaseUI-Flutter/issues/616)). ([1535fac4](https://github.com/firebase/FirebaseUI-Flutter/commit/1535fac4e26a5dc91c13601c1327e43994d5403c))
 - **FEAT**: upgrade all packages min SDK to Dart 3.5 ([#615](https://github.com/firebase/FirebaseUI-Flutter/issues/615)). ([aefa711a](https://github.com/firebase/FirebaseUI-Flutter/commit/aefa711ad9c550f4f96cb574cb6a26919593d5eb))
 - **FEAT**: update FlutterFire dependencies to the latest ([#580](https://github.com/firebase/FirebaseUI-Flutter/issues/580)). ([acef6d3c](https://github.com/firebase/FirebaseUI-Flutter/commit/acef6d3c4575a44e951247638a2a015285a19ff1))

## 2.0.1

 - **FIX**: bump FlutterFire dependencies & fix CI ([#552](https://github.com/firebase/FirebaseUI-Flutter/issues/552)). ([0e6d85bf](https://github.com/firebase/FirebaseUI-Flutter/commit/0e6d85bf4c31b1a3fadff9ebdde3e00704123ad6))

## 2.0.0

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**: bump FlutterFire dependencies & remove deprecated API ([#529](https://github.com/firebase/FirebaseUI-Flutter/issues/529)). ([7650921e](https://github.com/firebase/FirebaseUI-Flutter/commit/7650921e0c99479d35302e994df7c31f7b624420))

## 1.4.3

 - **FIX**: bump FF dependencies to latest ([#526](https://github.com/firebase/FirebaseUI-Flutter/issues/526)). ([9f355bfc](https://github.com/firebase/FirebaseUI-Flutter/commit/9f355bfcda8319c9ed4786e1e3da91babb4f5229))

## 1.4.2

 - **FIX**: bump FF dependencies to latest ([#520](https://github.com/firebase/FirebaseUI-Flutter/issues/520)). ([ac4f1fdd](https://github.com/firebase/FirebaseUI-Flutter/commit/ac4f1fddcee04b020a6384ac74f2571bccafe44e))

## 1.4.1

 - **FIX**: replace deprecated API and bump FlutterFire dependencies ([#453](https://github.com/firebase/FirebaseUI-Flutter/issues/453)). ([530be48a](https://github.com/firebase/FirebaseUI-Flutter/commit/530be48a4710387832f98059bd34ce07bba1778c))

## 1.4.0

 - **FEAT**: bump FlutterFire dependencies 2024-09-30 ([#407](https://github.com/firebase/FirebaseUI-Flutter/issues/407)). ([d72ce8e3](https://github.com/firebase/FirebaseUI-Flutter/commit/d72ce8e3e6d79563c7992d25f36c05b06a742297))

## 1.3.3

 - Update a dependency to the latest release.

## 1.3.2

 - Update a dependency to the latest release.

## 1.3.1

 - Update a dependency to the latest release.

## 1.3.0

 - **FEAT**(ui_auth): use google_sign_in on macOS ([#255](https://github.com/firebase/FirebaseUI-Flutter/issues/255)). ([72571a0d](https://github.com/firebase/FirebaseUI-Flutter/commit/72571a0dd20181cabfc1f63d52e903e754399496))

## 1.2.17

 - Update a dependency to the latest release.

## 1.2.16

 - Update a dependency to the latest release.

## 1.2.15

 - Update a dependency to the latest release.

## 1.2.14

 - Update a dependency to the latest release.

## 1.2.13

 - Update a dependency to the latest release.

## 1.2.12

 - Update a dependency to the latest release.

## 1.2.11

 - Update a dependency to the latest release.

## 1.2.10

 - Update a dependency to the latest release.

## 1.2.9

 - Update a dependency to the latest release.

## 1.2.8
 
 - Migrate to a [new repo](https://github.com/firebase/FirebaseUI-Flutter)s

## 1.2.7

 - Update a dependency to the latest release.

## 1.2.6

 - Update a dependency to the latest release.

## 1.2.5

 - Update a dependency to the latest release.

## 1.2.4

 - Update a dependency to the latest release.

## 1.2.3

 - Update a dependency to the latest release.

## 1.2.2

 - Update a dependency to the latest release.

## 1.2.1

 - Update a dependency to the latest release.

## 1.2.0

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/flutterfire/issues/10944)). ([e1f5a5ea](https://github.com/firebase/flutterfire/commit/e1f5a5ea798c54f19d1d2f7b8f2250f8819f44b7))

## 1.1.5

 - Update a dependency to the latest release.

## 1.1.4

 - Update a dependency to the latest release.

## 1.1.3

 - Update a dependency to the latest release.

## 1.1.2

 - Update a dependency to the latest release.

## 1.1.1

 - Update a dependency to the latest release.

## 1.1.0

 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/flutterfire/issues/10618)). ([f80948a2](https://github.com/firebase/flutterfire/commit/f80948a28b62eead358bdb900d5a0dfb97cebb33))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/flutterfire/issues/10620)). ([15c1e85c](https://github.com/firebase/flutterfire/commit/15c1e85c5dae8e9884d321fde4a1217bc21cd6c8))

## 1.0.24

 - Update a dependency to the latest release.

## 1.0.23

 - Update a dependency to the latest release.

## 1.0.22

 - **FIX**(ui_auth_google): bump google_sign_in version ([#10531](https://github.com/firebase/flutterfire/issues/10531)). ([782850d7](https://github.com/firebase/flutterfire/commit/782850d7912c79fbd3da5d96fda2cf3d844a11dc))

## 1.0.21

 - Update a dependency to the latest release.

## 1.0.20

 - Update a dependency to the latest release.

## 1.0.19

 - Update a dependency to the latest release.

## 1.0.18

 - **FIX**: allow GoogleService-Info.plist based configuration ([#10360](https://github.com/firebase/flutterfire/issues/10360)). ([162597f4](https://github.com/firebase/flutterfire/commit/162597f4556b1e0da0601db08574f41ac3585500))

## 1.0.17

 - Update a dependency to the latest release.

## 1.0.16

 - Update a dependency to the latest release.

## 1.0.15

 - Update a dependency to the latest release.

## 1.0.14

 - Update a dependency to the latest release.

## 1.0.13

 - Update a dependency to the latest release.

## 1.0.12

 - Update a dependency to the latest release.

## 1.0.11

 - Update a dependency to the latest release.

## 1.0.10

 - Update a dependency to the latest release.

## 1.0.9

 - Update a dependency to the latest release.

## 1.0.8

 - **FIX**: fix an issue with Google Sign In where the clientId was passed on Android ([#10017](https://github.com/firebase/flutterfire/issues/10017)). ([cba4344c](https://github.com/firebase/flutterfire/commit/cba4344c05fb489cafd627420e2f7e0391ec625d))

## 1.0.7

 - Update a dependency to the latest release.

## 1.0.6

 - **FIX**: Pass the clientId into GoogleSignIn ([#9823](https://github.com/firebase/flutterfire/issues/9823)). ([343e6ed1](https://github.com/firebase/flutterfire/commit/343e6ed1ae27229b243d942e21c03ea310d57015))
 - **DOCS**: Fixed typo in firebase_ui_oauth packages for firebase_ui_auth package. ([#9931](https://github.com/firebase/flutterfire/issues/9931)). ([8cfc803e](https://github.com/firebase/flutterfire/commit/8cfc803eea8103701aeb1791d00c743582ccdb40))

## 1.0.5

 - Update a dependency to the latest release.

## 1.0.4

 - Update a dependency to the latest release.

## 1.0.3

 - Update a dependency to the latest release.

## 1.0.2

 - Update a dependency to the latest release.

## 1.0.1

 - Update a dependency to the latest release.

## 1.0.0

- Graduate package to a stable release.

Check out the [migration guide](https://github.com/firebase/flutterfire/blob/master/packages/firebase_ui_auth/doc/migration.md) to migrate from `flutterfire_ui`.

## 1.0.0-dev.2

 - Update a dependency to the latest release.

## 1.0.0-dev.1

 - **FEAT**: add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/flutterfire/issues/9343)). ([db5a5e1c](https://github.com/firebase/flutterfire/commit/db5a5e1c37defa47f18784176d165e3546efa778))

## 1.0.0-dev.0

## 0.0.1

* TODO: Describe initial release.
