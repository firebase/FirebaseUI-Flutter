# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2024-04-24

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.14.0`](#firebase_ui_auth---v1140)
 - [`firebase_ui_localizations` - `v1.11.0`](#firebase_ui_localizations---v1110)
 - [`firebase_ui_oauth` - `v1.5.2`](#firebase_ui_oauth---v152)
 - [`firebase_ui_oauth_apple` - `v1.2.20`](#firebase_ui_oauth_apple---v1220)
 - [`firebase_ui_oauth_twitter` - `v1.2.20`](#firebase_ui_oauth_twitter---v1220)
 - [`firebase_ui_oauth_facebook` - `v1.2.20`](#firebase_ui_oauth_facebook---v1220)
 - [`firebase_ui_oauth_google` - `v1.3.2`](#firebase_ui_oauth_google---v132)
 - [`firebase_ui_database` - `v1.4.3`](#firebase_ui_database---v143)
 - [`firebase_ui_firestore` - `v1.6.3`](#firebase_ui_firestore---v163)
 - [`firebase_ui_storage` - `v2.0.4`](#firebase_ui_storage---v204)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth` - `v1.5.2`
 - `firebase_ui_oauth_apple` - `v1.2.20`
 - `firebase_ui_oauth_twitter` - `v1.2.20`
 - `firebase_ui_oauth_facebook` - `v1.2.20`
 - `firebase_ui_oauth_google` - `v1.3.2`
 - `firebase_ui_database` - `v1.4.3`
 - `firebase_ui_firestore` - `v1.6.3`
 - `firebase_ui_storage` - `v2.0.4`

---

