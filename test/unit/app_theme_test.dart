import 'dart:math' as math;

import 'package:al_falah/app/theme/app_theme.dart';
import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  test('light and dark themes keep approved palette roles', () {
    final light = AppTheme.light;
    final dark = AppTheme.dark;

    expect(light.brightness, Brightness.light);
    expect(dark.brightness, Brightness.dark);
    expect(light.colorScheme.primary, const Color(0xFF472C43));
    expect(dark.colorScheme.primary, const Color(0xFFE9DCE8));
    expect(light.scaffoldBackgroundColor, const Color(0xFFF8F3E9));
    expect(dark.scaffoldBackgroundColor, const Color(0xFF211C22));
    expect(light.extension<AppColors>(), AppColors.light);
    expect(dark.extension<AppColors>(), AppColors.dark);
  });

  test('semantic text styles and geometry tokens are available', () {
    final text = AppTypography.build();

    expect(text.displayLarge, isNotNull);
    expect(text.headlineMedium, isNotNull);
    expect(text.titleLarge, isNotNull);
    expect(text.bodyLarge, isNotNull);
    expect(text.labelLarge, isNotNull);
    expect(text.bodySmall, isNotNull);
    expect(text.bodyLarge!.fontFamily, isNull);
    expect(AppSpacing.xs, 4);
    expect(AppSpacing.xxl, 32);
    expect(AppShapes.cardRadius, 18);
    expect(AppIconSizes.regular, 24);
    expect(AppIconSizes.compact, 20);
  });

  for (final colors in [AppColors.light, AppColors.dark]) {
    test('${colors.brightness} focused controls use the focus token', () {
      final theme = colors.brightness == Brightness.light
          ? AppTheme.light
          : AppTheme.dark;
      final focusState = {WidgetState.focused};
      expect(
        theme.outlinedButtonTheme.style!.side!.resolve(focusState)!.color,
        colors.focusIndicator,
      );
      expect(
        theme.iconButtonTheme.style!.side!.resolve(focusState)!.color,
        colors.focusIndicator,
      );
    });

    test('${colors.brightness} text and state pairs meet contrast targets', () {
      expect(
        _contrast(colors.onPrimary, colors.primary),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrast(colors.onSecondary, colors.secondary),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrast(colors.onSurface, colors.surface),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrast(colors.onSurfaceVariant, colors.surface),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrast(colors.error, colors.surface),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrast(colors.success, colors.surface),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrast(colors.warning, colors.surface),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrast(colors.disabled, colors.surface),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrast(colors.disabled, colors.surfaceVariant),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrast(colors.focusIndicator, colors.surface),
        greaterThanOrEqualTo(3),
      );
      expect(
        _contrast(colors.outline, colors.surface),
        greaterThanOrEqualTo(3),
      );
    });
  }
}

double _contrast(Color first, Color second) {
  final a = _luminance(first);
  final b = _luminance(second);
  return (a > b ? a + 0.05 : b + 0.05) / (a > b ? b + 0.05 : a + 0.05);
}

double _luminance(Color color) {
  final argb = color.toARGB32();
  final red = _linearize((argb >> 16 & 0xFF) / 255);
  final green = _linearize((argb >> 8 & 0xFF) / 255);
  final blue = _linearize((argb & 0xFF) / 255);
  return red * 0.2126 + green * 0.7152 + blue * 0.0722;
}

double _linearize(double value) => value <= 0.04045
    ? value / 12.92
    : math.pow((value + 0.055) / 1.055, 2.4).toDouble();
