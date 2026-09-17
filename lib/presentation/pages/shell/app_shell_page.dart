import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';
import 'package:womensday/presentation/widgets/sakura_background.dart';

/// Нижняя навигация по четырём главным экранам.
class AppShellPage extends ConsumerWidget {
  const AppShellPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const int _calendarIndex = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.spa_outlined),
              selectedIcon: Icon(Icons.spa),
              label: 'Сегодня',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month),
              label: 'Календарь',
            ),
            NavigationDestination(
              icon: Icon(Icons.insights_outlined),
              selectedIcon: Icon(Icons.insights),
              label: 'Циклы',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: 'Ещё',
            ),
          ],
        ),
      ),
    );
  }
}
