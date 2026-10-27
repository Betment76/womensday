import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/l10n/app_localizations.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';
import 'package:womensday/presentation/widgets/sakura_background.dart';

/// Нижняя навигация по четырём главным экранам.
class AppShellPage extends ConsumerWidget {
  const AppShellPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const int _calendarIndex = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return SakuraBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: navigationShell.currentIndex != 0,
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          animationDuration: AppConstants.animationDuration,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (int index) {
            if (index == _calendarIndex) {
              ref.read(selectedCalendarDateProvider.notifier).state =
                  DateTime.now().dateOnly;
            }
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          destinations: <NavigationDestination>[
            NavigationDestination(
              icon: const Icon(Icons.spa_outlined),
              selectedIcon: const Icon(Icons.spa),
              label: l10n.navToday,
            ),
            NavigationDestination(
              icon: const Icon(Icons.calendar_month_outlined),
              selectedIcon: const Icon(Icons.calendar_month),
              label: l10n.navCalendar,
            ),
            NavigationDestination(
              icon: const Icon(Icons.insights_outlined),
              selectedIcon: const Icon(Icons.insights),
              label: l10n.navStats,
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              label: l10n.navSettings,
            ),
          ],
        ),
      ),
    );
  }
}
