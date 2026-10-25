## 0.3.0

> Note: This release has breaking changes.

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10344)). ([c9364bb6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/c9364bb65dd479f00d646a4061673167dd26aa67))
 - **FIX**(ui_auth): allow to pass EmailFormStyle via property ([#98](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/98)). ([88c31a33](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/88c31a332dc490d5500e81d491ba929b0fe4c5f0))
 - **FIX**(firebase_ui_auth): `sendPasswordResetEmail` should not be executed when `isLoading=true` ([#315](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/315)). ([955e5c28](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/955e5c286ea5835defe0bd922428102e98f9e8d7))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9756)). ([9fde266e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9fde266e8df7dc028b53ce21b71699d758171b71))
 - **FIX**(ui_oauth_apple): set default scope to 'email' and add a way to provide custom scopes ([#9784](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9784)). ([cec68582](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/cec68582b904ff043dfd3560ea4ccf2984a5bccf))
 - **FIX**: bump FlutterFire dependencies & fix CI ([#552](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/552)). ([0e6d85bf](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0e6d85bf4c31b1a3fadff9ebdde3e00704123ad6))
 - **FIX**: analyser issues from later Flutter version ([#551](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/551)). ([62cc4be7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/62cc4be752ac729306243111652b2717e5eeba42))
 - **FIX**(ui_auth): fix docs typo ([#9925](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9925)). ([0405b6e9](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0405b6e968e23436d40b91a2c8c43a2b1640b79a))
 - **FIX**(firebase_ui_auth): Add padding between avatar and display name form ([#524](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/524)). ([2747c1ae](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/2747c1ae2869f2c6988cfab819d2885f75913494))
 - **FIX**(firebase_ui_auth): Avoid redundant confirmation on account deletion ([#494](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/494)). ([e2626d24](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/e2626d244aabe70ba98ea6200a71e980e87c37b5))
 - **FIX**(ui_auth): fix docs typo for EmailAuthProvider. ([#9927](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9927)). ([0412a9db](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0412a9db6ea68d0a0fc3932b4ca437c5411963fa))
 - **FIX**: bump FF dependencies to latest ([#526](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/526)). ([9f355bfc](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9f355bfcda8319c9ed4786e1e3da91babb4f5229))
 - **FIX**: bump FF dependencies to latest ([#520](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/520)). ([ac4f1fdd](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/ac4f1fddcee04b020a6384ac74f2571bccafe44e))
 - **FIX**: replace deprecated API and bump FlutterFire dependencies ([#453](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/453)). ([530be48a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/530be48a4710387832f98059bd34ce07bba1778c))
 - **FIX**(auth): remove listener on dispose and only call setState when mounted ([#419](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/419)). ([91c982b5](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/91c982b5bec13b2698b0b83d5885b46cbf0c9b77))
 - **FIX**(auth): ensure previous display name is provided to callback ([#431](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/431)). ([662717d7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/662717d7a8f55d0fd4a1c5d4d8bac56a52e6e783))
 - **FIX**(ui_auth): upgrade dependency to fix platform support for firebase_ui_auth ([#9924](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9924)). ([13004220](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/130042208ebe5a285dc87c1a2517c55ae1a53737))
 - **FIX**(ui_auth): fix confirmation dialog for unlink account button in profile screen ([#373](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/373)). ([0e3a7c49](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0e3a7c4912de4cba1fa6e8fe3d99e1ae2e8a8286))
 - **FIX**(auth): using theme color instead of hardcoded value ([#416](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/416)). ([d183d87e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d183d87e61086c34e8e18233dfc99873b863e7d8))
 - **FIX**(ui_auth): make light text on _EmailVerificationBadge legible ([#196](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/196)). ([72530e52](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/72530e522f141eb12b74c13b99b4460e6da3d140))
 - **FIX**(ui_auth): fix confirmation dialog for delete account button ([#346](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/346)). ([4fd041d1](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/4fd041d12756084da6e4e3e7232c0dd35fc3593c))
 - **FIX**(auth): `ForgotPasswordScreen` display email within input box ([#336](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/336)). ([ad666666](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/ad666666b05c637d5bdf4d041c29a1eeac63d528))
 - **FIX**(ui_auth): widen app_links constraint to allow 7.x ([#676](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/676)). ([235b4071](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/235b4071cd62edcf35ac0503900060edab1c0474))
 - **FIX**(ui_oauth): initialize auth and auth listener in standalone OAuth buttons ([#9926](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9926)). ([d52d58b8](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d52d58b83355a19daf2f7373cb9bffd6233237bd))
 - **FIX**(ui_auth): Fixed a momentary form display after signing in with EmailLinkAuth. ([#318](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/318)). ([3e37d143](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/3e37d1435a4df12c41b9dd857cec67848b2af2c3))
 - **FIX**(firebase_ui_localizations): expose all Firebase UI localizations for overriding ([#309](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/309)). ([e4567478](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/e4567478205f2b88b54aa21af6429fb1c7c81564))
 - **FIX**(firebase_ui_auth): Catch sms code validation ([#482](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/482)). ([687a9bad](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/687a9bad5fd2ad6d2c279f0676c2a54678cd4b56))
 - **FIX**(ui_auth): correctly handle phone auth in showReauthenticateDialog ([#209](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/209)). ([c0612cfd](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/c0612cfd71dc5ea2448ba73882b39a9766b97a98))
 - **FIX**(ui_auth): deprecate email enumeration protection affected APIs ([#210](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/210)). ([eed65674](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/eed656748caa12eb31d7a9677a16bf6b1d129b77))
 - **FIX**(ui_auth): correctly position phone input screen footer ([#183](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/183)). ([d5e2338d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d5e2338df4fbbed69c7526ecc1d4559730c43d03))
 - **FIX**(ui_auth): make maxWidth configurable on all screens ([#178](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/178)). ([c5e77c27](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/c5e77c2705a4237fec489bcdd6b94c85a91e481c))
 - **FIX**(ui_auth): documentation - fix material misspelling in universal_text_form_field.dart ([#11151](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/11151)). ([f44b9ff3](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/f44b9ff3d086a4f01b1e23a2fe45c0ebeeb73d34))
 - **FIX**(ui_auth): deprecate screens and widgets that use fetchSignInMethodsForEmail ([#153](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/153)). ([84ce5fb7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/84ce5fb7a4c2237932568c3cb85953b112ed04a8))
 - **FIX**(ui_auth): use capitalized cancel label on dialogs ([#134](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/134)). ([78c1ba9b](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/78c1ba9b20a6691e046bdbc76595fd810867cde5))
 - **FIX**(ui_localizations): localize weak password error ([#138](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/138)). ([bcfa2be6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/bcfa2be660454078abc0a542abe3359f23453ca4))
 - **FIX**(ui_auth): add showPasswordVisibilityToggle to the SignInScreen ([#114](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/114)). ([77ed75d3](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/77ed75d3cc61aa09c0e5d204af09b98b3f6f1421))
 - **FIX**(ui_auth,ui_localizations): add invalid verification SMS code error label ([#102](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/102)). ([8adc39b9](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/8adc39b94abcf55a4fc0c07850e7e9ec25380d0d))
 - **FIX**(ui_auth): automatically upgrade anonymous accounts ([#10071](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10071)). ([eb205bf8](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/eb205bf8fef6683e2c974bd900e8ee100a296095))
 - **FIX**(ui_localizations,ui_auth): add missing labels ([#87](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/87)). ([be2b0c33](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/be2b0c33f9537f307c2cae97e5f483f695b3ea05))
 - **FIX**(ui_auth): Pass correct AuthAction to the footerBuilder ([#70](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/70)). ([1e091cc5](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/1e091cc583f5c976634583315a9d8a1968927498))
 - **FIX**(ui_auth): fix LoadingIndicator layout on EmailVerificationScreen ([#11169](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/11169)). ([07739ebd](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/07739ebd2b8c6366c8b9630198fcc0f85ce512f7))
 - **FIX**(ui_auth): pass breakpoint to LoginScreen ([#10607](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10607)). ([147b9545](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/147b95455c1ae41d28c0c172adafcd4455f0c77b))
 - **FIX**(firebase_ui_auth): clear the error on ForgotPasswordScreen after submitting a valid email ([#9992](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9992)). ([b176f572](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/b176f5728dc62b7b9109aa78f3012c744ce73292))
 - **FIX**: allow to unlink providers only in edit mode ([#10649](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10649)). ([aa217855](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/aa2178557aca63d484eb2a8abb108a07081ba8bb))
 - **FIX**(ui_auth): fix OAuth providers on RegisterScreen ([#10026](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10026)). ([d29aed25](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d29aed259d2ae0f712b3c9ee12620c8baf3fc118))
 - **FIX**(ui_auth): fix reauthenticate dialog overflow ([#9734](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9734)). ([a85d4b2b](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/a85d4b2bb471d248adca189c7ef06fa2727f8dd8))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10901)). ([81a1bf47](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/81a1bf47166765349ed02a87ad2f5f41929c7fcc))
 - **FIX**(ui_auth): emit UserCreated state when signed in user is new ([#10225](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10225)). ([a461bad6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/a461bad63411eef67de10a26765d5d7d0b7b6865))
 - **FIX**(firebase_ui_oauth): fix OAuth provider buttons paddings ([#9991](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9991)). ([34aae12a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/34aae12a8107bdc43707ebb28f327533c4c90647))
 - **FIX**: Unfocus to dismiss keyboard when submitting email form ([#10208](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10208)). ([310b1f6d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/310b1f6ddd3eb79832c23ecd2acd7a96e7593693))
 - **FIX**(ui_auth): fix material 3 button styling ([#10253](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10253)). ([90377b06](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/90377b0645bd9541e3aa6b72fc60e32e8d94e5ec))
 - **FIX**(ui): allow null countryCode for phone input ([#9937](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9937)). ([227e27c4](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/227e27c4b5325d086604ec475bfb7ff69f5a95f0))
 - **FIX**(firebase_ui_auth): Error added in ProfileScreen in firebase_ui_auth 1.4.0 ([#10957](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10957)). ([e00550f7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/e00550f70b803fc9401fab53012e297ce01d295e))
 - **FIX**(auth,web): `currentUser` is now populated right at the start of the application without needing to wait for `authStateChange` ([#10028](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10028)). ([4d41880e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/4d41880e10de4320d7d368606f7deef6a4524e11))
 - **FIX**(ui_auth): fix ProfileScreen ignoring parent rebuilds ([#11160](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/11160)). ([f8232be6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/f8232be65c495ec20ce4bd735d6300ac4d3700a7))
 - **FIX**(ui_auth_google): bump google_sign_in version ([#10531](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10531)). ([b9059c25](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/b9059c25f486f5c4b5037e9442f066a23ad0f614))
 - **FIX**(ui_auth): fix ResponsivePage layout causing unexpected overflows ([#10533](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10533)). ([9314edd7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9314edd7e7e10a77269c70facbbc71167c32aca4))
 - **FIX**(ui_auth): fix PhoneInputScreen layout ([#10227](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10227)). ([f4ecfb25](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/f4ecfb257f0bf49b5d0801efea973920a2dc8019))
 - **FIX**(ui_auth): fix default SMSCodeInputScreen breakpoint ([#10226](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10226)). ([eb8d6936](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/eb8d6936c6f0d4e8d19f5ebabe17ebef28c8ddaf))
 - **FIX**(ui_auth): allow to pass actions to the RegisterScreen ([#10025](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10025)). ([5cd84e32](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/5cd84e329e720446bfcdb915751dbe03bc798daf))
 - **FIX**(firebase_ui_auth): preserve UI form state when device rotates ([#9993](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9993)). ([08e0eff2](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/08e0eff2767f5b5f9f5304ec33b416ba84e1d5ff))
 - **FEAT**(auth): move to Pigeon for Platform channels ([#10802](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10802)). ([651ed52b](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/651ed52b9bb7c8979ae189b36d4a9607f9c65e01))
 - **FEAT**(ui_auth): Add "Go Back" button to EmailLinkSignInView ([#63](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/63)). ([326fd27d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/326fd27d362de0f342062ac68f85ab8ceea005aa))
 - **FEAT**(ui_auth): allow passing custom user avatar widget ([#11161](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/11161)). ([1a4c004c](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/1a4c004cf928179cb15e1ad506d843136553d9a6))
 - **FEAT**(ui_auth): allow to toggle password visibility ([#104](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/104)). ([6e3735d9](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6e3735d9fda3f2415a781ff591a5842864dc2fcf))
 - **FEAT**(ui_auth): show confirmation dialog when trying to unlink a provider ([#116](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/116)). ([8757037b](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/8757037baa3d88ff25b5dc20aab0dc6ba445827b))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**(ui_auth): add a way to customize ErrorText message ([#119](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/119)). ([a36884d7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/a36884d73228a33a4c4b061e095f4939bf671d8e))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10496)). ([9ce686c6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9ce686c68d78e94165bde3a616702ec4c13a0fa5))
 - **FEAT**(ui_auth): add more account actions ([#172](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/172)). ([518a6c7b](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/518a6c7b24835134d7943b3fc91a68f125e5a0fb))
 - **FEAT**: upgrade to dart 3 compatible dependencies ([#10890](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10890)). ([857070d2](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/857070d21ab1046df95ef874e1592418c3587af9))
 - **FEAT**: [firebase_ui_auth] [firebase_ui_oauth] Allow for custom labels to be used for custom OAuth providers ([#9858](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9858)). ([6badaf8e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6badaf8edcf931ca6b91dccca369e12c9f88b706))
 - **FEAT**(ui_auth): confirm account deletion ([#187](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/187)). ([053a96ee](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/053a96eeedfc74c20ab3e73605dae42676b85a96))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9343)). ([2d2db74d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/2d2db74d984ecc75b712d4058d2e65058c88c8ad))
 - **FEAT**(ui_auth): export `localizedErrorText` ([#189](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/189)). ([ab89f5cf](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/ab89f5cfa215be771e06abc9a94a65f821e2ce8d))
 - **FEAT**(ui_shared): pass platform-specific icons and colors explicitly ([#10655](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10655)). ([c7ac28a5](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/c7ac28a59ba2787228c71e12bb02dc786db14fcd))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10620)). ([79f76d3a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/79f76d3a886288738ccfdcbcd2d07e76c6e5a52e))
 - **FEAT**(ui_auth): add a way to get an AuthController for AuthState ([#207](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/207)). ([0816bfd4](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0816bfd4a1acfbe390d9725d48892b0831e99679))
 - **FEAT**(firebase_ui_localizations): support for `sendVerificationEmailLabel()` label ([#280](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/280)). ([95be915d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/95be915d162c6fb5dfdc6a8ad3298c2002d38dbf))
 - **FEAT**(firebase_ui_auth): add `showPasswordVisibilityToggle` to `RegisterScreen` ([#297](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/297)). ([6ec3ec1e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6ec3ec1edf584fe9f94142ceb7fbdeac57846678))
 - **FEAT**(firebase_ui_auth): add autofocus property to PhoneInput widget ([#334](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/334)). ([eb9e2bd1](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/eb9e2bd1e04be52472b70354dd253a362c3b49c2))
 - **FEAT**: bump FlutterFire dependencies 2024-09-30 ([#407](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/407)). ([d72ce8e3](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d72ce8e3e6d79563c7992d25f36c05b06a742297))
 - **FEAT**(firebase_ui_auth): Use icon from OAuth provider as a fallback in ProfileScreen ([#474](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/474)). ([55f04ebb](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/55f04ebbf29fcc7f8abe11df1b4e7dfaf04028f5))
 - **FEAT**(firebase_ui_auth): Override the default deletion modal. ([#493](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/493)). ([97210905](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/97210905daaa1536e9fd849a4480a20d547b8ccf))
 - **FEAT**(auth): upgrade flutter_facebook_auth dependency and use limited/classic login depending on ATT status  ([#553](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/553)). ([c3acdba7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/c3acdba70eb6a6f79d12911361d416d9f0b866d7))
 - **FEAT**: update FlutterFire dependencies to the latest ([#580](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/580)). ([acef6d3c](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/acef6d3c4575a44e951247638a2a015285a19ff1))
 - **FEAT**: upgrade all packages min SDK to Dart 3.5 ([#615](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/615)). ([aefa711a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/aefa711ad9c550f4f96cb574cb6a26919593d5eb))
 - **FEAT**: upgrade all packages min SDK to Dart 3.5 ([#616](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/616)). ([1535fac4](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/1535fac4e26a5dc91c13601c1327e43994d5403c))
 - **FEAT**: Require Dart 3.9 ([#618](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/618)). ([80a27122](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/80a27122e1008b76c3cb505f8140195f6dd52648))
 - **FEAT**: migrate to Swift Package Manager and drop the Firestore fork ([#699](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/699)). ([73b2c453](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/73b2c45384ccf2de4a9ca9cfc0590648fe9e91d2))
 - **FEAT**(ui_auth): add a way to customize PlatformException text ([#171](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/171)). ([cbe75ca4](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/cbe75ca436bd4aeeb9c9f2e1b9fc067b2e1de279))
 - **FEAT**(ui_auth): use google_sign_in on macOS ([#255](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/255)). ([72571a0d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/72571a0dd20181cabfc1f63d52e903e754399496))
 - **DOCS**(ui_auth): fix typo RegisterScren -> RegisterScreen ([#10488](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10488)). ([385f55ef](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/385f55ef28a25a1310cae44dca390bade376713a))
 - **DOCS**: Fixed typo on phone.md ([#10196](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10196)). ([8922419d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/8922419d1938eb8b458e1f50c9035b57293c9a2b))
 - **DOCS**(ui_auth): Removed extra header and fixed typos ([#10248](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10248)). ([b881a04e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/b881a04e72a8475e11c1c342443f99ad060aeb4a))
 - **DOCS**(ui_auth): fix typo in "platform ([#10247](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10247)). ([8254549a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/8254549ab402e4cfb33617210bde6f8b30ce8f01))
 - **DOCS**(ui_auth): add a font requirement ([#10293](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10293)). ([deef5210](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/deef521088ba4ea262209b4ed3800aac981bb328))
 - **DOCS**(firebase_ui_auth): fix return type of example main function ([#10342](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10342)). ([8bfb084f](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/8bfb084fc7982d27ffc6c407e3e1a0d0159cc146))
 - **DOCS**(ui_auth): Fixed typo 'EmaiAuthProvider' to 'EmailAuthProvider' ([#10654](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10654)). ([85e8256e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/85e8256ed9120ced08ad9a26647fc9a4ff57ec53))
 - **DOCS**(firebase_ui_auth): fix an error in the documentation ([#10797](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10797)). ([111dee9f](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/111dee9f68fb2405904b82b6ae59000ff52209af))
 - **DOCS**(firebase_ui_auth): fix phone provider's widget example ([#10917](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10917)). ([0c5672eb](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0c5672eb813632b1c9a26c6c1eb1d7f1270d3931))
 - **DOCS**(ui_auth): improve phone.md  ([#9774](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9774)). ([a0a0e0ba](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/a0a0e0ba0f30bd74ecd18dbaa46a90dad86261c5))
 - **DOCS**: Added superkey to example widget ([#326](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/326)). ([dd5507e1](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/dd5507e1953d9095a60e4cc127d0b8e72790a4ce))
 - **DOCS**(firebase_ui_auth): Handle `UserCreated` event in `README` example ([#422](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/422)). ([bd1d5ecf](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/bd1d5ecf24d4a33d180543e6d58271b495c0131d))
 - **DOCS**(ui_auth): update platform support matrix ([#9764](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9764)). ([a0a0f374](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/a0a0f3742f8e92460d9478dfc7c1de33ecdb2e3b))
 - **DOCS**(ui_auth): add docs links to the package README ([#10104](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10104)). ([3509c322](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/3509c322d7140011f6c7aa060ebd620f9460e16a))
 - **BREAKING** **FEAT**(auth): Remove Dynamic Links, replace with app-links. ([#522](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/522)). ([b32ec609](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/b32ec6091da05d2f72188c3f335a2b6b954567ec))
 - **BREAKING** **FEAT**: bump FlutterFire dependencies & remove deprecated API ([#529](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/529)). ([7650921e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/7650921e0c99479d35302e994df7c31f7b624420))
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

 - **BREAKING** **FEAT**(ui_oauth_google): migrate to google_sign_in 7 ([#700](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/700)). ([7fd741c9](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/7fd741c9bb4db30a0525f24b1cdbc003d320228c))

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

 - **BREAKING** **FEAT**(ui_auth): complete email link sign in after cold start and on other devices ([#710](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/710)). ([57b353e5](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/57b353e598d0e2527ec506a869ecffa97caae5fd))

## 0.2.0

> Note: This release has breaking changes.

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10344)). ([c9364bb6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/c9364bb65dd479f00d646a4061673167dd26aa67))
 - **FIX**(ui_auth): allow to pass EmailFormStyle via property ([#98](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/98)). ([88c31a33](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/88c31a332dc490d5500e81d491ba929b0fe4c5f0))
 - **FIX**(firebase_ui_auth): `sendPasswordResetEmail` should not be executed when `isLoading=true` ([#315](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/315)). ([955e5c28](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/955e5c286ea5835defe0bd922428102e98f9e8d7))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9756)). ([9fde266e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9fde266e8df7dc028b53ce21b71699d758171b71))
 - **FIX**(ui_oauth_apple): set default scope to 'email' and add a way to provide custom scopes ([#9784](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9784)). ([cec68582](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/cec68582b904ff043dfd3560ea4ccf2984a5bccf))
 - **FIX**: bump FlutterFire dependencies & fix CI ([#552](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/552)). ([0e6d85bf](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0e6d85bf4c31b1a3fadff9ebdde3e00704123ad6))
 - **FIX**: analyser issues from later Flutter version ([#551](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/551)). ([62cc4be7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/62cc4be752ac729306243111652b2717e5eeba42))
 - **FIX**(ui_auth): fix docs typo ([#9925](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9925)). ([0405b6e9](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0405b6e968e23436d40b91a2c8c43a2b1640b79a))
 - **FIX**(firebase_ui_auth): Add padding between avatar and display name form ([#524](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/524)). ([2747c1ae](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/2747c1ae2869f2c6988cfab819d2885f75913494))
 - **FIX**(firebase_ui_auth): Avoid redundant confirmation on account deletion ([#494](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/494)). ([e2626d24](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/e2626d244aabe70ba98ea6200a71e980e87c37b5))
 - **FIX**(ui_auth): fix docs typo for EmailAuthProvider. ([#9927](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9927)). ([0412a9db](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0412a9db6ea68d0a0fc3932b4ca437c5411963fa))
 - **FIX**: bump FF dependencies to latest ([#526](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/526)). ([9f355bfc](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9f355bfcda8319c9ed4786e1e3da91babb4f5229))
 - **FIX**: bump FF dependencies to latest ([#520](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/520)). ([ac4f1fdd](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/ac4f1fddcee04b020a6384ac74f2571bccafe44e))
 - **FIX**: replace deprecated API and bump FlutterFire dependencies ([#453](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/453)). ([530be48a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/530be48a4710387832f98059bd34ce07bba1778c))
 - **FIX**(auth): remove listener on dispose and only call setState when mounted ([#419](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/419)). ([91c982b5](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/91c982b5bec13b2698b0b83d5885b46cbf0c9b77))
 - **FIX**(auth): ensure previous display name is provided to callback ([#431](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/431)). ([662717d7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/662717d7a8f55d0fd4a1c5d4d8bac56a52e6e783))
 - **FIX**(ui_auth): upgrade dependency to fix platform support for firebase_ui_auth ([#9924](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9924)). ([13004220](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/130042208ebe5a285dc87c1a2517c55ae1a53737))
 - **FIX**(ui_auth): fix confirmation dialog for unlink account button in profile screen ([#373](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/373)). ([0e3a7c49](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0e3a7c4912de4cba1fa6e8fe3d99e1ae2e8a8286))
 - **FIX**(auth): using theme color instead of hardcoded value ([#416](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/416)). ([d183d87e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d183d87e61086c34e8e18233dfc99873b863e7d8))
 - **FIX**(ui_auth): make light text on _EmailVerificationBadge legible ([#196](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/196)). ([72530e52](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/72530e522f141eb12b74c13b99b4460e6da3d140))
 - **FIX**(ui_auth): fix confirmation dialog for delete account button ([#346](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/346)). ([4fd041d1](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/4fd041d12756084da6e4e3e7232c0dd35fc3593c))
 - **FIX**(auth): `ForgotPasswordScreen` display email within input box ([#336](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/336)). ([ad666666](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/ad666666b05c637d5bdf4d041c29a1eeac63d528))
 - **FIX**(ui_auth): widen app_links constraint to allow 7.x ([#676](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/676)). ([235b4071](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/235b4071cd62edcf35ac0503900060edab1c0474))
 - **FIX**(ui_oauth): initialize auth and auth listener in standalone OAuth buttons ([#9926](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9926)). ([d52d58b8](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d52d58b83355a19daf2f7373cb9bffd6233237bd))
 - **FIX**(ui_auth): Fixed a momentary form display after signing in with EmailLinkAuth. ([#318](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/318)). ([3e37d143](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/3e37d1435a4df12c41b9dd857cec67848b2af2c3))
 - **FIX**(firebase_ui_localizations): expose all Firebase UI localizations for overriding ([#309](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/309)). ([e4567478](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/e4567478205f2b88b54aa21af6429fb1c7c81564))
 - **FIX**(firebase_ui_auth): Catch sms code validation ([#482](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/482)). ([687a9bad](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/687a9bad5fd2ad6d2c279f0676c2a54678cd4b56))
 - **FIX**(ui_auth): correctly handle phone auth in showReauthenticateDialog ([#209](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/209)). ([c0612cfd](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/c0612cfd71dc5ea2448ba73882b39a9766b97a98))
 - **FIX**(ui_auth): deprecate email enumeration protection affected APIs ([#210](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/210)). ([eed65674](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/eed656748caa12eb31d7a9677a16bf6b1d129b77))
 - **FIX**(ui_auth): correctly position phone input screen footer ([#183](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/183)). ([d5e2338d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d5e2338df4fbbed69c7526ecc1d4559730c43d03))
 - **FIX**(ui_auth): make maxWidth configurable on all screens ([#178](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/178)). ([c5e77c27](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/c5e77c2705a4237fec489bcdd6b94c85a91e481c))
 - **FIX**(ui_auth): documentation - fix material misspelling in universal_text_form_field.dart ([#11151](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/11151)). ([f44b9ff3](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/f44b9ff3d086a4f01b1e23a2fe45c0ebeeb73d34))
 - **FIX**(ui_auth): deprecate screens and widgets that use fetchSignInMethodsForEmail ([#153](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/153)). ([84ce5fb7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/84ce5fb7a4c2237932568c3cb85953b112ed04a8))
 - **FIX**(ui_auth): use capitalized cancel label on dialogs ([#134](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/134)). ([78c1ba9b](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/78c1ba9b20a6691e046bdbc76595fd810867cde5))
 - **FIX**(ui_localizations): localize weak password error ([#138](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/138)). ([bcfa2be6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/bcfa2be660454078abc0a542abe3359f23453ca4))
 - **FIX**(ui_auth): add showPasswordVisibilityToggle to the SignInScreen ([#114](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/114)). ([77ed75d3](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/77ed75d3cc61aa09c0e5d204af09b98b3f6f1421))
 - **FIX**(ui_auth,ui_localizations): add invalid verification SMS code error label ([#102](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/102)). ([8adc39b9](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/8adc39b94abcf55a4fc0c07850e7e9ec25380d0d))
 - **FIX**(ui_auth): automatically upgrade anonymous accounts ([#10071](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10071)). ([eb205bf8](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/eb205bf8fef6683e2c974bd900e8ee100a296095))
 - **FIX**(ui_localizations,ui_auth): add missing labels ([#87](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/87)). ([be2b0c33](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/be2b0c33f9537f307c2cae97e5f483f695b3ea05))
 - **FIX**(ui_auth): Pass correct AuthAction to the footerBuilder ([#70](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/70)). ([1e091cc5](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/1e091cc583f5c976634583315a9d8a1968927498))
 - **FIX**(ui_auth): fix LoadingIndicator layout on EmailVerificationScreen ([#11169](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/11169)). ([07739ebd](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/07739ebd2b8c6366c8b9630198fcc0f85ce512f7))
 - **FIX**(ui_auth): pass breakpoint to LoginScreen ([#10607](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10607)). ([147b9545](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/147b95455c1ae41d28c0c172adafcd4455f0c77b))
 - **FIX**(firebase_ui_auth): clear the error on ForgotPasswordScreen after submitting a valid email ([#9992](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9992)). ([b176f572](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/b176f5728dc62b7b9109aa78f3012c744ce73292))
 - **FIX**: allow to unlink providers only in edit mode ([#10649](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10649)). ([aa217855](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/aa2178557aca63d484eb2a8abb108a07081ba8bb))
 - **FIX**(ui_auth): fix OAuth providers on RegisterScreen ([#10026](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10026)). ([d29aed25](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d29aed259d2ae0f712b3c9ee12620c8baf3fc118))
 - **FIX**(ui_auth): fix reauthenticate dialog overflow ([#9734](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9734)). ([a85d4b2b](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/a85d4b2bb471d248adca189c7ef06fa2727f8dd8))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10901)). ([81a1bf47](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/81a1bf47166765349ed02a87ad2f5f41929c7fcc))
 - **FIX**(ui_auth): emit UserCreated state when signed in user is new ([#10225](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10225)). ([a461bad6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/a461bad63411eef67de10a26765d5d7d0b7b6865))
 - **FIX**(firebase_ui_oauth): fix OAuth provider buttons paddings ([#9991](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9991)). ([34aae12a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/34aae12a8107bdc43707ebb28f327533c4c90647))
 - **FIX**: Unfocus to dismiss keyboard when submitting email form ([#10208](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10208)). ([310b1f6d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/310b1f6ddd3eb79832c23ecd2acd7a96e7593693))
 - **FIX**(ui_auth): fix material 3 button styling ([#10253](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10253)). ([90377b06](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/90377b0645bd9541e3aa6b72fc60e32e8d94e5ec))
 - **FIX**(ui): allow null countryCode for phone input ([#9937](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9937)). ([227e27c4](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/227e27c4b5325d086604ec475bfb7ff69f5a95f0))
 - **FIX**(firebase_ui_auth): Error added in ProfileScreen in firebase_ui_auth 1.4.0 ([#10957](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10957)). ([e00550f7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/e00550f70b803fc9401fab53012e297ce01d295e))
 - **FIX**(auth,web): `currentUser` is now populated right at the start of the application without needing to wait for `authStateChange` ([#10028](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10028)). ([4d41880e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/4d41880e10de4320d7d368606f7deef6a4524e11))
 - **FIX**(ui_auth): fix ProfileScreen ignoring parent rebuilds ([#11160](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/11160)). ([f8232be6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/f8232be65c495ec20ce4bd735d6300ac4d3700a7))
 - **FIX**(ui_auth_google): bump google_sign_in version ([#10531](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10531)). ([b9059c25](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/b9059c25f486f5c4b5037e9442f066a23ad0f614))
 - **FIX**(ui_auth): fix ResponsivePage layout causing unexpected overflows ([#10533](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10533)). ([9314edd7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9314edd7e7e10a77269c70facbbc71167c32aca4))
 - **FIX**(ui_auth): fix PhoneInputScreen layout ([#10227](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10227)). ([f4ecfb25](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/f4ecfb257f0bf49b5d0801efea973920a2dc8019))
 - **FIX**(ui_auth): fix default SMSCodeInputScreen breakpoint ([#10226](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10226)). ([eb8d6936](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/eb8d6936c6f0d4e8d19f5ebabe17ebef28c8ddaf))
 - **FIX**(ui_auth): allow to pass actions to the RegisterScreen ([#10025](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10025)). ([5cd84e32](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/5cd84e329e720446bfcdb915751dbe03bc798daf))
 - **FIX**(firebase_ui_auth): preserve UI form state when device rotates ([#9993](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9993)). ([08e0eff2](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/08e0eff2767f5b5f9f5304ec33b416ba84e1d5ff))
 - **FEAT**(auth): move to Pigeon for Platform channels ([#10802](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10802)). ([651ed52b](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/651ed52b9bb7c8979ae189b36d4a9607f9c65e01))
 - **FEAT**(ui_auth): Add "Go Back" button to EmailLinkSignInView ([#63](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/63)). ([326fd27d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/326fd27d362de0f342062ac68f85ab8ceea005aa))
 - **FEAT**(ui_auth): allow passing custom user avatar widget ([#11161](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/11161)). ([1a4c004c](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/1a4c004cf928179cb15e1ad506d843136553d9a6))
 - **FEAT**(ui_auth): allow to toggle password visibility ([#104](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/104)). ([6e3735d9](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6e3735d9fda3f2415a781ff591a5842864dc2fcf))
 - **FEAT**(ui_auth): show confirmation dialog when trying to unlink a provider ([#116](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/116)). ([8757037b](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/8757037baa3d88ff25b5dc20aab0dc6ba445827b))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**(ui_auth): add a way to customize ErrorText message ([#119](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/119)). ([a36884d7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/a36884d73228a33a4c4b061e095f4939bf671d8e))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10496)). ([9ce686c6](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/9ce686c68d78e94165bde3a616702ec4c13a0fa5))
 - **FEAT**(ui_auth): add more account actions ([#172](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/172)). ([518a6c7b](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/518a6c7b24835134d7943b3fc91a68f125e5a0fb))
 - **FEAT**: upgrade to dart 3 compatible dependencies ([#10890](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10890)). ([857070d2](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/857070d21ab1046df95ef874e1592418c3587af9))
 - **FEAT**: [firebase_ui_auth] [firebase_ui_oauth] Allow for custom labels to be used for custom OAuth providers ([#9858](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9858)). ([6badaf8e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6badaf8edcf931ca6b91dccca369e12c9f88b706))
 - **FEAT**(ui_auth): confirm account deletion ([#187](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/187)). ([053a96ee](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/053a96eeedfc74c20ab3e73605dae42676b85a96))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9343)). ([2d2db74d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/2d2db74d984ecc75b712d4058d2e65058c88c8ad))
 - **FEAT**(ui_auth): export `localizedErrorText` ([#189](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/189)). ([ab89f5cf](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/ab89f5cfa215be771e06abc9a94a65f821e2ce8d))
 - **FEAT**(ui_shared): pass platform-specific icons and colors explicitly ([#10655](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10655)). ([c7ac28a5](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/c7ac28a59ba2787228c71e12bb02dc786db14fcd))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10620)). ([79f76d3a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/79f76d3a886288738ccfdcbcd2d07e76c6e5a52e))
 - **FEAT**(ui_auth): add a way to get an AuthController for AuthState ([#207](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/207)). ([0816bfd4](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0816bfd4a1acfbe390d9725d48892b0831e99679))
 - **FEAT**(firebase_ui_localizations): support for `sendVerificationEmailLabel()` label ([#280](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/280)). ([95be915d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/95be915d162c6fb5dfdc6a8ad3298c2002d38dbf))
 - **FEAT**(firebase_ui_auth): add `showPasswordVisibilityToggle` to `RegisterScreen` ([#297](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/297)). ([6ec3ec1e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/6ec3ec1edf584fe9f94142ceb7fbdeac57846678))
 - **FEAT**(firebase_ui_auth): add autofocus property to PhoneInput widget ([#334](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/334)). ([eb9e2bd1](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/eb9e2bd1e04be52472b70354dd253a362c3b49c2))
 - **FEAT**: bump FlutterFire dependencies 2024-09-30 ([#407](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/407)). ([d72ce8e3](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/d72ce8e3e6d79563c7992d25f36c05b06a742297))
 - **FEAT**(firebase_ui_auth): Use icon from OAuth provider as a fallback in ProfileScreen ([#474](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/474)). ([55f04ebb](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/55f04ebbf29fcc7f8abe11df1b4e7dfaf04028f5))
 - **FEAT**(firebase_ui_auth): Override the default deletion modal. ([#493](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/493)). ([97210905](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/97210905daaa1536e9fd849a4480a20d547b8ccf))
 - **FEAT**(auth): upgrade flutter_facebook_auth dependency and use limited/classic login depending on ATT status  ([#553](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/553)). ([c3acdba7](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/c3acdba70eb6a6f79d12911361d416d9f0b866d7))
 - **FEAT**: update FlutterFire dependencies to the latest ([#580](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/580)). ([acef6d3c](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/acef6d3c4575a44e951247638a2a015285a19ff1))
 - **FEAT**: upgrade all packages min SDK to Dart 3.5 ([#615](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/615)). ([aefa711a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/aefa711ad9c550f4f96cb574cb6a26919593d5eb))
 - **FEAT**: upgrade all packages min SDK to Dart 3.5 ([#616](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/616)). ([1535fac4](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/1535fac4e26a5dc91c13601c1327e43994d5403c))
 - **FEAT**: Require Dart 3.9 ([#618](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/618)). ([80a27122](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/80a27122e1008b76c3cb505f8140195f6dd52648))
 - **FEAT**: migrate to Swift Package Manager and drop the Firestore fork ([#699](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/699)). ([73b2c453](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/73b2c45384ccf2de4a9ca9cfc0590648fe9e91d2))
 - **FEAT**(ui_auth): add a way to customize PlatformException text ([#171](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/171)). ([cbe75ca4](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/cbe75ca436bd4aeeb9c9f2e1b9fc067b2e1de279))
 - **FEAT**(ui_auth): use google_sign_in on macOS ([#255](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/255)). ([72571a0d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/72571a0dd20181cabfc1f63d52e903e754399496))
 - **DOCS**(ui_auth): fix typo RegisterScren -> RegisterScreen ([#10488](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10488)). ([385f55ef](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/385f55ef28a25a1310cae44dca390bade376713a))
 - **DOCS**: Fixed typo on phone.md ([#10196](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10196)). ([8922419d](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/8922419d1938eb8b458e1f50c9035b57293c9a2b))
 - **DOCS**(ui_auth): Removed extra header and fixed typos ([#10248](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10248)). ([b881a04e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/b881a04e72a8475e11c1c342443f99ad060aeb4a))
 - **DOCS**(ui_auth): fix typo in "platform ([#10247](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10247)). ([8254549a](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/8254549ab402e4cfb33617210bde6f8b30ce8f01))
 - **DOCS**(ui_auth): add a font requirement ([#10293](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10293)). ([deef5210](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/deef521088ba4ea262209b4ed3800aac981bb328))
 - **DOCS**(firebase_ui_auth): fix return type of example main function ([#10342](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10342)). ([8bfb084f](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/8bfb084fc7982d27ffc6c407e3e1a0d0159cc146))
 - **DOCS**(ui_auth): Fixed typo 'EmaiAuthProvider' to 'EmailAuthProvider' ([#10654](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10654)). ([85e8256e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/85e8256ed9120ced08ad9a26647fc9a4ff57ec53))
 - **DOCS**(firebase_ui_auth): fix an error in the documentation ([#10797](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10797)). ([111dee9f](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/111dee9f68fb2405904b82b6ae59000ff52209af))
 - **DOCS**(firebase_ui_auth): fix phone provider's widget example ([#10917](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10917)). ([0c5672eb](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/0c5672eb813632b1c9a26c6c1eb1d7f1270d3931))
 - **DOCS**(ui_auth): improve phone.md  ([#9774](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9774)). ([a0a0e0ba](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/a0a0e0ba0f30bd74ecd18dbaa46a90dad86261c5))
 - **DOCS**: Added superkey to example widget ([#326](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/326)). ([dd5507e1](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/dd5507e1953d9095a60e4cc127d0b8e72790a4ce))
 - **DOCS**(firebase_ui_auth): Handle `UserCreated` event in `README` example ([#422](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/422)). ([bd1d5ecf](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/bd1d5ecf24d4a33d180543e6d58271b495c0131d))
 - **DOCS**(ui_auth): update platform support matrix ([#9764](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/9764)). ([a0a0f374](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/a0a0f3742f8e92460d9478dfc7c1de33ecdb2e3b))
 - **DOCS**(ui_auth): add docs links to the package README ([#10104](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/10104)). ([3509c322](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/3509c322d7140011f6c7aa060ebd620f9460e16a))
 - **BREAKING** **FEAT**(auth): Remove Dynamic Links, replace with app-links. ([#522](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/522)). ([b32ec609](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/b32ec6091da05d2f72188c3f335a2b6b954567ec))
 - **BREAKING** **FEAT**: bump FlutterFire dependencies & remove deprecated API ([#529](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/529)). ([7650921e](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/7650921e0c99479d35302e994df7c31f7b624420))
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

 - **BREAKING** **FEAT**(ui_oauth_google): migrate to google_sign_in 7 ([#700](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/700)). ([7fd741c9](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/7fd741c9bb4db30a0525f24b1cdbc003d320228c))

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

 - **BREAKING** **FEAT**(ui_auth): complete email link sign in after cold start and on other devices ([#710](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/issues/710)). ([57b353e5](https://github.com/gnomezgrave/forui_FirebaseUI-Flutter/commit/57b353e598d0e2527ec506a869ecffa97caae5fd))

## 0.1.0

 - Initial release of `forui_firebase_ui_auth`: Forui port of the original Firebase UI Auth package. Screens and form widgets use Forui (`FScaffold`, `FTextFormField`, `FOtpField`, `FAvatar`, `FDialog`, Lucide icons). Apps must wrap UI in an `FTheme` ancestor. Requires Dart `^3.13.0` / Flutter 3.47+.
