import 'package:al_falah/app/router/feature_shell.dart';
import 'package:al_falah/core/localization/app_strings.dart';
import 'package:material_ui/material_ui.dart';

class AdhkarPage extends StatelessWidget {
  const AdhkarPage({super.key});

  @override
  Widget build(BuildContext context) => const FeatureShell(
    title: AppStrings.adhkar,
    message: AppStrings.adhkarUnavailable,
    showBack: false,
  );
}
