import 'package:al_falah/app/app.dart';
import 'package:al_falah/app/router/app_routes.dart';
import 'package:al_falah/app/router/main_navigation_shell.dart';
import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:al_falah/features/about/presentation/about_page.dart';
import 'package:al_falah/features/adhkar/presentation/adhkar_page.dart';
import 'package:al_falah/features/bookmarks/presentation/bookmarks_page.dart';
import 'package:al_falah/features/home/presentation/home_page.dart';
import 'package:al_falah/features/quran/presentation/surah_index_page.dart';
import 'package:al_falah/features/settings/presentation/settings_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/semantics.dart' show SemanticsAction;
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

Finder tab(String label) => find.descendant(
  of: find.byKey(const ValueKey('main-navigation-bar')),
  matching: find.text(label),
);

Finder tabSemantics(String label) => find.descendant(
  of: find.byKey(const ValueKey('main-navigation-bar')),
  matching: find.bySemanticsLabel(label),
);

void main() {
  testWidgets('shows exactly four approved tabs in RTL order', (tester) async {
    await tester.pumpWidget(const AlFalahApp());
    await tester.pumpAndSettle();

    final labels = ['الرئيسية', 'القرآن', 'المحفوظات', 'الأذكار'];
    for (final label in labels) {
      expect(tab(label), findsOneWidget);
    }
    expect(
      find.descendant(
        of: find.byKey(const ValueKey('main-navigation-bar')),
        matching: find.byType(TextButton),
      ),
      findsNWidgets(4),
    );
    final positions = labels
        .map((label) => tester.getCenter(tab(label)).dx)
        .toList();
    expect(
      positions,
      orderedEquals([...positions]..sort((a, b) => b.compareTo(a))),
    );
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(SettingsPage), findsNothing);
  });

  testWidgets('tabs select their own routes without stacking duplicates', (
    tester,
  ) async {
    await tester.pumpWidget(const AlFalahApp());
    for (final destination in [
      (label: 'القرآن', page: SurahIndexPage),
      (label: 'المحفوظات', page: BookmarksPage),
      (label: 'الأذكار', page: AdhkarPage),
      (label: 'الرئيسية', page: HomePage),
    ]) {
      await tester.tap(tab(destination.label));
      await tester.pumpAndSettle();
      expect(find.byType(destination.page), findsOneWidget);
    }
    await tester.tap(tab('القرآن'));
    await tester.pumpAndSettle();
    await tester.tap(tab('القرآن'));
    await tester.pumpAndSettle();
    expect(find.byType(SurahIndexPage), findsOneWidget);
    expect(
      GoRouter.of(tester.element(find.byType(SurahIndexPage))).canPop(),
      isFalse,
    );
  });

  testWidgets('screen readers receive one selected tab and Arabic labels', (
    tester,
  ) async {
    await tester.pumpWidget(const AlFalahApp());
    final home = tester.getSemantics(tabSemantics('الرئيسية'));
    final quran = tester.getSemantics(tabSemantics('القرآن'));
    expect(home.flagsCollection.isSelected.toBoolOrNull(), isTrue);
    expect(quran.flagsCollection.isSelected.toBoolOrNull(), isFalse);
    expect(home.getSemanticsData().hasAction(SemanticsAction.tap), isTrue);

    await tester.tap(tab('القرآن'));
    await tester.pumpAndSettle();
    expect(
      tester
          .getSemantics(tabSemantics('القرآن'))
          .flagsCollection
          .isSelected
          .toBoolOrNull(),
      isTrue,
    );
  });

  testWidgets('tab controls expose a visible keyboard focus border', (
    tester,
  ) async {
    await tester.pumpWidget(const AlFalahApp());
    final button = tester.widget<TextButton>(
      find.ancestor(of: tab('القرآن'), matching: find.byType(TextButton)),
    );
    final focusedSide = button.style!.side!.resolve({WidgetState.focused});
    expect(focusedSide?.color, AppColors.light.focusIndicator);
    expect(focusedSide?.width, 2);
  });

  testWidgets(
    'Home quick actions select tabs; Settings and licenses stay secondary',
    (tester) async {
      await tester.pumpWidget(const AlFalahApp());
      await tester.tap(find.text('القرآن الكريم'));
      await tester.pumpAndSettle();
      expect(find.byType(SurahIndexPage), findsOneWidget);
      expect(find.text('المحتوى غير متاح حتى اكتمال اعتماده.'), findsOneWidget);

      await tester.tap(tab('الرئيسية'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(OutlinedButton, 'المحفوظات'));
      await tester.pumpAndSettle();
      expect(find.byType(BookmarksPage), findsOneWidget);

      await tester.tap(tab('الرئيسية'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(OutlinedButton, 'الأذكار'));
      await tester.pumpAndSettle();
      expect(find.byType(AdhkarPage), findsOneWidget);

      await tester.tap(tab('الرئيسية'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('الإعدادات'));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
      expect(find.byType(MainNavigationShell), findsNothing);
      await tester.tap(find.text('المصادر والتراخيص'));
      await tester.pumpAndSettle();
      expect(find.byType(AboutPage), findsOneWidget);
      expect(find.text('تراخيص البرمجيات'), findsOneWidget);
      await tester.tap(find.byTooltip('رجوع'));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
      await tester.tap(find.byTooltip('رجوع'));
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    },
  );

  testWidgets('system back from a tab root returns Home', (tester) async {
    await tester.pumpWidget(const AlFalahApp());
    await tester.tap(tab('الأذكار'));
    await tester.pumpAndSettle();
    expect(find.byType(AdhkarPage), findsOneWidget);
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('a secondary route returns to its originating tab', (
    tester,
  ) async {
    await tester.pumpWidget(const AlFalahApp());
    await tester.tap(tab('القرآن'));
    await tester.pumpAndSettle();
    GoRouter.of(tester.element(find.byType(SurahIndexPage)))
        .pushNamed(AppRoutes.settings);
    await tester.pumpAndSettle();
    expect(find.byType(SettingsPage), findsOneWidget);
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.byType(SurahIndexPage), findsOneWidget);
  });

  testWidgets('Home scroll state survives branch switching', (tester) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
      tester.platformDispatcher.clearTextScaleFactorTestValue();
    });
    await tester.pumpWidget(const AlFalahApp());
    final homeScroll = find.descendant(
      of: find.byType(HomePage),
      matching: find.byType(Scrollable),
    );
    await tester.drag(homeScroll, const Offset(0, -200));
    await tester.pumpAndSettle();
    final before = tester.state<ScrollableState>(homeScroll).position.pixels;
    expect(before, greaterThan(0));

    await tester.tap(tab('القرآن'));
    await tester.pumpAndSettle();
    await tester.tap(tab('الرئيسية'));
    await tester.pumpAndSettle();
    expect(tester.state<ScrollableState>(homeScroll).position.pixels, before);
  });

  for (final brightness in [Brightness.light, Brightness.dark]) {
    testWidgets('$brightness uses A2 and IBM typography in the tab shell', (
      tester,
    ) async {
      tester.platformDispatcher.platformBrightnessTestValue = brightness;
      addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
      await tester.pumpWidget(const AlFalahApp());
      final context = tester.element(find.byType(MainNavigationShell));
      expect(Theme.of(context).brightness, brightness);
      expect(
        Theme.of(context).textTheme.labelMedium!.fontFamily,
        'IBM Plex Sans Arabic',
      );
    });
  }

  for (final scale in [1.0, 1.5, 2.0]) {
    testWidgets('all four tabs remain usable at ${scale}x on 320dp', (
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
      for (final label in ['الرئيسية', 'القرآن', 'المحفوظات', 'الأذكار']) {
        expect(tab(label), findsOneWidget);
      }
      expect(
        tester.getCenter(tab('الرئيسية')).dy,
        lessThan(tester.getCenter(tab('المحفوظات')).dy),
      );
      await tester.tap(tab('الأذكار'));
      await tester.pumpAndSettle();
      expect(find.byType(AdhkarPage), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
