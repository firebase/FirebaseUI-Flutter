// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart'
    show encodeSvg;

class FakeAssetBundle extends Fake implements AssetBundle {
  final String svgStr = '''<svg viewBox="0 0 10 10"></svg>''';
  final List<String> loadedKeys = [];

  @override
  Future<ByteData> load(String key) async {
    loadedKeys.add(key);
    final bytes = encodeSvg(xml: svgStr, debugName: key);
    return bytes.buffer.asByteData();
  }
}

// Duplicated from packages/firebase_ui_oauth_google/lib/src/theme.dart
// to prevent circular dependency
const _googleBlue = Color(0xff4285f4);
const _googleWhite = Color(0xffffffff);
const _googleDark = Color(0xff757575);

const _backgroundColor = ThemedColor(_googleBlue, _googleWhite);
const _color = ThemedColor(_googleWhite, _googleDark);
const _iconBackgroundColor = ThemedColor(_googleWhite, _googleWhite);

const _iconAsset = 'assets/icons/google.svg';

const _iconSrc = ThemedIconSrc(_iconAsset, _iconAsset);

class GoogleProviderButtonStyle extends ThemedOAuthProviderButtonStyle {
  const GoogleProviderButtonStyle();

  @override
  ThemedColor get backgroundColor => _backgroundColor;

  @override
  ThemedColor get color => _color;

  @override
  ThemedIconSrc get iconSrc => _iconSrc;

  @override
  ThemedColor get iconBackgroundColor => _iconBackgroundColor;

  @override
  double get iconPadding => 1;

  @override
  String get assetsPackage => 'firebase_ui_oauth_google';
}

/// A custom provider style whose icon is bundled with the app itself.
class AppBundledButtonStyle extends ThemedOAuthProviderButtonStyle {
  const AppBundledButtonStyle();

  @override
  ThemedColor get backgroundColor => _backgroundColor;

  @override
  ThemedColor get color => _color;

  @override
  ThemedIconSrc get iconSrc =>
      const ThemedIconSrc('assets/app_icon_dark.svg', 'assets/app_icon.svg');

  @override
  String? get assetsPackage => null;
}

class FakeOAuthProvider extends OAuthProvider {
  @override
  ProviderArgs get desktopSignInArgs => throw UnimplementedError();

  @override
  get firebaseAuthProvider => throw UnimplementedError();

  @override
  OAuthCredential fromDesktopAuthResult(AuthResult result) {
    throw UnimplementedError();
  }

  @override
  Future<void> logOutProvider() {
    throw UnimplementedError();
  }

  @override
  void mobileSignIn(AuthAction action) {}

  @override
  String get providerId => 'fake';

  @override
  ThemedOAuthProviderButtonStyle get style => const GoogleProviderButtonStyle();

  @override
  bool supportsPlatform(TargetPlatform platform) {
    return true;
  }
}

class FakeAuth extends Fake implements fba.FirebaseAuth {}

void main() {
  final provider = FakeOAuthProvider();

  const style = GoogleProviderButtonStyle();
  late Widget button;

  Widget renderMaterialButton([Brightness brightness = Brightness.dark]) {
    button = OAuthProviderButtonBase(
      provider: provider,
      label: 'Sign in with Google',
      loadingIndicator: const CircularProgressIndicator(),
      auth: FakeAuth(),
    );

    return DefaultAssetBundle(
      bundle: FakeAssetBundle(),
      child: MaterialApp(
        theme: ThemeData(brightness: brightness),
        home: Scaffold(body: button),
      ),
    );
  }

  group('OAuthProviderButton', () {
    testWidgets('renders label', (tester) async {
      await tester.pumpWidget(renderMaterialButton());

      final textFinder = find.text('Sign in with Google');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('applies background color from style', (tester) async {
      await tester.pumpWidget(renderMaterialButton());

      final expectedColor = style.backgroundColor.getValue(Brightness.dark);

      final containerFinder = find.byWidgetPredicate((widget) {
        return widget is Material &&
            widget.color!.r == expectedColor.r &&
            widget.color!.g == expectedColor.g &&
            widget.color!.b == expectedColor.b;
      });

      expect(containerFinder, findsOneWidget);
    });

    testWidgets('applies text color from style', (tester) async {
      await tester.pumpWidget(renderMaterialButton());

      final textFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.style!.color!.r == style.color.getValue(Brightness.dark).r &&
            widget.style!.color!.g == style.color.getValue(Brightness.dark).g &&
            widget.style!.color!.b == style.color.getValue(Brightness.dark).b,
      );

      expect(textFinder, findsOneWidget);
    });

    testWidgets('applies dark theme background color from style', (
      tester,
    ) async {
      await tester.pumpWidget(renderMaterialButton(Brightness.dark));

      final containerFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Material &&
            widget.color.toString() ==
                style.backgroundColor.getValue(Brightness.dark).toString(),
      );

      expect(containerFinder, findsOneWidget);
    });

    testWidgets('applies dark theme text color from style', (tester) async {
      await tester.pumpWidget(renderMaterialButton(Brightness.dark));

      final textFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.style!.color.toString() ==
                style.color.getValue(Brightness.dark).toString(),
      );

      expect(textFinder, findsOneWidget);
    });

    testWidgets('renders an icon', (tester) async {
      await tester.pumpWidget(renderMaterialButton());

      final iconFinder = find.byWidgetPredicate(
        (widget) => widget is VectorGraphic,
      );

      expect(iconFinder, findsOneWidget);
    });

    testWidgets('has layout flow aware padding', (tester) async {
      await tester.pumpWidget(
        DefaultAssetBundle(
          bundle: FakeAssetBundle(),
          child: MaterialApp(
            home: Scaffold(
              body: Row(
                children: [
                  Expanded(
                    child: OAuthProviderButtonBase(
                      provider: provider,
                      auth: FakeAuth(),
                      label: 'Sign in with Fake provider',
                      loadingIndicator: const CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(LayoutFlowAwarePadding), findsOneWidget);
    });
  });

  group('ThemedOAuthProviderButtonStyle.iconWidget', () {
    Future<List<String>> pumpIcon(WidgetTester tester, Widget icon) async {
      final bundle = FakeAssetBundle();
      await tester.pumpWidget(DefaultAssetBundle(bundle: bundle, child: icon));
      return bundle.loadedKeys;
    }

    testWidgets('loads icons from assetsPackage', (tester) async {
      final keys = await pumpIcon(
        tester,
        style.iconWidget.getValue(Brightness.light),
      );

      expect(keys, ['packages/firebase_ui_oauth_google/$_iconAsset']);
    });

    testWidgets('loads icons from the app bundle when assetsPackage is null', (
      tester,
    ) async {
      const appStyle = AppBundledButtonStyle();
      final keys = await pumpIcon(
        tester,
        appStyle.iconWidget.getValue(Brightness.light),
      );

      expect(keys, ['assets/app_icon_dark.svg']);
    });
  });
}
