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
