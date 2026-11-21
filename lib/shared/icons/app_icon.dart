import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:material_ui/material_ui.dart';

/// Add mappings when a feature actually uses them, not for hypothetical screens.
enum AppIconName { home, back }

class AppIcon extends StatelessWidget {
  const AppIcon(this.name, {this.compact = false, this.color, super.key});

  final AppIconName name;
  final bool compact;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final direction = Directionality.of(context);
    final data = switch (name) {
      AppIconName.home => Icons.home_outlined,
      AppIconName.back =>
        direction == TextDirection.rtl ? Icons.arrow_forward : Icons.arrow_back,
    };
    return Icon(
      data,
      size: compact ? AppIconSizes.compact : AppIconSizes.regular,
      color: color ?? AppColors.of(context).onSurface,
    );
  }
}

/// Requiring a label keeps standalone icon actions accessible.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.label,
    this.onPressed,
    super.key,
  });

  final AppIconName icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Semantics(
    label: label,
    button: true,
    enabled: onPressed != null,
    child: IconButton(
      tooltip: label,
      onPressed: onPressed,
      icon: AppIcon(icon),
    ),
  );
}
