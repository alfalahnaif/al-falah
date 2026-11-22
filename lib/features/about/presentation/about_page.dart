import 'package:al_falah/core/localization/app_strings.dart';
import 'package:al_falah/shared/widgets/app_button.dart';
import 'package:al_falah/app/router/feature_shell.dart';
import 'package:material_ui/material_ui.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) => FeatureShell(
    title: AppStrings.about,
    message: AppStrings.aboutUnavailable,
    action: AppButton(
      label: AppStrings.softwareLicenses,
      variant: AppButtonVariant.secondary,
      onPressed: () =>
          showLicensePage(context: context, applicationName: AppStrings.name),
    ),
  );
}
