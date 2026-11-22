import 'package:al_falah/app/app.dart';
import 'package:al_falah/app/router/app_router.dart';
import 'package:al_falah/app/router/app_routes.dart';
import 'package:al_falah/features/about/presentation/about_page.dart';
import 'package:al_falah/features/adhkar/presentation/adhkar_page.dart';
import 'package:al_falah/features/bookmarks/presentation/bookmarks_page.dart';
import 'package:al_falah/features/home/presentation/home_page.dart';
import 'package:al_falah/features/quran/presentation/surah_index_page.dart';
import 'package:al_falah/features/settings/presentation/settings_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

Finder tab(String label) => find.descendant(
  of: find.byKey(const ValueKey('main-navigation-bar')),
  matching: find.text(label),
);

void main() {
  testWidgets('starts at Home in Arabic RTL', (tester) async {
    await tester.pumpWidget(const AlFalahApp());
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(HomePage));
    expect(
      GoRouter.of(context).routeInformationProvider.value.uri.path,
      AppRoutes.homePath,
    );
    expect(Localizations.localeOf(context), const Locale('ar'));
    expect(Directionality.of(context), TextDirection.rtl);
  });

  for (final destination in [
    (label: 'القرآن', page: SurahIndexPage, secondary: false),
    (label: 'المحفوظات', page: BookmarksPage, secondary: false),
    (label: 'الإعدادات', page: SettingsPage, secondary: true),
  ]) {
    testWidgets('opens ${destination.label} and returns to Home', (
      tester,
    ) async {
      await tester.pumpWidget(const AlFalahApp());
      await tester.tap(
        destination.secondary
            ? find.byTooltip(destination.label)
            : tab(destination.label),
      );
      await tester.pumpAndSettle();

      expect(find.byType(destination.page), findsOneWidget);
      final context = tester.element(find.byType(destination.page));
      expect(Directionality.of(context), TextDirection.rtl);
      if (destination.secondary) {
        expect(find.byTooltip('رجوع'), findsOneWidget);
        expect(find.bySemanticsLabel('رجوع'), findsOneWidget);
        await tester.tap(find.byTooltip('رجوع'));
      } else {
        await tester.tap(tab('الرئيسية'));
      }
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });
  }

  testWidgets('Settings opens About and back follows the stack', (
    tester,
  ) async {
    await tester.pumpWidget(const AlFalahApp());
    await tester.tap(find.byTooltip('الإعدادات'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('المصادر والتراخيص'));
    await tester.pumpAndSettle();

    expect(find.byType(AboutPage), findsOneWidget);
    await tester.tap(find.byTooltip('رجوع'));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsPage), findsOneWidget);
    await tester.tap(find.byTooltip('رجوع'));
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('system back returns from Bookmarks to Home', (tester) async {
    await tester.pumpWidget(const AlFalahApp());
    await tester.tap(tab('المحفوظات'));
    await tester.pumpAndSettle();
    expect(find.byType(BookmarksPage), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('About opens the bundled software license screen', (
    tester,
  ) async {
    await tester.pumpWidget(const AlFalahApp());
    await tester.tap(find.byTooltip('الإعدادات'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('المصادر والتراخيص'));
    await tester.pumpAndSettle();
    expect(find.bySemanticsLabel('تراخيص البرمجيات'), findsOneWidget);

    await tester.tap(find.text('تراخيص البرمجيات'));
    await tester.pumpAndSettle();
    expect(find.byType(LicensePage), findsOneWidget);
  });

  for (final destination in [
    (path: AppRoutes.surahIndexPath, page: SurahIndexPage),
    (path: AppRoutes.bookmarksPath, page: BookmarksPage),
    (path: AppRoutes.adhkarPath, page: AdhkarPage),
    (path: AppRoutes.settingsPath, page: SettingsPage),
    (path: AppRoutes.aboutPath, page: AboutPage),
  ]) {
    testWidgets('direct path ${destination.path} opens its shell', (
      tester,
    ) async {
      final router = AppRouter.create();
      addTearDown(router.dispose);
      await tester.pumpWidget(AlFalahApp(router: router));
      router.go(destination.path);
      await tester.pumpAndSettle();

      expect(find.byType(destination.page), findsOneWidget);
      expect(router.routeInformationProvider.value.uri.path, destination.path);
      if (destination.path == AppRoutes.settingsPath ||
          destination.path == AppRoutes.aboutPath) {
        await tester.tap(find.byTooltip('رجوع'));
      } else {
        await tester.tap(tab('الرئيسية'));
      }
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });
  }

  testWidgets('unknown path shows a themed Arabic error and Home action', (
    tester,
  ) async {
    final router = AppRouter.create();
    addTearDown(router.dispose);
    await tester.pumpWidget(AlFalahApp(router: router));
    router.go('/missing-route');
    await tester.pumpAndSettle();

    expect(find.text('الصفحة غير موجودة'), findsWidgets);
    expect(find.bySemanticsLabel('العودة إلى الرئيسية'), findsOneWidget);
    await tester.tap(find.text('العودة إلى الرئيسية'));
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
    expect(router.routeInformationProvider.value.uri.path, AppRoutes.homePath);
  });

  testWidgets('parent rebuild retains the current router and route', (
    tester,
  ) async {
    await tester.pumpWidget(const AlFalahApp());
    await tester.tap(tab('القرآن'));
    await tester.pumpAndSettle();
    final before = GoRouter.of(tester.element(find.byType(SurahIndexPage)));

    await tester.pumpWidget(const AlFalahApp());
    await tester.pumpAndSettle();
    expect(find.byType(SurahIndexPage), findsOneWidget);
    expect(
      GoRouter.of(tester.element(find.byType(SurahIndexPage))),
      same(before),
    );
  });

  for (final brightness in [Brightness.light, Brightness.dark]) {
    testWidgets('$brightness preserves theme and IBM typography on a route', (
      tester,
    ) async {
      tester.platformDispatcher.platformBrightnessTestValue = brightness;
      addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
      await tester.pumpWidget(const AlFalahApp());
      await tester.tap(tab('المحفوظات'));
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(BookmarksPage));
      expect(Theme.of(context).brightness, brightness);
      expect(
        Theme.of(context).textTheme.bodyLarge!.fontFamily,
        'IBM Plex Sans Arabic',
      );
      expect(find.byKey(const ValueKey('main-navigation-bar')), findsOneWidget);
      expect(tab('المحفوظات'), findsOneWidget);
    });
  }

  for (final scale in [1.0, 1.5, 2.0]) {
    testWidgets('navigation works at ${scale}x on a narrow screen', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = scale;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
        tester.platformDispatcher.clearTextScaleFactorTestValue();
      });
      await tester.pumpWidget(const AlFalahApp());
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('الإعدادات'));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
