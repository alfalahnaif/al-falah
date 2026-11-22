import 'package:al_falah/app/router/app_routes.dart';
import 'package:al_falah/core/localization/app_strings.dart';
import 'package:al_falah/shared/widgets/app_button.dart';
import 'package:al_falah/app/router/feature_shell.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => FeatureShell(
    title: AppStrings.settings,
    message: AppStrings.settingsUnavailable,
    action: AppButton(
      label: AppStrings.about,
      variant: AppButtonVariant.secondary,
      onPressed: () => context.pushNamed(AppRoutes.about),
    ),
  );
}
