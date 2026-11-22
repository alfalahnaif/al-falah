import 'package:al_falah/app/router/app_routes.dart';
import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:al_falah/core/localization/app_strings.dart';
import 'package:al_falah/shared/widgets/app_button.dart';
import 'package:al_falah/shared/widgets/app_card.dart';
import 'package:al_falah/shared/icons/app_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.name),
        actions: [
          AppIconButton(
            icon: AppIconName.settings,
            label: AppStrings.settings,
            onPressed: () => context.pushNamed(AppRoutes.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            AppCard(
              onTap: () => context.goNamed(AppRoutes.surahIndex),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppIcon(
                    AppIconName.quran,
                    color: AppColors.of(context).primary,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    AppStrings.quranEntry,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    AppStrings.contentUnavailable,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.of(context).onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              AppStrings.quickAccess,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            AppButton(
              label: AppStrings.bookmarks,
              leadingIcon: AppIconName.bookmarks,
              variant: AppButtonVariant.secondary,
              onPressed: () => context.goNamed(AppRoutes.bookmarks),
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: AppStrings.adhkar,
              leadingIcon: AppIconName.adhkar,
              variant: AppButtonVariant.secondary,
              onPressed: () => context.goNamed(AppRoutes.adhkar),
            ),
          ],
        ),
      ),
    );
  }
}
