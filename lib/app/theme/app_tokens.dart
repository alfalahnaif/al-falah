import 'package:material_ui/material_ui.dart';

/// Interface colors only. Mushaf artwork and text never consume this palette.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.brightness,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.outline,
    required this.divider,
    required this.disabled,
    required this.error,
    required this.success,
    required this.warning,
    required this.focusIndicator,
    required this.mutedGold,
  });

  final Brightness brightness;
  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color onSurface;
  final Color onSurfaceVariant;
  final Color outline;
  final Color divider;
  final Color disabled;
  final Color error;
  final Color success;
  final Color warning;
  final Color focusIndicator;
  final Color mutedGold;

  static const light = AppColors(
    brightness: Brightness.light,
    background: Color(0xFFF8F3E9),
    surface: Color(0xFFFFFDF8),
    surfaceVariant: Color(0xFFF2E8DD),
    primary: Color(0xFF472C43),
    onPrimary: Color(0xFFFFFDF8),
    secondary: Color(0xFF6F553C),
    onSecondary: Color(0xFFFFFDF8),
    onSurface: Color(0xFF302831),
    onSurfaceVariant: Color(0xFF675C58),
    outline: Color(0xFF8C817C),
    divider: Color(0xFFD4C5BD),
    disabled: Color(0xFF675C58),
    error: Color(0xFFA5222C),
    success: Color(0xFF2C6649),
    warning: Color(0xFF79520F),
    focusIndicator: Color(0xFF365EA8),
    mutedGold: Color(0xFFBEA27D),
  );

  static const dark = AppColors(
    brightness: Brightness.dark,
    background: Color(0xFF211C22),
    surface: Color(0xFF302831),
    surfaceVariant: Color(0xFF423844),
    primary: Color(0xFFE9DCE8),
    onPrimary: Color(0xFF211C22),
    secondary: Color(0xFFC8AC8B),
    onSecondary: Color(0xFF211C22),
    onSurface: Color(0xFFF9F4F4),
    onSurfaceVariant: Color(0xFFC6B8BE),
    outline: Color(0xFFA99BA5),
    divider: Color(0xFF695D69),
    disabled: Color(0xFFC6B8BE),
    error: Color(0xFFFFB4AB),
    success: Color(0xFFA6D8B6),
    warning: Color(0xFFF0C987),
    focusIndicator: Color(0xFFAAD0FF),
    mutedGold: Color(0xFFC8AC8B),
  );

  static AppColors of(BuildContext context) =>
      Theme.of(context).extension<AppColors>()!;

  @override
  AppColors copyWith({
    Brightness? brightness,
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? onSurface,
    Color? onSurfaceVariant,
    Color? outline,
    Color? divider,
    Color? disabled,
    Color? error,
    Color? success,
    Color? warning,
    Color? focusIndicator,
    Color? mutedGold,
  }) => AppColors(
    brightness: brightness ?? this.brightness,
    background: background ?? this.background,
    surface: surface ?? this.surface,
    surfaceVariant: surfaceVariant ?? this.surfaceVariant,
    primary: primary ?? this.primary,
    onPrimary: onPrimary ?? this.onPrimary,
    secondary: secondary ?? this.secondary,
    onSecondary: onSecondary ?? this.onSecondary,
    onSurface: onSurface ?? this.onSurface,
    onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
    outline: outline ?? this.outline,
    divider: divider ?? this.divider,
    disabled: disabled ?? this.disabled,
    error: error ?? this.error,
    success: success ?? this.success,
    warning: warning ?? this.warning,
    focusIndicator: focusIndicator ?? this.focusIndicator,
    mutedGold: mutedGold ?? this.mutedGold,
  );

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    Color blend(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColors(
      brightness: t < 0.5 ? brightness : other.brightness,
      background: blend(background, other.background),
      surface: blend(surface, other.surface),
      surfaceVariant: blend(surfaceVariant, other.surfaceVariant),
      primary: blend(primary, other.primary),
      onPrimary: blend(onPrimary, other.onPrimary),
      secondary: blend(secondary, other.secondary),
      onSecondary: blend(onSecondary, other.onSecondary),
      onSurface: blend(onSurface, other.onSurface),
      onSurfaceVariant: blend(onSurfaceVariant, other.onSurfaceVariant),
      outline: blend(outline, other.outline),
      divider: blend(divider, other.divider),
      disabled: blend(disabled, other.disabled),
      error: blend(error, other.error),
      success: blend(success, other.success),
      warning: blend(warning, other.warning),
      focusIndicator: blend(focusIndicator, other.focusIndicator),
      mutedGold: blend(mutedGold, other.mutedGold),
    );
  }
}

abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
}

abstract final class AppShapes {
  static const double controlRadius = 8;
  static const double buttonRadius = 14;
  static const double cardRadius = 18;
  static const double containerRadius = 20;
}

abstract final class AppIconSizes {
  static const double compact = 20;
  static const double regular = 24;
}

/// Semantic interface styles. The Mushaf renderer has its own typography.
abstract final class AppTypography {
  static const family = 'IBM Plex Sans Arabic';

  static TextTheme build() => TextTheme(
    displayLarge: TextStyle(
      fontFamily: family,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    headlineMedium: TextStyle(
      fontFamily: family,
      fontSize: 26,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    titleLarge: TextStyle(
      fontFamily: family,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 1.45,
    ),
    titleMedium: TextStyle(
      fontFamily: family,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),
    bodyLarge: TextStyle(
      fontFamily: family,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.6,
    ),
    bodyMedium: TextStyle(
      fontFamily: family,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.6,
    ),
    bodySmall: TextStyle(
      fontFamily: family,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    labelLarge: TextStyle(
      fontFamily: family,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    labelMedium: TextStyle(
      fontFamily: family,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
  );
}
