import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:material_ui/material_ui.dart';

/// Light and dark interface themes use the bundled IBM Plex Sans Arabic family.
abstract final class AppTheme {
  static ThemeData get light => _build(AppColors.light);
  static ThemeData get dark => _build(AppColors.dark);

  static ThemeData _build(AppColors colors) {
    final text = AppTypography.build().apply(
      bodyColor: colors.onSurface,
      displayColor: colors.onSurface,
    );
    final scheme =
        ColorScheme.fromSeed(
          seedColor: colors.primary,
          brightness: colors.brightness,
        ).copyWith(
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          secondary: colors.secondary,
          onSecondary: colors.onSecondary,
          surface: colors.surface,
          onSurface: colors.onSurface,
          surfaceContainer: colors.surfaceVariant,
          surfaceContainerLow: colors.background,
          surfaceContainerHigh: colors.surfaceVariant,
          onSurfaceVariant: colors.onSurfaceVariant,
          outline: colors.outline,
          outlineVariant: colors.divider,
          error: colors.error,
          onError: colors.brightness == Brightness.light
              ? colors.surface
              : colors.background,
          surfaceTint: Colors.transparent,
        );

    ButtonStyle buttonStyle({required Color foreground, Color? background}) =>
        ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(48, 48)),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppShapes.buttonRadius),
            ),
          ),
          textStyle: WidgetStatePropertyAll(text.labelLarge),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? colors.disabled
                : foreground,
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? (background == null ? null : colors.surfaceVariant)
                : background,
          ),
          side: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.focused)
                ? BorderSide(color: colors.focusIndicator, width: 2)
                : null,
          ),
        );

    return ThemeData(
      useMaterial3: true,
      brightness: colors.brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: colors.background,
      fontFamily: AppTypography.family,
      textTheme: text,
      iconTheme: IconThemeData(
        color: colors.onSurface,
        size: AppIconSizes.regular,
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      extensions: [colors],
      filledButtonTheme: FilledButtonThemeData(
        style: buttonStyle(
          foreground: colors.onPrimary,
          background: colors.primary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: buttonStyle(foreground: colors.primary).copyWith(
          side: WidgetStateProperty.resolveWith(
            (states) => BorderSide(
              color: states.contains(WidgetState.focused)
                  ? colors.focusIndicator
                  : colors.outline,
              width: states.contains(WidgetState.focused) ? 2 : 1,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: buttonStyle(foreground: colors.primary),
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colors.divider),
          borderRadius: BorderRadius.circular(AppShapes.cardRadius),
        ),
      ),
      appBarTheme: AppBarThemeData(
        backgroundColor: colors.background,
        foregroundColor: colors.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        titleTextStyle: text.titleLarge,
        iconTheme: IconThemeData(color: colors.onSurface),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        indicatorColor: colors.surfaceVariant,
        labelTextStyle: WidgetStatePropertyAll(text.labelMedium),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: colors.surface,
        labelStyle: text.bodyMedium,
        hintStyle: text.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppShapes.controlRadius),
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppShapes.controlRadius),
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppShapes.controlRadius),
          borderSide: BorderSide(color: colors.focusIndicator, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppShapes.controlRadius),
          borderSide: BorderSide(color: colors.error),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppShapes.containerRadius),
        ),
      ),
      dividerTheme: DividerThemeData(color: colors.divider, thickness: 1),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(48, 48)),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? colors.disabled
                : colors.onSurface,
          ),
          side: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.focused)
                ? BorderSide(color: colors.focusIndicator, width: 2)
                : null,
          ),
        ),
      ),
    );
  }
}
