import 'package:al_falah/app/app.dart';
import 'package:al_falah/app/theme/app_theme.dart';
import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('IBM Plex font assets are available to the application', (
    tester,
  ) async {
    for (final name in ['Regular', 'Medium', 'SemiBold', 'Bold']) {
      final asset = await rootBundle.load(
        'assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-$name.ttf',
      );
      expect(asset.lengthInBytes, greaterThan(200000));
    }
    final license = await rootBundle.loadString(
      'assets/licenses/IBM_PLEX_SANS_ARABIC_LICENSE.txt',
    );
    expect(license, contains('SIL OPEN FONT LICENSE'));
  });

  for (final brightness in [Brightness.light, Brightness.dark]) {
    testWidgets('$brightness keeps Arabic RTL and the IBM interface family', (
      tester,
    ) async {
      tester.platformDispatcher.platformBrightnessTestValue = brightness;
      addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
      await tester.pumpWidget(const AlFalahApp());

      final context = tester.element(find.text('الفلاح'));
      expect(Directionality.of(context), TextDirection.rtl);
      expect(
        Theme.of(context).textTheme.titleLarge!.fontFamily,
        'IBM Plex Sans Arabic',
      );
      expect(
        AppTypography.build().bodyMedium!.fontFamily,
        'IBM Plex Sans Arabic',
      );
      expect(tester.takeException(), isNull);
    });
  }

  for (final scale in [1.0, 1.5, 2.0]) {
    testWidgets('neutral mixed-script interface text fits at ${scale}x', (
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

      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('ar'),
          supportedLocales: const [Locale('ar')],
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          theme: AppTheme.light,
          home: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'عنوان الواجهة',
                        style: AppTypography.build().displayLarge,
                      ),
                      Text(
                        'نص تَجْرِبَة عربي وEnglish 2026 / ٢٠٢٦',
                        style: AppTypography.build().bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      expect(
        Directionality.of(tester.element(find.text('عنوان الواجهة'))),
        TextDirection.rtl,
      );
      expect(tester.takeException(), isNull);
    });
  }
}
