import 'package:al_falah/app/router/app_routes.dart';
import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:al_falah/core/localization/app_strings.dart';
import 'package:al_falah/shared/widgets/app_button.dart';
import 'package:al_falah/shared/widgets/app_card.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.name)),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppCard(
                  child: Text(
                    AppStrings.englishName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                AppButton(
                  label: AppStrings.surahIndex,
                  onPressed: () => context.pushNamed(AppRoutes.surahIndex),
                ),
                const SizedBox(height: AppSpacing.sm),
                AppButton(
                  label: AppStrings.bookmarks,
                  variant: AppButtonVariant.secondary,
                  onPressed: () => context.pushNamed(AppRoutes.bookmarks),
                ),
                const SizedBox(height: AppSpacing.sm),
                AppButton(
                  label: AppStrings.settings,
                  variant: AppButtonVariant.text,
                  onPressed: () => context.pushNamed(AppRoutes.settings),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
