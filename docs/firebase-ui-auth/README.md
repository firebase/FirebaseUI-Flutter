# Firebase UI for authentication

Firebase UI for authentication provides a simple and easy way to implement authentication in your Flutter app.
The library provides fully featured UI screens to drop into new or existing applications, along with
lower level abstractions for developers looking for tighter control.

## Installation

Activate FlutterFire CLI

```sh
dart pub global activate flutterfire_cli
```

Install dependencies

```sh
flutter pub add firebase_core
flutter pub add firebase_auth
flutter pub add firebase_ui_auth
```

## Configuration

Configure firebase using cli:

```sh
flutterfire configure
```

Initialize firebase app:

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
```

## macOS entitlements

If you're building for macOS, make sure to add necessary entitlements. Learn more [from the official Flutter documentation](https://docs.flutter.dev/platform-integration/macos/building#setting-up-entitlements).

## Writing widget unit tests

If you're writing widget unit tests, you'll need to add the following to your `setUpAll` method:

```dart
setUpAll(() {
  setFirebaseUiIsTestMode(true);
});
```

Also, you will likely want to mock the `FirebaseAuth` instance:

```dart
class MockFirebaseAuth extends Mock implements FirebaseAuth {
  /// mock necessary methods
}
```

An instance of `MockFirebaseAuth` can then be passed to Firebase UI widgets:

```dart
SignInScreen(
  auth: MockFirebaseAuth(),
  /// ... other props
)
```

## Next steps

To understand what Firebase UI for authentication offers, the following documentation pages walk you through the various topics on
how to use the package within your Flutter app.

- Available auth providers:

  - [EmailAuthProvider](./providers/email.md) - allows registering and signing in using email and password.
  - [EmailLinkAuthProvider](./providers/email-link.md) - allows registering and signing in using a link sent to email.
  - [PhoneAuthProvider](./providers/phone.md) - allows registering and signing in using a phone number
  - [UniversalEmailSignInProvider](./providers/universal-email-sign-in.md) - gets all connected auth providers for a given email.
  - [OAuth](./providers/oauth.md)

- [Localization](../firebase-ui-localizations.md)
- [Theming](./theming.md)
- [Navigation](./navigation.md)
