import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:material_ui/material_ui.dart';

/// A flat outlined surface. Interactive cards use Material's built-in semantics.
class AppCard extends StatelessWidget {
  const AppCard({required this.child, this.onTap, super.key});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final shape = RoundedRectangleBorder(
      side: BorderSide(color: colors.divider),
      borderRadius: BorderRadius.circular(AppShapes.cardRadius),
    );
    final content = Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: child,
    );
    return Card(
      color: colors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? content
          : InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(AppShapes.cardRadius),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 48),
                child: content,
              ),
            ),
    );
  }
}
