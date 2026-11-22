import 'package:al_falah/app/theme/app_tokens.dart';
import 'package:al_falah/core/localization/app_strings.dart';
import 'package:al_falah/shared/icons/app_icon.dart';
import 'package:flutter/semantics.dart' show SemanticsRole;
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

/// Four peer destinations. The indexed shell retains each branch's widget state.
class MainNavigationShell extends StatelessWidget {
  const MainNavigationShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const _tabs = <({String label, AppIconName icon})>[
    (label: AppStrings.homeTab, icon: AppIconName.home),
    (label: AppStrings.quranTab, icon: AppIconName.quran),
    (label: AppStrings.bookmarks, icon: AppIconName.bookmarks),
    (label: AppStrings.adhkar, icon: AppIconName.adhkar),
  ];

  void _select(int index) => navigationShell.goBranch(
    index,
    initialLocation: index == navigationShell.currentIndex,
  );

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final scaledLabel = MediaQuery.textScalerOf(context).scale(14);
    return BackButtonListener(
      onBackButtonPressed: () async {
        if (GoRouter.of(context).canPop() ||
            navigationShell.currentIndex == 0) {
          return false;
        }
        navigationShell.goBranch(0);
        return true;
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: Material(
          key: const ValueKey('main-navigation-bar'),
          color: colors.surface,
          child: Semantics(
            role: SemanticsRole.tabBar,
            explicitChildNodes: true,
            child: SafeArea(
              top: false,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final twoRows =
                      constraints.maxWidth < 360 ||
                      (constraints.maxWidth < 600 && scaledLabel >= 21);
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(height: 1, color: colors.divider),
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.xs),
                        child: twoRows
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _row(context, [0, 1]),
                                  _row(context, [2, 3]),
                                ],
                              )
                            : _row(context, [0, 1, 2, 3]),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _row(BuildContext context, List<int> indices) => Row(
    children: [
      for (final index in indices)
        Expanded(child: _destination(context, index)),
    ],
  );

  Widget _destination(BuildContext context, int index) {
    final colors = AppColors.of(context);
    final tab = _tabs[index];
    final selected = navigationShell.currentIndex == index;
    final foreground = selected ? colors.primary : colors.onSurfaceVariant;
    final style = ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(48, 64)),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(AppSpacing.xs)),
      backgroundColor: WidgetStatePropertyAll(
        selected ? colors.surfaceVariant : colors.surface,
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppShapes.buttonRadius),
        ),
      ),
      side: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.focused)
            ? BorderSide(color: colors.focusIndicator, width: 2)
            : BorderSide.none,
      ),
    );
    return Semantics(
      role: SemanticsRole.tab,
      label: tab.label,
      selected: selected,
      button: true,
      onTap: () => _select(index),
      excludeSemantics: true,
      child: TextButton(
        onPressed: () => _select(index),
        style: style,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(tab.icon, color: foreground),
            Text(
              tab.label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium
                  ?.copyWith(color: foreground, letterSpacing: 0),
            ),
          ],
        ),
      ),
    );
  }
}
