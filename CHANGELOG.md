# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2023-08-17

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`firebase_ui_auth` - `v1.7.0`](#firebase_ui_auth---v170)
 - [`firebase_ui_database` - `v1.4.0`](#firebase_ui_database---v140)
 - [`firebase_ui_firestore` - `v1.6.0`](#firebase_ui_firestore---v160)
 - [`firebase_ui_localizations` - `v1.6.0`](#firebase_ui_localizations---v160)
 - [`firebase_ui_oauth` - `v1.5.0`](#firebase_ui_oauth---v150)
 - [`firebase_ui_oauth_apple` - `v1.3.0`](#firebase_ui_oauth_apple---v130)
 - [`firebase_ui_oauth_facebook` - `v1.3.0`](#firebase_ui_oauth_facebook---v130)
 - [`firebase_ui_oauth_google` - `v1.3.0`](#firebase_ui_oauth_google---v130)
 - [`firebase_ui_oauth_twitter` - `v1.3.0`](#firebase_ui_oauth_twitter---v130)
 - [`firebase_ui_shared` - `v1.4.0`](#firebase_ui_shared---v140)
 - [`firebase_ui_storage` - `v0.1.0-dev.9`](#firebase_ui_storage---v010-dev9)

---

#### `firebase_ui_auth` - `v1.7.0`

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/FirebaseUI-Flutter/issues/10344)). ([4f7a8050](https://github.com/firebase/FirebaseUI-Flutter/commit/4f7a8050b2fbed2cfcc3c6896a5af22df0df0442))
 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/FirebaseUI-Flutter/issues/10344)). ([c9364bb6](https://github.com/firebase/FirebaseUI-Flutter/commit/c9364bb65dd479f00d646a4061673167dd26aa67))
 - **FIX**(ui_auth): allow to pass actions to the RegisterScreen ([#10025](https://github.com/firebase/FirebaseUI-Flutter/issues/10025)). ([7cc7ee98](https://github.com/firebase/FirebaseUI-Flutter/commit/7cc7ee982003ef6cdad48ef91e8eea5599b929fd))
 - **FIX**(ui_auth): emit UserCreated state when signed in user is new ([#10225](https://github.com/firebase/FirebaseUI-Flutter/issues/10225)). ([a461bad6](https://github.com/firebase/FirebaseUI-Flutter/commit/a461bad63411eef67de10a26765d5d7d0b7b6865))
 - **FIX**(ui_auth): fix ProfileScreen ignoring parent rebuilds ([#11160](https://github.com/firebase/FirebaseUI-Flutter/issues/11160)). ([f8232be6](https://github.com/firebase/FirebaseUI-Flutter/commit/f8232be65c495ec20ce4bd735d6300ac4d3700a7))
 - **FIX**(firebase_ui_auth): Error added in ProfileScreen in firebase_ui_auth 1.4.0 ([#10957](https://github.com/firebase/FirebaseUI-Flutter/issues/10957)). ([e00550f7](https://github.com/firebase/FirebaseUI-Flutter/commit/e00550f70b803fc9401fab53012e297ce01d295e))
 - **FIX**(ui_auth): fix reauthenticate dialog overflow ([#9734](https://github.com/firebase/FirebaseUI-Flutter/issues/9734)). ([d6a9b0cb](https://github.com/firebase/FirebaseUI-Flutter/commit/d6a9b0cb095e1a9d7fdfde70092b0b8dd047c239))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/FirebaseUI-Flutter/issues/10901)). ([81a1bf47](https://github.com/firebase/FirebaseUI-Flutter/commit/81a1bf47166765349ed02a87ad2f5f41929c7fcc))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/firebase/FirebaseUI-Flutter/issues/9756)). ([dd41fcb6](https://github.com/firebase/FirebaseUI-Flutter/commit/dd41fcb6fecf4511a881dd034d4a181080b4a00d))
 - **FIX**: allow to unlink providers only in edit mode ([#10649](https://github.com/firebase/FirebaseUI-Flutter/issues/10649)). ([aa217855](https://github.com/firebase/FirebaseUI-Flutter/commit/aa2178557aca63d484eb2a8abb108a07081ba8bb))
 - **FIX**(ui_oauth_apple): set default scope to 'email' and add a way to provide custom scopes ([#9784](https://github.com/firebase/FirebaseUI-Flutter/issues/9784)). ([730e5274](https://github.com/firebase/FirebaseUI-Flutter/commit/730e5274747e06e4e32ddb1b7e466699888088e3))
 - **FIX**(ui_auth): fix docs typo ([#9925](https://github.com/firebase/FirebaseUI-Flutter/issues/9925)). ([fa1a52ee](https://github.com/firebase/FirebaseUI-Flutter/commit/fa1a52eeafbf9ba1f405078f17a7cb2ce0abcbc6))
 - **FIX**: Unfocus to dismiss keyboard when submitting email form ([#10208](https://github.com/firebase/FirebaseUI-Flutter/issues/10208)). ([310b1f6d](https://github.com/firebase/FirebaseUI-Flutter/commit/310b1f6ddd3eb79832c23ecd2acd7a96e7593693))
 - **FIX**(ui_auth): allow to pass actions to the RegisterScreen ([#10025](https://github.com/firebase/FirebaseUI-Flutter/issues/10025)). ([5cd84e32](https://github.com/firebase/FirebaseUI-Flutter/commit/5cd84e329e720446bfcdb915751dbe03bc798daf))
 - **FIX**(ui_auth): pass breakpoint to LoginScreen ([#10607](https://github.com/firebase/FirebaseUI-Flutter/issues/10607)). ([147b9545](https://github.com/firebase/FirebaseUI-Flutter/commit/147b95455c1ae41d28c0c172adafcd4455f0c77b))
 - **FIX**(ui_auth): fix ResponsivePage layout causing unexpected overflows ([#10533](https://github.com/firebase/FirebaseUI-Flutter/issues/10533)). ([9314edd7](https://github.com/firebase/FirebaseUI-Flutter/commit/9314edd7e7e10a77269c70facbbc71167c32aca4))
 - **FIX**(ui_auth_google): bump google_sign_in version ([#10531](https://github.com/firebase/FirebaseUI-Flutter/issues/10531)). ([b9059c25](https://github.com/firebase/FirebaseUI-Flutter/commit/b9059c25f486f5c4b5037e9442f066a23ad0f614))
 - **FIX**(ui_auth): fix docs typo for EmailAuthProvider. ([#9927](https://github.com/firebase/FirebaseUI-Flutter/issues/9927)). ([96f96385](https://github.com/firebase/FirebaseUI-Flutter/commit/96f963853d0db071907c95ffcadfce961152c312))
 - **FIX**(ui_auth): upgrade dependency to fix platform support for firebase_ui_auth ([#9924](https://github.com/firebase/FirebaseUI-Flutter/issues/9924)). ([254095a6](https://github.com/firebase/FirebaseUI-Flutter/commit/254095a6639768c62f0790c7c4f2c16ee06d30a1))
 - **FIX**(ui_oauth): initialize auth and auth listener in standalone OAuth buttons ([#9926](https://github.com/firebase/FirebaseUI-Flutter/issues/9926)). ([89c99654](https://github.com/firebase/FirebaseUI-Flutter/commit/89c9965481637f19361e7a09e8f770b86d668499))
 - **FIX**(ui): allow null countryCode for phone input ([#9937](https://github.com/firebase/FirebaseUI-Flutter/issues/9937)). ([7613dc07](https://github.com/firebase/FirebaseUI-Flutter/commit/7613dc07642f05e31ef765f2380c1b1eca7976c0))
 - **FIX**(ui_auth): fix material 3 button styling ([#10253](https://github.com/firebase/FirebaseUI-Flutter/issues/10253)). ([90377b06](https://github.com/firebase/FirebaseUI-Flutter/commit/90377b0645bd9541e3aa6b72fc60e32e8d94e5ec))
 - **FIX**: Unfocus to dismiss keyboard when submitting email form ([#10208](https://github.com/firebase/FirebaseUI-Flutter/issues/10208)). ([3a0d9fa6](https://github.com/firebase/FirebaseUI-Flutter/commit/3a0d9fa62cce97ee717ac6f30e8519aad8026dce))
 - **FIX**(ui_auth): fix default SMSCodeInputScreen breakpoint ([#10226](https://github.com/firebase/FirebaseUI-Flutter/issues/10226)). ([eb8d6936](https://github.com/firebase/FirebaseUI-Flutter/commit/eb8d6936c6f0d4e8d19f5ebabe17ebef28c8ddaf))
 - **FIX**(ui_auth): fix PhoneInputScreen layout ([#10227](https://github.com/firebase/FirebaseUI-Flutter/issues/10227)). ([f4ecfb25](https://github.com/firebase/FirebaseUI-Flutter/commit/f4ecfb257f0bf49b5d0801efea973920a2dc8019))
 - **FIX**(firebase_ui_auth): clear the error on ForgotPasswordScreen after submitting a valid email ([#9992](https://github.com/firebase/FirebaseUI-Flutter/issues/9992)). ([f1e0f77e](https://github.com/firebase/FirebaseUI-Flutter/commit/f1e0f77e7fe4b4bf4bd99fa8e468fe6c3be87949))
 - **FIX**(ui_auth): automatically upgrade anonymous accounts ([#10071](https://github.com/firebase/FirebaseUI-Flutter/issues/10071)). ([eb205bf8](https://github.com/firebase/FirebaseUI-Flutter/commit/eb205bf8fef6683e2c974bd900e8ee100a296095))
 - **FIX**(ui_auth): fix LoadingIndicator layout on EmailVerificationScreen ([#11169](https://github.com/firebase/FirebaseUI-Flutter/issues/11169)). ([07739ebd](https://github.com/firebase/FirebaseUI-Flutter/commit/07739ebd2b8c6366c8b9630198fcc0f85ce512f7))
 - **FIX**(auth,web): `currentUser` is now populated right at the start of the application without needing to wait for `authStateChange` ([#10028](https://github.com/firebase/FirebaseUI-Flutter/issues/10028)). ([4d41880e](https://github.com/firebase/FirebaseUI-Flutter/commit/4d41880e10de4320d7d368606f7deef6a4524e11))
 - **FIX**(firebase_ui_oauth): fix OAuth provider buttons paddings ([#9991](https://github.com/firebase/FirebaseUI-Flutter/issues/9991)). ([34aae12a](https://github.com/firebase/FirebaseUI-Flutter/commit/34aae12a8107bdc43707ebb28f327533c4c90647))
 - **FIX**(ui_auth): fix OAuth providers on RegisterScreen ([#10026](https://github.com/firebase/FirebaseUI-Flutter/issues/10026)). ([d29aed25](https://github.com/firebase/FirebaseUI-Flutter/commit/d29aed259d2ae0f712b3c9ee12620c8baf3fc118))
 - **FIX**(firebase_ui_auth): preserve UI form state when device rotates ([#9993](https://github.com/firebase/FirebaseUI-Flutter/issues/9993)). ([08e0eff2](https://github.com/firebase/FirebaseUI-Flutter/commit/08e0eff2767f5b5f9f5304ec33b416ba84e1d5ff))
 - **FIX**(firebase_ui_auth): clear the error on ForgotPasswordScreen after submitting a valid email ([#9992](https://github.com/firebase/FirebaseUI-Flutter/issues/9992)). ([b176f572](https://github.com/firebase/FirebaseUI-Flutter/commit/b176f5728dc62b7b9109aa78f3012c744ce73292))
 - **FIX**(ui): allow null countryCode for phone input ([#9937](https://github.com/firebase/FirebaseUI-Flutter/issues/9937)). ([227e27c4](https://github.com/firebase/FirebaseUI-Flutter/commit/227e27c4b5325d086604ec475bfb7ff69f5a95f0))
 - **FIX**(firebase_ui_auth): preserve UI form state when device rotates ([#9993](https://github.com/firebase/FirebaseUI-Flutter/issues/9993)). ([99600997](https://github.com/firebase/FirebaseUI-Flutter/commit/99600997a76b295f30d732747426316a2d65d0ae))
 - **FIX**(ui_oauth): initialize auth and auth listener in standalone OAuth buttons ([#9926](https://github.com/firebase/FirebaseUI-Flutter/issues/9926)). ([d52d58b8](https://github.com/firebase/FirebaseUI-Flutter/commit/d52d58b83355a19daf2f7373cb9bffd6233237bd))
 - **FIX**(ui_auth): upgrade dependency to fix platform support for firebase_ui_auth ([#9924](https://github.com/firebase/FirebaseUI-Flutter/issues/9924)). ([13004220](https://github.com/firebase/FirebaseUI-Flutter/commit/130042208ebe5a285dc87c1a2517c55ae1a53737))
 - **FIX**(ui_auth): fix docs typo for EmailAuthProvider. ([#9927](https://github.com/firebase/FirebaseUI-Flutter/issues/9927)). ([0412a9db](https://github.com/firebase/FirebaseUI-Flutter/commit/0412a9db6ea68d0a0fc3932b4ca437c5411963fa))
 - **FIX**(ui_auth): fix docs typo ([#9925](https://github.com/firebase/FirebaseUI-Flutter/issues/9925)). ([0405b6e9](https://github.com/firebase/FirebaseUI-Flutter/commit/0405b6e968e23436d40b91a2c8c43a2b1640b79a))
 - **FIX**(ui_oauth_apple): set default scope to 'email' and add a way to provide custom scopes ([#9784](https://github.com/firebase/FirebaseUI-Flutter/issues/9784)). ([cec68582](https://github.com/firebase/FirebaseUI-Flutter/commit/cec68582b904ff043dfd3560ea4ccf2984a5bccf))
 - **FIX**(ui_auth): emit UserCreated state when signed in user is new ([#10225](https://github.com/firebase/FirebaseUI-Flutter/issues/10225)). ([8a6f8662](https://github.com/firebase/FirebaseUI-Flutter/commit/8a6f866258312c5c0e1ec6765b15d50d53ddab59))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/firebase/FirebaseUI-Flutter/issues/9756)). ([9fde266e](https://github.com/firebase/FirebaseUI-Flutter/commit/9fde266e8df7dc028b53ce21b71699d758171b71))
 - **FIX**(ui_auth): fix reauthenticate dialog overflow ([#9734](https://github.com/firebase/FirebaseUI-Flutter/issues/9734)). ([a85d4b2b](https://github.com/firebase/FirebaseUI-Flutter/commit/a85d4b2bb471d248adca189c7ef06fa2727f8dd8))
 - **FIX**(ui_auth): fix LoadingIndicator layout on EmailVerificationScreen ([#11169](https://github.com/firebase/FirebaseUI-Flutter/issues/11169)). ([0b62b25e](https://github.com/firebase/FirebaseUI-Flutter/commit/0b62b25e775e793517b12376986924c89d9e3620))
 - **FIX**(ui_auth): fix material 3 button styling ([#10253](https://github.com/firebase/FirebaseUI-Flutter/issues/10253)). ([5c475413](https://github.com/firebase/FirebaseUI-Flutter/commit/5c47541385286f84e077eae734fff665207f1b48))
 - **FIX**(ui_auth): documentation - fix material misspelling in universal_text_form_field.dart ([#11151](https://github.com/firebase/FirebaseUI-Flutter/issues/11151)). ([47d0b282](https://github.com/firebase/FirebaseUI-Flutter/commit/47d0b2828517049ad352dd93ac497d6107434aaf))
 - **FIX**(ui_auth): fix ProfileScreen ignoring parent rebuilds ([#11160](https://github.com/firebase/FirebaseUI-Flutter/issues/11160)). ([a6796717](https://github.com/firebase/FirebaseUI-Flutter/commit/a679671719e0391b6cedf43ebd33a855317cb012))
 - **FIX**(firebase_ui_auth): Error added in ProfileScreen in firebase_ui_auth 1.4.0 ([#10957](https://github.com/firebase/FirebaseUI-Flutter/issues/10957)). ([dff2f522](https://github.com/firebase/FirebaseUI-Flutter/commit/dff2f5221f1ae8012c3cb0c22359f69c486c1da2))
 - **FIX**(firebase_ui_oauth): fix OAuth provider buttons paddings ([#9991](https://github.com/firebase/FirebaseUI-Flutter/issues/9991)). ([e06b8875](https://github.com/firebase/FirebaseUI-Flutter/commit/e06b8875365869ec2ea77d97e4f77dba9d86c75a))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/FirebaseUI-Flutter/issues/10901)). ([f6df184c](https://github.com/firebase/FirebaseUI-Flutter/commit/f6df184cfec4892cda7bc19d58bf81539b295c61))
 - **FIX**(auth,web): `currentUser` is now populated right at the start of the application without needing to wait for `authStateChange` ([#10028](https://github.com/firebase/FirebaseUI-Flutter/issues/10028)). ([7c7b04e3](https://github.com/firebase/FirebaseUI-Flutter/commit/7c7b04e36c2b84f4031adec9f70c3dd373763ed8))
 - **FIX**: allow to unlink providers only in edit mode ([#10649](https://github.com/firebase/FirebaseUI-Flutter/issues/10649)). ([059ee882](https://github.com/firebase/FirebaseUI-Flutter/commit/059ee8827c5fa905132dfaf6c75f2e47e5d73b9f))
 - **FIX**(ui_auth): automatically upgrade anonymous accounts ([#10071](https://github.com/firebase/FirebaseUI-Flutter/issues/10071)). ([7ccf2b3d](https://github.com/firebase/FirebaseUI-Flutter/commit/7ccf2b3dc9fb56e0a505e7ea8f8a651bd4962117))
 - **FIX**(ui_auth): pass breakpoint to LoginScreen ([#10607](https://github.com/firebase/FirebaseUI-Flutter/issues/10607)). ([819df859](https://github.com/firebase/FirebaseUI-Flutter/commit/819df85913f026e2bec7d39cb6886e8d70381cb0))
 - **FIX**(ui_auth): fix ResponsivePage layout causing unexpected overflows ([#10533](https://github.com/firebase/FirebaseUI-Flutter/issues/10533)). ([43259e53](https://github.com/firebase/FirebaseUI-Flutter/commit/43259e53f87d8711d5d8ad9c50c882b2650ba811))
 - **FIX**(ui_auth_google): bump google_sign_in version ([#10531](https://github.com/firebase/FirebaseUI-Flutter/issues/10531)). ([2edd6574](https://github.com/firebase/FirebaseUI-Flutter/commit/2edd6574f82954279dce6fc36819224c9c2ce8fd))
 - **FIX**(ui_auth): documentation - fix material misspelling in universal_text_form_field.dart ([#11151](https://github.com/firebase/FirebaseUI-Flutter/issues/11151)). ([f44b9ff3](https://github.com/firebase/FirebaseUI-Flutter/commit/f44b9ff3d086a4f01b1e23a2fe45c0ebeeb73d34))
 - **FIX**(ui_auth): fix PhoneInputScreen layout ([#10227](https://github.com/firebase/FirebaseUI-Flutter/issues/10227)). ([3c59ea35](https://github.com/firebase/FirebaseUI-Flutter/commit/3c59ea352f1b363a2d68d0af28d0f129b9e80015))
 - **FIX**(ui_auth): fix default SMSCodeInputScreen breakpoint ([#10226](https://github.com/firebase/FirebaseUI-Flutter/issues/10226)). ([584bbb47](https://github.com/firebase/FirebaseUI-Flutter/commit/584bbb472cbeaf9d515b70fc66f21e79fc43f82c))
 - **FIX**(ui_auth): fix OAuth providers on RegisterScreen ([#10026](https://github.com/firebase/FirebaseUI-Flutter/issues/10026)). ([e72a1f34](https://github.com/firebase/FirebaseUI-Flutter/commit/e72a1f34924d439ddc486b4dd1cbd2fa8a075df3))
 - **FEAT**(ui_shared): pass platform-specific icons and colors explicitly ([#10655](https://github.com/firebase/FirebaseUI-Flutter/issues/10655)). ([c7ac28a5](https://github.com/firebase/FirebaseUI-Flutter/commit/c7ac28a59ba2787228c71e12bb02dc786db14fcd))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([79f76d3a](https://github.com/firebase/FirebaseUI-Flutter/commit/79f76d3a886288738ccfdcbcd2d07e76c6e5a52e))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/FirebaseUI-Flutter/issues/10496)). ([930becc3](https://github.com/firebase/FirebaseUI-Flutter/commit/930becc3ddbffcd65f4c79bd2973994e1be396d3))
 - **FEAT**: [firebase_ui_auth] [firebase_ui_oauth] Allow for custom labels to be used for custom OAuth providers ([#9858](https://github.com/firebase/FirebaseUI-Flutter/issues/9858)). ([3d967041](https://github.com/firebase/FirebaseUI-Flutter/commit/3d96704140ec482392dc7638c0eba92808e7bc2c))
 - **FEAT**: upgrade to dart 3 compatible dependencies ([#10890](https://github.com/firebase/FirebaseUI-Flutter/issues/10890)). ([19794810](https://github.com/firebase/FirebaseUI-Flutter/commit/19794810caeaf45e32e45be88b4efd6714b98859))
 - **FEAT**: [firebase_ui_auth] [firebase_ui_oauth] Allow for custom labels to be used for custom OAuth providers ([#9858](https://github.com/firebase/FirebaseUI-Flutter/issues/9858)). ([6badaf8e](https://github.com/firebase/FirebaseUI-Flutter/commit/6badaf8edcf931ca6b91dccca369e12c9f88b706))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/firebase/FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**(ui_shared): pass platform-specific icons and colors explicitly ([#10655](https://github.com/firebase/FirebaseUI-Flutter/issues/10655)). ([d4d48696](https://github.com/firebase/FirebaseUI-Flutter/commit/d4d48696643560f7e882097f40039625ee067f79))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/firebase/FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/FirebaseUI-Flutter/issues/9343)). ([1795911a](https://github.com/firebase/FirebaseUI-Flutter/commit/1795911a82d9507f9801663003a913f15b0f39b4))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([cf7aa79c](https://github.com/firebase/FirebaseUI-Flutter/commit/cf7aa79cbae0189e6e34a0c970d81e6cd4e5c25d))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([2b1e4a3d](https://github.com/firebase/FirebaseUI-Flutter/commit/2b1e4a3d968b0212881b0356464586c03ca71997))
 - **FEAT**: upgrade to dart 3 compatible dependencies ([#10890](https://github.com/firebase/FirebaseUI-Flutter/issues/10890)). ([857070d2](https://github.com/firebase/FirebaseUI-Flutter/commit/857070d21ab1046df95ef874e1592418c3587af9))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/firebase/FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**(ui_auth): allow passing custom user avatar widget ([#11161](https://github.com/firebase/FirebaseUI-Flutter/issues/11161)). ([1a4c004c](https://github.com/firebase/FirebaseUI-Flutter/commit/1a4c004cf928179cb15e1ad506d843136553d9a6))
 - **FEAT**(ui_auth): allow passing custom user avatar widget ([#11161](https://github.com/firebase/FirebaseUI-Flutter/issues/11161)). ([006556b7](https://github.com/firebase/FirebaseUI-Flutter/commit/006556b73a87067d0e82d414fc8be07ed5c5ebe4))
 - **FEAT**(auth): move to Pigeon for Platform channels ([#10802](https://github.com/firebase/FirebaseUI-Flutter/issues/10802)). ([651ed52b](https://github.com/firebase/FirebaseUI-Flutter/commit/651ed52b9bb7c8979ae189b36d4a9607f9c65e01))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/FirebaseUI-Flutter/issues/10496)). ([9ce686c6](https://github.com/firebase/FirebaseUI-Flutter/commit/9ce686c68d78e94165bde3a616702ec4c13a0fa5))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([a26682e0](https://github.com/firebase/FirebaseUI-Flutter/commit/a26682e0957ea983b82b5c48a2c54cec1d80995b))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([eea2c2e7](https://github.com/firebase/FirebaseUI-Flutter/commit/eea2c2e76aa268a2b8a1b9a42e8b985e06ea80b6))
 - **FEAT**(auth): move to Pigeon for Platform channels ([#10802](https://github.com/firebase/FirebaseUI-Flutter/issues/10802)). ([63268d03](https://github.com/firebase/FirebaseUI-Flutter/commit/63268d0388a3f0e7f09455c279016098869fe0b5))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/FirebaseUI-Flutter/issues/9343)). ([2d2db74d](https://github.com/firebase/FirebaseUI-Flutter/commit/2d2db74d984ecc75b712d4058d2e65058c88c8ad))
 - **DOCS**(ui_auth): fix typo in "platform ([#10247](https://github.com/firebase/FirebaseUI-Flutter/issues/10247)). ([b7300960](https://github.com/firebase/FirebaseUI-Flutter/commit/b73009604d5d41707ae2875ceaf9c273378302a7))
 - **DOCS**(ui_auth): add a font requirement ([#10293](https://github.com/firebase/FirebaseUI-Flutter/issues/10293)). ([0778db97](https://github.com/firebase/FirebaseUI-Flutter/commit/0778db97d63fc3dcf2b6105ec16043d83eeff7d3))
 - **DOCS**(firebase_ui_auth): fix return type of example main function ([#10342](https://github.com/firebase/FirebaseUI-Flutter/issues/10342)). ([ddae71ff](https://github.com/firebase/FirebaseUI-Flutter/commit/ddae71ff1777b848966ffbef1bbdfe4694964abb))
 - **DOCS**: Fixed typo on phone.md ([#10196](https://github.com/firebase/FirebaseUI-Flutter/issues/10196)). ([609e2dd3](https://github.com/firebase/FirebaseUI-Flutter/commit/609e2dd332cb9f9b290d8fd9d3b30e3b23afb19c))
 - **DOCS**(ui_auth): add docs links to the package README ([#10104](https://github.com/firebase/FirebaseUI-Flutter/issues/10104)). ([a15d0b9b](https://github.com/firebase/FirebaseUI-Flutter/commit/a15d0b9bd32568a5c12d33232533c4d2ec64efbb))
 - **DOCS**(ui_auth): Fixed typo 'EmaiAuthProvider' to 'EmailAuthProvider' ([#10654](https://github.com/firebase/FirebaseUI-Flutter/issues/10654)). ([daba3458](https://github.com/firebase/FirebaseUI-Flutter/commit/daba34580255ae6417a6b29255de2176b39d1548))
 - **DOCS**(ui_auth): fix typo RegisterScren -> RegisterScreen ([#10488](https://github.com/firebase/FirebaseUI-Flutter/issues/10488)). ([f3df6397](https://github.com/firebase/FirebaseUI-Flutter/commit/f3df6397ce23439dfea657cbdfa5ee4edc3219af))
 - **DOCS**(firebase_ui_auth): fix an error in the documentation ([#10797](https://github.com/firebase/FirebaseUI-Flutter/issues/10797)). ([e05537b1](https://github.com/firebase/FirebaseUI-Flutter/commit/e05537b155b77b668f36e6ed3d792b0b47234e98))
 - **DOCS**(firebase_ui_auth): fix phone provider's widget example ([#10917](https://github.com/firebase/FirebaseUI-Flutter/issues/10917)). ([9249f767](https://github.com/firebase/FirebaseUI-Flutter/commit/9249f767c2782d9ad7abf9cb307cc82cc25ef39f))
 - **DOCS**(ui_auth): update platform support matrix ([#9764](https://github.com/firebase/FirebaseUI-Flutter/issues/9764)). ([a0a0f374](https://github.com/firebase/FirebaseUI-Flutter/commit/a0a0f3742f8e92460d9478dfc7c1de33ecdb2e3b))
 - **DOCS**(ui_auth): improve phone.md  ([#9774](https://github.com/firebase/FirebaseUI-Flutter/issues/9774)). ([a0a0e0ba](https://github.com/firebase/FirebaseUI-Flutter/commit/a0a0e0ba0f30bd74ecd18dbaa46a90dad86261c5))
 - **DOCS**(ui_auth): add docs links to the package README ([#10104](https://github.com/firebase/FirebaseUI-Flutter/issues/10104)). ([3509c322](https://github.com/firebase/FirebaseUI-Flutter/commit/3509c322d7140011f6c7aa060ebd620f9460e16a))
 - **DOCS**: Fixed typo on phone.md ([#10196](https://github.com/firebase/FirebaseUI-Flutter/issues/10196)). ([8922419d](https://github.com/firebase/FirebaseUI-Flutter/commit/8922419d1938eb8b458e1f50c9035b57293c9a2b))
 - **DOCS**(ui_auth): Removed extra header and fixed typos ([#10248](https://github.com/firebase/FirebaseUI-Flutter/issues/10248)). ([b881a04e](https://github.com/firebase/FirebaseUI-Flutter/commit/b881a04e72a8475e11c1c342443f99ad060aeb4a))
 - **DOCS**(ui_auth): improve phone.md  ([#9774](https://github.com/firebase/FirebaseUI-Flutter/issues/9774)). ([4f4b51f8](https://github.com/firebase/FirebaseUI-Flutter/commit/4f4b51f81ae19f61262539a0a17403424e6b5e60))
 - **DOCS**(ui_auth): fix typo in "platform ([#10247](https://github.com/firebase/FirebaseUI-Flutter/issues/10247)). ([8254549a](https://github.com/firebase/FirebaseUI-Flutter/commit/8254549ab402e4cfb33617210bde6f8b30ce8f01))
 - **DOCS**(ui_auth): add a font requirement ([#10293](https://github.com/firebase/FirebaseUI-Flutter/issues/10293)). ([deef5210](https://github.com/firebase/FirebaseUI-Flutter/commit/deef521088ba4ea262209b4ed3800aac981bb328))
 - **DOCS**(firebase_ui_auth): fix return type of example main function ([#10342](https://github.com/firebase/FirebaseUI-Flutter/issues/10342)). ([8bfb084f](https://github.com/firebase/FirebaseUI-Flutter/commit/8bfb084fc7982d27ffc6c407e3e1a0d0159cc146))
 - **DOCS**(ui_auth): Fixed typo 'EmaiAuthProvider' to 'EmailAuthProvider' ([#10654](https://github.com/firebase/FirebaseUI-Flutter/issues/10654)). ([85e8256e](https://github.com/firebase/FirebaseUI-Flutter/commit/85e8256ed9120ced08ad9a26647fc9a4ff57ec53))
 - **DOCS**(ui_auth): fix typo RegisterScren -> RegisterScreen ([#10488](https://github.com/firebase/FirebaseUI-Flutter/issues/10488)). ([385f55ef](https://github.com/firebase/FirebaseUI-Flutter/commit/385f55ef28a25a1310cae44dca390bade376713a))
 - **DOCS**(ui_auth): update platform support matrix ([#9764](https://github.com/firebase/FirebaseUI-Flutter/issues/9764)). ([a99ea066](https://github.com/firebase/FirebaseUI-Flutter/commit/a99ea066a5182fa44a3efc7c888822589ddabbfd))
 - **DOCS**(firebase_ui_auth): fix an error in the documentation ([#10797](https://github.com/firebase/FirebaseUI-Flutter/issues/10797)). ([111dee9f](https://github.com/firebase/FirebaseUI-Flutter/commit/111dee9f68fb2405904b82b6ae59000ff52209af))
 - **DOCS**(firebase_ui_auth): fix phone provider's widget example ([#10917](https://github.com/firebase/FirebaseUI-Flutter/issues/10917)). ([0c5672eb](https://github.com/firebase/FirebaseUI-Flutter/commit/0c5672eb813632b1c9a26c6c1eb1d7f1270d3931))
 - **DOCS**(ui_auth): Removed extra header and fixed typos ([#10248](https://github.com/firebase/FirebaseUI-Flutter/issues/10248)). ([b1434359](https://github.com/firebase/FirebaseUI-Flutter/commit/b1434359af8227a1cdc966d4ad0fc93bcbb1bc92))

#### `firebase_ui_database` - `v1.4.0`

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/FirebaseUI-Flutter/issues/10344)). ([c9364bb6](https://github.com/firebase/FirebaseUI-Flutter/commit/c9364bb65dd479f00d646a4061673167dd26aa67))
 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/FirebaseUI-Flutter/issues/10344)). ([4f7a8050](https://github.com/firebase/FirebaseUI-Flutter/commit/4f7a8050b2fbed2cfcc3c6896a5af22df0df0442))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/FirebaseUI-Flutter/issues/10901)). ([81a1bf47](https://github.com/firebase/FirebaseUI-Flutter/commit/81a1bf47166765349ed02a87ad2f5f41929c7fcc))
 - **FIX**: allow to unlink providers only in edit mode ([#10649](https://github.com/firebase/FirebaseUI-Flutter/issues/10649)). ([aa217855](https://github.com/firebase/FirebaseUI-Flutter/commit/aa2178557aca63d484eb2a8abb108a07081ba8bb))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/firebase/FirebaseUI-Flutter/issues/9756)). ([9fde266e](https://github.com/firebase/FirebaseUI-Flutter/commit/9fde266e8df7dc028b53ce21b71699d758171b71))
 - **FIX**(ui): improve pub score ([#9722](https://github.com/firebase/FirebaseUI-Flutter/issues/9722)). ([12ee1bb0](https://github.com/firebase/FirebaseUI-Flutter/commit/12ee1bb049e4b26e65cc30c2d149e7fdb8c42f1e))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/FirebaseUI-Flutter/issues/10901)). ([f6df184c](https://github.com/firebase/FirebaseUI-Flutter/commit/f6df184cfec4892cda7bc19d58bf81539b295c61))
 - **FIX**: allow to unlink providers only in edit mode ([#10649](https://github.com/firebase/FirebaseUI-Flutter/issues/10649)). ([059ee882](https://github.com/firebase/FirebaseUI-Flutter/commit/059ee8827c5fa905132dfaf6c75f2e47e5d73b9f))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/firebase/FirebaseUI-Flutter/issues/9756)). ([dd41fcb6](https://github.com/firebase/FirebaseUI-Flutter/commit/dd41fcb6fecf4511a881dd034d4a181080b4a00d))
 - **FIX**(ui): improve pub score ([#9722](https://github.com/firebase/FirebaseUI-Flutter/issues/9722)). ([08dd9380](https://github.com/firebase/FirebaseUI-Flutter/commit/08dd9380c908005092efa7322f8eff179ab9472a))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/firebase/FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/firebase/FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/FirebaseUI-Flutter/issues/10496)). ([9ce686c6](https://github.com/firebase/FirebaseUI-Flutter/commit/9ce686c68d78e94165bde3a616702ec4c13a0fa5))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/firebase/FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui): add firebase_ui_database ([#9341](https://github.com/firebase/FirebaseUI-Flutter/issues/9341)). ([3a1e60a2](https://github.com/firebase/FirebaseUI-Flutter/commit/3a1e60a2b014bcef6b36c4841b8d29f284f66654))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([a26682e0](https://github.com/firebase/FirebaseUI-Flutter/commit/a26682e0957ea983b82b5c48a2c54cec1d80995b))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([eea2c2e7](https://github.com/firebase/FirebaseUI-Flutter/commit/eea2c2e76aa268a2b8a1b9a42e8b985e06ea80b6))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/FirebaseUI-Flutter/issues/10496)). ([930becc3](https://github.com/firebase/FirebaseUI-Flutter/commit/930becc3ddbffcd65f4c79bd2973994e1be396d3))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([cf7aa79c](https://github.com/firebase/FirebaseUI-Flutter/commit/cf7aa79cbae0189e6e34a0c970d81e6cd4e5c25d))
 - **FEAT**(ui): add firebase_ui_database ([#9341](https://github.com/firebase/FirebaseUI-Flutter/issues/9341)). ([386ef6e3](https://github.com/firebase/FirebaseUI-Flutter/commit/386ef6e3848404dd8504901a80d4e0e6e32c0407))

#### `firebase_ui_firestore` - `v1.6.0`

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/FirebaseUI-Flutter/issues/10344)). ([c9364bb6](https://github.com/firebase/FirebaseUI-Flutter/commit/c9364bb65dd479f00d646a4061673167dd26aa67))
 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/FirebaseUI-Flutter/issues/10344)). ([4f7a8050](https://github.com/firebase/FirebaseUI-Flutter/commit/4f7a8050b2fbed2cfcc3c6896a5af22df0df0442))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/FirebaseUI-Flutter/issues/10901)). ([81a1bf47](https://github.com/firebase/FirebaseUI-Flutter/commit/81a1bf47166765349ed02a87ad2f5f41929c7fcc))
 - **FIX**: allow to unlink providers only in edit mode ([#10649](https://github.com/firebase/FirebaseUI-Flutter/issues/10649)). ([aa217855](https://github.com/firebase/FirebaseUI-Flutter/commit/aa2178557aca63d484eb2a8abb108a07081ba8bb))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/firebase/FirebaseUI-Flutter/issues/9756)). ([9fde266e](https://github.com/firebase/FirebaseUI-Flutter/commit/9fde266e8df7dc028b53ce21b71699d758171b71))
 - **FIX**(ui): improve pub score ([#9722](https://github.com/firebase/FirebaseUI-Flutter/issues/9722)). ([12ee1bb0](https://github.com/firebase/FirebaseUI-Flutter/commit/12ee1bb049e4b26e65cc30c2d149e7fdb8c42f1e))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/FirebaseUI-Flutter/issues/10901)). ([f6df184c](https://github.com/firebase/FirebaseUI-Flutter/commit/f6df184cfec4892cda7bc19d58bf81539b295c61))
 - **FIX**: allow to unlink providers only in edit mode ([#10649](https://github.com/firebase/FirebaseUI-Flutter/issues/10649)). ([059ee882](https://github.com/firebase/FirebaseUI-Flutter/commit/059ee8827c5fa905132dfaf6c75f2e47e5d73b9f))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/firebase/FirebaseUI-Flutter/issues/9756)). ([dd41fcb6](https://github.com/firebase/FirebaseUI-Flutter/commit/dd41fcb6fecf4511a881dd034d4a181080b4a00d))
 - **FIX**(ui): improve pub score ([#9722](https://github.com/firebase/FirebaseUI-Flutter/issues/9722)). ([08dd9380](https://github.com/firebase/FirebaseUI-Flutter/commit/08dd9380c908005092efa7322f8eff179ab9472a))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/firebase/FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/firebase/FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/FirebaseUI-Flutter/issues/10496)). ([9ce686c6](https://github.com/firebase/FirebaseUI-Flutter/commit/9ce686c68d78e94165bde3a616702ec4c13a0fa5))
 - **FEAT**: upgrade to dart 3 compatible dependencies ([#10890](https://github.com/firebase/FirebaseUI-Flutter/issues/10890)). ([857070d2](https://github.com/firebase/FirebaseUI-Flutter/commit/857070d21ab1046df95ef874e1592418c3587af9))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/firebase/FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui_firestore): use aggregate query to display total rows count in DataTable ([#10113](https://github.com/firebase/FirebaseUI-Flutter/issues/10113)). ([09f6a072](https://github.com/firebase/FirebaseUI-Flutter/commit/09f6a072d36c07f3909d2a672ae8c8b0f8c0c10d))
 - **FEAT**(ui_firestore): Added empty builder in FirestoreListView ([#9916](https://github.com/firebase/FirebaseUI-Flutter/issues/9916)). ([25a582a1](https://github.com/firebase/FirebaseUI-Flutter/commit/25a582a162e4e6b3d75cf5c6fbc521921d59ffeb))
 - **FEAT**(ui): add firebase_ui_firestore ([#9342](https://github.com/firebase/FirebaseUI-Flutter/issues/9342)). ([06fce9b2](https://github.com/firebase/FirebaseUI-Flutter/commit/06fce9b287ec0101e067337d473d4d8aae0e3edf))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([a26682e0](https://github.com/firebase/FirebaseUI-Flutter/commit/a26682e0957ea983b82b5c48a2c54cec1d80995b))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([eea2c2e7](https://github.com/firebase/FirebaseUI-Flutter/commit/eea2c2e76aa268a2b8a1b9a42e8b985e06ea80b6))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/FirebaseUI-Flutter/issues/10496)). ([930becc3](https://github.com/firebase/FirebaseUI-Flutter/commit/930becc3ddbffcd65f4c79bd2973994e1be396d3))
 - **FEAT**: upgrade to dart 3 compatible dependencies ([#10890](https://github.com/firebase/FirebaseUI-Flutter/issues/10890)). ([19794810](https://github.com/firebase/FirebaseUI-Flutter/commit/19794810caeaf45e32e45be88b4efd6714b98859))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([cf7aa79c](https://github.com/firebase/FirebaseUI-Flutter/commit/cf7aa79cbae0189e6e34a0c970d81e6cd4e5c25d))
 - **FEAT**(ui_firestore): use aggregate query to display total rows count in DataTable ([#10113](https://github.com/firebase/FirebaseUI-Flutter/issues/10113)). ([ea4b4a42](https://github.com/firebase/FirebaseUI-Flutter/commit/ea4b4a4233727f7c0680090d8addbdd0f3b0a071))
 - **FEAT**(ui_firestore): Added empty builder in FirestoreListView ([#9916](https://github.com/firebase/FirebaseUI-Flutter/issues/9916)). ([540c8728](https://github.com/firebase/FirebaseUI-Flutter/commit/540c8728ff387e90f93ac8ff66a65e7f3b220caa))
 - **FEAT**(ui): add firebase_ui_firestore ([#9342](https://github.com/firebase/FirebaseUI-Flutter/issues/9342)). ([39b647e7](https://github.com/firebase/FirebaseUI-Flutter/commit/39b647e7ba2fbf023812d049d350956d8f79dedd))

#### `firebase_ui_localizations` - `v1.6.0`

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/FirebaseUI-Flutter/issues/10344)). ([c9364bb6](https://github.com/firebase/FirebaseUI-Flutter/commit/c9364bb65dd479f00d646a4061673167dd26aa67))
 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/FirebaseUI-Flutter/issues/10344)). ([4f7a8050](https://github.com/firebase/FirebaseUI-Flutter/commit/4f7a8050b2fbed2cfcc3c6896a5af22df0df0442))
 - **FIX**(firebase_ui_localizations): fixed register translation for turkish ([#11339](https://github.com/firebase/FirebaseUI-Flutter/issues/11339)). ([074f82ca](https://github.com/firebase/FirebaseUI-Flutter/commit/074f82ca9b5f7fd2a320c6ed446e15c666179b84))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/FirebaseUI-Flutter/issues/10901)). ([81a1bf47](https://github.com/firebase/FirebaseUI-Flutter/commit/81a1bf47166765349ed02a87ad2f5f41929c7fcc))
 - **FIX**(ui_localizations): drop intl dependency as it is not used ([#10856](https://github.com/firebase/FirebaseUI-Flutter/issues/10856)). ([498fddae](https://github.com/firebase/FirebaseUI-Flutter/commit/498fddaeea1b09dd44f0d9686e68f4aca42c05f5))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/firebase/FirebaseUI-Flutter/issues/9756)). ([9fde266e](https://github.com/firebase/FirebaseUI-Flutter/commit/9fde266e8df7dc028b53ce21b71699d758171b71))
 - **FIX**(ui): improve pub score ([#9722](https://github.com/firebase/FirebaseUI-Flutter/issues/9722)). ([12ee1bb0](https://github.com/firebase/FirebaseUI-Flutter/commit/12ee1bb049e4b26e65cc30c2d149e7fdb8c42f1e))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/FirebaseUI-Flutter/issues/10901)). ([f6df184c](https://github.com/firebase/FirebaseUI-Flutter/commit/f6df184cfec4892cda7bc19d58bf81539b295c61))
 - **FIX**(ui_localizations): drop intl dependency as it is not used ([#10856](https://github.com/firebase/FirebaseUI-Flutter/issues/10856)). ([cba29baf](https://github.com/firebase/FirebaseUI-Flutter/commit/cba29bafc4563d09957ca9db494eb2f04bffa225))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/firebase/FirebaseUI-Flutter/issues/9756)). ([dd41fcb6](https://github.com/firebase/FirebaseUI-Flutter/commit/dd41fcb6fecf4511a881dd034d4a181080b4a00d))
 - **FIX**(ui): improve pub score ([#9722](https://github.com/firebase/FirebaseUI-Flutter/issues/9722)). ([08dd9380](https://github.com/firebase/FirebaseUI-Flutter/commit/08dd9380c908005092efa7322f8eff179ab9472a))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/firebase/FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/firebase/FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/FirebaseUI-Flutter/issues/10496)). ([9ce686c6](https://github.com/firebase/FirebaseUI-Flutter/commit/9ce686c68d78e94165bde3a616702ec4c13a0fa5))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/firebase/FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([79f76d3a](https://github.com/firebase/FirebaseUI-Flutter/commit/79f76d3a886288738ccfdcbcd2d07e76c6e5a52e))
 - **FEAT**: Added Hebrew language to firebase_ui_localizations ([#10300](https://github.com/firebase/FirebaseUI-Flutter/issues/10300)). ([fe0f5064](https://github.com/firebase/FirebaseUI-Flutter/commit/fe0f5064f740cf8159f88f67b2bab5b6b4f3fc95))
 - **FEAT**(ui_auth): added Hungarian localization ([#10111](https://github.com/firebase/FirebaseUI-Flutter/issues/10111)). ([5c498095](https://github.com/firebase/FirebaseUI-Flutter/commit/5c498095fcdc836cdde6dcd17c7f7ba2aae0ded2))
 - **FEAT**(ui): generate labels from .arb ([#9340](https://github.com/firebase/FirebaseUI-Flutter/issues/9340)). ([e062ce72](https://github.com/firebase/FirebaseUI-Flutter/commit/e062ce72b182e82be922b426b97402631eae3e03))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([a26682e0](https://github.com/firebase/FirebaseUI-Flutter/commit/a26682e0957ea983b82b5c48a2c54cec1d80995b))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([eea2c2e7](https://github.com/firebase/FirebaseUI-Flutter/commit/eea2c2e76aa268a2b8a1b9a42e8b985e06ea80b6))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/FirebaseUI-Flutter/issues/10496)). ([930becc3](https://github.com/firebase/FirebaseUI-Flutter/commit/930becc3ddbffcd65f4c79bd2973994e1be396d3))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([cf7aa79c](https://github.com/firebase/FirebaseUI-Flutter/commit/cf7aa79cbae0189e6e34a0c970d81e6cd4e5c25d))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([2b1e4a3d](https://github.com/firebase/FirebaseUI-Flutter/commit/2b1e4a3d968b0212881b0356464586c03ca71997))
 - **FEAT**: Added Hebrew language to firebase_ui_localizations ([#10300](https://github.com/firebase/FirebaseUI-Flutter/issues/10300)). ([9b928677](https://github.com/firebase/FirebaseUI-Flutter/commit/9b92867720dbc328a4a067a6bde893586ba6ba85))
 - **FEAT**(ui_auth): added Hungarian localization ([#10111](https://github.com/firebase/FirebaseUI-Flutter/issues/10111)). ([de3933a7](https://github.com/firebase/FirebaseUI-Flutter/commit/de3933a7387bda042892288ecd8b1b996e7d99e3))
 - **FEAT**(ui): generate labels from .arb ([#9340](https://github.com/firebase/FirebaseUI-Flutter/issues/9340)). ([583fa74a](https://github.com/firebase/FirebaseUI-Flutter/commit/583fa74a99dc2983c54cf8d90b1ed46c5b912aec))

#### `firebase_ui_oauth` - `v1.5.0`

 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/FirebaseUI-Flutter/issues/10344)). ([c9364bb6](https://github.com/firebase/FirebaseUI-Flutter/commit/c9364bb65dd479f00d646a4061673167dd26aa67))
 - **REFACTOR**: upgrade project to remove warnings from Flutter 3.7 ([#10344](https://github.com/firebase/FirebaseUI-Flutter/issues/10344)). ([4f7a8050](https://github.com/firebase/FirebaseUI-Flutter/commit/4f7a8050b2fbed2cfcc3c6896a5af22df0df0442))
 - **FIX**(ui_auth): fix linking OAuthProvider from ProfileScreen ([#11168](https://github.com/firebase/FirebaseUI-Flutter/issues/11168)). ([a8a6f862](https://github.com/firebase/FirebaseUI-Flutter/commit/a8a6f862083b232755a2aa2533a8de7afdebcc4c))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/FirebaseUI-Flutter/issues/10901)). ([81a1bf47](https://github.com/firebase/FirebaseUI-Flutter/commit/81a1bf47166765349ed02a87ad2f5f41929c7fcc))
 - **FIX**(firebase_ui_oauth): fix OAuth provider buttons paddings ([#9991](https://github.com/firebase/FirebaseUI-Flutter/issues/9991)). ([34aae12a](https://github.com/firebase/FirebaseUI-Flutter/commit/34aae12a8107bdc43707ebb28f327533c4c90647))
 - **FIX**(firebase_ui_oauth): Made ThemedOAuthProviderButtonStyle.iconPadding work. ([ddf20a92](https://github.com/firebase/FirebaseUI-Flutter/commit/ddf20a92bec1a0014f0d1f37224cae23d5f884f2))
 - **FIX**(ui_oauth): initialize auth and auth listener in standalone OAuth buttons ([#9926](https://github.com/firebase/FirebaseUI-Flutter/issues/9926)). ([d52d58b8](https://github.com/firebase/FirebaseUI-Flutter/commit/d52d58b83355a19daf2f7373cb9bffd6233237bd))
 - **FIX**(ui_auth): upgrade dependency to fix platform support for firebase_ui_auth ([#9924](https://github.com/firebase/FirebaseUI-Flutter/issues/9924)). ([13004220](https://github.com/firebase/FirebaseUI-Flutter/commit/130042208ebe5a285dc87c1a2517c55ae1a53737))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/firebase/FirebaseUI-Flutter/issues/9756)). ([9fde266e](https://github.com/firebase/FirebaseUI-Flutter/commit/9fde266e8df7dc028b53ce21b71699d758171b71))
 - **FIX**(ui_auth): fix linking OAuthProvider from ProfileScreen ([#11168](https://github.com/firebase/FirebaseUI-Flutter/issues/11168)). ([c6962eb6](https://github.com/firebase/FirebaseUI-Flutter/commit/c6962eb6f52bb6872747f8d0aaf1bfc843b1b061))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/FirebaseUI-Flutter/issues/10901)). ([f6df184c](https://github.com/firebase/FirebaseUI-Flutter/commit/f6df184cfec4892cda7bc19d58bf81539b295c61))
 - **FIX**(firebase_ui_oauth): fix OAuth provider buttons paddings ([#9991](https://github.com/firebase/FirebaseUI-Flutter/issues/9991)). ([e06b8875](https://github.com/firebase/FirebaseUI-Flutter/commit/e06b8875365869ec2ea77d97e4f77dba9d86c75a))
 - **FIX**(firebase_ui_oauth): Made ThemedOAuthProviderButtonStyle.iconPadding work. ([8c73271d](https://github.com/firebase/FirebaseUI-Flutter/commit/8c73271d2b013262301d0f24053276f9c0d38cc4))
 - **FIX**(ui_oauth): initialize auth and auth listener in standalone OAuth buttons ([#9926](https://github.com/firebase/FirebaseUI-Flutter/issues/9926)). ([89c99654](https://github.com/firebase/FirebaseUI-Flutter/commit/89c9965481637f19361e7a09e8f770b86d668499))
 - **FIX**(ui_auth): upgrade dependency to fix platform support for firebase_ui_auth ([#9924](https://github.com/firebase/FirebaseUI-Flutter/issues/9924)). ([254095a6](https://github.com/firebase/FirebaseUI-Flutter/commit/254095a6639768c62f0790c7c4f2c16ee06d30a1))
 - **FIX**(ui): bump dependencies ([#9756](https://github.com/firebase/FirebaseUI-Flutter/issues/9756)). ([dd41fcb6](https://github.com/firebase/FirebaseUI-Flutter/commit/dd41fcb6fecf4511a881dd034d4a181080b4a00d))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/firebase/FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/firebase/FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/FirebaseUI-Flutter/issues/10496)). ([9ce686c6](https://github.com/firebase/FirebaseUI-Flutter/commit/9ce686c68d78e94165bde3a616702ec4c13a0fa5))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/firebase/FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([79f76d3a](https://github.com/firebase/FirebaseUI-Flutter/commit/79f76d3a886288738ccfdcbcd2d07e76c6e5a52e))
 - **FEAT**: [firebase_ui_auth] [firebase_ui_oauth] Allow for custom labels to be used for custom OAuth providers ([#9858](https://github.com/firebase/FirebaseUI-Flutter/issues/9858)). ([6badaf8e](https://github.com/firebase/FirebaseUI-Flutter/commit/6badaf8edcf931ca6b91dccca369e12c9f88b706))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/FirebaseUI-Flutter/issues/9343)). ([2d2db74d](https://github.com/firebase/FirebaseUI-Flutter/commit/2d2db74d984ecc75b712d4058d2e65058c88c8ad))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([a26682e0](https://github.com/firebase/FirebaseUI-Flutter/commit/a26682e0957ea983b82b5c48a2c54cec1d80995b))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([eea2c2e7](https://github.com/firebase/FirebaseUI-Flutter/commit/eea2c2e76aa268a2b8a1b9a42e8b985e06ea80b6))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/FirebaseUI-Flutter/issues/10496)). ([930becc3](https://github.com/firebase/FirebaseUI-Flutter/commit/930becc3ddbffcd65f4c79bd2973994e1be396d3))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([cf7aa79c](https://github.com/firebase/FirebaseUI-Flutter/commit/cf7aa79cbae0189e6e34a0c970d81e6cd4e5c25d))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([2b1e4a3d](https://github.com/firebase/FirebaseUI-Flutter/commit/2b1e4a3d968b0212881b0356464586c03ca71997))
 - **FEAT**: [firebase_ui_auth] [firebase_ui_oauth] Allow for custom labels to be used for custom OAuth providers ([#9858](https://github.com/firebase/FirebaseUI-Flutter/issues/9858)). ([3d967041](https://github.com/firebase/FirebaseUI-Flutter/commit/3d96704140ec482392dc7638c0eba92808e7bc2c))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/FirebaseUI-Flutter/issues/9343)). ([1795911a](https://github.com/firebase/FirebaseUI-Flutter/commit/1795911a82d9507f9801663003a913f15b0f39b4))

#### `firebase_ui_oauth_apple` - `v1.3.0`

 - **FIX**(ui_oauth_apple): set default scope to 'email' and add a way to provide custom scopes ([#9784](https://github.com/firebase/FirebaseUI-Flutter/issues/9784)). ([cec68582](https://github.com/firebase/FirebaseUI-Flutter/commit/cec68582b904ff043dfd3560ea4ccf2984a5bccf))
 - **FIX**(ui_oauth_apple): set default scope to 'email' and add a way to provide custom scopes ([#9784](https://github.com/firebase/FirebaseUI-Flutter/issues/9784)). ([730e5274](https://github.com/firebase/FirebaseUI-Flutter/commit/730e5274747e06e4e32ddb1b7e466699888088e3))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/firebase/FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/firebase/FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/firebase/FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([79f76d3a](https://github.com/firebase/FirebaseUI-Flutter/commit/79f76d3a886288738ccfdcbcd2d07e76c6e5a52e))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/FirebaseUI-Flutter/issues/9343)). ([2d2db74d](https://github.com/firebase/FirebaseUI-Flutter/commit/2d2db74d984ecc75b712d4058d2e65058c88c8ad))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([a26682e0](https://github.com/firebase/FirebaseUI-Flutter/commit/a26682e0957ea983b82b5c48a2c54cec1d80995b))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([eea2c2e7](https://github.com/firebase/FirebaseUI-Flutter/commit/eea2c2e76aa268a2b8a1b9a42e8b985e06ea80b6))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([cf7aa79c](https://github.com/firebase/FirebaseUI-Flutter/commit/cf7aa79cbae0189e6e34a0c970d81e6cd4e5c25d))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([2b1e4a3d](https://github.com/firebase/FirebaseUI-Flutter/commit/2b1e4a3d968b0212881b0356464586c03ca71997))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/FirebaseUI-Flutter/issues/9343)). ([1795911a](https://github.com/firebase/FirebaseUI-Flutter/commit/1795911a82d9507f9801663003a913f15b0f39b4))
 - **DOCS**(ui_auth): Fixed typo in firebase_ui_oauth packages for firebase_ui_auth package. ([#9931](https://github.com/firebase/FirebaseUI-Flutter/issues/9931)). ([9de6a764](https://github.com/firebase/FirebaseUI-Flutter/commit/9de6a764879e03dd9c3c546a99c1321e68c3bd18))
 - **DOCS**(ui_auth): Fixed typo in firebase_ui_oauth packages for firebase_ui_auth package. ([#9931](https://github.com/firebase/FirebaseUI-Flutter/issues/9931)). ([0f45fe84](https://github.com/firebase/FirebaseUI-Flutter/commit/0f45fe84014d35b00ab088b8ade3c3fa3e58ea68))

#### `firebase_ui_oauth_facebook` - `v1.3.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/firebase/FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/firebase/FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/firebase/FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([79f76d3a](https://github.com/firebase/FirebaseUI-Flutter/commit/79f76d3a886288738ccfdcbcd2d07e76c6e5a52e))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/FirebaseUI-Flutter/issues/9343)). ([2d2db74d](https://github.com/firebase/FirebaseUI-Flutter/commit/2d2db74d984ecc75b712d4058d2e65058c88c8ad))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([a26682e0](https://github.com/firebase/FirebaseUI-Flutter/commit/a26682e0957ea983b82b5c48a2c54cec1d80995b))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([eea2c2e7](https://github.com/firebase/FirebaseUI-Flutter/commit/eea2c2e76aa268a2b8a1b9a42e8b985e06ea80b6))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([cf7aa79c](https://github.com/firebase/FirebaseUI-Flutter/commit/cf7aa79cbae0189e6e34a0c970d81e6cd4e5c25d))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([2b1e4a3d](https://github.com/firebase/FirebaseUI-Flutter/commit/2b1e4a3d968b0212881b0356464586c03ca71997))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/FirebaseUI-Flutter/issues/9343)). ([1795911a](https://github.com/firebase/FirebaseUI-Flutter/commit/1795911a82d9507f9801663003a913f15b0f39b4))
 - **DOCS**(ui_auth): Fixed typo in firebase_ui_oauth packages for firebase_ui_auth package. ([#9931](https://github.com/firebase/FirebaseUI-Flutter/issues/9931)). ([9de6a764](https://github.com/firebase/FirebaseUI-Flutter/commit/9de6a764879e03dd9c3c546a99c1321e68c3bd18))
 - **DOCS**(ui_auth): Fixed typo in firebase_ui_oauth packages for firebase_ui_auth package. ([#9931](https://github.com/firebase/FirebaseUI-Flutter/issues/9931)). ([0f45fe84](https://github.com/firebase/FirebaseUI-Flutter/commit/0f45fe84014d35b00ab088b8ade3c3fa3e58ea68))

#### `firebase_ui_oauth_google` - `v1.3.0`

 - **FIX**(ui_auth_google): bump google_sign_in version ([#10531](https://github.com/firebase/FirebaseUI-Flutter/issues/10531)). ([b9059c25](https://github.com/firebase/FirebaseUI-Flutter/commit/b9059c25f486f5c4b5037e9442f066a23ad0f614))
 - **FIX**(ui_auth,ui_oauth_google): allow GoogleService-Info.plist based configuration ([#10360](https://github.com/firebase/FirebaseUI-Flutter/issues/10360)). ([c1bc63bb](https://github.com/firebase/FirebaseUI-Flutter/commit/c1bc63bbacf9ba1fb65801c9b0189e592c58347a))
 - **FIX**(ui_oauth_google,android): fix an issue with Google Sign In where the clientId was passed on Android ([#10017](https://github.com/firebase/FirebaseUI-Flutter/issues/10017)). ([97c9fe8b](https://github.com/firebase/FirebaseUI-Flutter/commit/97c9fe8b13d09bbaf823a2ad7481d742fc569625))
 - **FIX**(ui_oauth_google): Pass the clientId into GoogleSignIn ([#9823](https://github.com/firebase/FirebaseUI-Flutter/issues/9823)). ([06b66ea2](https://github.com/firebase/FirebaseUI-Flutter/commit/06b66ea29066a3d3475e4d0ab9cbc1ccbc590b99))
 - **FIX**(ui_auth_google): bump google_sign_in version ([#10531](https://github.com/firebase/FirebaseUI-Flutter/issues/10531)). ([2edd6574](https://github.com/firebase/FirebaseUI-Flutter/commit/2edd6574f82954279dce6fc36819224c9c2ce8fd))
 - **FIX**(ui_auth,ui_oauth_google): allow GoogleService-Info.plist based configuration ([#10360](https://github.com/firebase/FirebaseUI-Flutter/issues/10360)). ([514af68a](https://github.com/firebase/FirebaseUI-Flutter/commit/514af68ad3555a84d9e3ed28acc481169bb873d6))
 - **FIX**(ui_oauth_google,android): fix an issue with Google Sign In where the clientId was passed on Android ([#10017](https://github.com/firebase/FirebaseUI-Flutter/issues/10017)). ([93db38b6](https://github.com/firebase/FirebaseUI-Flutter/commit/93db38b66160850e0e3bb510d9e88ba9df2faec0))
 - **FIX**(ui_oauth_google): Pass the clientId into GoogleSignIn ([#9823](https://github.com/firebase/FirebaseUI-Flutter/issues/9823)). ([00bd4236](https://github.com/firebase/FirebaseUI-Flutter/commit/00bd423607abe9d3aaef4cb49835ee439947f19e))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/firebase/FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/firebase/FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/firebase/FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([79f76d3a](https://github.com/firebase/FirebaseUI-Flutter/commit/79f76d3a886288738ccfdcbcd2d07e76c6e5a52e))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/FirebaseUI-Flutter/issues/9343)). ([2d2db74d](https://github.com/firebase/FirebaseUI-Flutter/commit/2d2db74d984ecc75b712d4058d2e65058c88c8ad))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([a26682e0](https://github.com/firebase/FirebaseUI-Flutter/commit/a26682e0957ea983b82b5c48a2c54cec1d80995b))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([eea2c2e7](https://github.com/firebase/FirebaseUI-Flutter/commit/eea2c2e76aa268a2b8a1b9a42e8b985e06ea80b6))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([cf7aa79c](https://github.com/firebase/FirebaseUI-Flutter/commit/cf7aa79cbae0189e6e34a0c970d81e6cd4e5c25d))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([2b1e4a3d](https://github.com/firebase/FirebaseUI-Flutter/commit/2b1e4a3d968b0212881b0356464586c03ca71997))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/FirebaseUI-Flutter/issues/9343)). ([1795911a](https://github.com/firebase/FirebaseUI-Flutter/commit/1795911a82d9507f9801663003a913f15b0f39b4))
 - **DOCS**(ui_auth): Fixed typo in firebase_ui_oauth packages for firebase_ui_auth package. ([#9931](https://github.com/firebase/FirebaseUI-Flutter/issues/9931)). ([9de6a764](https://github.com/firebase/FirebaseUI-Flutter/commit/9de6a764879e03dd9c3c546a99c1321e68c3bd18))
 - **DOCS**(ui_auth): Fixed typo in firebase_ui_oauth packages for firebase_ui_auth package. ([#9931](https://github.com/firebase/FirebaseUI-Flutter/issues/9931)). ([0f45fe84](https://github.com/firebase/FirebaseUI-Flutter/commit/0f45fe84014d35b00ab088b8ade3c3fa3e58ea68))

#### `firebase_ui_oauth_twitter` - `v1.3.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/firebase/FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([6a6b02b1](https://github.com/firebase/FirebaseUI-Flutter/commit/6a6b02b1125dbbe266fcc7dab379769d2fa6e4b3))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([882d9205](https://github.com/firebase/FirebaseUI-Flutter/commit/882d9205325674648c02726ae1c16597012c5bdf))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([79f76d3a](https://github.com/firebase/FirebaseUI-Flutter/commit/79f76d3a886288738ccfdcbcd2d07e76c6e5a52e))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/FirebaseUI-Flutter/issues/9343)). ([2d2db74d](https://github.com/firebase/FirebaseUI-Flutter/commit/2d2db74d984ecc75b712d4058d2e65058c88c8ad))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([a26682e0](https://github.com/firebase/FirebaseUI-Flutter/commit/a26682e0957ea983b82b5c48a2c54cec1d80995b))
 - **FEAT**: update librairies to be compatible with Flutter 3.10.0 ([#10944](https://github.com/firebase/FirebaseUI-Flutter/issues/10944)). ([eea2c2e7](https://github.com/firebase/FirebaseUI-Flutter/commit/eea2c2e76aa268a2b8a1b9a42e8b985e06ea80b6))
 - **FEAT**: bump dart sdk constraint to 2.18 ([#10618](https://github.com/firebase/FirebaseUI-Flutter/issues/10618)). ([cf7aa79c](https://github.com/firebase/FirebaseUI-Flutter/commit/cf7aa79cbae0189e6e34a0c970d81e6cd4e5c25d))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([2b1e4a3d](https://github.com/firebase/FirebaseUI-Flutter/commit/2b1e4a3d968b0212881b0356464586c03ca71997))
 - **FEAT**(ui): add firebase_ui_auth and oauth providers ([#9343](https://github.com/firebase/FirebaseUI-Flutter/issues/9343)). ([1795911a](https://github.com/firebase/FirebaseUI-Flutter/commit/1795911a82d9507f9801663003a913f15b0f39b4))
 - **DOCS**(ui_auth): Fixed typo in firebase_ui_oauth packages for firebase_ui_auth package. ([#9931](https://github.com/firebase/FirebaseUI-Flutter/issues/9931)). ([9de6a764](https://github.com/firebase/FirebaseUI-Flutter/commit/9de6a764879e03dd9c3c546a99c1321e68c3bd18))
 - **DOCS**(ui_auth): Fixed typo in firebase_ui_oauth packages for firebase_ui_auth package. ([#9931](https://github.com/firebase/FirebaseUI-Flutter/issues/9931)). ([0f45fe84](https://github.com/firebase/FirebaseUI-Flutter/commit/0f45fe84014d35b00ab088b8ade3c3fa3e58ea68))

#### `firebase_ui_shared` - `v1.4.0`

 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/firebase/FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**(ui_storage): configuration API and UploadButton widget ([#10699](https://github.com/firebase/FirebaseUI-Flutter/issues/10699)). ([00f8155f](https://github.com/firebase/FirebaseUI-Flutter/commit/00f8155f17f0f0ef1a715b7a5fb85e42f0d5dafa))
 - **FEAT**(ui_shared): pass platform-specific icons and colors explicitly ([#10655](https://github.com/firebase/FirebaseUI-Flutter/issues/10655)). ([c7ac28a5](https://github.com/firebase/FirebaseUI-Flutter/commit/c7ac28a59ba2787228c71e12bb02dc786db14fcd))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([79f76d3a](https://github.com/firebase/FirebaseUI-Flutter/commit/79f76d3a886288738ccfdcbcd2d07e76c6e5a52e))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([a26682e0](https://github.com/firebase/FirebaseUI-Flutter/commit/a26682e0957ea983b82b5c48a2c54cec1d80995b))
 - **FEAT**(ui_storage): configuration API and UploadButton widget ([#10699](https://github.com/firebase/FirebaseUI-Flutter/issues/10699)). ([2712ac47](https://github.com/firebase/FirebaseUI-Flutter/commit/2712ac47bddbde4e6f70bc75b5ccc746b4107097))
 - **FEAT**(ui_shared): pass platform-specific icons and colors explicitly ([#10655](https://github.com/firebase/FirebaseUI-Flutter/issues/10655)). ([d4d48696](https://github.com/firebase/FirebaseUI-Flutter/commit/d4d48696643560f7e882097f40039625ee067f79))
 - **FEAT**(ui_shared): extract common widgets to a shared library ([#10620](https://github.com/firebase/FirebaseUI-Flutter/issues/10620)). ([2b1e4a3d](https://github.com/firebase/FirebaseUI-Flutter/commit/2b1e4a3d968b0212881b0356464586c03ca71997))

#### `firebase_ui_storage` - `v0.1.0-dev.9`

 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/FirebaseUI-Flutter/issues/10901)). ([81a1bf47](https://github.com/firebase/FirebaseUI-Flutter/commit/81a1bf47166765349ed02a87ad2f5f41929c7fcc))
 - **FIX**: add support for AGP 8.0 ([#10901](https://github.com/firebase/FirebaseUI-Flutter/issues/10901)). ([f6df184c](https://github.com/firebase/FirebaseUI-Flutter/commit/f6df184cfec4892cda7bc19d58bf81539b295c61))
 - **FEAT**(ui_storage): add StorageGridView widget ([#11206](https://github.com/firebase/FirebaseUI-Flutter/issues/11206)). ([c7657191](https://github.com/firebase/FirebaseUI-Flutter/commit/c76571913b75f349d47f30c20f6ebe831bcbd20c))
 - **FEAT**(ui_storage): add shimmer for loading images ([#11237](https://github.com/firebase/FirebaseUI-Flutter/issues/11237)). ([95ad465d](https://github.com/firebase/FirebaseUI-Flutter/commit/95ad465d88e494822cae8b2399b56cfb02f6bc2e))
 - **FEAT**(ui_storage): add StorageListView and PaginatedLoadingController ([#11170](https://github.com/firebase/FirebaseUI-Flutter/issues/11170)). ([ebdf5856](https://github.com/firebase/FirebaseUI-Flutter/commit/ebdf58568e59894e5d9bb6596556e684f64252ff))
 - **FEAT**(ui_storage): add StorageImage widget ([#11080](https://github.com/firebase/FirebaseUI-Flutter/issues/11080)). ([1ae5ff33](https://github.com/firebase/FirebaseUI-Flutter/commit/1ae5ff332274366e7fe8a5ac1685f516a3090108))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([9c2906d5](https://github.com/firebase/FirebaseUI-Flutter/commit/9c2906d52c75a74cf9b733f584e7c5d68f076de3))
 - **FEAT**(ui_storage): add TaskProgressIndicator ([#10859](https://github.com/firebase/FirebaseUI-Flutter/issues/10859)). ([a394c528](https://github.com/firebase/FirebaseUI-Flutter/commit/a394c528a1c1817a582089aa0f4e75a936d14cb9))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/FirebaseUI-Flutter/issues/10496)). ([9ce686c6](https://github.com/firebase/FirebaseUI-Flutter/commit/9ce686c68d78e94165bde3a616702ec4c13a0fa5))
 - **FEAT**(ui_storage): configuration API and UploadButton widget ([#10699](https://github.com/firebase/FirebaseUI-Flutter/issues/10699)). ([00f8155f](https://github.com/firebase/FirebaseUI-Flutter/commit/00f8155f17f0f0ef1a715b7a5fb85e42f0d5dafa))
 - **FEAT**(ui_storage): add StorageGridView widget ([#11206](https://github.com/firebase/FirebaseUI-Flutter/issues/11206)). ([1698aa4f](https://github.com/firebase/FirebaseUI-Flutter/commit/1698aa4fb823fda61ed36a0465078018766a92ac))
 - **FEAT**(ui_storage): add shimmer for loading images ([#11237](https://github.com/firebase/FirebaseUI-Flutter/issues/11237)). ([64928d29](https://github.com/firebase/FirebaseUI-Flutter/commit/64928d29b4589b1afd96482a1b658bf0a4719b4f))
 - **FEAT**(ui_storage): add StorageListView and PaginatedLoadingController ([#11170](https://github.com/firebase/FirebaseUI-Flutter/issues/11170)). ([7e4dc336](https://github.com/firebase/FirebaseUI-Flutter/commit/7e4dc336bf71e3a4627f586c382c2f7f2711eee0))
 - **FEAT**(ui_storage): add StorageImage widget ([#11080](https://github.com/firebase/FirebaseUI-Flutter/issues/11080)). ([5c1a6bca](https://github.com/firebase/FirebaseUI-Flutter/commit/5c1a6bcab838ca1c8e108847285af7e72b36a269))
 - **FEAT**: update dependency constraints to `sdk: '>=2.18.0 <4.0.0'` `flutter: '>=3.3.0'` ([#10946](https://github.com/firebase/FirebaseUI-Flutter/issues/10946)). ([a26682e0](https://github.com/firebase/FirebaseUI-Flutter/commit/a26682e0957ea983b82b5c48a2c54cec1d80995b))
 - **FEAT**(ui_storage): add TaskProgressIndicator ([#10859](https://github.com/firebase/FirebaseUI-Flutter/issues/10859)). ([83f8fcf9](https://github.com/firebase/FirebaseUI-Flutter/commit/83f8fcf941e83112ce7adcdf36afd00b6118b893))
 - **FEAT**(core): add support for Windows via Firebase C++ desktop SDK ([#10496](https://github.com/firebase/FirebaseUI-Flutter/issues/10496)). ([930becc3](https://github.com/firebase/FirebaseUI-Flutter/commit/930becc3ddbffcd65f4c79bd2973994e1be396d3))
 - **FEAT**(ui_storage): configuration API and UploadButton widget ([#10699](https://github.com/firebase/FirebaseUI-Flutter/issues/10699)). ([2712ac47](https://github.com/firebase/FirebaseUI-Flutter/commit/2712ac47bddbde4e6f70bc75b5ccc746b4107097))

# Change Log

All notable changes for firebase_ui packages

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

