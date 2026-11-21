import 'package:al_falah/core/localization/app_strings.dart';
import 'package:material_ui/material_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.name)),
      body: const Center(child: Text(AppStrings.englishName)),
    );
  }
}
