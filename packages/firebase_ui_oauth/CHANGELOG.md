## 0.3.0

> Note: This release has breaking changes.

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10344)). ([c9364bb6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/c9364bb65dd479f00d646a4061673167dd26aa67))
 - **FIX**: bump FF dependencies to latest ([#526](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/526)). ([9f355bfc](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9f355bfcda8319c9ed4786e1e3da91babb4f5229))
 - **FIX**(ui_oauth): use dart.library.js_interop for Wasm-compatible imports ([#675](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/675)). ([84da53c3](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/84da53c391d3f79926ae701c59c67b6037308e0b))
 - **FIX**: compilation errors from invalid/unknown identifiers ([#579](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/579)). ([5d91871c](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/5d91871c15f1ee65509c6badb80be60caf9d6e97))
 - **FIX**(ui_oauth): fix sign in button layout when width is resized ([#548](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/548)). ([77251666](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/77251666e1acef537c2f2f854b634516f2f22b08))
 - **FIX**: bump FlutterFire dependencies & fix CI ([#552](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/552)). ([0e6d85bf](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0e6d85bf4c31b1a3fadff9ebdde3e00704123ad6))
 - **FIX**: analyser issues from later Flutter version ([#551](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/551)). ([62cc4be7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/62cc4be752ac729306243111652b2717e5eeba42))
 - **FIX**(ui_auth): upgrade dependency to fix platform support for firebase_ui_auth ([#9924](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9924)). ([13004220](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/130042208ebe5a285dc87c1a2517c55ae1a53737))
 - **FIX**(ui_oauth): replace desktop_webview_auth with flutter_web_auth_2 ([#693](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/693)). ([eb0a2128](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/eb0a2128fe35823038efe9bf81fedec19b08357a))
 - **FIX**: bump FF dependencies to latest ([#520](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/520)). ([ac4f1fdd](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/ac4f1fddcee04b020a6384ac74f2571bccafe44e))
 - **FIX**: replace deprecated API and bump FlutterFire dependencies ([#453](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/453)). ([530be48a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/530be48a4710387832f98059bd34ce07bba1778c))
 - **FIX**(auth): `desktopSignIn()` method required in web mixin ([#294](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/294)). ([65568934](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/655689344bbf4fc7e8a6911ce67a3ce896079235))
 - **FIX**(firebase_ui_oauth): fix OAuth provider buttons paddings ([#9991](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9991)). ([34aae12a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/34aae12a8107bdc43707ebb28f327533c4c90647))
 - **FIX**(ui_auth): use capitalized cancel label on dialogs ([#134](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/134)). ([78c1ba9b](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/78c1ba9b20a6691e046bdbc76595fd810867cde5))
 - **FIX**(ui_auth): add showPasswordVisibilityToggle to the SignInScreen ([#114](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/114)). ([77ed75d3](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/77ed75d3cc61aa09c0e5d204af09b98b3f6f1421))
 - **FIX**(ui_oauth): initialize auth and auth listener in standalone OAuth buttons ([#9926](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9926)). ([d52d58b8](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d52d58b83355a19daf2f7373cb9bffd6233237bd))
 - **FIX**(firebase_ui_oauth): Fix provider auth listener late init exception ([#107](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/107)). ([0f0fa80e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0f0fa80e8d0535864014472927275cc7dea8cebf))
 - **FIX**(firebase_ui_oauth): Made ThemedOAuthProviderButtonStyle.iconPadding work. ([ddf20a92](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/ddf20a92bec1a0014f0d1f37224cae23d5f884f2))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10901)). ([81a1bf47](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/81a1bf47166765349ed02a87ad2f5f41929c7fcc))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9756)). ([9fde266e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9fde266e8df7dc028b53ce21b71699d758171b71))
 - **FIX**(ui_auth): fix linking OAuthProvider from ProfileScreen ([#11168](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/11168)). ([a8a6f862](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/a8a6f862083b232755a2aa2533a8de7afdebcc4c))
 - **FEAT**: bump FlutterFire dependencies 2024-09-30 ([#407](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/407)). ([d72ce8e3](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d72ce8e3e6d79563c7992d25f36c05b06a742297))
 - **FEAT**(firebase_ui_auth): Use icon from OAuth provider as a fallback in ProfileScreen ([#474](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/474)). ([55f04ebb](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/55f04ebbf29fcc7f8abe11df1b4e7dfaf04028f5))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9343)). ([2d2db74d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/2d2db74d984ecc75b712d4058d2e65058c88c8ad))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10496)). ([9ce686c6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9ce686c68d78e94165bde3a616702ec4c13a0fa5))
 - **FEAT**: update FlutterFire dependencies to the latest ([#580](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/580)). ([acef6d3c](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/acef6d3c4575a44e951247638a2a015285a19ff1))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10620)). ([79f76d3a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/79f76d3a886288738ccfdcbcd2d07e76c6e5a52e))
 - **FEAT**: upgrade all packages min SDK to Dart 3.5 ([#615](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/615)). ([aefa711a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/aefa711ad9c550f4f96cb574cb6a26919593d5eb))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**: upgrade all packages min SDK to Dart 3.5 ([#616](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/616)). ([1535fac4](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/1535fac4e26a5dc91c13601c1327e43994d5403c))
 - **FEAT**: [firebase_ui_auth] [firebase_ui_oauth] Allow for custom labels to be used for custom OAuth providers ([#9858](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9858)). ([6badaf8e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6badaf8edcf931ca6b91dccca369e12c9f88b706))
 - **FEAT**: Require Dart 3.9 ([#618](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/618)). ([80a27122](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/80a27122e1008b76c3cb505f8140195f6dd52648))
 - **FEAT**(ui_auth): use google_sign_in on macOS ([#255](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/255)). ([72571a0d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/72571a0dd20181cabfc1f63d52e903e754399496))
 - **BREAKING** **FEAT**(ui_oauth_twitter): replace twitter_login with signInWithProvider ([#697](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/697)). ([6290de49](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6290de498144efc95d5bd98018a420c20f8777b5))

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

 - **BREAKING** **FEAT**: bump FlutterFire dependencies & remove deprecated API ([#529](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/529)). ([7650921e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/7650921e0c99479d35302e994df7c31f7b624420))

## 0.2.0

> Note: This release has breaking changes.

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10344)). ([c9364bb6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/c9364bb65dd479f00d646a4061673167dd26aa67))
 - **FIX**: bump FF dependencies to latest ([#526](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/526)). ([9f355bfc](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9f355bfcda8319c9ed4786e1e3da91babb4f5229))
 - **FIX**(ui_oauth): use dart.library.js_interop for Wasm-compatible imports ([#675](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/675)). ([84da53c3](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/84da53c391d3f79926ae701c59c67b6037308e0b))
 - **FIX**: compilation errors from invalid/unknown identifiers ([#579](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/579)). ([5d91871c](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/5d91871c15f1ee65509c6badb80be60caf9d6e97))
 - **FIX**(ui_oauth): fix sign in button layout when width is resized ([#548](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/548)). ([77251666](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/77251666e1acef537c2f2f854b634516f2f22b08))
 - **FIX**: bump FlutterFire dependencies & fix CI ([#552](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/552)). ([0e6d85bf](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0e6d85bf4c31b1a3fadff9ebdde3e00704123ad6))
 - **FIX**: analyser issues from later Flutter version ([#551](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/551)). ([62cc4be7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/62cc4be752ac729306243111652b2717e5eeba42))
 - **FIX**(ui_auth): upgrade dependency to fix platform support for firebase_ui_auth ([#9924](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9924)). ([13004220](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/130042208ebe5a285dc87c1a2517c55ae1a53737))
 - **FIX**(ui_oauth): replace desktop_webview_auth with flutter_web_auth_2 ([#693](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/693)). ([eb0a2128](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/eb0a2128fe35823038efe9bf81fedec19b08357a))
 - **FIX**: bump FF dependencies to latest ([#520](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/520)). ([ac4f1fdd](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/ac4f1fddcee04b020a6384ac74f2571bccafe44e))
 - **FIX**: replace deprecated API and bump FlutterFire dependencies ([#453](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/453)). ([530be48a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/530be48a4710387832f98059bd34ce07bba1778c))
 - **FIX**(auth): `desktopSignIn()` method required in web mixin ([#294](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/294)). ([65568934](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/655689344bbf4fc7e8a6911ce67a3ce896079235))
 - **FIX**(firebase_ui_oauth): fix OAuth provider buttons paddings ([#9991](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9991)). ([34aae12a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/34aae12a8107bdc43707ebb28f327533c4c90647))
 - **FIX**(ui_auth): use capitalized cancel label on dialogs ([#134](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/134)). ([78c1ba9b](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/78c1ba9b20a6691e046bdbc76595fd810867cde5))
 - **FIX**(ui_auth): add showPasswordVisibilityToggle to the SignInScreen ([#114](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/114)). ([77ed75d3](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/77ed75d3cc61aa09c0e5d204af09b98b3f6f1421))
 - **FIX**(ui_oauth): initialize auth and auth listener in standalone OAuth buttons ([#9926](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9926)). ([d52d58b8](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d52d58b83355a19daf2f7373cb9bffd6233237bd))
 - **FIX**(firebase_ui_oauth): Fix provider auth listener late init exception ([#107](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/107)). ([0f0fa80e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0f0fa80e8d0535864014472927275cc7dea8cebf))
 - **FIX**(firebase_ui_oauth): Made ThemedOAuthProviderButtonStyle.iconPadding work. ([ddf20a92](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/ddf20a92bec1a0014f0d1f37224cae23d5f884f2))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10901)). ([81a1bf47](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/81a1bf47166765349ed02a87ad2f5f41929c7fcc))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9756)). ([9fde266e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9fde266e8df7dc028b53ce21b71699d758171b71))
 - **FIX**(ui_auth): fix linking OAuthProvider from ProfileScreen ([#11168](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/11168)). ([a8a6f862](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/a8a6f862083b232755a2aa2533a8de7afdebcc4c))
 - **FEAT**: bump FlutterFire dependencies 2024-09-30 ([#407](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/407)). ([d72ce8e3](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d72ce8e3e6d79563c7992d25f36c05b06a742297))
 - **FEAT**(firebase_ui_auth): Use icon from OAuth provider as a fallback in ProfileScreen ([#474](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/474)). ([55f04ebb](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/55f04ebbf29fcc7f8abe11df1b4e7dfaf04028f5))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9343)). ([2d2db74d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/2d2db74d984ecc75b712d4058d2e65058c88c8ad))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10496)). ([9ce686c6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9ce686c68d78e94165bde3a616702ec4c13a0fa5))
 - **FEAT**: update FlutterFire dependencies to the latest ([#580](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/580)). ([acef6d3c](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/acef6d3c4575a44e951247638a2a015285a19ff1))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10620)). ([79f76d3a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/79f76d3a886288738ccfdcbcd2d07e76c6e5a52e))
 - **FEAT**: upgrade all packages min SDK to Dart 3.5 ([#615](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/615)). ([aefa711a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/aefa711ad9c550f4f96cb574cb6a26919593d5eb))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**: upgrade all packages min SDK to Dart 3.5 ([#616](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/616)). ([1535fac4](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/1535fac4e26a5dc91c13601c1327e43994d5403c))
 - **FEAT**: [firebase_ui_auth] [firebase_ui_oauth] Allow for custom labels to be used for custom OAuth providers ([#9858](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9858)). ([6badaf8e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6badaf8edcf931ca6b91dccca369e12c9f88b706))
 - **FEAT**: Require Dart 3.9 ([#618](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/618)). ([80a27122](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/80a27122e1008b76c3cb505f8140195f6dd52648))
 - **FEAT**(ui_auth): use google_sign_in on macOS ([#255](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/255)). ([72571a0d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/72571a0dd20181cabfc1f63d52e903e754399496))
 - **BREAKING** **FEAT**(ui_oauth_twitter): replace twitter_login with signInWithProvider ([#697](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/697)). ([6290de49](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6290de498144efc95d5bd98018a420c20f8777b5))

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

 - **BREAKING** **FEAT**: bump FlutterFire dependencies & remove deprecated API ([#529](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/529)). ([7650921e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/7650921e0c99479d35302e994df7c31f7b624420))

## 0.1.0

 - Initial release of `forui_firebase_ui_oauth`: Forui port of the original Firebase UI OAuth button package (`FButton`-based provider buttons). Apps must wrap UI in an `FTheme` ancestor. Requires Dart `^3.13.0` / Flutter 3.47+.
