import 'package:al_falah/app/theme/app_theme.dart';
import 'package:al_falah/app/router/app_router.dart';
import 'package:al_falah/core/localization/app_strings.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class AlFalahApp extends StatefulWidget {
  const AlFalahApp({this.router, super.key});

  /// Optional injected router keeps route tests isolated.
  final GoRouter? router;

  @override
  State<AlFalahApp> createState() => _AlFalahAppState();
}

class _AlFalahAppState extends State<AlFalahApp> {
  late final GoRouter _router = widget.router ?? AppRouter.create();

  @override
  void dispose() {
    if (widget.router == null) _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.name,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: _router,
    );
  }
}
