## 4.0.0

> Note: This release has breaking changes.

 - **FIX**(firebase_ui_auth): Catch sms code validation ([#482](https://github.com/firebase/FirebaseUI-Flutter/issues/482)). ([687a9bad](https://github.com/firebase/FirebaseUI-Flutter/commit/687a9bad5fd2ad6d2c279f0676c2a54678cd4b56))
 - **FIX**(ui_auth): widen app_links constraint to allow 7.x ([#676](https://github.com/firebase/FirebaseUI-Flutter/issues/676)). ([235b4071](https://github.com/firebase/FirebaseUI-Flutter/commit/235b4071cd62edcf35ac0503900060edab1c0474))
 - **FEAT**: migrate to Swift Package Manager and drop the Firestore fork ([#699](https://github.com/firebase/FirebaseUI-Flutter/issues/699)). ([73b2c453](https://github.com/firebase/FirebaseUI-Flutter/commit/73b2c45384ccf2de4a9ca9cfc0590648fe9e91d2))
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

 - **BREAKING** **FEAT**(ui_auth): complete email link sign in after cold start and on other devices ([#710](https://github.com/firebase/FirebaseUI-Flutter/issues/710)). ([57b353e5](https://github.com/firebase/FirebaseUI-Flutter/commit/57b353e598d0e2527ec506a869ecffa97caae5fd))
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

 - **BREAKING** **FEAT**(ui_oauth_twitter): replace twitter_login with signInWithProvider ([#697](https://github.com/firebase/FirebaseUI-Flutter/issues/697)). ([6290de49](https://github.com/firebase/FirebaseUI-Flutter/commit/6290de498144efc95d5bd98018a420c20f8777b5))

    * feat(ui_oauth_twitter)!: replace twitter_login with signInWithProvider
    
    twitter_login has not published since July 2023 and ships an Android build.gradle with no namespace that pins AGP 4.1.0, which capped this repo at AGP 8.7.3 and blocked #693 from using flutter_web_auth_2.
    
    TwitterProvider now signs in through auth.signInWithProvider on Android and iOS, mirroring AppleProvider, so Firebase performs the OAuth dance and the Twitter API key and secret move out of the app binary into the Firebase console. macOS and Windows keep the vendored OAuth 1.0a flow, which is why apiKey and apiSecretKey survive as optional parameters rather than being removed.
    
    macOS stays on the desktop flow because signInWithProvider is not available to it: FLTFirebaseAuthPlugin.swift carves out Apple and Game Center, then fails every other provider under `#if os(macOS)` with unsupported-platform. Android has no equivalent restriction.
    
    - AuthAction.none throws UnsupportedError on Android and iOS, since signInWithProvider cannot return a credential without also creating a session.
    - Anonymous users are upgraded with linkWithProvider so the anonymous uid survives sign in.
    - A debug-only diagnostic warns once when apiKey or apiSecretKey are passed on a platform that now ignores them.
    - Restores compileSdk to flutter.compileSdkVersion and bumps AGP to 8.9.1, now that nothing pins it.
    
    
    
    * fix(ui_oauth_twitter): report an error when linking without a signed in user
    
    AuthAction.link with no FirebaseAuth.currentUser null-shorted the linkWithProvider call, so the flow neither completed nor reported an error and the UI stayed in its loading state. The credential path this replaced raised through auth.currentUser!, so a null user was at least surfaced.
    
    Reports a FirebaseAuthException instead, which reaches AuthFailed rather than escaping as an unhandled Error the way a StateError would.
    
    * ci(e2e): correct stale version comment on the setup-gradle pin
    
    The pin comment claimed v6 while the pinned SHA is v6.2.0, and upstream has since moved the v6 tag to v6.3.0. zizmor flagged the mismatch as a medium severity finding, which blocks the workflow check.
    
    Corrects the comment rather than moving the pin, so the action version CI runs is unchanged.
    
    * docs(ui_oauth_twitter): document the signInWithProvider setup
    
    Rewrites the Twitter section around the flow Firebase now performs on Android and iOS: enable the provider in the console, point the X app callback URL at the Firebase auth handler, then add the encoded app ID URL scheme on iOS and the SHA-1 on Android. The twitter_login install step is gone, and the API key and secret move into their own macOS and Windows section, since those are the only platforms that still need them.
    
    Adds the encoded app ID scheme to the firebase_ui_auth example and drops the ffire:// redirect it passed for twitter_login, which no longer takes part in either flow.
    
    * fix(tests): bump the Gradle wrapper to 8.11.1 for AGP 8.9.1
    
    AGP 8.9.1 requires Gradle 8.11.1 or later, and the tests app wrapper was on 8.10, so assembleDebug failed with a version-check error as soon as the AGP pin moved.
    
    Only the tests app is affected. The example apps keep their own lower AGP versions and wrappers.
    
    * chore(ui_oauth): format the twitter example button call
    
    * fix(ui_oauth_twitter): report auth failures instead of throwing Errors
    
    Independent review found that three of the new failure paths raised Error subtypes into the auth listener. defaultOnAuthError rethrows anything that is not a FirebaseAuthException, and both AuthFlow.onError and the button's handler catch only Exception, so those Errors escaped and left the flow in its loading state permanently.
    
    - AuthAction.none now reports a FirebaseAuthException rather than throwing UnsupportedError out of the tap handler.
    - Missing OAuth 1.0a credentials are checked in desktopSignIn, before the base flow reads desktopSignInArgs synchronously, so the ArgumentError is no longer reachable from the UI.
    - Empty strings count as missing credentials, since String.fromEnvironment yields an empty string and that is the documented way to supply them. The debug diagnostic no longer fires on them either.
    - User cancellation is mapped back to a flow reset. The native SDKs report dismissal as a FirebaseAuthException, which was being rendered as a sign in failure where the previous flow reset silently.
    - The linked credential is no longer force unwrapped, since it is nullable on every platform.
    
    Also makes the anonymous upgrade test pass AuthAction.signIn explicitly. The flow resolves to AuthAction.link whenever currentUser is non-null, so the test was passing without the shouldUpgradeAnonymous branch being consulted.
    
    * fix(ui_oauth_twitter): correct the diagnostic callback URL and two stale comments
    
    The debug diagnostic told developers to set their Twitter app callback URL to redirectUri when one was supplied, but the native flow on Android and iOS ignores redirectUri and always completes through the Firebase auth handler, so the advice guaranteed failure for exactly the consumers migrating from the custom scheme twitter_login needed. It now names the handler. The desktop flow still honours redirectUri, so its own use of it is unchanged.
    
    Also corrects the class doc, which listed Game Center alongside Apple as exempt from the macOS restriction. Game Center is rejected on every platform, for its own reason, so Apple is the only exception. And removes a comment in the example that lost its subject when the twitter_login dependency was deleted.
    
    * fix(ui_auth): navigate to the profile after a sign in that returns no email
    
    The example's sign in handler matched only emailVerified users and unverified users that have an email, so a user with neither matched no case and the screen stayed put after signing in successfully. Twitter only returns an email when the app asks for it, and such a user is never emailVerified, so Twitter sign in landed in that gap.
    
    The app's own initialRoute already treats those users as signed in via its catch all, so this brings the in flow navigation in line with what a relaunch does.
    
    * fix(ui_auth): stop EmailVerificationController crashing on resume when signed out
    
    reload() read auth.currentUser! and runs on every app resume, so resuming with no signed in user threw an unhandled TypeError rather than an Exception, which escapes the flow's error handling entirely.
    
    Cancelling an OAuth sign in is the easiest way to hit it: the provider takes the app to the background, cancelling brings it back, and currentUser is still null because the sign in never completed. Any app switch while signed out does the same, so this is not specific to a provider.
    
    The constructor already guards currentUser for null, so this brings reload() in line with the rest of the class rather than changing its contract.
    
    * chore(ui_oauth_twitter): wrap the diagnostic guard condition
    
    * docs(ui_oauth_twitter): expand the 2.x upgrade note with what testing found
    
    Device testing surfaced three things the original note could not have covered, because none of them is visible from the source.
    
    - Registering the Android SHA-1 is not sufficient on its own. The certificate hash is embedded in google-services.json at download time, so the file has to be re-downloaded afterwards. The note now carries the error string Firebase shows when either step is missed, since that is what consumers will actually search for.
    - Firebase occasionally opens the full browser rather than a Chrome Custom Tab, and abandoning the flow there leaves the operation pending until the app restarts. Recorded as a known limitation, since nothing in the Dart layer can resolve a future the SDK never completes.
    - Cancelling returns silently, which is worth stating because it is indistinguishable from nothing having happened.
    
    Also documents that redirectUri is ignored on Android and iOS, which was missing, and splits the section into what you must change, what behaviour changed, and the known limitation.


## 3.1.1

 - Update a dependency to the latest release.

## 3.1.0

 - **FEAT**: Require Dart 3.9 ([#618](https://github.com/firebase/FirebaseUI-Flutter/issues/618)). ([80a27122](https://github.com/firebase/FirebaseUI-Flutter/commit/80a27122e1008b76c3cb505f8140195f6dd52648))
 - **FEAT**: upgrade all packages min SDK to Dart 3.5 ([#616](https://github.com/firebase/FirebaseUI-Flutter/issues/616)). ([1535fac4](https://github.com/firebase/FirebaseUI-Flutter/commit/1535fac4e26a5dc91c13601c1327e43994d5403c))
 - **FEAT**: upgrade all packages min SDK to Dart 3.5 ([#615](https://github.com/firebase/FirebaseUI-Flutter/issues/615)). ([aefa711a](https://github.com/firebase/FirebaseUI-Flutter/commit/aefa711ad9c550f4f96cb574cb6a26919593d5eb))
 - **FEAT**: update FlutterFire dependencies to the latest ([#580](https://github.com/firebase/FirebaseUI-Flutter/issues/580)). ([acef6d3c](https://github.com/firebase/FirebaseUI-Flutter/commit/acef6d3c4575a44e951247638a2a015285a19ff1))
 - **FEAT**(auth): upgrade flutter_facebook_auth dependency and use limited/classic login depending on ATT status  ([#553](https://github.com/firebase/FirebaseUI-Flutter/issues/553)). ([c3acdba7](https://github.com/firebase/FirebaseUI-Flutter/commit/c3acdba70eb6a6f79d12911361d416d9f0b866d7))

## 3.0.1

 - **FIX**: bump FlutterFire dependencies & fix CI ([#552](https://github.com/firebase/FirebaseUI-Flutter/issues/552)). ([0e6d85bf](https://github.com/firebase/FirebaseUI-Flutter/commit/0e6d85bf4c31b1a3fadff9ebdde3e00704123ad6))
 - **FIX**: analyser issues from later Flutter version ([#551](https://github.com/firebase/FirebaseUI-Flutter/issues/551)). ([62cc4be7](https://github.com/firebase/FirebaseUI-Flutter/commit/62cc4be752ac729306243111652b2717e5eeba42))

## 3.0.0

> Note: This release has breaking changes.

 - **BREAKING** **FEAT**: bump FlutterFire dependencies & remove deprecated API ([#529](https://github.com/firebase/FirebaseUI-Flutter/issues/529)). ([7650921e](https://github.com/firebase/FirebaseUI-Flutter/commit/7650921e0c99479d35302e994df7c31f7b624420))
- **BREAKING** **FEAT**: Removed all API associated with `fetchSignInMethodsForEmail()` which has been removed from FlutterFire. This includes these methods: `AuthFlow.onBeforeProvidersForEmailFetch()`, `AuthFlow.onDifferentProvidersFound()`, `showDifferentMethodSignInDialog()`, `AuthProvider.onBeforeProvidersForEmailFetch()`, `AuthProvider.onDifferentProvidersFound()`, `AuthProvider.findProvidersForEmail()`. These classes: `DifferentSignInMethodsFound`, `FetchingProvidersForEmail`, `UniversalEmailSignInController`, `UniversalEmailSignInListener`, `UniversalEmailSignInScreen`, `DifferentMethodSignInView`, `FindProvidersForEmailView`, `DifferentMethodSignInDialog`.


## 2.0.0

> Note: This release has breaking changes.

 - **FIX**(firebase_ui_auth): Add padding between avatar and display name form ([#524](https://github.com/firebase/FirebaseUI-Flutter/issues/524)). ([2747c1ae](https://github.com/firebase/FirebaseUI-Flutter/commit/2747c1ae2869f2c6988cfab819d2885f75913494))
 - **FIX**(firebase_ui_auth): Avoid redundant confirmation on account deletion ([#494](https://github.com/firebase/FirebaseUI-Flutter/issues/494)). ([e2626d24](https://github.com/firebase/FirebaseUI-Flutter/commit/e2626d244aabe70ba98ea6200a71e980e87c37b5))
 - **FIX**: bump FF dependencies to latest ([#526](https://github.com/firebase/FirebaseUI-Flutter/issues/526)). ([9f355bfc](https://github.com/firebase/FirebaseUI-Flutter/commit/9f355bfcda8319c9ed4786e1e3da91babb4f5229))
 - **FEAT**(firebase_ui_auth): Override the default deletion modal. ([#493](https://github.com/firebase/FirebaseUI-Flutter/issues/493)). ([97210905](https://github.com/firebase/FirebaseUI-Flutter/commit/97210905daaa1536e9fd849a4480a20d547b8ccf))
 - **BREAKING** **FEAT**(auth): Remove Dynamic Links, replace with app-links. ([#522](https://github.com/firebase/FirebaseUI-Flutter/issues/522)). ([b32ec609](https://github.com/firebase/FirebaseUI-Flutter/commit/b32ec6091da05d2f72188c3f335a2b6b954567ec))
   - Dynamic Links has been stripped out, please ensure you follow this [migration guide to setup Firebase Hosting](firebase.google.com/support/guides/app-links-universal-links) to replace it. 

## 1.17.0

 - **FIX**: bump FF dependencies to latest ([#520](https://github.com/firebase/FirebaseUI-Flutter/issues/520)). ([ac4f1fdd](https://github.com/firebase/FirebaseUI-Flutter/commit/ac4f1fddcee04b020a6384ac74f2571bccafe44e))
 - **FEAT**(firebase_ui_auth): Use icon from OAuth provider as a fallback in ProfileScreen ([#474](https://github.com/firebase/FirebaseUI-Flutter/issues/474)). ([55f04ebb](https://github.com/firebase/FirebaseUI-Flutter/commit/55f04ebbf29fcc7f8abe11df1b4e7dfaf04028f5))

## 1.16.1

 - **FIX**: replace deprecated API and bump FlutterFire dependencies ([#453](https://github.com/firebase/FirebaseUI-Flutter/issues/453)). ([530be48a](https://github.com/firebase/FirebaseUI-Flutter/commit/530be48a4710387832f98059bd34ce07bba1778c))
 - **FIX**(auth): remove listener on dispose and only call setState when mounted ([#419](https://github.com/firebase/FirebaseUI-Flutter/issues/419)). ([91c982b5](https://github.com/firebase/FirebaseUI-Flutter/commit/91c982b5bec13b2698b0b83d5885b46cbf0c9b77))
 - **FIX**(auth): ensure previous display name is provided to callback ([#431](https://github.com/firebase/FirebaseUI-Flutter/issues/431)). ([662717d7](https://github.com/firebase/FirebaseUI-Flutter/commit/662717d7a8f55d0fd4a1c5d4d8bac56a52e6e783))
 - **FIX**(ui_auth): fix confirmation dialog for unlink account button in profile screen ([#373](https://github.com/firebase/FirebaseUI-Flutter/issues/373)). ([0e3a7c49](https://github.com/firebase/FirebaseUI-Flutter/commit/0e3a7c4912de4cba1fa6e8fe3d99e1ae2e8a8286))
 - **FIX**(auth): using theme color instead of hardcoded value ([#416](https://github.com/firebase/FirebaseUI-Flutter/issues/416)). ([d183d87e](https://github.com/firebase/FirebaseUI-Flutter/commit/d183d87e61086c34e8e18233dfc99873b863e7d8))
 - **FIX**(ui_auth): make light text on _EmailVerificationBadge legible ([#196](https://github.com/firebase/FirebaseUI-Flutter/issues/196)). ([72530e52](https://github.com/firebase/FirebaseUI-Flutter/commit/72530e522f141eb12b74c13b99b4460e6da3d140))
 - **DOCS**(firebase_ui_auth): Handle `UserCreated` event in `README` example ([#422](https://github.com/firebase/FirebaseUI-Flutter/issues/422)). ([bd1d5ecf](https://github.com/firebase/FirebaseUI-Flutter/commit/bd1d5ecf24d4a33d180543e6d58271b495c0131d))

## 1.16.0

 - **FEAT**: bump FlutterFire dependencies 2024-09-30 ([#407](https://github.com/firebase/FirebaseUI-Flutter/issues/407)). ([d72ce8e3](https://github.com/firebase/FirebaseUI-Flutter/commit/d72ce8e3e6d79563c7992d25f36c05b06a742297))

## 1.15.0

 - **FIX**(ui_auth): fix confirmation dialog for delete account button ([#346](https://github.com/firebase/FirebaseUI-Flutter/issues/346)). ([4fd041d1](https://github.com/firebase/FirebaseUI-Flutter/commit/4fd041d12756084da6e4e3e7232c0dd35fc3593c))
 - **FEAT**(firebase_ui_auth): add autofocus property to PhoneInput widget ([#334](https://github.com/firebase/FirebaseUI-Flutter/issues/334)). ([eb9e2bd1](https://github.com/firebase/FirebaseUI-Flutter/commit/eb9e2bd1e04be52472b70354dd253a362c3b49c2))

## 1.14.0

 - **FIX**(auth): `ForgotPasswordScreen` display email within input box ([#336](https://github.com/firebase/FirebaseUI-Flutter/issues/336)). ([ad666666](https://github.com/firebase/FirebaseUI-Flutter/commit/ad666666b05c637d5bdf4d041c29a1eeac63d528))
 - **FIX**(firebase_ui_auth): `sendPasswordResetEmail` should not be executed when `isLoading=true` ([#315](https://github.com/firebase/FirebaseUI-Flutter/issues/315)). ([955e5c28](https://github.com/firebase/FirebaseUI-Flutter/commit/955e5c286ea5835defe0bd922428102e98f9e8d7))
 - **FIX**(ui_auth): Fixed a momentary form display after signing in with EmailLinkAuth. ([#318](https://github.com/firebase/FirebaseUI-Flutter/issues/318)). ([3e37d143](https://github.com/firebase/FirebaseUI-Flutter/commit/3e37d1435a4df12c41b9dd857cec67848b2af2c3))
 - **FIX**(firebase_ui_localizations): expose all Firebase UI localizations for overriding ([#309](https://github.com/firebase/FirebaseUI-Flutter/issues/309)). ([e4567478](https://github.com/firebase/FirebaseUI-Flutter/commit/e4567478205f2b88b54aa21af6429fb1c7c81564))
 - **FEAT**(firebase_ui_auth): add `showPasswordVisibilityToggle` to `RegisterScreen` ([#297](https://github.com/firebase/FirebaseUI-Flutter/issues/297)). ([6ec3ec1e](https://github.com/firebase/FirebaseUI-Flutter/commit/6ec3ec1edf584fe9f94142ceb7fbdeac57846678))
 - **FEAT**(firebase_ui_localizations): support for `sendVerificationEmailLabel()` label ([#280](https://github.com/firebase/FirebaseUI-Flutter/issues/280)). ([95be915d](https://github.com/firebase/FirebaseUI-Flutter/commit/95be915d162c6fb5dfdc6a8ad3298c2002d38dbf))
 - **DOCS**: Added superkey to example widget ([#326](https://github.com/firebase/FirebaseUI-Flutter/issues/326)). ([dd5507e1](https://github.com/firebase/FirebaseUI-Flutter/commit/dd5507e1953d9095a60e4cc127d0b8e72790a4ce))

## 1.13.1

 - Update a dependency to the latest release.

## 1.13.0

 - **FEAT**(ui_auth): use google_sign_in on macOS ([#255](https://github.com/firebase/FirebaseUI-Flutter/issues/255)). ([72571a0d](https://github.com/firebase/FirebaseUI-Flutter/commit/72571a0dd20181cabfc1f63d52e903e754399496))

## 1.12.1

 - Update a dependency to the latest release.

## 1.12.0

 - **FIX**(ui_auth): correctly handle phone auth in showReauthenticateDialog ([#209](https://github.com/firebase/FirebaseUI-Flutter/issues/209)). ([c0612cfd](https://github.com/firebase/FirebaseUI-Flutter/commit/c0612cfd71dc5ea2448ba73882b39a9766b97a98))
 - **FIX**(ui_auth): deprecate email enumeration protection affected APIs ([#210](https://github.com/firebase/FirebaseUI-Flutter/issues/210)). ([eed65674](https://github.com/firebase/FirebaseUI-Flutter/commit/eed656748caa12eb31d7a9677a16bf6b1d129b77))
 - **FEAT**(ui_auth): add a way to get an AuthController for AuthState ([#207](https://github.com/firebase/FirebaseUI-Flutter/issues/207)). ([0816bfd4](https://github.com/firebase/FirebaseUI-Flutter/commit/0816bfd4a1acfbe390d9725d48892b0831e99679))

## 1.11.0

 - **FIX**(ui_auth): correctly position phone input screen footer ([#183](https://github.com/firebase/FirebaseUI-Flutter/issues/183)). ([d5e2338d](https://github.com/firebase/FirebaseUI-Flutter/commit/d5e2338df4fbbed69c7526ecc1d4559730c43d03))
 - **FIX**(ui_auth): make maxWidth configurable on all screens ([#178](https://github.com/firebase/FirebaseUI-Flutter/issues/178)). ([c5e77c27](https://github.com/firebase/FirebaseUI-Flutter/commit/c5e77c2705a4237fec489bcdd6b94c85a91e481c))
 - **FEAT**(ui_auth): export `localizedErrorText` ([#189](https://github.com/firebase/FirebaseUI-Flutter/issues/189)). ([ab89f5cf](https://github.com/firebase/FirebaseUI-Flutter/commit/ab89f5cfa215be771e06abc9a94a65f821e2ce8d))
 - **FEAT**(ui_auth): confirm account deletion ([#187](https://github.com/firebase/FirebaseUI-Flutter/issues/187)). ([053a96ee](https://github.com/firebase/FirebaseUI-Flutter/commit/053a96eeedfc74c20ab3e73605dae42676b85a96))

## 1.10.0

 - **FEAT**(ui_auth): add more account actions ([#172](https://github.com/firebase/FirebaseUI-Flutter/issues/172)). ([518a6c7b](https://github.com/firebase/FirebaseUI-Flutter/commit/518a6c7b24835134d7943b3fc91a68f125e5a0fb))
 - **FEAT**(ui_auth): add a way to customize PlatformException text ([#171](https://github.com/firebase/FirebaseUI-Flutter/issues/171)). ([cbe75ca4](https://github.com/firebase/FirebaseUI-Flutter/commit/cbe75ca436bd4aeeb9c9f2e1b9fc067b2e1de279))

## 1.9.1

 - **FIX**(ui_auth): deprecate screens and widgets that use fetchSignInMethodsForEmail ([#153](https://github.com/firebase/FirebaseUI-Flutter/issues/153)). ([84ce5fb7](https://github.com/firebase/FirebaseUI-Flutter/commit/84ce5fb7a4c2237932568c3cb85953b112ed04a8))
 - **FIX**(ui_auth): use capitalized cancel label on dialogs ([#134](https://github.com/firebase/FirebaseUI-Flutter/issues/134)). ([78c1ba9b](https://github.com/firebase/FirebaseUI-Flutter/commit/78c1ba9b20a6691e046bdbc76595fd810867cde5))
 - **FIX**(ui_localizations): localize weak password error ([#138](https://github.com/firebase/FirebaseUI-Flutter/issues/138)). ([bcfa2be6](https://github.com/firebase/FirebaseUI-Flutter/commit/bcfa2be660454078abc0a542abe3359f23453ca4))

## 1.9.0

 - **FIX**(ui_auth): add showPasswordVisibilityToggle to the SignInScreen ([#114](https://github.com/firebase/FirebaseUI-Flutter/issues/114)). ([77ed75d3](https://github.com/firebase/FirebaseUI-Flutter/commit/77ed75d3cc61aa09c0e5d204af09b98b3f6f1421))
 - **FEAT**(ui_auth): add a way to customize ErrorText message ([#119](https://github.com/firebase/FirebaseUI-Flutter/issues/119)). ([a36884d7](https://github.com/firebase/FirebaseUI-Flutter/commit/a36884d73228a33a4c4b061e095f4939bf671d8e))
 - **FEAT**(ui_auth): show confirmation dialog when trying to unlink a provider ([#116](https://github.com/firebase/FirebaseUI-Flutter/issues/116)). ([8757037b](https://github.com/firebase/FirebaseUI-Flutter/commit/8757037baa3d88ff25b5dc20aab0dc6ba445827b))

## 1.8.0

 - **FIX**(ui_auth,ui_localizations): add invalid verification SMS code error label ([#102](https://github.com/firebase/FirebaseUI-Flutter/issues/102)). ([8adc39b9](https://github.com/firebase/FirebaseUI-Flutter/commit/8adc39b94abcf55a4fc0c07850e7e9ec25380d0d))
 - **FIX**(ui_auth): allow to pass EmailFormStyle via property ([#98](https://github.com/firebase/FirebaseUI-Flutter/issues/98)). ([88c31a33](https://github.com/firebase/FirebaseUI-Flutter/commit/88c31a332dc490d5500e81d491ba929b0fe4c5f0))
 - **FEAT**(ui_auth): allow to toggle password visibility ([#104](https://github.com/firebase/FirebaseUI-Flutter/issues/104)). ([6e3735d9](https://github.com/firebase/FirebaseUI-Flutter/commit/6e3735d9fda3f2415a781ff591a5842864dc2fcf))

## 1.7.0

 - **FIX**(ui_localizations,ui_auth): add missing labels ([#87](https://github.com/firebase/FirebaseUI-Flutter/issues/87)). ([be2b0c33](https://github.com/firebase/FirebaseUI-Flutter/commit/be2b0c33f9537f307c2cae97e5f483f695b3ea05))
 - **FIX**(ui_auth): Pass correct AuthAction to the footerBuilder ([#70](https://github.com/firebase/FirebaseUI-Flutter/issues/70)). ([1e091cc5](https://github.com/firebase/FirebaseUI-Flutter/commit/1e091cc583f5c976634583315a9d8a1968927498))
 - **FEAT**(ui_auth): Add "Go Back" button to EmailLinkSignInView ([#63](https://github.com/firebase/FirebaseUI-Flutter/issues/63)). ([326fd27d](https://github.com/firebase/FirebaseUI-Flutter/commit/326fd27d362de0f342062ac68f85ab8ceea005aa))

## 1.6.5

 - Update a dependency to the latest release.

## 1.6.4

 - Migrate to a [new repo](https://github.com/firebase/FirebaseUI-Flutter)

## 1.6.2

 - Update a dependency to the latest release.

## 1.6.1

 - Update a dependency to the latest release.

## 1.6.0

 - **FIX**(ui_auth): fix LoadingIndicator layout on EmailVerificationScreen ([#11169](https://github.com/firebase/flutterfire/issues/11169)). ([fd832fb8](https://github.com/firebase/flutterfire/commit/fd832fb8ef8cf6288ec5d722dcade8eb7c133a9b))
 - **FEAT**(auth): move to Pigeon for Platform channels ([#10802](https://github.com/firebase/flutterfire/issues/10802)). ([43e5b20b](https://github.com/firebase/flutterfire/commit/43e5b20b14799102a6544a4763476eaba44b9cfb))

## 1.5.0

 - **FIX**(ui_auth): documentation - fix material misspelling in universal_text_form_field.dart ([#11151](https://github.com/firebase/flutterfire/issues/11151)). ([31358154](https://github.com/firebase/flutterfire/commit/313581548422bc68bd47f3d890a9f4de8da7e2ad))
 - **FIX**(ui_auth): fix ProfileScreen ignoring parent rebuilds ([#11160](https://github.com/firebase/flutterfire/issues/11160)). ([89df2b58](https://github.com/firebase/flutterfire/commit/89df2b58d25d0980430acfee7b9f70765fe33bce))
 - **FEAT**(ui_auth): allow passing custom user avatar widget ([#11161](https://github.com/firebase/flutterfire/issues/11161)). ([cfcaa2f0](https://github.com/firebase/flutterfire/commit/cfcaa2f0dd0e3b2d980b675a5567245842a8a6c3))

## 1.4.3

 - Update a dependency to the latest release.

## 1.4.2

 - **FIX**(firebase_ui_auth): Error added in ProfileScreen in firebase_ui_auth 1.4.0 ([#10957](https://github.com/firebase/flutterfire/issues/10957)). ([12284b3b](https://github.com/firebase/flutterfire/commit/12284b3b0b9813c4ec8fe8678f48d6b38d642989))

## 1.4.1

 - Update a dependency to the latest release.

## 1.4.0

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/flutterfire/issues/10944)). ([e1f5a5ea](https://github.com/firebase/flutterfire/commit/e1f5a5ea798c54f19d1d2f7b8f2250f8819f44b7))
 - **DOCS**(firebase_ui_auth): fix phone provider's widget example ([#10917](https://github.com/firebase/flutterfire/issues/10917)). ([c56234ff](https://github.com/firebase/flutterfire/commit/c56234ffd06c29edac6243bf0509b1925390395a))

## 1.3.0

 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/flutterfire/issues/10901)). ([a3b96735](https://github.com/firebase/flutterfire/commit/a3b967354294c295a9be8d699a6adb7f4b1dba7f))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/flutterfire/issues/10496)). ([c0b8ad56](https://github.com/firebase/flutterfire/commit/c0b8ad5605d1fda6d897ea625224b5e61c5826ad))
 - **FEAT**: upgrade to dart 3 compatible dependencies ([#10890](https://github.com/firebase/flutterfire/issues/10890)). ([4bd7e59b](https://github.com/firebase/flutterfire/commit/4bd7e59b1f2b09a2230c49830159342dd4592041))

## 1.2.4

 - Update a dependency to the latest release.

## 1.2.3

 - **DOCS**(firebase_ui_auth): fix an error in the documentation ([#10797](https://github.com/firebase/flutterfire/issues/10797)). ([b71e0dde](https://github.com/firebase/flutterfire/commit/b71e0dde5ad0c2c04876afde5da8c8b1b8cb321d))

## 1.2.2

 - Update a dependency to the latest release.

## 1.2.1

 - **FIX**: allow to unlink providers only in edit mode ([#10649](https://github.com/firebase/flutterfire/issues/10649)). ([c2da6c7e](https://github.com/firebase/flutterfire/commit/c2da6c7e80bbf817ddbaf6475b7b5ea53c4ac666))
 - **DOCS**(ui_auth): fix typo RegisterScren -> RegisterScreen ([#10488](https://github.com/firebase/flutterfire/issues/10488)). ([47c132c8](https://github.com/firebase/flutterfire/commit/47c132c85e83415fc4335ad7be5ef63958c0c3b0))

## 1.2.0

 - **FIX**(ui_auth): pass breakpoint to LoginScreen ([#10607](https://github.com/firebase/flutterfire/issues/10607)). ([39d77c4d](https://github.com/firebase/flutterfire/commit/39d77c4dcc9e77b9f78db918dc444c0e09fd3228))
 - **FEAT**(ui_shared): pass platform-specific icons and colors explicitly ([#10655](https://github.com/firebase/flutterfire/issues/10655)). ([60ff1dfe](https://github.com/firebase/flutterfire/commit/60ff1dfe32abe6780fc5aafad63606b00af3f3e2))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/flutterfire/issues/10618)). ([f80948a2](https://github.com/firebase/flutterfire/commit/f80948a28b62eead358bdb900d5a0dfb97cebb33))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/flutterfire/issues/10620)). ([15c1e85c](https://github.com/firebase/flutterfire/commit/15c1e85c5dae8e9884d321fde4a1217bc21cd6c8))
 - **DOCS**(ui_auth): Fixed typo 'EmaiAuthProvider' to 'EmailAuthProvider' ([#10654](https://github.com/firebase/flutterfire/issues/10654)). ([59932020](https://github.com/firebase/flutterfire/commit/599320203ff7c8ea07d9a697c52c995a306f00ea))

## 1.1.17

 - Update a dependency to the latest release.

## 1.1.16

 - Update a dependency to the latest release.

## 1.1.15

 - **FIX**(ui_auth): fix ResponsivePage layout causing unexpected overflows ([#10533](https://github.com/firebase/flutterfire/issues/10533)). ([80c3c5ef](https://github.com/firebase/flutterfire/commit/80c3c5efbe329a780ae247da281d775f91125b56))
 - **FIX**(ui_auth_google): bump google_sign_in version ([#10531](https://github.com/firebase/flutterfire/issues/10531)). ([782850d7](https://github.com/firebase/flutterfire/commit/782850d7912c79fbd3da5d96fda2cf3d844a11dc))

## 1.1.14

 - Update a dependency to the latest release.

## 1.1.13

 - Update a dependency to the latest release.

## 1.1.12

 - Update a dependency to the latest release.

## 1.1.11

 - Update a dependency to the latest release.

## 1.1.10

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/flutterfire/issues/10344)). ([e0087c84](https://github.com/firebase/flutterfire/commit/e0087c845c7526c11a4241a26d39d4673b0ad29d))
 - **DOCS**: fix return type of example main function ([#10342](https://github.com/firebase/flutterfire/issues/10342)). ([3339bfeb](https://github.com/firebase/flutterfire/commit/3339bfeb81624e6e706d335139c087e4f3ea53eb))

## 1.1.9

 - **DOCS**: add a font requirement ([#10293](https://github.com/firebase/flutterfire/issues/10293)). ([d94a4ba1](https://github.com/firebase/flutterfire/commit/d94a4ba1c33c0eb49f35292025c3cf964fa21a0d))

## 1.1.8

 - **FIX**: fix material 3 button styling ([#10253](https://github.com/firebase/flutterfire/issues/10253)). ([a541e9ab](https://github.com/firebase/flutterfire/commit/a541e9ab777a93714355247463e285c14686b319))
 - **FIX**: Unfocus to dismiss keyboard when submitting email form ([#10208](https://github.com/firebase/flutterfire/issues/10208)). ([f3a4d3ac](https://github.com/firebase/flutterfire/commit/f3a4d3acc3fbb0743380f3d6f1226e2aa5b95345))
 - **FIX**: emit UserCreated state when signed in user is new ([#10225](https://github.com/firebase/flutterfire/issues/10225)). ([a2ce4104](https://github.com/firebase/flutterfire/commit/a2ce410479d33d87987bfc90fcc9c41954c041d1))
 - **FIX**: fix default SMSCodeInputScreen breakpoint ([#10226](https://github.com/firebase/flutterfire/issues/10226)). ([443418f4](https://github.com/firebase/flutterfire/commit/443418f4276f87d2d9594343284e44a86db1516d))
 - **FIX**: fix PhoneInputScreen layout ([#10227](https://github.com/firebase/flutterfire/issues/10227)). ([7d817863](https://github.com/firebase/flutterfire/commit/7d81786322013df7f0a087e79f3abebbb4ece6cc))
 - **DOCS**: fix typo in "platform ([#10247](https://github.com/firebase/flutterfire/issues/10247)). ([7bb4ba16](https://github.com/firebase/flutterfire/commit/7bb4ba165ec70814bc7da0098bdd8604bdf8fd14))
 - **DOCS**: Removed extra header and fixed typos ([#10248](https://github.com/firebase/flutterfire/issues/10248)). ([66a1ab52](https://github.com/firebase/flutterfire/commit/66a1ab529dec2a54715e857008ce49436a766e3c))

## 1.1.7

 - **DOCS**: Fixed typo on phone.md ([#10196](https://github.com/firebase/flutterfire/issues/10196)). ([2fb8af45](https://github.com/firebase/flutterfire/commit/2fb8af45f2f6b1c5311de2a3bcfa032625037944))

## 1.1.6

 - Update a dependency to the latest release.

## 1.1.5

 - Update a dependency to the latest release.

## 1.1.4

 - Update a dependency to the latest release.

## 1.1.3

 - **DOCS**: add docs links to the package README ([#10104](https://github.com/firebase/flutterfire/issues/10104)). ([dd611cd2](https://github.com/firebase/flutterfire/commit/dd611cd25139f78bc947a68366213902a31ae350))

## 1.1.2

 - **FIX**: automatically upgrade anonymous accounts ([#10071](https://github.com/firebase/flutterfire/issues/10071)). ([7b7e82d0](https://github.com/firebase/flutterfire/commit/7b7e82d0ba1c1213813fee5363414af926ce3951))
 - **FIX**: allow to pass actions to the RegisterScreen ([#10025](https://github.com/firebase/flutterfire/issues/10025)). ([3f5ca800](https://github.com/firebase/flutterfire/commit/3f5ca80057d7df15aa16212859733a2eca37007d))
 - **FIX**: `currentUser` is now populated right at the start of the application without needing to wait for `authStateChange` ([#10028](https://github.com/firebase/flutterfire/issues/10028)). ([2bd0dbff](https://github.com/firebase/flutterfire/commit/2bd0dbffb081370da051ec52859b924e1cf06fca))

## 1.1.1

 - **FIX**: fix OAuth provider buttons paddings ([#9991](https://github.com/firebase/flutterfire/issues/9991)). ([cadf2f21](https://github.com/firebase/flutterfire/commit/cadf2f21e9d279d81f6a98624a3a5ff10e654cf2))
 - **FIX**: fix OAuth providers on RegisterScreen ([#10026](https://github.com/firebase/flutterfire/issues/10026)). ([5b11e80f](https://github.com/firebase/flutterfire/commit/5b11e80fbef217d667161c5c31500dd9507ba77b))
 - **FIX**: preserve UI form state when device rotates ([#9993](https://github.com/firebase/flutterfire/issues/9993)). ([55dcd329](https://github.com/firebase/flutterfire/commit/55dcd329489962e2c37bb4140802ffe4b4232c5c))
 - **FIX**: clear the error on ForgotPasswordScreen after submitting a valid email ([#9992](https://github.com/firebase/flutterfire/issues/9992)). ([6c90b6bd](https://github.com/firebase/flutterfire/commit/6c90b6bdd09ef411261aaae5a83328ce0fa3177f))

## 1.1.0

 - **FIX**: allow null countryCode for phone input ([#9937](https://github.com/firebase/flutterfire/issues/9937)). ([e87ec8a9](https://github.com/firebase/flutterfire/commit/e87ec8a9422d3608fcd5357c899f388321bc0a44))
 - **FEAT**: [firebase_ui_auth] [firebase_ui_oauth] Allow for custom labels to be used for custom OAuth providers ([#9858](https://github.com/firebase/flutterfire/issues/9858)). ([fd0b815d](https://github.com/firebase/flutterfire/commit/fd0b815dbf82327caa9867dfe4b72571cc1bfe9a))
 - **DOCS**: improve phone.md  ([#9774](https://github.com/firebase/flutterfire/issues/9774)). ([1f1ffd19](https://github.com/firebase/flutterfire/commit/1f1ffd19ab6383ed1fcac43b2011ee0b0a471c12))

## 1.0.6

 - **FIX**: initialize auth and auth listener in standalone OAuth buttons ([#9926](https://github.com/firebase/flutterfire/issues/9926)). ([24450803](https://github.com/firebase/flutterfire/commit/24450803ba97a8a8a384a0a06d1d724c90d7953c))
 - **FIX**: upgrade dependency to fix platform support for firebase_ui_auth ([#9924](https://github.com/firebase/flutterfire/issues/9924)). ([a972a790](https://github.com/firebase/flutterfire/commit/a972a790cea7eb6755e70478d994048e06122f76))
 - **FIX**: fix docs typo for EmailAuthProvider. ([#9927](https://github.com/firebase/flutterfire/issues/9927)). ([b1b3b437](https://github.com/firebase/flutterfire/commit/b1b3b4376d674ea5ec95405dc0a7fd9d3d6254fd))
 - **FIX**: fix docs typo ([#9925](https://github.com/firebase/flutterfire/issues/9925)). ([beba8598](https://github.com/firebase/flutterfire/commit/beba859896cfc30bac183a61e4a88d5e1c95a30c))

## 1.0.5

 - Update a dependency to the latest release.

## 1.0.4

 - **FIX**: set default scope to 'email' and add a way to provide custom scopes ([#9784](https://github.com/firebase/flutterfire/issues/9784)). ([19a54edc](https://github.com/firebase/flutterfire/commit/19a54edc5921e567cfc22f1f55240c2f0b5fa56c))

## 1.0.3

 - Update a dependency to the latest release.

## 1.0.2

 - **DOCS**: update platform support matrix ([#9764](https://github.com/firebase/flutterfire/issues/9764)). ([dd83af99](https://github.com/firebase/flutterfire/commit/dd83af99d9e2c1ea7caf1fa7b58546c1937bc0d3))

## 1.0.1

 - **FIX**: bump dependencies ([#9756](https://github.com/firebase/flutterfire/issues/9756)). ([595a7daa](https://github.com/firebase/flutterfire/commit/595a7daa3e856cad152463e543d152f71f61cee9))

## 1.0.0

- Graduate package to a stable release.

Check out the [migration guide](https://github.com/firebase/flutterfire/blob/master/packages/firebase_ui_auth/doc/migration.md) to migrate from `flutterfire_ui`.

## 1.0.0-dev.2

 - Update a dependency to the latest release.

## 1.0.0-dev.1

 - **FIX**: fix reauthenticate dialog overflow ([#9734](https://github.com/firebase/flutterfire/issues/9734)). ([defaa207](https://github.com/firebase/flutterfire/commit/defaa20781512166e95cf63c73d4c27f8daa8b72))
 - **FEAT**: add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/flutterfire/issues/9343)). ([db5a5e1c](https://github.com/firebase/flutterfire/commit/db5a5e1c37defa47f18784176d165e3546efa778))

## 1.0.0-dev.0

 - Bump "firebase_ui_auth" to `1.0.0-dev.0`.

## 0.0.1

* TODO: Describe initial release.
