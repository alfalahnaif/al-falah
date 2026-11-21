import 'package:al_falah/app/theme/app_theme.dart';
import 'package:al_falah/core/localization/app_strings.dart';
import 'package:al_falah/features/home/presentation/home_page.dart';
import 'package:material_ui/material_ui.dart';

class AlFalahApp extends StatelessWidget {
  const AlFalahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.name,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
