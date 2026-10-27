import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/constants/distribution_config.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/domain/entities/cycle_settings.dart';
import 'package:womensday/l10n/app_localizations.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';
import 'package:womensday/presentation/controllers/locale_controller.dart';
import 'package:womensday/presentation/widgets/premium_purchase_button.dart';
import 'package:womensday/presentation/widgets/number_stepper.dart';
import 'package:womensday/presentation/widgets/section_card.dart';

/// Настройки цикла, напоминаний и сброс данных.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final CalendarState state = ref.watch(calendarControllerProvider);
    final CycleSettings settings = state.data.settings;
    final Locale locale = ref.watch(localeControllerProvider);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        children: [
          Text(
            l10n.settingsTitle,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          SectionCard(
            padding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
            child: Column(
              children: [
                NumberStepper(
                  compact: true,
                  label: l10n.cycleLengthLabel,
                  value: settings.cycleLength,
                  unit: l10n.daysUnit,
                  min: AppConstants.minCycleLength,
                  max: AppConstants.maxCycleLength,
                  onChanged: (int value) {
                    executeSave(ref, settings.copyWith(cycleLength: value));
                  },
                ),
                const Divider(height: 20),
                NumberStepper(
                  compact: true,
                  label: l10n.periodDurationLabel,
                  value: settings.periodDuration,
                  unit: l10n.daysUnit,
                  min: AppConstants.minPeriodDuration,
                  max: AppConstants.maxPeriodDuration,
                  onChanged: (int value) {
                    executeSave(
                      ref,
                      settings.copyWith(periodDuration: value),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 48,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.reminderTitle,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          l10n.reminderSubtitle,
                          style: const TextStyle(fontSize: 11),
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 48,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.languageTitle,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SegmentedButton<String>(
                    segments: const <ButtonSegment<String>>[
                      ButtonSegment<String>(value: 'ru', label: Text('RU')),
                      ButtonSegment<String>(value: 'en', label: Text('EN')),
                    ],
                    selected: <String>{locale.languageCode},
                    onSelectionChanged: (Set<String> selection) {
                      unawaited(
                        executeApplyLocale(ref, selection.first),
                      );
                    },
                    style: ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.aboutTitle,
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 8),
                          Text(l10n.aboutSubtitle),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: SakuraColors.sakura),
                  ],
                ),
              ),
            ),
          ),
          if (DistributionConfig.paymentsEnabled) ...<Widget>[
            const SizedBox(height: 12),
            const PremiumPurchaseButton(),
          ],
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () => executeConfirmReset(context, ref),
            child: Text(l10n.resetData),
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
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(l10n.resetDialogTitle),
          content: Text(l10n.resetDialogBody),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(l10n.resetConfirm),
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
