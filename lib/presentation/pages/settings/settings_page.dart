import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/domain/entities/cycle_settings.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';
import 'package:womensday/presentation/widgets/premium_purchase_button.dart';
import 'package:womensday/presentation/widgets/number_stepper.dart';
import 'package:womensday/presentation/widgets/section_card.dart';

/// Настройки цикла, напоминаний и сброс данных.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CalendarState state = ref.watch(calendarControllerProvider);
    final CycleSettings settings = state.data.settings;
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        children: [
          Text(
            'Настройки',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          SectionCard(
            child: NumberStepper(
              label: 'Обычная длина цикла',
              value: settings.cycleLength,
              min: AppConstants.minCycleLength,
              max: AppConstants.maxCycleLength,
              onChanged: (int value) {
                executeSave(ref, settings.copyWith(cycleLength: value));
              },
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(
            child: NumberStepper(
              label: 'Длительность месячных',
              value: settings.periodDuration,
              min: AppConstants.minPeriodDuration,
              max: AppConstants.maxPeriodDuration,
              onChanged: (int value) {
                executeSave(ref, settings.copyWith(periodDuration: value));
              },
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 48,
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Напоминание',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'За день до прогноза месячных',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: settings.areRemindersEnabled,
                    activeThumbColor: SakuraColors.sakura,
                    onChanged: (bool value) {
                      executeSave(
                        ref,
                        settings.copyWith(areRemindersEnabled: value),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(
            padding: EdgeInsets.zero,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () => context.push('/about'),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'О приложении',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          SizedBox(height: 8),
                          Text('Фазы цикла и юридические документы'),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: SakuraColors.sakura),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const PremiumPurchaseButton(),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () => executeConfirmReset(context, ref),
            child: const Text('Сбросить все данные'),
          ),
        ],
      ),
    );
  }

  void executeSave(WidgetRef ref, CycleSettings settings) {
    ref
        .read(calendarControllerProvider.notifier)
        .executeUpdateSettings(settings);
  }

  Future<void> executeConfirmReset(BuildContext context, WidgetRef ref) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Сбросить данные?'),
          content: const Text(
            'Календарь, заметки и настройки будут удалены. Онбординг начнётся заново.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Отмена'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Сбросить'),
            ),
          ],
        );
      },
    );
    if (confirmed != true) {
      return;
    }
    await ref.read(calendarControllerProvider.notifier).executeResetData();
  }
}
