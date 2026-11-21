import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:al_falah/core/localization/app_strings.dart';
import 'package:al_falah/shared/icons/app_icon.dart';
import 'package:material_ui/material_ui.dart';

enum AppButtonVariant { primary, secondary, text }

/// Shared behavior for labels, optional leading icons, and a disabled loading state.
class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.leadingIcon,
    this.isLoading = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppIconName? leadingIcon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final action = isLoading ? null : onPressed;
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: AppIconSizes.compact,
            height: AppIconSizes.compact,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
        ] else if (leadingIcon != null) ...[
          AppIcon(
            leadingIcon!,
            compact: true,
            color: onPressed == null
                ? colors.disabled
                : variant == AppButtonVariant.primary
                ? colors.onPrimary
                : colors.primary,
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
        Flexible(child: Text(label, textAlign: TextAlign.center)),
      ],
    );
    final child = isLoading
        ? Semantics(
            label: '$label، ${AppStrings.loading}',
            liveRegion: true,
            child: ExcludeSemantics(child: content),
          )
        : content;

    return switch (variant) {
      AppButtonVariant.primary => FilledButton(onPressed: action, child: child),
      AppButtonVariant.secondary => OutlinedButton(
        onPressed: action,
        child: child,
      ),
      AppButtonVariant.text => TextButton(onPressed: action, child: child),
    };
  }
}