#### `firebase_ui_auth` - `v1.14.0`

 - **FIX**(auth): `ForgotPasswordScreen` display email within input box ([#336](https://github.com/firebase/FirebaseUI-Flutter/issues/336)). ([ad666666](https://github.com/firebase/FirebaseUI-Flutter/commit/ad666666b05c637d5bdf4d041c29a1eeac63d528))
 - **FIX**(firebase_ui_auth): `sendPasswordResetEmail` should not be executed when `isLoading=true` ([#315](https://github.com/firebase/FirebaseUI-Flutter/issues/315)). ([955e5c28](https://github.com/firebase/FirebaseUI-Flutter/commit/955e5c286ea5835defe0bd922428102e98f9e8d7))
 - **FIX**(ui_auth): Fixed a momentary form display after signing in with EmailLinkAuth. ([#318](https://github.com/firebase/FirebaseUI-Flutter/issues/318)). ([3e37d143](https://github.com/firebase/FirebaseUI-Flutter/commit/3e37d1435a4df12c41b9dd857cec67848b2af2c3))
 - **FIX**(firebase_ui_localizations): expose all Firebase UI localizations for overriding ([#309](https://github.com/firebase/FirebaseUI-Flutter/issues/309)). ([e4567478](https://github.com/firebase/FirebaseUI-Flutter/commit/e4567478205f2b88b54aa21af6429fb1c7c81564))
 - **FEAT**(firebase_ui_auth): add `showPasswordVisibilityToggle` to `RegisterScreen` ([#297](https://github.com/firebase/FirebaseUI-Flutter/issues/297)). ([6ec3ec1e](https://github.com/firebase/FirebaseUI-Flutter/commit/6ec3ec1edf584fe9f94142ceb7fbdeac57846678))
 - **FEAT**(firebase_ui_localizations): support for `sendVerificationEmailLabel()` label ([#280](https://github.com/firebase/FirebaseUI-Flutter/issues/280)). ([95be915d](https://github.com/firebase/FirebaseUI-Flutter/commit/95be915d162c6fb5dfdc6a8ad3298c2002d38dbf))
 - **DOCS**: Added superkey to example widget ([#326](https://github.com/firebase/FirebaseUI-Flutter/issues/326)). ([dd5507e1](https://github.com/firebase/FirebaseUI-Flutter/commit/dd5507e1953d9095a60e4cc127d0b8e72790a4ce))

#### `firebase_ui_localizations` - `v1.11.0`

 - **FIX**(ui_localizations): In the Japanese file, change "login" to "sign and improve translations ([#304](https://github.com/firebase/FirebaseUI-Flutter/issues/304)). ([ae01e9f1](https://github.com/firebase/FirebaseUI-Flutter/commit/ae01e9f13dbd4d5b357c1124be39f9cc44ccb9ee))
 - **FIX**(firebase_ui_localizations): expose all Firebase UI localizations for overriding ([#309](https://github.com/firebase/FirebaseUI-Flutter/issues/309)). ([e4567478](https://github.com/firebase/FirebaseUI-Flutter/commit/e4567478205f2b88b54aa21af6429fb1c7c81564))
 - **FEAT**(firebase_ui_localizations): support for `sendVerificationEmailLabel()` label ([#280](https://github.com/firebase/FirebaseUI-Flutter/issues/280)). ([95be915d](https://github.com/firebase/FirebaseUI-Flutter/commit/95be915d162c6fb5dfdc6a8ad3298c2002d38dbf))


## 2024-02-28

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_oauth` - `v1.5.1`](#firebase_ui_oauth---v151)
 - [`firebase_ui_oauth_facebook` - `v1.2.19`](#firebase_ui_oauth_facebook---v1219)
 - [`firebase_ui_oauth_twitter` - `v1.2.19`](#firebase_ui_oauth_twitter---v1219)
 - [`firebase_ui_auth` - `v1.13.1`](#firebase_ui_auth---v1131)
 - [`firebase_ui_oauth_google` - `v1.3.1`](#firebase_ui_oauth_google---v131)
 - [`firebase_ui_oauth_apple` - `v1.2.19`](#firebase_ui_oauth_apple---v1219)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth_facebook` - `v1.2.19`
 - `firebase_ui_oauth_twitter` - `v1.2.19`
 - `firebase_ui_auth` - `v1.13.1`
 - `firebase_ui_oauth_google` - `v1.3.1`
 - `firebase_ui_oauth_apple` - `v1.2.19`

---

#### `firebase_ui_oauth` - `v1.5.1`

 - **FIX**(auth): `desktopSignIn()` method required in web mixin ([#294](https://github.com/firebase/FirebaseUI-Flutter/issues/294)). ([65568934](https://github.com/firebase/FirebaseUI-Flutter/commit/655689344bbf4fc7e8a6911ce67a3ce896079235))


## 2024-02-06

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.13.0`](#firebase_ui_auth---v1130)
 - [`firebase_ui_localizations` - `v1.10.2`](#firebase_ui_localizations---v1102)
 - [`firebase_ui_oauth` - `v1.5.0`](#firebase_ui_oauth---v150)
 - [`firebase_ui_oauth_google` - `v1.3.0`](#firebase_ui_oauth_google---v130)
 - [`firebase_ui_oauth_facebook` - `v1.2.18`](#firebase_ui_oauth_facebook---v1218)
 - [`firebase_ui_oauth_twitter` - `v1.2.18`](#firebase_ui_oauth_twitter---v1218)
 - [`firebase_ui_oauth_apple` - `v1.2.18`](#firebase_ui_oauth_apple---v1218)
 - [`firebase_ui_firestore` - `v1.6.2`](#firebase_ui_firestore---v162)
 - [`firebase_ui_database` - `v1.4.2`](#firebase_ui_database---v142)
 - [`firebase_ui_storage` - `v2.0.3`](#firebase_ui_storage---v203)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth_facebook` - `v1.2.18`
 - `firebase_ui_oauth_twitter` - `v1.2.18`
 - `firebase_ui_oauth_apple` - `v1.2.18`
 - `firebase_ui_firestore` - `v1.6.2`
 - `firebase_ui_storage` - `v2.0.3`

---

#### `firebase_ui_auth` - `v1.13.0`

 - **FEAT**(ui_auth): use google_sign_in on macOS ([#255](https://github.com/firebase/FirebaseUI-Flutter/issues/255)). ([72571a0d](https://github.com/firebase/FirebaseUI-Flutter/commit/72571a0dd20181cabfc1f63d52e903e754399496))

#### `firebase_ui_localizations` - `v1.10.2`

 - **FIX**(ui_localizations): Add missing generated translation file. ([ca15feb6](https://github.com/firebase/FirebaseUI-Flutter/commit/ca15feb69b0d1699fc21f831ddbb1e8f87795e9b))
 - **FIX**: Arabic translation of Sign In With Apple button label. ([085dc6de](https://github.com/firebase/FirebaseUI-Flutter/commit/085dc6de7090d4eb85f8d3953b5e9c037e35541a))

#### `firebase_ui_oauth` - `v1.5.0`

 - **FEAT**(ui_auth): use google_sign_in on macOS ([#255](https://github.com/firebase/FirebaseUI-Flutter/issues/255)). ([72571a0d](https://github.com/firebase/FirebaseUI-Flutter/commit/72571a0dd20181cabfc1f63d52e903e754399496))

#### `firebase_ui_oauth_google` - `v1.3.0`

 - **FEAT**(ui_auth): use google_sign_in on macOS ([#255](https://github.com/firebase/FirebaseUI-Flutter/issues/255)). ([72571a0d](https://github.com/firebase/FirebaseUI-Flutter/commit/72571a0dd20181cabfc1f63d52e903e754399496))

#### `firebase_ui_database` - `v1.4.2`

 - **FIX**:(firebase_ui_database): Perform list operations in correct order ([213](https://github.com/firebase/FirebaseUI-Flutter/pull/213))

## 2024-01-09

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_firestore` - `v1.6.1`](#firebase_ui_firestore---v161)
 - [`firebase_ui_localizations` - `v1.10.1`](#firebase_ui_localizations---v1101)
 - [`firebase_ui_auth` - `v1.12.1`](#firebase_ui_auth---v1121)
 - [`firebase_ui_storage` - `v2.0.2`](#firebase_ui_storage---v202)
 - [`firebase_ui_database` - `v1.4.1`](#firebase_ui_database---v141)
 - [`firebase_ui_oauth` - `v1.4.17`](#firebase_ui_oauth---v1417)
 - [`firebase_ui_oauth_facebook` - `v1.2.17`](#firebase_ui_oauth_facebook---v1217)
 - [`firebase_ui_oauth_twitter` - `v1.2.17`](#firebase_ui_oauth_twitter---v1217)
 - [`firebase_ui_oauth_apple` - `v1.2.17`](#firebase_ui_oauth_apple---v1217)
 - [`firebase_ui_oauth_google` - `v1.2.17`](#firebase_ui_oauth_google---v1217)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_auth` - `v1.12.1`
 - `firebase_ui_storage` - `v2.0.2`
 - `firebase_ui_database` - `v1.4.1`
 - `firebase_ui_oauth` - `v1.4.17`
 - `firebase_ui_oauth_facebook` - `v1.2.17`
 - `firebase_ui_oauth_twitter` - `v1.2.17`
 - `firebase_ui_oauth_apple` - `v1.2.17`
 - `firebase_ui_oauth_google` - `v1.2.17`

---

#### `firebase_ui_firestore` - `v1.6.1`

 - **FIX**(ui_firestore): null-assert count for aggregate query ([#246](https://github.com/firebase/FirebaseUI-Flutter/issues/246)). ([8afbe368](https://github.com/firebase/FirebaseUI-Flutter/commit/8afbe36824ec481055dcbf0558e0611bab712553))

#### `firebase_ui_localizations` - `v1.10.1`

 - **FIX**: Update translation strings in RO for confirm account deletion ([#219](https://github.com/firebase/FirebaseUI-Flutter/issues/219)). ([704b34ea](https://github.com/firebase/FirebaseUI-Flutter/commit/704b34ea174ecf3a78357de0236156f4d17a6ba5))


## 2024-01-04

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.12.0`](#firebase_ui_auth---v1120)
 - [`firebase_ui_database` - `v1.4.0`](#firebase_ui_database---v140)
 - [`firebase_ui_firestore` - `v1.6.0`](#firebase_ui_firestore---v160)
 - [`firebase_ui_localizations` - `v1.10.0`](#firebase_ui_localizations---v1100)
 - [`firebase_ui_oauth` - `v1.4.16`](#firebase_ui_oauth---v1416)
 - [`firebase_ui_oauth_twitter` - `v1.2.16`](#firebase_ui_oauth_twitter---v1216)
 - [`firebase_ui_oauth_facebook` - `v1.2.16`](#firebase_ui_oauth_facebook---v1216)
 - [`firebase_ui_oauth_apple` - `v1.2.16`](#firebase_ui_oauth_apple---v1216)
 - [`firebase_ui_oauth_google` - `v1.2.16`](#firebase_ui_oauth_google---v1216)
 - [`firebase_ui_storage` - `v2.0.1`](#firebase_ui_storage---v201)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth` - `v1.4.16`
 - `firebase_ui_oauth_twitter` - `v1.2.16`
 - `firebase_ui_oauth_facebook` - `v1.2.16`
 - `firebase_ui_oauth_apple` - `v1.2.16`
 - `firebase_ui_oauth_google` - `v1.2.16`
 - `firebase_ui_storage` - `v2.0.1`

---

#### `firebase_ui_auth` - `v1.12.0`

 - **FIX**(ui_auth): correctly handle phone auth in showReauthenticateDialog ([#209](https://github.com/firebase/FirebaseUI-Flutter/issues/209)). ([c0612cfd](https://github.com/firebase/FirebaseUI-Flutter/commit/c0612cfd71dc5ea2448ba73882b39a9766b97a98))
 - **FIX**(ui_auth): deprecate email enumeration protection affected APIs ([#210](https://github.com/firebase/FirebaseUI-Flutter/issues/210)). ([eed65674](https://github.com/firebase/FirebaseUI-Flutter/commit/eed656748caa12eb31d7a9677a16bf6b1d129b77))
 - **FEAT**(ui_auth): add a way to get an AuthController for AuthState ([#207](https://github.com/firebase/FirebaseUI-Flutter/issues/207)). ([0816bfd4](https://github.com/firebase/FirebaseUI-Flutter/commit/0816bfd4a1acfbe390d9725d48892b0831e99679))

#### `firebase_ui_database` - `v1.4.0`

 - **FEAT**(firebase_ui_database): Allow reversing the database query ([#193](https://github.com/firebase/FirebaseUI-Flutter/issues/193)). ([0588812b](https://github.com/firebase/FirebaseUI-Flutter/commit/0588812beac550afcf8dba2cabde28f258a90ed1))

#### `firebase_ui_firestore` - `v1.6.0`

 - **FEAT**(ui_firestore): implemented separators and fetching indicator ([#99](https://github.com/firebase/FirebaseUI-Flutter/issues/99)). ([d8d8bf59](https://github.com/firebase/FirebaseUI-Flutter/commit/d8d8bf594273618e866545172e57c10409f3a78f))

#### `firebase_ui_localizations` - `v1.10.0`

 - **FEAT**(ui_localizations): Add Norwegian (NB) localization ([#191](https://github.com/firebase/FirebaseUI-Flutter/issues/191)). ([715ab1b8](https://github.com/firebase/FirebaseUI-Flutter/commit/715ab1b8ab7df536da50177e75d6d0632ecdf83c))


## 2023-11-30

### Changes

---

Packages with breaking changes:

 - [`firebase_ui_storage` - `v2.0.0`](#firebase_ui_storage---v200)

Packages with other changes:

 - [`firebase_ui_auth` - `v1.11.0`](#firebase_ui_auth---v1110)
 - [`firebase_ui_localizations` - `v1.9.0`](#firebase_ui_localizations---v190)
 - [`firebase_ui_oauth` - `v1.4.15`](#firebase_ui_oauth---v1415)
 - [`firebase_ui_oauth_twitter` - `v1.2.15`](#firebase_ui_oauth_twitter---v1215)
 - [`firebase_ui_oauth_facebook` - `v1.2.15`](#firebase_ui_oauth_facebook---v1215)
 - [`firebase_ui_oauth_apple` - `v1.2.15`](#firebase_ui_oauth_apple---v1215)
 - [`firebase_ui_oauth_google` - `v1.2.15`](#firebase_ui_oauth_google---v1215)
 - [`firebase_ui_firestore` - `v1.5.15`](#firebase_ui_firestore---v1515)
 - [`firebase_ui_database` - `v1.3.13`](#firebase_ui_database---v1313)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth` - `v1.4.15`
 - `firebase_ui_oauth_twitter` - `v1.2.15`
 - `firebase_ui_oauth_facebook` - `v1.2.15`
 - `firebase_ui_oauth_apple` - `v1.2.15`
 - `firebase_ui_oauth_google` - `v1.2.15`
 - `firebase_ui_firestore` - `v1.5.15`
 - `firebase_ui_database` - `v1.3.13`

---

#### `firebase_ui_storage` - `v2.0.0`

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


#### `firebase_ui_auth` - `v1.11.0`

 - **FIX**(ui_auth): correctly position phone input screen footer ([#183](https://github.com/firebase/FirebaseUI-Flutter/issues/183)). ([d5e2338d](https://github.com/firebase/FirebaseUI-Flutter/commit/d5e2338df4fbbed69c7526ecc1d4559730c43d03))
 - **FIX**(ui_auth): make maxWidth configurable on all screens ([#178](https://github.com/firebase/FirebaseUI-Flutter/issues/178)). ([c5e77c27](https://github.com/firebase/FirebaseUI-Flutter/commit/c5e77c2705a4237fec489bcdd6b94c85a91e481c))
 - **FEAT**(ui_auth): export `localizedErrorText` ([#189](https://github.com/firebase/FirebaseUI-Flutter/issues/189)). ([ab89f5cf](https://github.com/firebase/FirebaseUI-Flutter/commit/ab89f5cfa215be771e06abc9a94a65f821e2ce8d))
 - **FEAT**(ui_auth): confirm account deletion ([#187](https://github.com/firebase/FirebaseUI-Flutter/issues/187)). ([053a96ee](https://github.com/firebase/FirebaseUI-Flutter/commit/053a96eeedfc74c20ab3e73605dae42676b85a96))

#### `firebase_ui_localizations` - `v1.9.0`

 - **FEAT**(ui_auth): confirm account deletion ([#187](https://github.com/firebase/FirebaseUI-Flutter/issues/187)). ([053a96ee](https://github.com/firebase/FirebaseUI-Flutter/commit/053a96eeedfc74c20ab3e73605dae42676b85a96))


## 2023-11-09

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.10.0`](#firebase_ui_auth---v1100)
 - [`firebase_ui_localizations` - `v1.8.0`](#firebase_ui_localizations---v180)
 - [`firebase_ui_oauth_apple` - `v1.2.14`](#firebase_ui_oauth_apple---v1214)
 - [`firebase_ui_oauth` - `v1.4.14`](#firebase_ui_oauth---v1414)
 - [`firebase_ui_oauth_twitter` - `v1.2.14`](#firebase_ui_oauth_twitter---v1214)
 - [`firebase_ui_oauth_facebook` - `v1.2.14`](#firebase_ui_oauth_facebook---v1214)
 - [`firebase_ui_oauth_google` - `v1.2.14`](#firebase_ui_oauth_google---v1214)
 - [`firebase_ui_database` - `v1.3.12`](#firebase_ui_database---v1312)
 - [`firebase_ui_firestore` - `v1.5.14`](#firebase_ui_firestore---v1514)
 - [`firebase_ui_storage` - `v1.0.4`](#firebase_ui_storage---v104)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth` - `v1.4.14`
 - `firebase_ui_oauth_twitter` - `v1.2.14`
 - `firebase_ui_oauth_facebook` - `v1.2.14`
 - `firebase_ui_oauth_google` - `v1.2.14`
 - `firebase_ui_database` - `v1.3.12`
 - `firebase_ui_firestore` - `v1.5.14`
 - `firebase_ui_storage` - `v1.0.4`

---

#### `firebase_ui_auth` - `v1.10.0`

 - **FEAT**(ui_auth): add more account actions ([#172](https://github.com/firebase/FirebaseUI-Flutter/issues/172)). ([518a6c7b](https://github.com/firebase/FirebaseUI-Flutter/commit/518a6c7b24835134d7943b3fc91a68f125e5a0fb))
 - **FEAT**(ui_auth): add a way to customize PlatformException text ([#171](https://github.com/firebase/FirebaseUI-Flutter/issues/171)). ([cbe75ca4](https://github.com/firebase/FirebaseUI-Flutter/commit/cbe75ca436bd4aeeb9c9f2e1b9fc067b2e1de279))

#### `firebase_ui_localizations` - `v1.8.0`

 - **FEAT**(ui_localizations): Add romanian localization ([#174](https://github.com/firebase/FirebaseUI-Flutter/issues/174)). ([dc9c9cb2](https://github.com/firebase/FirebaseUI-Flutter/commit/dc9c9cb2698e3ab1d1774143b05d48eccde73dfb))

#### `firebase_ui_oauth_apple` - `v1.2.14`

 - **FIX**(ui_oauth_apple): fix AuthAction.link for Apple Sign In ([#170](https://github.com/firebase/FirebaseUI-Flutter/issues/170)). ([b69c8edd](https://github.com/firebase/FirebaseUI-Flutter/commit/b69c8eddc0fdf9336a420639200e51f24aab5775))


## 2023-10-19

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.9.1`](#firebase_ui_auth---v191)
 - [`firebase_ui_localizations` - `v1.7.1`](#firebase_ui_localizations---v171)
 - [`firebase_ui_oauth` - `v1.4.13`](#firebase_ui_oauth---v1413)
 - [`firebase_ui_oauth_apple` - `v1.2.13`](#firebase_ui_oauth_apple---v1213)
 - [`firebase_ui_shared` - `v1.4.1`](#firebase_ui_shared---v141)
 - [`firebase_ui_oauth_twitter` - `v1.2.13`](#firebase_ui_oauth_twitter---v1213)
 - [`firebase_ui_oauth_facebook` - `v1.2.13`](#firebase_ui_oauth_facebook---v1213)
 - [`firebase_ui_oauth_google` - `v1.2.13`](#firebase_ui_oauth_google---v1213)
 - [`firebase_ui_firestore` - `v1.5.13`](#firebase_ui_firestore---v1513)
 - [`firebase_ui_database` - `v1.3.11`](#firebase_ui_database---v1311)
 - [`firebase_ui_storage` - `v1.0.3`](#firebase_ui_storage---v103)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth_twitter` - `v1.2.13`
 - `firebase_ui_oauth_facebook` - `v1.2.13`
 - `firebase_ui_oauth_google` - `v1.2.13`
 - `firebase_ui_firestore` - `v1.5.13`
 - `firebase_ui_database` - `v1.3.11`
 - `firebase_ui_storage` - `v1.0.3`

---

#### `firebase_ui_auth` - `v1.9.1`

 - **FIX**(ui_auth): deprecate screens and widgets that use fetchSignInMethodsForEmail ([#153](https://github.com/firebase/FirebaseUI-Flutter/issues/153)). ([84ce5fb7](https://github.com/firebase/FirebaseUI-Flutter/commit/84ce5fb7a4c2237932568c3cb85953b112ed04a8))
 - **FIX**(ui_auth): use capitalized cancel label on dialogs ([#134](https://github.com/firebase/FirebaseUI-Flutter/issues/134)). ([78c1ba9b](https://github.com/firebase/FirebaseUI-Flutter/commit/78c1ba9b20a6691e046bdbc76595fd810867cde5))
 - **FIX**(ui_localizations): localize weak password error ([#138](https://github.com/firebase/FirebaseUI-Flutter/issues/138)). ([bcfa2be6](https://github.com/firebase/FirebaseUI-Flutter/commit/bcfa2be660454078abc0a542abe3359f23453ca4))

#### `firebase_ui_localizations` - `v1.7.1`

 - **FIX**(ui_localizations): localize weak password error ([#138](https://github.com/firebase/FirebaseUI-Flutter/issues/138)). ([bcfa2be6](https://github.com/firebase/FirebaseUI-Flutter/commit/bcfa2be660454078abc0a542abe3359f23453ca4))
 - **FIX**(ui_localizations): fix loading Traditional Chinese ([#128](https://github.com/firebase/FirebaseUI-Flutter/issues/128)). ([5e09eab1](https://github.com/firebase/FirebaseUI-Flutter/commit/5e09eab180099f34523b373068d9702ce033ab05))

#### `firebase_ui_oauth` - `v1.4.13`

 - **FIX**(ui_auth): use capitalized cancel label on dialogs ([#134](https://github.com/firebase/FirebaseUI-Flutter/issues/134)). ([78c1ba9b](https://github.com/firebase/FirebaseUI-Flutter/commit/78c1ba9b20a6691e046bdbc76595fd810867cde5))

#### `firebase_ui_oauth_apple` - `v1.2.13`

 - **DOCS**(ui_oauth_apple): add platform support note ([#139](https://github.com/firebase/FirebaseUI-Flutter/issues/139)). ([88b85b83](https://github.com/firebase/FirebaseUI-Flutter/commit/88b85b835ee52355983d95e13bbc68392de44090))

#### `firebase_ui_shared` - `v1.4.1`

 - **FIX**(ui_auth): adaptive AlertDialog for Flutter <3.13 ([#152](https://github.com/firebase/FirebaseUI-Flutter/issues/152)). ([0e93d610](https://github.com/firebase/FirebaseUI-Flutter/commit/0e93d6101be1ebaa4b2ee491362fa7a83c71cb58))


## 2023-10-09

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.9.0`](#firebase_ui_auth---v190)
 - [`firebase_ui_localizations` - `v1.7.0`](#firebase_ui_localizations---v170)
 - [`firebase_ui_oauth` - `v1.4.12`](#firebase_ui_oauth---v1412)
 - [`firebase_ui_shared` - `v1.4.0`](#firebase_ui_shared---v140)
 - [`firebase_ui_oauth_twitter` - `v1.2.12`](#firebase_ui_oauth_twitter---v1212)
 - [`firebase_ui_oauth_facebook` - `v1.2.12`](#firebase_ui_oauth_facebook---v1212)
 - [`firebase_ui_oauth_apple` - `v1.2.12`](#firebase_ui_oauth_apple---v1212)
 - [`firebase_ui_oauth_google` - `v1.2.12`](#firebase_ui_oauth_google---v1212)
 - [`firebase_ui_firestore` - `v1.5.12`](#firebase_ui_firestore---v1512)
 - [`firebase_ui_database` - `v1.3.10`](#firebase_ui_database---v1310)
 - [`firebase_ui_storage` - `v1.0.2`](#firebase_ui_storage---v102)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth_twitter` - `v1.2.12`
 - `firebase_ui_oauth_facebook` - `v1.2.12`
 - `firebase_ui_oauth_apple` - `v1.2.12`
 - `firebase_ui_oauth_google` - `v1.2.12`
 - `firebase_ui_firestore` - `v1.5.12`
 - `firebase_ui_database` - `v1.3.10`
 - `firebase_ui_storage` - `v1.0.2`

---

#### `firebase_ui_auth` - `v1.9.0`

 - **FIX**(ui_auth): add showPasswordVisibilityToggle to the SignInScreen ([#114](https://github.com/firebase/FirebaseUI-Flutter/issues/114)). ([77ed75d3](https://github.com/firebase/FirebaseUI-Flutter/commit/77ed75d3cc61aa09c0e5d204af09b98b3f6f1421))
 - **FEAT**(ui_auth): add a way to customize ErrorText message ([#119](https://github.com/firebase/FirebaseUI-Flutter/issues/119)). ([a36884d7](https://github.com/firebase/FirebaseUI-Flutter/commit/a36884d73228a33a4c4b061e095f4939bf671d8e))
 - **FEAT**(ui_auth): show confirmation dialog when trying to unlink a provider ([#116](https://github.com/firebase/FirebaseUI-Flutter/issues/116)). ([8757037b](https://github.com/firebase/FirebaseUI-Flutter/commit/8757037baa3d88ff25b5dc20aab0dc6ba445827b))

#### `firebase_ui_localizations` - `v1.7.0`

 - **FIX**(ui_localizations): update italian translations ([#109](https://github.com/firebase/FirebaseUI-Flutter/issues/109)). ([d1c69dcc](https://github.com/firebase/FirebaseUI-Flutter/commit/d1c69dccab50d0a2ed2c44f50a12bf6fdae7f990))
 - **FIX**(ui_auth): add showPasswordVisibilityToggle to the SignInScreen ([#114](https://github.com/firebase/FirebaseUI-Flutter/issues/114)). ([77ed75d3](https://github.com/firebase/FirebaseUI-Flutter/commit/77ed75d3cc61aa09c0e5d204af09b98b3f6f1421))
 - **FEAT**(ui_auth): show confirmation dialog when trying to unlink a provider ([#116](https://github.com/firebase/FirebaseUI-Flutter/issues/116)). ([8757037b](https://github.com/firebase/FirebaseUI-Flutter/commit/8757037baa3d88ff25b5dc20aab0dc6ba445827b))

#### `firebase_ui_oauth` - `v1.4.12`

 - **FIX**(ui_auth): add showPasswordVisibilityToggle to the SignInScreen ([#114](https://github.com/firebase/FirebaseUI-Flutter/issues/114)). ([77ed75d3](https://github.com/firebase/FirebaseUI-Flutter/commit/77ed75d3cc61aa09c0e5d204af09b98b3f6f1421))
 - **FIX**(firebase_ui_oauth): Fix provider auth listener late init exception ([#107](https://github.com/firebase/FirebaseUI-Flutter/issues/107)). ([0f0fa80e](https://github.com/firebase/FirebaseUI-Flutter/commit/0f0fa80e8d0535864014472927275cc7dea8cebf))

#### `firebase_ui_shared` - `v1.4.0`

 - **FEAT**(ui_auth): show confirmation dialog when trying to unlink a provider ([#116](https://github.com/firebase/FirebaseUI-Flutter/issues/116)). ([8757037b](https://github.com/firebase/FirebaseUI-Flutter/commit/8757037baa3d88ff25b5dc20aab0dc6ba445827b))


## 2023-09-07

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.8.0`](#firebase_ui_auth---v180)
 - [`firebase_ui_localizations` - `v1.6.1`](#firebase_ui_localizations---v161)
 - [`firebase_ui_oauth` - `v1.4.11`](#firebase_ui_oauth---v1411)
 - [`firebase_ui_oauth_facebook` - `v1.2.11`](#firebase_ui_oauth_facebook---v1211)
 - [`firebase_ui_oauth_twitter` - `v1.2.11`](#firebase_ui_oauth_twitter---v1211)
 - [`firebase_ui_oauth_apple` - `v1.2.11`](#firebase_ui_oauth_apple---v1211)
 - [`firebase_ui_oauth_google` - `v1.2.11`](#firebase_ui_oauth_google---v1211)
 - [`firebase_ui_firestore` - `v1.5.11`](#firebase_ui_firestore---v1511)
 - [`firebase_ui_database` - `v1.3.9`](#firebase_ui_database---v139)
 - [`firebase_ui_storage` - `v1.0.1`](#firebase_ui_storage---v101)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth` - `v1.4.11`
 - `firebase_ui_oauth_facebook` - `v1.2.11`
 - `firebase_ui_oauth_twitter` - `v1.2.11`
 - `firebase_ui_oauth_apple` - `v1.2.11`
 - `firebase_ui_oauth_google` - `v1.2.11`
 - `firebase_ui_firestore` - `v1.5.11`
 - `firebase_ui_database` - `v1.3.9`
 - `firebase_ui_storage` - `v1.0.1`

---

#### `firebase_ui_auth` - `v1.8.0`

 - **FIX**(ui_auth,ui_localizations): add invalid verification SMS code error label ([#102](https://github.com/firebase/FirebaseUI-Flutter/issues/102)). ([8adc39b9](https://github.com/firebase/FirebaseUI-Flutter/commit/8adc39b94abcf55a4fc0c07850e7e9ec25380d0d))
 - **FIX**(ui_auth): allow to pass EmailFormStyle via property ([#98](https://github.com/firebase/FirebaseUI-Flutter/issues/98)). ([88c31a33](https://github.com/firebase/FirebaseUI-Flutter/commit/88c31a332dc490d5500e81d491ba929b0fe4c5f0))
 - **FEAT**(ui_auth): allow to toggle password visibility ([#104](https://github.com/firebase/FirebaseUI-Flutter/issues/104)). ([6e3735d9](https://github.com/firebase/FirebaseUI-Flutter/commit/6e3735d9fda3f2415a781ff591a5842864dc2fcf))

#### `firebase_ui_localizations` - `v1.6.1`

 - **FIX**(ui_auth,ui_localizations): add invalid verification SMS code error label ([#102](https://github.com/firebase/FirebaseUI-Flutter/issues/102)). ([8adc39b9](https://github.com/firebase/FirebaseUI-Flutter/commit/8adc39b94abcf55a4fc0c07850e7e9ec25380d0d))


## 2023-09-01

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_storage` - `v1.0.0`](#firebase_ui_storage---v100)
 - [`firebase_ui_auth` - `v1.7.0`](#firebase_ui_auth---v170)
 - [`firebase_ui_localizations` - `v1.6.0`](#firebase_ui_localizations---v160)
 - [`firebase_ui_oauth` - `v1.4.10`](#firebase_ui_oauth---v1410)
 - [`firebase_ui_oauth_twitter` - `v1.2.10`](#firebase_ui_oauth_twitter---v1210)
 - [`firebase_ui_oauth_facebook` - `v1.2.10`](#firebase_ui_oauth_facebook---v1210)
 - [`firebase_ui_oauth_apple` - `v1.2.10`](#firebase_ui_oauth_apple---v1210)
 - [`firebase_ui_oauth_google` - `v1.2.10`](#firebase_ui_oauth_google---v1210)
 - [`firebase_ui_firestore` - `v1.5.10`](#firebase_ui_firestore---v1510)
 - [`firebase_ui_database` - `v1.3.8`](#firebase_ui_database---v138)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth` - `v1.4.10`
 - `firebase_ui_oauth_twitter` - `v1.2.10`
 - `firebase_ui_oauth_facebook` - `v1.2.10`
 - `firebase_ui_oauth_apple` - `v1.2.10`
 - `firebase_ui_oauth_google` - `v1.2.10`
 - `firebase_ui_firestore` - `v1.5.10`
 - `firebase_ui_database` - `v1.3.8`

---

#### `firebase_ui_storage` - `v1.0.0`

 - Firebase UI Storage graduated to stable release

 - **FEAT**(ui_storage,ui_localizations): add UploadButton label ([#86](https://github.com/firebase/FirebaseUI-Flutter/issues/86)). ([e13a6b1e](https://github.com/firebase/FirebaseUI-Flutter/commit/e13a6b1ec00c576f95c4f0782e26e00340a8187d))
 - **DOCS**(ui_storage): add Firebase UI Storage docs ([#92](https://github.com/firebase/FirebaseUI-Flutter/issues/92)). ([4c4e3539](https://github.com/firebase/FirebaseUI-Flutter/commit/4c4e3539c64c7cc7728c6eea8ab91df5a47d5703))

#### `firebase_ui_auth` - `v1.7.0`

 - **FIX**(ui_localizations,ui_auth): add missing labels ([#87](https://github.com/firebase/FirebaseUI-Flutter/issues/87)). ([be2b0c33](https://github.com/firebase/FirebaseUI-Flutter/commit/be2b0c33f9537f307c2cae97e5f483f695b3ea05))
 - **FIX**(ui_auth): Pass correct AuthAction to the footerBuilder ([#70](https://github.com/firebase/FirebaseUI-Flutter/issues/70)). ([1e091cc5](https://github.com/firebase/FirebaseUI-Flutter/commit/1e091cc583f5c976634583315a9d8a1968927498))
 - **FEAT**(ui_auth): Add "Go Back" button to EmailLinkSignInView ([#63](https://github.com/firebase/FirebaseUI-Flutter/issues/63)). ([326fd27d](https://github.com/firebase/FirebaseUI-Flutter/commit/326fd27d362de0f342062ac68f85ab8ceea005aa))

#### `firebase_ui_localizations` - `v1.6.0`

 - **FIX**(ui_localizations,ui_auth): add missing labels ([#87](https://github.com/firebase/FirebaseUI-Flutter/issues/87)). ([be2b0c33](https://github.com/firebase/FirebaseUI-Flutter/commit/be2b0c33f9537f307c2cae97e5f483f695b3ea05))
 - **FEAT**(ui_storage,ui_localizations): add UploadButton label ([#86](https://github.com/firebase/FirebaseUI-Flutter/issues/86)). ([e13a6b1e](https://github.com/firebase/FirebaseUI-Flutter/commit/e13a6b1ec00c576f95c4f0782e26e00340a8187d))


## 2023-08-24

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_localizations` - `v1.5.3`](#firebase_ui_localizations---v153)
 - [`firebase_ui_oauth_apple` - `v1.2.9`](#firebase_ui_oauth_apple---v129)
 - [`firebase_ui_auth` - `v1.6.5`](#firebase_ui_auth---v165)
 - [`firebase_ui_database` - `v1.3.7`](#firebase_ui_database---v137)
 - [`firebase_ui_firestore` - `v1.5.9`](#firebase_ui_firestore---v159)
 - [`firebase_ui_oauth` - `v1.4.9`](#firebase_ui_oauth---v149)
 - [`firebase_ui_oauth_facebook` - `v1.2.9`](#firebase_ui_oauth_facebook---v129)
 - [`firebase_ui_oauth_twitter` - `v1.2.9`](#firebase_ui_oauth_twitter---v129)
 - [`firebase_ui_oauth_google` - `v1.2.9`](#firebase_ui_oauth_google---v129)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_auth` - `v1.6.5`
 - `firebase_ui_database` - `v1.3.7`
 - `firebase_ui_firestore` - `v1.5.9`
 - `firebase_ui_oauth` - `v1.4.9`
 - `firebase_ui_oauth_facebook` - `v1.2.9`
 - `firebase_ui_oauth_twitter` - `v1.2.9`
 - `firebase_ui_oauth_google` - `v1.2.9`

---

#### `firebase_ui_localizations` - `v1.5.3`

 - **FIX**: update ru translations to remove English duplicates ([#65](https://github.com/firebase/FirebaseUI-Flutter/issues/65)). ([9d813bee](https://github.com/firebase/FirebaseUI-Flutter/commit/9d813beed875654ea9eeab7ea9687508486624fe))

#### `firebase_ui_oauth_apple` - `v1.2.9`

 - **FIX**(firebase_ui_oauth_apple): Enables Android as a supported platform for AppleProvider. ([48a1134b](https://github.com/firebase/FirebaseUI-Flutter/commit/48a1134b92a30684464c33adaa6e0f7beab7694e))


## 2023-08-17

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_shared` - `v1.3.1`](#firebase_ui_shared---v131)
 - [`firebase_ui_storage` - `v0.1.0-dev.10`](#firebase_ui_storage---v010-dev10)
 - [`firebase_ui_auth` - `v1.6.5`](#firebase_ui_auth---v165)
 - [`firebase_ui_oauth` - `v1.4.9`](#firebase_ui_oauth---v149)
 - [`firebase_ui_oauth_twitter` - `v1.2.9`](#firebase_ui_oauth_twitter---v129)
 - [`firebase_ui_oauth_facebook` - `v1.2.9`](#firebase_ui_oauth_facebook---v129)
 - [`firebase_ui_oauth_google` - `v1.2.9`](#firebase_ui_oauth_google---v129)
 - [`firebase_ui_oauth_apple` - `v1.2.9`](#firebase_ui_oauth_apple---v129)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_storage` - `v0.1.0-dev.10`
 - `firebase_ui_auth` - `v1.6.5`
 - `firebase_ui_oauth` - `v1.4.9`
 - `firebase_ui_oauth_twitter` - `v1.2.9`
 - `firebase_ui_oauth_facebook` - `v1.2.9`
 - `firebase_ui_oauth_google` - `v1.2.9`
 - `firebase_ui_oauth_apple` - `v1.2.9`

---

#### `firebase_ui_shared` - `v1.3.1`

 - Migrate to a [new repo](https://github.com/firebase/FirebaseUI-Flutter)

#### `firebase_ui_localizations` - `v1.5.2`

 - Migrate to a [new repo](https://github.com/firebase/FirebaseUI-Flutter)

#### `firebase_ui_firestore` - `v1.5.8`

 - Migrate to a [new repo](https://github.com/firebase/FirebaseUI-Flutter)

#### `firebase_ui_database` - `v1.3.6`

 - Migrate to a [new repo](https://github.com/firebase/FirebaseUI-Flutter)

#### `firebase_ui_auth` - `v1.6.4`

 - Migrate to a [new repo](https://github.com/firebase/FirebaseUI-Flutter)


## 2023-07-26

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_firestore` - `v1.5.6`](#firebase_ui_firestore---v156)
 - [`firebase_ui_oauth_google` - `v1.2.7`](#firebase_ui_oauth_google---v127)
 - [`firebase_ui_oauth_twitter` - `v1.2.7`](#firebase_ui_oauth_twitter---v127)
 - [`firebase_ui_auth` - `v1.6.2`](#firebase_ui_auth---v162)
 - [`firebase_ui_oauth_facebook` - `v1.2.7`](#firebase_ui_oauth_facebook---v127)
 - [`firebase_ui_oauth_apple` - `v1.2.7`](#firebase_ui_oauth_apple---v127)
 - [`firebase_ui_oauth` - `v1.4.7`](#firebase_ui_oauth---v147)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.5.6`
 - `firebase_ui_oauth_google` - `v1.2.7`
 - `firebase_ui_oauth_twitter` - `v1.2.7`
 - `firebase_ui_auth` - `v1.6.2`
 - `firebase_ui_oauth_facebook` - `v1.2.7`
 - `firebase_ui_oauth_apple` - `v1.2.7`
 - `firebase_ui_oauth` - `v1.4.7`

---


## 2023-07-18

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_oauth_facebook` - `v1.2.6`](#firebase_ui_oauth_facebook---v126)
 - [`firebase_ui_oauth_twitter` - `v1.2.6`](#firebase_ui_oauth_twitter---v126)
 - [`firebase_ui_auth` - `v1.6.1`](#firebase_ui_auth---v161)
 - [`firebase_ui_oauth_apple` - `v1.2.6`](#firebase_ui_oauth_apple---v126)
 - [`firebase_ui_oauth` - `v1.4.6`](#firebase_ui_oauth---v146)
 - [`firebase_ui_oauth_google` - `v1.2.6`](#firebase_ui_oauth_google---v126)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth_facebook` - `v1.2.6`
 - `firebase_ui_oauth_twitter` - `v1.2.6`
 - `firebase_ui_auth` - `v1.6.1`
 - `firebase_ui_oauth_apple` - `v1.2.6`
 - `firebase_ui_oauth` - `v1.4.6`
 - `firebase_ui_oauth_google` - `v1.2.6`

---


## 2023-07-14

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.6.0`](#firebase_ui_auth---v160)
 - [`firebase_ui_oauth` - `v1.4.5`](#firebase_ui_oauth---v145)
 - [`firebase_ui_storage` - `v0.1.0-dev.8`](#firebase_ui_storage---v010-dev8)
 - [`firebase_ui_firestore` - `v1.5.5`](#firebase_ui_firestore---v155)
 - [`firebase_ui_oauth_facebook` - `v1.2.5`](#firebase_ui_oauth_facebook---v125)
 - [`firebase_ui_oauth_twitter` - `v1.2.5`](#firebase_ui_oauth_twitter---v125)
 - [`firebase_ui_oauth_apple` - `v1.2.5`](#firebase_ui_oauth_apple---v125)
 - [`firebase_ui_oauth_google` - `v1.2.5`](#firebase_ui_oauth_google---v125)
 - [`firebase_ui_database` - `v1.3.4`](#firebase_ui_database---v134)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.5.5`
 - `firebase_ui_oauth_facebook` - `v1.2.5`
 - `firebase_ui_oauth_twitter` - `v1.2.5`
 - `firebase_ui_oauth_apple` - `v1.2.5`
 - `firebase_ui_oauth_google` - `v1.2.5`
 - `firebase_ui_database` - `v1.3.4`

---

#### `firebase_ui_auth` - `v1.6.0`

 - **FIX**(ui_auth): fix LoadingIndicator layout on EmailVerificationScreen ([#11169](https://github.com/firebase/flutterfire/issues/11169)). ([fd832fb8](https://github.com/firebase/flutterfire/commit/fd832fb8ef8cf6288ec5d722dcade8eb7c133a9b))
 - **FEAT**(auth): move to Pigeon for Platform channels ([#10802](https://github.com/firebase/flutterfire/issues/10802)). ([43e5b20b](https://github.com/firebase/flutterfire/commit/43e5b20b14799102a6544a4763476eaba44b9cfb))

#### `firebase_ui_oauth` - `v1.4.5`

 - **FIX**(ui_auth): fix linking OAuthProvider from ProfileScreen ([#11168](https://github.com/firebase/flutterfire/issues/11168)). ([5063af5b](https://github.com/firebase/flutterfire/commit/5063af5b668cc0c15574f9ea3d08a4af2b163377))

#### `firebase_ui_storage` - `v0.1.0-dev.8`

 - **FEAT**(ui_storage): add StorageGridView widget ([#11206](https://github.com/firebase/flutterfire/issues/11206)). ([48a3a396](https://github.com/firebase/flutterfire/commit/48a3a3960aa10e2d0850c9e6e2256a54c9f0cc4f))
 - **FEAT**(ui_storage): add shimmer for loading images ([#11237](https://github.com/firebase/flutterfire/issues/11237)). ([e2ad9004](https://github.com/firebase/flutterfire/commit/e2ad9004e2f1a31242df6ff12cf6dd46cfc63ff5))
 - **FEAT**(ui_storage): add StorageListView and PaginatedLoadingController ([#11170](https://github.com/firebase/flutterfire/issues/11170)). ([dcf1b22a](https://github.com/firebase/flutterfire/commit/dcf1b22aefa6b3846cff9604ab15fae36d847cd1))


## 2023-06-26

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.5.0`](#firebase_ui_auth---v150)
 - [`firebase_ui_storage` - `v0.1.0-dev.7`](#firebase_ui_storage---v010-dev7)
 - [`firebase_ui_firestore` - `v1.5.4`](#firebase_ui_firestore---v154)
 - [`firebase_ui_oauth` - `v1.4.4`](#firebase_ui_oauth---v144)
 - [`firebase_ui_oauth_google` - `v1.2.4`](#firebase_ui_oauth_google---v124)
 - [`firebase_ui_oauth_twitter` - `v1.2.4`](#firebase_ui_oauth_twitter---v124)
 - [`firebase_ui_oauth_facebook` - `v1.2.4`](#firebase_ui_oauth_facebook---v124)
 - [`firebase_ui_oauth_apple` - `v1.2.4`](#firebase_ui_oauth_apple---v124)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.5.4`
 - `firebase_ui_oauth` - `v1.4.4`
 - `firebase_ui_oauth_google` - `v1.2.4`
 - `firebase_ui_oauth_twitter` - `v1.2.4`
 - `firebase_ui_oauth_facebook` - `v1.2.4`
 - `firebase_ui_oauth_apple` - `v1.2.4`

---

#### `firebase_ui_auth` - `v1.5.0`

 - **FIX**(ui_auth): documentation - fix material misspelling in universal_text_form_field.dart ([#11151](https://github.com/firebase/flutterfire/issues/11151)). ([31358154](https://github.com/firebase/flutterfire/commit/313581548422bc68bd47f3d890a9f4de8da7e2ad))
 - **FIX**(ui_auth): fix ProfileScreen ignoring parent rebuilds ([#11160](https://github.com/firebase/flutterfire/issues/11160)). ([89df2b58](https://github.com/firebase/flutterfire/commit/89df2b58d25d0980430acfee7b9f70765fe33bce))
 - **FEAT**(ui_auth): allow passing custom user avatar widget ([#11161](https://github.com/firebase/flutterfire/issues/11161)). ([cfcaa2f0](https://github.com/firebase/flutterfire/commit/cfcaa2f0dd0e3b2d980b675a5567245842a8a6c3))

#### `firebase_ui_storage` - `v0.1.0-dev.7`

 - **FEAT**(ui_storage): add StorageImage widget ([#11080](https://github.com/firebase/flutterfire/issues/11080)). ([b592fb23](https://github.com/firebase/flutterfire/commit/b592fb23596b97e1b5c692c5c0b6fadaf852be28))


## 2023-06-13

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_firestore` - `v1.5.3`](#firebase_ui_firestore---v153)
 - [`firebase_ui_oauth_twitter` - `v1.2.3`](#firebase_ui_oauth_twitter---v123)
 - [`firebase_ui_oauth_google` - `v1.2.3`](#firebase_ui_oauth_google---v123)
 - [`firebase_ui_auth` - `v1.4.3`](#firebase_ui_auth---v143)
 - [`firebase_ui_oauth_facebook` - `v1.2.3`](#firebase_ui_oauth_facebook---v123)
 - [`firebase_ui_oauth` - `v1.4.3`](#firebase_ui_oauth---v143)
 - [`firebase_ui_oauth_apple` - `v1.2.3`](#firebase_ui_oauth_apple---v123)
 - [`firebase_ui_database` - `v1.3.3`](#firebase_ui_database---v133)
 - [`firebase_ui_storage` - `v0.1.0-dev.6`](#firebase_ui_storage---v010-dev6)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.5.3`
 - `firebase_ui_oauth_twitter` - `v1.2.3`
 - `firebase_ui_oauth_google` - `v1.2.3`
 - `firebase_ui_auth` - `v1.4.3`
 - `firebase_ui_oauth_facebook` - `v1.2.3`
 - `firebase_ui_oauth` - `v1.4.3`
 - `firebase_ui_oauth_apple` - `v1.2.3`
 - `firebase_ui_database` - `v1.3.3`
 - `firebase_ui_storage` - `v0.1.0-dev.6`

---


## 2023-05-30

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.4.2`](#firebase_ui_auth---v142)
 - [`firebase_ui_firestore` - `v1.5.2`](#firebase_ui_firestore---v152)
 - [`firebase_ui_oauth` - `v1.4.2`](#firebase_ui_oauth---v142)
 - [`firebase_ui_oauth_google` - `v1.2.2`](#firebase_ui_oauth_google---v122)
 - [`firebase_ui_oauth_twitter` - `v1.2.2`](#firebase_ui_oauth_twitter---v122)
 - [`firebase_ui_oauth_apple` - `v1.2.2`](#firebase_ui_oauth_apple---v122)
 - [`firebase_ui_oauth_facebook` - `v1.2.2`](#firebase_ui_oauth_facebook---v122)
 - [`firebase_ui_database` - `v1.3.2`](#firebase_ui_database---v132)
 - [`firebase_ui_storage` - `v0.1.0-dev.5`](#firebase_ui_storage---v010-dev5)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.5.2`
 - `firebase_ui_oauth` - `v1.4.2`
 - `firebase_ui_oauth_google` - `v1.2.2`
 - `firebase_ui_oauth_twitter` - `v1.2.2`
 - `firebase_ui_oauth_apple` - `v1.2.2`
 - `firebase_ui_oauth_facebook` - `v1.2.2`
 - `firebase_ui_database` - `v1.3.2`
 - `firebase_ui_storage` - `v0.1.0-dev.5`

---

#### `firebase_ui_auth` - `v1.4.2`

 - **FIX**(firebase_ui_auth): Error added in ProfileScreen in firebase_ui_auth 1.4.0 ([#10957](https://github.com/firebase/flutterfire/issues/10957)). ([12284b3b](https://github.com/firebase/flutterfire/commit/12284b3b0b9813c4ec8fe8678f48d6b38d642989))


## 2023-05-16

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_firestore` - `v1.5.1`](#firebase_ui_firestore---v151)
 - [`firebase_ui_auth` - `v1.4.1`](#firebase_ui_auth---v141)
 - [`firebase_ui_database` - `v1.3.1`](#firebase_ui_database---v131)
 - [`firebase_ui_storage` - `v0.1.0-dev.4`](#firebase_ui_storage---v010-dev4)
 - [`firebase_ui_oauth` - `v1.4.1`](#firebase_ui_oauth---v141)
 - [`firebase_ui_oauth_facebook` - `v1.2.1`](#firebase_ui_oauth_facebook---v121)
 - [`firebase_ui_oauth_apple` - `v1.2.1`](#firebase_ui_oauth_apple---v121)
 - [`firebase_ui_oauth_google` - `v1.2.1`](#firebase_ui_oauth_google---v121)
 - [`firebase_ui_oauth_twitter` - `v1.2.1`](#firebase_ui_oauth_twitter---v121)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.5.1`
 - `firebase_ui_auth` - `v1.4.1`
 - `firebase_ui_database` - `v1.3.1`
 - `firebase_ui_storage` - `v0.1.0-dev.4`
 - `firebase_ui_oauth` - `v1.4.1`
 - `firebase_ui_oauth_facebook` - `v1.2.1`
 - `firebase_ui_oauth_apple` - `v1.2.1`
 - `firebase_ui_oauth_google` - `v1.2.1`
 - `firebase_ui_oauth_twitter` - `v1.2.1`

---


## 2023-05-11

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.4.0`](#firebase_ui_auth---v140)
 - [`firebase_ui_database` - `v1.3.0`](#firebase_ui_database---v130)
 - [`firebase_ui_firestore` - `v1.5.0`](#firebase_ui_firestore---v150)
 - [`firebase_ui_localizations` - `v1.5.0`](#firebase_ui_localizations---v150)
 - [`firebase_ui_oauth` - `v1.4.0`](#firebase_ui_oauth---v140)
 - [`firebase_ui_oauth_apple` - `v1.2.0`](#firebase_ui_oauth_apple---v120)
 - [`firebase_ui_oauth_facebook` - `v1.2.0`](#firebase_ui_oauth_facebook---v120)
 - [`firebase_ui_oauth_google` - `v1.2.0`](#firebase_ui_oauth_google---v120)
 - [`firebase_ui_oauth_twitter` - `v1.2.0`](#firebase_ui_oauth_twitter---v120)
 - [`firebase_ui_shared` - `v1.3.0`](#firebase_ui_shared---v130)
 - [`firebase_ui_storage` - `v0.1.0-dev.3`](#firebase_ui_storage---v010-dev3)

---

#### `firebase_ui_auth` - `v1.4.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/flutterfire/issues/10944)). ([e1f5a5ea](https://github.com/firebase/flutterfire/commit/e1f5a5ea798c54f19d1d2f7b8f2250f8819f44b7))
 - **DOCS**(firebase_ui_auth): fix phone provider's widget example ([#10917](https://github.com/firebase/flutterfire/issues/10917)). ([c56234ff](https://github.com/firebase/flutterfire/commit/c56234ffd06c29edac6243bf0509b1925390395a))

#### `firebase_ui_database` - `v1.3.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/flutterfire/issues/10944)). ([e1f5a5ea](https://github.com/firebase/flutterfire/commit/e1f5a5ea798c54f19d1d2f7b8f2250f8819f44b7))

#### `firebase_ui_firestore` - `v1.5.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/flutterfire/issues/10944)). ([e1f5a5ea](https://github.com/firebase/flutterfire/commit/e1f5a5ea798c54f19d1d2f7b8f2250f8819f44b7))

#### `firebase_ui_localizations` - `v1.5.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/flutterfire/issues/10944)). ([e1f5a5ea](https://github.com/firebase/flutterfire/commit/e1f5a5ea798c54f19d1d2f7b8f2250f8819f44b7))

#### `firebase_ui_oauth` - `v1.4.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/flutterfire/issues/10944)). ([e1f5a5ea](https://github.com/firebase/flutterfire/commit/e1f5a5ea798c54f19d1d2f7b8f2250f8819f44b7))

#### `firebase_ui_oauth_apple` - `v1.2.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/flutterfire/issues/10944)). ([e1f5a5ea](https://github.com/firebase/flutterfire/commit/e1f5a5ea798c54f19d1d2f7b8f2250f8819f44b7))

#### `firebase_ui_oauth_facebook` - `v1.2.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/flutterfire/issues/10944)). ([e1f5a5ea](https://github.com/firebase/flutterfire/commit/e1f5a5ea798c54f19d1d2f7b8f2250f8819f44b7))

#### `firebase_ui_oauth_google` - `v1.2.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/flutterfire/issues/10944)). ([e1f5a5ea](https://github.com/firebase/flutterfire/commit/e1f5a5ea798c54f19d1d2f7b8f2250f8819f44b7))

#### `firebase_ui_oauth_twitter` - `v1.2.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/flutterfire/issues/10944)). ([e1f5a5ea](https://github.com/firebase/flutterfire/commit/e1f5a5ea798c54f19d1d2f7b8f2250f8819f44b7))

#### `firebase_ui_shared` - `v1.3.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))

#### `firebase_ui_storage` - `v0.1.0-dev.3`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/flutterfire/issues/10946)). ([2772d10f](https://github.com/firebase/flutterfire/commit/2772d10fe510dcc28ec2d37a26b266c935699fa6))
 - **FEAT**(ui_storage): add TaskProgressIndicator ([#10859](https://github.com/firebase/flutterfire/issues/10859)). ([6ae57735](https://github.com/firebase/flutterfire/commit/6ae57735289cfa82322ee2259816a49cd605b784))


## 2023-05-04

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.3.0`](#firebase_ui_auth---v130)
 - [`firebase_ui_database` - `v1.2.0`](#firebase_ui_database---v120)
 - [`firebase_ui_firestore` - `v1.4.0`](#firebase_ui_firestore---v140)
 - [`firebase_ui_localizations` - `v1.4.0`](#firebase_ui_localizations---v140)
 - [`firebase_ui_oauth` - `v1.3.0`](#firebase_ui_oauth---v130)
 - [`firebase_ui_storage` - `v0.1.0-dev.2`](#firebase_ui_storage---v010-dev2)
 - [`firebase_ui_oauth_facebook` - `v1.1.5`](#firebase_ui_oauth_facebook---v115)
 - [`firebase_ui_oauth_twitter` - `v1.1.5`](#firebase_ui_oauth_twitter---v115)
 - [`firebase_ui_oauth_apple` - `v1.1.5`](#firebase_ui_oauth_apple---v115)
 - [`firebase_ui_oauth_google` - `v1.1.5`](#firebase_ui_oauth_google---v115)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth_facebook` - `v1.1.5`
 - `firebase_ui_oauth_twitter` - `v1.1.5`
 - `firebase_ui_oauth_apple` - `v1.1.5`
 - `firebase_ui_oauth_google` - `v1.1.5`

---

#### `firebase_ui_auth` - `v1.3.0`

 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/flutterfire/issues/10901)). ([a3b96735](https://github.com/firebase/flutterfire/commit/a3b967354294c295a9be8d699a6adb7f4b1dba7f))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/flutterfire/issues/10496)). ([c0b8ad56](https://github.com/firebase/flutterfire/commit/c0b8ad5605d1fda6d897ea625224b5e61c5826ad))
 - **FEAT**: upgrade to dart 3 compatible dependencies ([#10890](https://github.com/firebase/flutterfire/issues/10890)). ([4bd7e59b](https://github.com/firebase/flutterfire/commit/4bd7e59b1f2b09a2230c49830159342dd4592041))

#### `firebase_ui_database` - `v1.2.0`

 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/flutterfire/issues/10901)). ([a3b96735](https://github.com/firebase/flutterfire/commit/a3b967354294c295a9be8d699a6adb7f4b1dba7f))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/flutterfire/issues/10496)). ([c0b8ad56](https://github.com/firebase/flutterfire/commit/c0b8ad5605d1fda6d897ea625224b5e61c5826ad))

#### `firebase_ui_firestore` - `v1.4.0`

 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/flutterfire/issues/10901)). ([a3b96735](https://github.com/firebase/flutterfire/commit/a3b967354294c295a9be8d699a6adb7f4b1dba7f))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/flutterfire/issues/10496)). ([c0b8ad56](https://github.com/firebase/flutterfire/commit/c0b8ad5605d1fda6d897ea625224b5e61c5826ad))
 - **FEAT**: upgrade to dart 3 compatible dependencies ([#10890](https://github.com/firebase/flutterfire/issues/10890)). ([4bd7e59b](https://github.com/firebase/flutterfire/commit/4bd7e59b1f2b09a2230c49830159342dd4592041))

#### `firebase_ui_localizations` - `v1.4.0`

 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/flutterfire/issues/10901)). ([a3b96735](https://github.com/firebase/flutterfire/commit/a3b967354294c295a9be8d699a6adb7f4b1dba7f))
 - **FIX**(ui_localizations): drop intl dependency as it is not used ([#10856](https://github.com/firebase/flutterfire/issues/10856)). ([f208ae9b](https://github.com/firebase/flutterfire/commit/f208ae9b0b2f784710bb6c7e894e3aeb5513d30d))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/flutterfire/issues/10496)). ([c0b8ad56](https://github.com/firebase/flutterfire/commit/c0b8ad5605d1fda6d897ea625224b5e61c5826ad))

#### `firebase_ui_oauth` - `v1.3.0`

 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/flutterfire/issues/10901)). ([a3b96735](https://github.com/firebase/flutterfire/commit/a3b967354294c295a9be8d699a6adb7f4b1dba7f))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/flutterfire/issues/10496)). ([c0b8ad56](https://github.com/firebase/flutterfire/commit/c0b8ad5605d1fda6d897ea625224b5e61c5826ad))

#### `firebase_ui_storage` - `v0.1.0-dev.2`

 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/flutterfire/issues/10901)). ([a3b96735](https://github.com/firebase/flutterfire/commit/a3b967354294c295a9be8d699a6adb7f4b1dba7f))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/flutterfire/issues/10496)). ([c0b8ad56](https://github.com/firebase/flutterfire/commit/c0b8ad5605d1fda6d897ea625224b5e61c5826ad))


## 2023-04-28

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_localizations` - `v1.3.1`](#firebase_ui_localizations---v131)
 - [`firebase_ui_firestore` - `v1.3.4`](#firebase_ui_firestore---v134)
 - [`firebase_ui_auth` - `v1.2.4`](#firebase_ui_auth---v124)
 - [`firebase_ui_database` - `v1.1.3`](#firebase_ui_database---v113)
 - [`firebase_ui_oauth` - `v1.2.4`](#firebase_ui_oauth---v124)
 - [`firebase_ui_oauth_facebook` - `v1.1.4`](#firebase_ui_oauth_facebook---v114)
 - [`firebase_ui_oauth_twitter` - `v1.1.4`](#firebase_ui_oauth_twitter---v114)
 - [`firebase_ui_oauth_apple` - `v1.1.4`](#firebase_ui_oauth_apple---v114)
 - [`firebase_ui_oauth_google` - `v1.1.4`](#firebase_ui_oauth_google---v114)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.3.4`
 - `firebase_ui_auth` - `v1.2.4`
 - `firebase_ui_database` - `v1.1.3`
 - `firebase_ui_oauth` - `v1.2.4`
 - `firebase_ui_oauth_facebook` - `v1.1.4`
 - `firebase_ui_oauth_twitter` - `v1.1.4`
 - `firebase_ui_oauth_apple` - `v1.1.4`
 - `firebase_ui_oauth_google` - `v1.1.4`

---

#### `firebase_ui_localizations` - `v1.3.1`

 - **FIX**(ui_localizations): drop intl dependency as it is not used ([#10856](https://github.com/firebase/flutterfire/issues/10856)). ([f208ae9b](https://github.com/firebase/flutterfire/commit/f208ae9b0b2f784710bb6c7e894e3aeb5513d30d))


## 2023-04-27

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.2.3`](#firebase_ui_auth---v123)
 - [`firebase_ui_firestore` - `v1.3.3`](#firebase_ui_firestore---v133)
 - [`firebase_ui_oauth` - `v1.2.3`](#firebase_ui_oauth---v123)
 - [`firebase_ui_oauth_twitter` - `v1.1.3`](#firebase_ui_oauth_twitter---v113)
 - [`firebase_ui_oauth_facebook` - `v1.1.3`](#firebase_ui_oauth_facebook---v113)
 - [`firebase_ui_oauth_apple` - `v1.1.3`](#firebase_ui_oauth_apple---v113)
 - [`firebase_ui_oauth_google` - `v1.1.3`](#firebase_ui_oauth_google---v113)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.3.3`
 - `firebase_ui_oauth` - `v1.2.3`
 - `firebase_ui_oauth_twitter` - `v1.1.3`
 - `firebase_ui_oauth_facebook` - `v1.1.3`
 - `firebase_ui_oauth_apple` - `v1.1.3`
 - `firebase_ui_oauth_google` - `v1.1.3`

---

#### `firebase_ui_auth` - `v1.2.3`

 - **DOCS**(firebase_ui_auth): fix an error in the documentation ([#10797](https://github.com/firebase/flutterfire/issues/10797)). ([b71e0dde](https://github.com/firebase/flutterfire/commit/b71e0dde5ad0c2c04876afde5da8c8b1b8cb321d))


## 2023-04-18

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_shared` - `v1.2.0`](#firebase_ui_shared---v120)
 - [`firebase_ui_storage` - `v0.1.0-dev.1`](#firebase_ui_storage---v010-dev1)
 - [`firebase_ui_auth` - `v1.2.2`](#firebase_ui_auth---v122)
 - [`firebase_ui_oauth` - `v1.2.2`](#firebase_ui_oauth---v122)
 - [`firebase_ui_oauth_twitter` - `v1.1.2`](#firebase_ui_oauth_twitter---v112)
 - [`firebase_ui_oauth_facebook` - `v1.1.2`](#firebase_ui_oauth_facebook---v112)
 - [`firebase_ui_oauth_apple` - `v1.1.2`](#firebase_ui_oauth_apple---v112)
 - [`firebase_ui_oauth_google` - `v1.1.2`](#firebase_ui_oauth_google---v112)
 - [`firebase_ui_database` - `v1.1.2`](#firebase_ui_database---v112)
 - [`firebase_ui_firestore` - `v1.3.2`](#firebase_ui_firestore---v132)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_auth` - `v1.2.2`
 - `firebase_ui_oauth` - `v1.2.2`
 - `firebase_ui_oauth_twitter` - `v1.1.2`
 - `firebase_ui_oauth_facebook` - `v1.1.2`
 - `firebase_ui_oauth_apple` - `v1.1.2`
 - `firebase_ui_oauth_google` - `v1.1.2`
 - `firebase_ui_database` - `v1.1.2`
 - `firebase_ui_firestore` - `v1.3.2`

---

#### `firebase_ui_shared` - `v1.2.0`

 - **FEAT**(ui_storage): configuration API and UploadButton widget ([#10699](https://github.com/firebase/flutterfire/issues/10699)). ([e802b3dd](https://github.com/firebase/flutterfire/commit/e802b3dd4454fe797abe18bb584b4287b5be74da))

#### `firebase_ui_storage` - `v0.1.0-dev.1`

 - **FEAT**(ui_storage): configuration API and UploadButton widget ([#10699](https://github.com/firebase/flutterfire/issues/10699)). ([e802b3dd](https://github.com/firebase/flutterfire/commit/e802b3dd4454fe797abe18bb584b4287b5be74da))


## 2023-04-13

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.2.1`](#firebase_ui_auth---v121)
 - [`firebase_ui_database` - `v1.1.1`](#firebase_ui_database---v111)
 - [`firebase_ui_firestore` - `v1.3.1`](#firebase_ui_firestore---v131)
 - [`firebase_ui_oauth_facebook` - `v1.1.1`](#firebase_ui_oauth_facebook---v111)
 - [`firebase_ui_oauth_twitter` - `v1.1.1`](#firebase_ui_oauth_twitter---v111)
 - [`firebase_ui_oauth` - `v1.2.1`](#firebase_ui_oauth---v121)
 - [`firebase_ui_oauth_google` - `v1.1.1`](#firebase_ui_oauth_google---v111)
 - [`firebase_ui_oauth_apple` - `v1.1.1`](#firebase_ui_oauth_apple---v111)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth_facebook` - `v1.1.1`
 - `firebase_ui_oauth_twitter` - `v1.1.1`
 - `firebase_ui_oauth` - `v1.2.1`
 - `firebase_ui_oauth_google` - `v1.1.1`
 - `firebase_ui_oauth_apple` - `v1.1.1`

---

#### `firebase_ui_auth` - `v1.2.1`

 - **FIX**: allow to unlink providers only in edit mode ([#10649](https://github.com/firebase/flutterfire/issues/10649)). ([c2da6c7e](https://github.com/firebase/flutterfire/commit/c2da6c7e80bbf817ddbaf6475b7b5ea53c4ac666))
 - **DOCS**(ui_auth): fix typo RegisterScren -> RegisterScreen ([#10488](https://github.com/firebase/flutterfire/issues/10488)). ([47c132c8](https://github.com/firebase/flutterfire/commit/47c132c85e83415fc4335ad7be5ef63958c0c3b0))

#### `firebase_ui_database` - `v1.1.1`

 - **FIX**: allow to unlink providers only in edit mode ([#10649](https://github.com/firebase/flutterfire/issues/10649)). ([c2da6c7e](https://github.com/firebase/flutterfire/commit/c2da6c7e80bbf817ddbaf6475b7b5ea53c4ac666))

#### `firebase_ui_firestore` - `v1.3.1`

 - **FIX**: allow to unlink providers only in edit mode ([#10649](https://github.com/firebase/flutterfire/issues/10649)). ([c2da6c7e](https://github.com/firebase/flutterfire/commit/c2da6c7e80bbf817ddbaf6475b7b5ea53c4ac666))


## 2023-03-30

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.2.0`](#firebase_ui_auth---v120)
 - [`firebase_ui_database` - `v1.1.0`](#firebase_ui_database---v110)
 - [`firebase_ui_firestore` - `v1.3.0`](#firebase_ui_firestore---v130)
 - [`firebase_ui_localizations` - `v1.3.0`](#firebase_ui_localizations---v130)
 - [`firebase_ui_oauth` - `v1.2.0`](#firebase_ui_oauth---v120)
 - [`firebase_ui_oauth_apple` - `v1.1.0`](#firebase_ui_oauth_apple---v110)
 - [`firebase_ui_oauth_facebook` - `v1.1.0`](#firebase_ui_oauth_facebook---v110)
 - [`firebase_ui_oauth_google` - `v1.1.0`](#firebase_ui_oauth_google---v110)
 - [`firebase_ui_oauth_twitter` - `v1.1.0`](#firebase_ui_oauth_twitter---v110)
 - [`firebase_ui_shared` - `v1.1.0`](#firebase_ui_shared---v110)

---

#### `firebase_ui_auth` - `v1.2.0`

 - **FIX**(ui_auth): pass breakpoint to LoginScreen ([#10607](https://github.com/firebase/flutterfire/issues/10607)). ([39d77c4d](https://github.com/firebase/flutterfire/commit/39d77c4dcc9e77b9f78db918dc444c0e09fd3228))
 - **FEAT**(ui_shared): pass platform-specific icons and colors explicitly ([#10655](https://github.com/firebase/flutterfire/issues/10655)). ([60ff1dfe](https://github.com/firebase/flutterfire/commit/60ff1dfe32abe6780fc5aafad63606b00af3f3e2))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/flutterfire/issues/10618)). ([f80948a2](https://github.com/firebase/flutterfire/commit/f80948a28b62eead358bdb900d5a0dfb97cebb33))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/flutterfire/issues/10620)). ([15c1e85c](https://github.com/firebase/flutterfire/commit/15c1e85c5dae8e9884d321fde4a1217bc21cd6c8))
 - **DOCS**(ui_auth): Fixed typo 'EmaiAuthProvider' to 'EmailAuthProvider' ([#10654](https://github.com/firebase/flutterfire/issues/10654)). ([59932020](https://github.com/firebase/flutterfire/commit/599320203ff7c8ea07d9a697c52c995a306f00ea))

#### `firebase_ui_database` - `v1.1.0`

 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/flutterfire/issues/10618)). ([f80948a2](https://github.com/firebase/flutterfire/commit/f80948a28b62eead358bdb900d5a0dfb97cebb33))

#### `firebase_ui_firestore` - `v1.3.0`

 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/flutterfire/issues/10618)). ([f80948a2](https://github.com/firebase/flutterfire/commit/f80948a28b62eead358bdb900d5a0dfb97cebb33))

#### `firebase_ui_localizations` - `v1.3.0`

 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/flutterfire/issues/10618)). ([f80948a2](https://github.com/firebase/flutterfire/commit/f80948a28b62eead358bdb900d5a0dfb97cebb33))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/flutterfire/issues/10620)). ([15c1e85c](https://github.com/firebase/flutterfire/commit/15c1e85c5dae8e9884d321fde4a1217bc21cd6c8))

#### `firebase_ui_oauth` - `v1.2.0`

 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/flutterfire/issues/10618)). ([f80948a2](https://github.com/firebase/flutterfire/commit/f80948a28b62eead358bdb900d5a0dfb97cebb33))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/flutterfire/issues/10620)). ([15c1e85c](https://github.com/firebase/flutterfire/commit/15c1e85c5dae8e9884d321fde4a1217bc21cd6c8))

#### `firebase_ui_oauth_apple` - `v1.1.0`

 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/flutterfire/issues/10618)). ([f80948a2](https://github.com/firebase/flutterfire/commit/f80948a28b62eead358bdb900d5a0dfb97cebb33))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/flutterfire/issues/10620)). ([15c1e85c](https://github.com/firebase/flutterfire/commit/15c1e85c5dae8e9884d321fde4a1217bc21cd6c8))

#### `firebase_ui_oauth_facebook` - `v1.1.0`

 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/flutterfire/issues/10618)). ([f80948a2](https://github.com/firebase/flutterfire/commit/f80948a28b62eead358bdb900d5a0dfb97cebb33))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/flutterfire/issues/10620)). ([15c1e85c](https://github.com/firebase/flutterfire/commit/15c1e85c5dae8e9884d321fde4a1217bc21cd6c8))

#### `firebase_ui_oauth_google` - `v1.1.0`

 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/flutterfire/issues/10618)). ([f80948a2](https://github.com/firebase/flutterfire/commit/f80948a28b62eead358bdb900d5a0dfb97cebb33))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/flutterfire/issues/10620)). ([15c1e85c](https://github.com/firebase/flutterfire/commit/15c1e85c5dae8e9884d321fde4a1217bc21cd6c8))

#### `firebase_ui_oauth_twitter` - `v1.1.0`

 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/flutterfire/issues/10618)). ([f80948a2](https://github.com/firebase/flutterfire/commit/f80948a28b62eead358bdb900d5a0dfb97cebb33))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/flutterfire/issues/10620)). ([15c1e85c](https://github.com/firebase/flutterfire/commit/15c1e85c5dae8e9884d321fde4a1217bc21cd6c8))

#### `firebase_ui_shared` - `v1.1.0`

 - **FEAT**(ui_shared): pass platform-specific icons and colors explicitly ([#10655](https://github.com/firebase/flutterfire/issues/10655)). ([60ff1dfe](https://github.com/firebase/flutterfire/commit/60ff1dfe32abe6780fc5aafad63606b00af3f3e2))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/flutterfire/issues/10620)). ([15c1e85c](https://github.com/firebase/flutterfire/commit/15c1e85c5dae8e9884d321fde4a1217bc21cd6c8))


## 2023-03-16

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_oauth_facebook` - `v1.0.24`](#firebase_ui_oauth_facebook---v1024)
 - [`firebase_ui_oauth_twitter` - `v1.0.24`](#firebase_ui_oauth_twitter---v1024)
 - [`firebase_ui_auth` - `v1.1.17`](#firebase_ui_auth---v1117)
 - [`firebase_ui_oauth` - `v1.1.17`](#firebase_ui_oauth---v1117)
 - [`firebase_ui_oauth_google` - `v1.0.24`](#firebase_ui_oauth_google---v1024)
 - [`firebase_ui_oauth_apple` - `v1.0.24`](#firebase_ui_oauth_apple---v1024)
 - [`firebase_ui_database` - `v1.0.18`](#firebase_ui_database---v1018)
 - [`firebase_ui_firestore` - `v1.2.10`](#firebase_ui_firestore---v1210)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth_facebook` - `v1.0.24`
 - `firebase_ui_oauth_twitter` - `v1.0.24`
 - `firebase_ui_auth` - `v1.1.17`
 - `firebase_ui_oauth` - `v1.1.17`
 - `firebase_ui_oauth_google` - `v1.0.24`
 - `firebase_ui_oauth_apple` - `v1.0.24`
 - `firebase_ui_database` - `v1.0.18`
 - `firebase_ui_firestore` - `v1.2.10`

---


## 2023-03-07

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_oauth_twitter` - `v1.0.23`](#firebase_ui_oauth_twitter---v1023)
 - [`firebase_ui_oauth_facebook` - `v1.0.23`](#firebase_ui_oauth_facebook---v1023)
 - [`firebase_ui_auth` - `v1.1.16`](#firebase_ui_auth---v1116)
 - [`firebase_ui_oauth_apple` - `v1.0.23`](#firebase_ui_oauth_apple---v1023)
 - [`firebase_ui_oauth_google` - `v1.0.23`](#firebase_ui_oauth_google---v1023)
 - [`firebase_ui_oauth` - `v1.1.16`](#firebase_ui_oauth---v1116)
 - [`firebase_ui_database` - `v1.0.17`](#firebase_ui_database---v1017)
 - [`firebase_ui_firestore` - `v1.2.9`](#firebase_ui_firestore---v129)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth_twitter` - `v1.0.23`
 - `firebase_ui_oauth_facebook` - `v1.0.23`
 - `firebase_ui_auth` - `v1.1.16`
 - `firebase_ui_oauth_apple` - `v1.0.23`
 - `firebase_ui_oauth_google` - `v1.0.23`
 - `firebase_ui_oauth` - `v1.1.16`
 - `firebase_ui_database` - `v1.0.17`
 - `firebase_ui_firestore` - `v1.2.9`

---


## 2023-03-02

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.1.15`](#firebase_ui_auth---v1115)
 - [`firebase_ui_oauth_google` - `v1.0.22`](#firebase_ui_oauth_google---v1022)
 - [`firebase_ui_oauth` - `v1.1.15`](#firebase_ui_oauth---v1115)
 - [`firebase_ui_oauth_facebook` - `v1.0.22`](#firebase_ui_oauth_facebook---v1022)
 - [`firebase_ui_oauth_apple` - `v1.0.22`](#firebase_ui_oauth_apple---v1022)
 - [`firebase_ui_oauth_twitter` - `v1.0.22`](#firebase_ui_oauth_twitter---v1022)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth` - `v1.1.15`
 - `firebase_ui_oauth_facebook` - `v1.0.22`
 - `firebase_ui_oauth_apple` - `v1.0.22`
 - `firebase_ui_oauth_twitter` - `v1.0.22`

---

#### `firebase_ui_auth` - `v1.1.15`

 - **FIX**(ui_auth): fix ResponsivePage layout causing unexpected overflows ([#10533](https://github.com/firebase/flutterfire/issues/10533)). ([80c3c5ef](https://github.com/firebase/flutterfire/commit/80c3c5efbe329a780ae247da281d775f91125b56))
 - **FIX**(ui_auth_google): bump google_sign_in version ([#10531](https://github.com/firebase/flutterfire/issues/10531)). ([782850d7](https://github.com/firebase/flutterfire/commit/782850d7912c79fbd3da5d96fda2cf3d844a11dc))

#### `firebase_ui_oauth_google` - `v1.0.22`

 - **FIX**(ui_auth_google): bump google_sign_in version ([#10531](https://github.com/firebase/flutterfire/issues/10531)). ([782850d7](https://github.com/firebase/flutterfire/commit/782850d7912c79fbd3da5d96fda2cf3d844a11dc))


## 2023-02-21

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_firestore` - `v1.2.8`](#firebase_ui_firestore---v128)
 - [`firebase_ui_auth` - `v1.1.14`](#firebase_ui_auth---v1114)
 - [`firebase_ui_oauth` - `v1.1.14`](#firebase_ui_oauth---v1114)
 - [`firebase_ui_database` - `v1.0.16`](#firebase_ui_database---v1016)
 - [`firebase_ui_oauth_apple` - `v1.0.21`](#firebase_ui_oauth_apple---v1021)
 - [`firebase_ui_oauth_google` - `v1.0.21`](#firebase_ui_oauth_google---v1021)
 - [`firebase_ui_oauth_facebook` - `v1.0.21`](#firebase_ui_oauth_facebook---v1021)
 - [`firebase_ui_oauth_twitter` - `v1.0.21`](#firebase_ui_oauth_twitter---v1021)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.2.8`
 - `firebase_ui_auth` - `v1.1.14`
 - `firebase_ui_oauth` - `v1.1.14`
 - `firebase_ui_database` - `v1.0.16`
 - `firebase_ui_oauth_apple` - `v1.0.21`
 - `firebase_ui_oauth_google` - `v1.0.21`
 - `firebase_ui_oauth_facebook` - `v1.0.21`
 - `firebase_ui_oauth_twitter` - `v1.0.21`

---


## 2023-02-17

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_firestore` - `v1.2.7`](#firebase_ui_firestore---v127)
 - [`firebase_ui_auth` - `v1.1.13`](#firebase_ui_auth---v1113)
 - [`firebase_ui_oauth` - `v1.1.13`](#firebase_ui_oauth---v1113)
 - [`firebase_ui_database` - `v1.0.15`](#firebase_ui_database---v1015)
 - [`firebase_ui_oauth_apple` - `v1.0.20`](#firebase_ui_oauth_apple---v1020)
 - [`firebase_ui_oauth_facebook` - `v1.0.20`](#firebase_ui_oauth_facebook---v1020)
 - [`firebase_ui_oauth_google` - `v1.0.20`](#firebase_ui_oauth_google---v1020)
 - [`firebase_ui_oauth_twitter` - `v1.0.20`](#firebase_ui_oauth_twitter---v1020)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.2.7`
 - `firebase_ui_auth` - `v1.1.13`
 - `firebase_ui_oauth` - `v1.1.13`
 - `firebase_ui_database` - `v1.0.15`
 - `firebase_ui_oauth_apple` - `v1.0.20`
 - `firebase_ui_oauth_facebook` - `v1.0.20`
 - `firebase_ui_oauth_google` - `v1.0.20`
 - `firebase_ui_oauth_twitter` - `v1.0.20`

---


## 2023-02-16

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_firestore` - `v1.2.6`](#firebase_ui_firestore---v126)
 - [`firebase_ui_auth` - `v1.1.12`](#firebase_ui_auth---v1112)
 - [`firebase_ui_oauth` - `v1.1.12`](#firebase_ui_oauth---v1112)
 - [`firebase_ui_database` - `v1.0.14`](#firebase_ui_database---v1014)
 - [`firebase_ui_oauth_apple` - `v1.0.19`](#firebase_ui_oauth_apple---v1019)
 - [`firebase_ui_oauth_facebook` - `v1.0.19`](#firebase_ui_oauth_facebook---v1019)
 - [`firebase_ui_oauth_google` - `v1.0.19`](#firebase_ui_oauth_google---v1019)
 - [`firebase_ui_oauth_twitter` - `v1.0.19`](#firebase_ui_oauth_twitter---v1019)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.2.6`
 - `firebase_ui_auth` - `v1.1.12`
 - `firebase_ui_oauth` - `v1.1.12`
 - `firebase_ui_database` - `v1.0.14`
 - `firebase_ui_oauth_apple` - `v1.0.19`
 - `firebase_ui_oauth_facebook` - `v1.0.19`
 - `firebase_ui_oauth_google` - `v1.0.19`
 - `firebase_ui_oauth_twitter` - `v1.0.19`

---


## 2023-02-14

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_localizations` - `v1.2.0`](#firebase_ui_localizations---v120)
 - [`firebase_ui_oauth_google` - `v1.0.18`](#firebase_ui_oauth_google---v1018)
 - [`firebase_ui_firestore` - `v1.2.5`](#firebase_ui_firestore---v125)
 - [`firebase_ui_database` - `v1.0.13`](#firebase_ui_database---v1013)
 - [`firebase_ui_auth` - `v1.1.11`](#firebase_ui_auth---v1111)
 - [`firebase_ui_oauth` - `v1.1.11`](#firebase_ui_oauth---v1111)
 - [`firebase_ui_oauth_apple` - `v1.0.18`](#firebase_ui_oauth_apple---v1018)
 - [`firebase_ui_oauth_facebook` - `v1.0.18`](#firebase_ui_oauth_facebook---v1018)
 - [`firebase_ui_oauth_twitter` - `v1.0.18`](#firebase_ui_oauth_twitter---v1018)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.2.5`
 - `firebase_ui_database` - `v1.0.13`
 - `firebase_ui_auth` - `v1.1.11`
 - `firebase_ui_oauth` - `v1.1.11`
 - `firebase_ui_oauth_apple` - `v1.0.18`
 - `firebase_ui_oauth_facebook` - `v1.0.18`
 - `firebase_ui_oauth_twitter` - `v1.0.18`

---

#### `firebase_ui_localizations` - `v1.2.0`

 - **FEAT**: Added Hebrew language to firebase_ui_localizations ([#10300](https://github.com/firebase/flutterfire/issues/10300)). ([ee4e29b8](https://github.com/firebase/flutterfire/commit/ee4e29b8ef99344d4622d974b55d679e0a1934a5))

#### `firebase_ui_oauth_google` - `v1.0.18`

 - **FIX**: allow GoogleService-Info.plist based configuration ([#10360](https://github.com/firebase/flutterfire/issues/10360)). ([162597f4](https://github.com/firebase/flutterfire/commit/162597f4556b1e0da0601db08574f41ac3585500))


## 2023-02-08

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.1.10`](#firebase_ui_auth---v1110)
 - [`firebase_ui_database` - `v1.0.12`](#firebase_ui_database---v1012)
 - [`firebase_ui_firestore` - `v1.2.4`](#firebase_ui_firestore---v124)
 - [`firebase_ui_localizations` - `v1.1.1`](#firebase_ui_localizations---v111)
 - [`firebase_ui_oauth` - `v1.1.10`](#firebase_ui_oauth---v1110)
 - [`firebase_ui_oauth_apple` - `v1.0.17`](#firebase_ui_oauth_apple---v1017)
 - [`firebase_ui_oauth_facebook` - `v1.0.17`](#firebase_ui_oauth_facebook---v1017)
 - [`firebase_ui_oauth_google` - `v1.0.17`](#firebase_ui_oauth_google---v1017)
 - [`firebase_ui_oauth_twitter` - `v1.0.17`](#firebase_ui_oauth_twitter---v1017)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth_apple` - `v1.0.17`
 - `firebase_ui_oauth_facebook` - `v1.0.17`
 - `firebase_ui_oauth_google` - `v1.0.17`
 - `firebase_ui_oauth_twitter` - `v1.0.17`

---

#### `firebase_ui_auth` - `v1.1.10`

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/flutterfire/issues/10344)). ([e0087c84](https://github.com/firebase/flutterfire/commit/e0087c845c7526c11a4241a26d39d4673b0ad29d))
 - **DOCS**: fix return type of example main function ([#10342](https://github.com/firebase/flutterfire/issues/10342)). ([3339bfeb](https://github.com/firebase/flutterfire/commit/3339bfeb81624e6e706d335139c087e4f3ea53eb))

#### `firebase_ui_database` - `v1.0.12`

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/flutterfire/issues/10344)). ([e0087c84](https://github.com/firebase/flutterfire/commit/e0087c845c7526c11a4241a26d39d4673b0ad29d))

#### `firebase_ui_firestore` - `v1.2.4`

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/flutterfire/issues/10344)). ([e0087c84](https://github.com/firebase/flutterfire/commit/e0087c845c7526c11a4241a26d39d4673b0ad29d))

#### `firebase_ui_localizations` - `v1.1.1`

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/flutterfire/issues/10344)). ([e0087c84](https://github.com/firebase/flutterfire/commit/e0087c845c7526c11a4241a26d39d4673b0ad29d))

#### `firebase_ui_oauth` - `v1.1.10`

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/flutterfire/issues/10344)). ([e0087c84](https://github.com/firebase/flutterfire/commit/e0087c845c7526c11a4241a26d39d4673b0ad29d))


## 2023-01-19

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.1.9`](#firebase_ui_auth---v119)
 - [`firebase_ui_oauth` - `v1.1.9`](#firebase_ui_oauth---v119)
 - [`firebase_ui_oauth_apple` - `v1.0.16`](#firebase_ui_oauth_apple---v1016)
 - [`firebase_ui_oauth_facebook` - `v1.0.16`](#firebase_ui_oauth_facebook---v1016)
 - [`firebase_ui_oauth_google` - `v1.0.16`](#firebase_ui_oauth_google---v1016)
 - [`firebase_ui_oauth_twitter` - `v1.0.16`](#firebase_ui_oauth_twitter---v1016)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth` - `v1.1.9`
 - `firebase_ui_oauth_apple` - `v1.0.16`
 - `firebase_ui_oauth_facebook` - `v1.0.16`
 - `firebase_ui_oauth_google` - `v1.0.16`
 - `firebase_ui_oauth_twitter` - `v1.0.16`

---

#### `firebase_ui_auth` - `v1.1.9`

 - **DOCS**: add a font requirement ([#10293](https://github.com/firebase/flutterfire/issues/10293)). ([d94a4ba1](https://github.com/firebase/flutterfire/commit/d94a4ba1c33c0eb49f35292025c3cf964fa21a0d))


## 2023-01-12

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.1.8`](#firebase_ui_auth---v118)
 - [`firebase_ui_localizations` - `v1.1.0`](#firebase_ui_localizations---v110)
 - [`firebase_ui_oauth` - `v1.1.8`](#firebase_ui_oauth---v118)
 - [`firebase_ui_oauth_apple` - `v1.0.15`](#firebase_ui_oauth_apple---v1015)
 - [`firebase_ui_oauth_facebook` - `v1.0.15`](#firebase_ui_oauth_facebook---v1015)
 - [`firebase_ui_oauth_google` - `v1.0.15`](#firebase_ui_oauth_google---v1015)
 - [`firebase_ui_oauth_twitter` - `v1.0.15`](#firebase_ui_oauth_twitter---v1015)
 - [`firebase_ui_firestore` - `v1.2.3`](#firebase_ui_firestore---v123)
 - [`firebase_ui_database` - `v1.0.11`](#firebase_ui_database---v1011)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth` - `v1.1.8`
 - `firebase_ui_oauth_apple` - `v1.0.15`
 - `firebase_ui_oauth_facebook` - `v1.0.15`
 - `firebase_ui_oauth_google` - `v1.0.15`
 - `firebase_ui_oauth_twitter` - `v1.0.15`
 - `firebase_ui_firestore` - `v1.2.3`
 - `firebase_ui_database` - `v1.0.11`

---

#### `firebase_ui_auth` - `v1.1.8`

 - **FIX**: fix material 3 button styling ([#10253](https://github.com/firebase/flutterfire/issues/10253)). ([a541e9ab](https://github.com/firebase/flutterfire/commit/a541e9ab777a93714355247463e285c14686b319))
 - **FIX**: Unfocus to dismiss keyboard when submitting email form ([#10208](https://github.com/firebase/flutterfire/issues/10208)). ([f3a4d3ac](https://github.com/firebase/flutterfire/commit/f3a4d3acc3fbb0743380f3d6f1226e2aa5b95345))
 - **FIX**: emit UserCreated state when signed in user is new ([#10225](https://github.com/firebase/flutterfire/issues/10225)). ([a2ce4104](https://github.com/firebase/flutterfire/commit/a2ce410479d33d87987bfc90fcc9c41954c041d1))
 - **FIX**: fix default SMSCodeInputScreen breakpoint ([#10226](https://github.com/firebase/flutterfire/issues/10226)). ([443418f4](https://github.com/firebase/flutterfire/commit/443418f4276f87d2d9594343284e44a86db1516d))
 - **FIX**: fix PhoneInputScreen layout ([#10227](https://github.com/firebase/flutterfire/issues/10227)). ([7d817863](https://github.com/firebase/flutterfire/commit/7d81786322013df7f0a087e79f3abebbb4ece6cc))
 - **DOCS**: fix typo in "platform ([#10247](https://github.com/firebase/flutterfire/issues/10247)). ([7bb4ba16](https://github.com/firebase/flutterfire/commit/7bb4ba165ec70814bc7da0098bdd8604bdf8fd14))
 - **DOCS**: Removed extra header and fixed typos ([#10248](https://github.com/firebase/flutterfire/issues/10248)). ([66a1ab52](https://github.com/firebase/flutterfire/commit/66a1ab529dec2a54715e857008ce49436a766e3c))

#### `firebase_ui_localizations` - `v1.1.0`

 - **FEAT**: added Hungarian localization ([#10111](https://github.com/firebase/flutterfire/issues/10111)). ([794622cd](https://github.com/firebase/flutterfire/commit/794622cd25332e728c2665ee71b843502fa37eff))


## 2023-01-05

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.1.7`](#firebase_ui_auth---v117)
 - [`firebase_ui_oauth_apple` - `v1.0.14`](#firebase_ui_oauth_apple---v1014)
 - [`firebase_ui_oauth` - `v1.1.7`](#firebase_ui_oauth---v117)
 - [`firebase_ui_oauth_facebook` - `v1.0.14`](#firebase_ui_oauth_facebook---v1014)
 - [`firebase_ui_oauth_google` - `v1.0.14`](#firebase_ui_oauth_google---v1014)
 - [`firebase_ui_oauth_twitter` - `v1.0.14`](#firebase_ui_oauth_twitter---v1014)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_oauth_apple` - `v1.0.14`
 - `firebase_ui_oauth` - `v1.1.7`
 - `firebase_ui_oauth_facebook` - `v1.0.14`
 - `firebase_ui_oauth_google` - `v1.0.14`
 - `firebase_ui_oauth_twitter` - `v1.0.14`

---

#### `firebase_ui_auth` - `v1.1.7`

 - **DOCS**: Fixed typo on phone.md ([#10196](https://github.com/firebase/flutterfire/issues/10196)). ([2fb8af45](https://github.com/firebase/flutterfire/commit/2fb8af45f2f6b1c5311de2a3bcfa032625037944))


## 2022-12-29

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.1.6`](#firebase_ui_auth---v116)
 - [`firebase_ui_oauth_apple` - `v1.0.13`](#firebase_ui_oauth_apple---v1013)
 - [`firebase_ui_oauth` - `v1.1.6`](#firebase_ui_oauth---v116)
 - [`firebase_ui_oauth_facebook` - `v1.0.13`](#firebase_ui_oauth_facebook---v1013)
 - [`firebase_ui_oauth_google` - `v1.0.13`](#firebase_ui_oauth_google---v1013)
 - [`firebase_ui_oauth_twitter` - `v1.0.13`](#firebase_ui_oauth_twitter---v1013)
 - [`firebase_ui_firestore` - `v1.2.2`](#firebase_ui_firestore---v122)
 - [`firebase_ui_database` - `v1.0.10`](#firebase_ui_database---v1010)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_auth` - `v1.1.6`
 - `firebase_ui_oauth_apple` - `v1.0.13`
 - `firebase_ui_oauth` - `v1.1.6`
 - `firebase_ui_oauth_facebook` - `v1.0.13`
 - `firebase_ui_oauth_google` - `v1.0.13`
 - `firebase_ui_oauth_twitter` - `v1.0.13`
 - `firebase_ui_firestore` - `v1.2.2`
 - `firebase_ui_database` - `v1.0.10`

---


## 2022-12-22

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_firestore` - `v1.2.0`](#firebase_ui_firestore---v120)
 - [`firebase_ui_auth` - `v1.1.4`](#firebase_ui_auth---v114)
 - [`firebase_ui_oauth_apple` - `v1.0.11`](#firebase_ui_oauth_apple---v1011)
 - [`firebase_ui_oauth` - `v1.1.4`](#firebase_ui_oauth---v114)
 - [`firebase_ui_oauth_facebook` - `v1.0.11`](#firebase_ui_oauth_facebook---v1011)
 - [`firebase_ui_oauth_google` - `v1.0.11`](#firebase_ui_oauth_google---v1011)
 - [`firebase_ui_oauth_twitter` - `v1.0.11`](#firebase_ui_oauth_twitter---v1011)
 - [`firebase_ui_database` - `v1.0.8`](#firebase_ui_database---v108)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_auth` - `v1.1.4`
 - `firebase_ui_oauth_apple` - `v1.0.11`
 - `firebase_ui_oauth` - `v1.1.4`
 - `firebase_ui_oauth_facebook` - `v1.0.11`
 - `firebase_ui_oauth_google` - `v1.0.11`
 - `firebase_ui_oauth_twitter` - `v1.0.11`
 - `firebase_ui_database` - `v1.0.8`

---

#### `firebase_ui_firestore` - `v1.2.0`

 - **FEAT**: use aggregate query to display total rows count in DataTable ([#10113](https://github.com/firebase/flutterfire/issues/10113)). ([bf52bcca](https://github.com/firebase/flutterfire/commit/bf52bcca3eb186cc001344d2522e11245e5e660a))


## 2022-12-19

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_firestore` - `v1.1.2`](#firebase_ui_firestore---v112)
 - [`firebase_ui_oauth_apple` - `v1.0.11`](#firebase_ui_oauth_apple---v1011)
 - [`firebase_ui_oauth` - `v1.1.4`](#firebase_ui_oauth---v114)
 - [`firebase_ui_auth` - `v1.1.4`](#firebase_ui_auth---v114)
 - [`firebase_ui_oauth_google` - `v1.0.11`](#firebase_ui_oauth_google---v1011)
 - [`firebase_ui_oauth_facebook` - `v1.0.11`](#firebase_ui_oauth_facebook---v1011)
 - [`firebase_ui_oauth_twitter` - `v1.0.11`](#firebase_ui_oauth_twitter---v1011)
 - [`firebase_ui_database` - `v1.0.8`](#firebase_ui_database---v108)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `firebase_ui_firestore` - `v1.1.2`
 - `firebase_ui_oauth_apple` - `v1.0.11`
 - `firebase_ui_oauth` - `v1.1.4`
 - `firebase_ui_auth` - `v1.1.4`
 - `firebase_ui_oauth_google` - `v1.0.11`
 - `firebase_ui_oauth_facebook` - `v1.0.11`
 - `firebase_ui_oauth_twitter` - `v1.0.11`
 - `firebase_ui_database` - `v1.0.8`

---

