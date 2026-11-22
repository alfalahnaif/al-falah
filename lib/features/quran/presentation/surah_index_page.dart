import 'package:al_falah/core/localization/app_strings.dart';
import 'package:al_falah/app/router/feature_shell.dart';
import 'package:material_ui/material_ui.dart';

class SurahIndexPage extends StatelessWidget {
  const SurahIndexPage({super.key});

  @override
  Widget build(BuildContext context) => const FeatureShell(
    title: AppStrings.quranTab,
    message: AppStrings.contentUnavailable,
    showBack: false,
  );
}
