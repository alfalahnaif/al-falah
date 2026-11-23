import 'package:al_falah/app/app.dart';
import 'package:al_falah/app/router/app_router.dart';
import 'package:al_falah/app/router/app_routes.dart';
import 'package:al_falah/features/home/presentation/home_page.dart';
import 'package:al_falah/features/about/presentation/about_page.dart';
import 'package:al_falah/features/settings/presentation/settings_page.dart';
import 'package:flutter/semantics.dart' show SemanticsAction;
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

const _labels = ['الرئيسية', 'القرآن', 'المحفوظات', 'الأذكار'];
const _barKey = ValueKey('main-navigation-bar');

Finder _tab(String label) =>
    find.descendant(of: find.byKey(_barKey), matching: find.text(label));

void _setSurface(
  WidgetTester tester, {
  required Size size,
  required double textScale,
  Brightness brightness = Brightness.light,
  FakeViewPadding padding = FakeViewPadding.zero,
}) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  tester.view.padding = padding;
  tester.platformDispatcher.textScaleFactorTestValue = textScale;
  tester.platformDispatcher.platformBrightnessTestValue = brightness;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
    tester.view.resetPadding();
    tester.platformDispatcher.clearTextScaleFactorTestValue();
    tester.platformDispatcher.clearPlatformBrightnessTestValue();
  });
}

void main() {
  for (final scenario in [
    (size: const Size(320, 640), scale: 2.0, dark: false, twoRows: true),
    (size: const Size(360, 800), scale: 1.5, dark: false, twoRows: true),
    (size: const Size(393, 852), scale: 1.0, dark: true, twoRows: false),
    (size: const Size(412, 915), scale: 2.0, dark: true, twoRows: true),
    (size: const Size(600, 960), scale: 2.0, dark: false, twoRows: false),
    (size: const Size(640, 320), scale: 1.5, dark: false, twoRows: false),
  ]) {
    testWidgets(
      '${scenario.size.width}x${scenario.size.height} at ${scenario.scale}x keeps all tabs usable',
      (tester) async {
        _setSurface(
          tester,
          size: scenario.size,
          textScale: scenario.scale,
          brightness: scenario.dark ? Brightness.dark : Brightness.light,
          padding: const FakeViewPadding(top: 24, bottom: 24),
        );
        await tester.pumpWidget(const AlFalahApp());
        await tester.pumpAndSettle();

        final bar = tester.getRect(find.byKey(_barKey));
        expect(bar.bottom, scenario.size.height);
        expect(bar.height, lessThan(scenario.size.height / 2));
        for (final label in _labels) {
          final rect = tester.getRect(_tab(label));
          expect(rect, isNotNull);
          expect(rect.left, greaterThanOrEqualTo(0));
          expect(rect.right, lessThanOrEqualTo(scenario.size.width));
          expect(rect.bottom, lessThanOrEqualTo(bar.bottom - 24));
        }
        final homeY = tester.getCenter(_tab('الرئيسية')).dy;
        final bookmarksY = tester.getCenter(_tab('المحفوظات')).dy;
        if (scenario.twoRows) {
          expect(homeY, lessThan(bookmarksY));
        } else {
          expect(homeY, bookmarksY);
        }
        for (final label in _labels) {
          await tester.tap(_tab(label));
          await tester.pumpAndSettle();
          expect(
            tester
                .getSemantics(_tab(label))
                .flagsCollection
                .isSelected
                .toBoolOrNull(),
            isTrue,
          );
          expect(tester.takeException(), isNull);
        }
      },
    );
  }

  testWidgets('safe-area inset keeps Home content above navigation', (
    tester,
  ) async {
    _setSurface(
      tester,
      size: const Size(320, 640),
      textScale: 2,
      padding: const FakeViewPadding(top: 32, bottom: 40),
    );
    await tester.pumpWidget(const AlFalahApp());
    await tester.pumpAndSettle();

    final bar = tester.getRect(find.byKey(_barKey));
    final scrollable = find.descendant(
      of: find.byType(HomePage),
      matching: find.byType(Scrollable),
    );
    expect(tester.getRect(scrollable).bottom, lessThanOrEqualTo(bar.top));
    await tester.drag(scrollable, const Offset(0, -500));
    await tester.pumpAndSettle();
    expect(find.text('الأذكار'), findsWidgets);
    expect(tester.takeException(), isNull);
  });

  testWidgets('tabs expose one labeled selected semantic action', (
    tester,
  ) async {
    await tester.pumpWidget(const AlFalahApp());
    for (final label in _labels) {
      final node = tester.getSemantics(_tab(label));
      expect(node.label, label);
      expect(node.getSemanticsData().hasAction(SemanticsAction.tap), isTrue);
      expect(node.childrenCountInTraversalOrder, 0);
      expect(
        node.flagsCollection.isSelected.toBoolOrNull(),
        label == 'الرئيسية',
      );
    }
  });

  for (final brightness in [Brightness.light, Brightness.dark]) {
    testWidgets('$brightness Home meets Flutter accessibility guidelines', (
      tester,
    ) async {
      _setSurface(
        tester,
        size: const Size(320, 640),
        textScale: 2,
        brightness: brightness,
      );
      await tester.pumpWidget(const AlFalahApp());
      await tester.pumpAndSettle();
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
      await expectLater(tester, meetsGuideline(textContrastGuideline));
    });
  }

  testWidgets('repeated secondary and tab back returns only one level', (
    tester,
  ) async {
    final router = AppRouter.create();
    addTearDown(router.dispose);
    await tester.pumpWidget(AlFalahApp(router: router));
    for (final label in ['القرآن', 'المحفوظات', 'الأذكار']) {
      await tester.tap(_tab(label));
      await tester.pumpAndSettle();
      router.pushNamed(AppRoutes.settings);
      await tester.pumpAndSettle();
      router.pushNamed(AppRoutes.about);
      await tester.pumpAndSettle();
      expect(find.byType(AboutPage), findsOneWidget);
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(
        tester
            .getSemantics(_tab(label))
            .flagsCollection
            .isSelected
            .toBoolOrNull(),
        isTrue,
      );
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(
        router.routeInformationProvider.value.uri.path,
        AppRoutes.homePath,
      );
    }
  });
}
