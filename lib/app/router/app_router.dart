import 'package:al_falah/app/router/app_routes.dart';
import 'package:al_falah/app/router/feature_shell.dart';
import 'package:al_falah/core/localization/app_strings.dart';
import 'package:al_falah/features/about/presentation/about_page.dart';
import 'package:al_falah/features/bookmarks/presentation/bookmarks_page.dart';
import 'package:al_falah/features/home/presentation/home_page.dart';
import 'package:al_falah/features/quran/presentation/surah_index_page.dart';
import 'package:al_falah/features/settings/presentation/settings_page.dart';
import 'package:al_falah/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouter {
  /// Construct once per app instance. Tests can supply and dispose their own router.
  static GoRouter create() => GoRouter(
    initialLocation: AppRoutes.homePath,
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: AppRoutes.homePath,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: AppRoutes.surahIndex,
        path: AppRoutes.surahIndexPath,
        builder: (context, state) => const SurahIndexPage(),
      ),
      GoRoute(
        name: AppRoutes.bookmarks,
        path: AppRoutes.bookmarksPath,
        builder: (context, state) => const BookmarksPage(),
      ),
      GoRoute(
        name: AppRoutes.settings,
        path: AppRoutes.settingsPath,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        name: AppRoutes.about,
        path: AppRoutes.aboutPath,
        builder: (context, state) => const AboutPage(),
      ),
    ],
    errorBuilder: (context, state) => FeatureShell(
      title: AppStrings.notFound,
      message: AppStrings.notFoundMessage,
      action: AppButton(
        label: AppStrings.returnHome,
        onPressed: () => context.goNamed(AppRoutes.home),
      ),
    ),
  );
}
