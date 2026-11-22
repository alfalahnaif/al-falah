import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

/// Add mappings when a feature actually uses them, not for hypothetical screens.
enum AppIconName { home, quran, bookmarks, adhkar, settings, back }

class AppIcon extends StatelessWidget {
  const AppIcon(this.name, {this.compact = false, this.color, super.key});

  final AppIconName name;
  final bool compact;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final direction = Directionality.of(context);
    final data = switch (name) {
      AppIconName.home => LucideIcons.home,
      AppIconName.quran => LucideIcons.bookOpen,
      AppIconName.bookmarks => LucideIcons.bookmark,
      AppIconName.adhkar => LucideIcons.heart,
      AppIconName.settings => LucideIcons.settings,
      AppIconName.back =>
        direction == TextDirection.rtl
            ? LucideIcons.arrowRight
            : LucideIcons.arrowLeft,
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

  // Keep one spoken node; IconButton's tooltip remains available visually.
  @override
  Widget build(BuildContext context) => Semantics(
    label: label,
    button: true,
    enabled: onPressed != null,
    focusable: onPressed != null,
    onTap: onPressed,
    excludeSemantics: true,
    child: IconButton(
      tooltip: label,
      onPressed: onPressed,
      icon: AppIcon(icon),
    ),
  );
}
