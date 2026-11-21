import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:al_falah/core/localization/app_strings.dart';
import 'package:al_falah/shared/widgets/app_card.dart';
import 'package:material_ui/material_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.name)),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: AppCard(
              child: Text(
                AppStrings.englishName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
