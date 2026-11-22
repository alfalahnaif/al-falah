import 'package:al_falah/app/router/app_routes.dart';
import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:al_falah/core/localization/app_strings.dart';
import 'package:al_falah/shared/icons/app_icon.dart';
import 'package:al_falah/shared/widgets/app_card.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

/// A restrained, data-free destination for features awaiting approved content.
class FeatureShell extends StatelessWidget {
  const FeatureShell({
    required this.title,
    required this.message,
    this.action,
    super.key,
  });

  final String title;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: AppIconButton(
        icon: AppIconName.back,
        label: AppStrings.back,
        onPressed: () {
          final router = GoRouter.of(context);
          if (router.canPop()) {
            router.pop();
          } else {
            router.goNamed(AppRoutes.home);
          }
        },
      ),
      title: Semantics(header: true, child: Text(title)),
    ),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          AppCard(child: Text(message)),
          if (action != null) ...[
            const SizedBox(height: AppSpacing.md),
            action!,
          ],
        ],
      ),
    ),
  );
}
