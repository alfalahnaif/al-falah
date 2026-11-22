import 'package:al_falah/app/app.dart';
import 'package:al_falah/app/theme/app_theme.dart';
import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:al_falah/features/home/presentation/home_page.dart';
import 'package:al_falah/shared/icons/app_icon.dart';
import 'package:al_falah/shared/widgets/app_button.dart';
import 'package:al_falah/shared/widgets/app_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('icon actions expose one semantic node each', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _host(
        Column(
          children: [
            AppIconButton(
              icon: AppIconName.back,
              label: 'رجوع',
              onPressed: () => taps++,
            ),
            const AppIconButton(icon: AppIconName.back, label: 'معطل'),
          ],
        ),
      ),
    );

    final enabled = tester.getSemantics(find.byType(AppIconButton).first);
    final disabled = tester.getSemantics(find.byType(AppIconButton).last);
    expect(
      enabled,
      matchesSemantics(
        label: 'رجوع',
        textDirection: TextDirection.rtl,
        isButton: true,
        hasEnabledState: true,
        isEnabled: true,
        isFocusable: true,
        hasTapAction: true,
      ),
    );
    expect(enabled.childrenCountInTraversalOrder, 0);
    expect(
      disabled,
      matchesSemantics(
        label: 'معطل',
        textDirection: TextDirection.rtl,
        isButton: true,
        hasEnabledState: true,
      ),
    );
    expect(disabled.childrenCountInTraversalOrder, 0);
    await tester.tap(find.byType(IconButton).first);
    expect(taps, 1);
    await tester.tap(find.byType(IconButton).last);
    expect(taps, 1);
  });

  testWidgets('system brightness selects the matching theme', (tester) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
    await tester.pumpWidget(const AlFalahApp());

    expect(
      Theme.of(tester.element(find.byType(HomePage))).brightness,
      Brightness.dark,
    );
    expect(find.text('الفلاح'), findsOneWidget);
    expect(
      Directionality.of(tester.element(find.text('الفلاح'))),
      TextDirection.rtl,
    );
  });

  testWidgets('buttons expose enabled, disabled, and loading behavior', (
    tester,
  ) async {
    var presses = 0;
    await tester.pumpWidget(
      _host(
        Column(
          children: [
            AppButton(label: 'متابعة', onPressed: () => presses++),
            const AppButton(label: 'غير متاح'),
            const AppButton(label: 'انتظار', isLoading: true),
            AppButton(
              label: 'ثانوي',
              variant: AppButtonVariant.secondary,
              onPressed: () {},
            ),
            AppButton(
              label: 'نصي',
              variant: AppButtonVariant.text,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );

    expect(find.byType(FilledButton), findsNWidgets(3));
    expect(find.byType(OutlinedButton), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
    await tester.tap(find.text('متابعة'));
    expect(presses, 1);
    expect(
      tester
          .widget<FilledButton>(find.widgetWithText(FilledButton, 'غير متاح'))
          .onPressed,
      isNull,
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    final loading = tester.widget<FilledButton>(
      find.byType(FilledButton).at(2),
    );
    expect(loading.onPressed, isNull);
    expect(find.bySemanticsLabel('انتظار، جارٍ التحميل'), findsOneWidget);
    final loadingSemantics = tester.getSemantics(
      find.widgetWithText(AppButton, 'انتظار'),
    );
    expect(
      loadingSemantics,
      matchesSemantics(
        label: 'انتظار، جارٍ التحميل',
        textDirection: TextDirection.rtl,
        isButton: true,
        hasEnabledState: true,
        isLiveRegion: true,
      ),
    );
    expect(loadingSemantics.childrenCountInTraversalOrder, 0);
  });

  testWidgets('card uses outlined, flat styling and interactive minimum', (
    tester,
  ) async {
    var taps = 0;
    await tester.pumpWidget(
      _host(AppCard(onTap: () => taps++, child: const Text('بطاقة'))),
    );

    final card = tester.widget<Card>(find.byType(Card));
    final shape = card.shape! as RoundedRectangleBorder;
    expect(card.elevation, 0);
    expect(shape.borderRadius, BorderRadius.circular(AppShapes.cardRadius));
    expect(shape.side.width, 1);
    expect(
      tester.getSize(find.byType(AppCard)).height,
      greaterThanOrEqualTo(48),
    );
    await tester.tap(find.text('بطاقة'));
    expect(taps, 1);
  });

  testWidgets('semantic icons use theme color and reverse back in RTL', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        const Row(
          children: [AppIcon(AppIconName.home), AppIcon(AppIconName.back)],
        ),
      ),
    );

    final icons = tester.widgetList<Icon>(find.byType(Icon)).toList();
    expect(icons[0].icon!.fontFamily, 'Lucide');
    expect(icons[0].icon!.fontPackage, 'lucide_icons_flutter');
    expect(icons[0].icon!.codePoint, 57589);
    expect(icons[0].size, AppIconSizes.regular);
    expect(icons[0].color, AppTheme.light.colorScheme.onSurface);
    expect(icons[1].icon!.codePoint, 57417);
  });

  testWidgets('back icon points backward in LTR and compact size is 20', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const Scaffold(
          body: Directionality(
            textDirection: TextDirection.ltr,
            child: AppIcon(AppIconName.back, compact: true),
          ),
        ),
      ),
    );

    final icon = tester.widget<Icon>(find.byType(Icon));
    expect(icon.icon!.codePoint, 57416);
    expect(icon.size, AppIconSizes.compact);
  });

  testWidgets('approved tab icons map to distinct Lucide symbols', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(
        const Row(
          children: [
            AppIcon(AppIconName.home),
            AppIcon(AppIconName.quran),
            AppIcon(AppIconName.bookmarks),
            AppIcon(AppIconName.adhkar),
            AppIcon(AppIconName.settings),
          ],
        ),
      ),
    );

    final icons = tester.widgetList<Icon>(find.byType(Icon)).toList();
    expect(icons, hasLength(5));
    expect(icons.map((icon) => icon.icon!.codePoint).toSet(), hasLength(5));
    for (final icon in icons) {
      expect(icon.icon!.fontPackage, 'lucide_icons_flutter');
      expect(icon.size, AppIconSizes.regular);
    }
  });

  testWidgets('icon button has a label, focusable target, and disabled state', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(const AppIconButton(icon: AppIconName.back, label: 'رجوع')),
    );

    final button = tester.widget<IconButton>(find.byType(IconButton));
    expect(button.onPressed, isNull);
    expect(button.tooltip, 'رجوع');
    expect(find.bySemanticsLabel('رجوع'), findsOneWidget);
    expect(
      tester.getSize(find.byType(IconButton)).width,
      greaterThanOrEqualTo(48),
    );
    expect(
      tester.getSize(find.byType(IconButton)).height,
      greaterThanOrEqualTo(48),
    );
  });

  testWidgets('large text does not overflow the minimal Arabic shell', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
      tester.platformDispatcher.clearTextScaleFactorTestValue();
    });

    await tester.pumpWidget(const AlFalahApp());
    expect(find.text('الفلاح'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

Widget _host(Widget child) => MaterialApp(
  locale: const Locale('ar'),
  supportedLocales: const [Locale('ar')],
  localizationsDelegates: GlobalMaterialLocalizations.delegates,
  theme: AppTheme.light,
  home: Scaffold(body: Center(child: child)),
);
