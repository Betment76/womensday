import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/core/extensions/plural_extension.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';
import 'package:womensday/presentation/extensions/cycle_phase_ui.dart';
import 'package:womensday/presentation/widgets/day_details_card.dart';
import 'package:womensday/presentation/widgets/sakura_background.dart';
import 'package:womensday/presentation/widgets/section_card.dart';

/// Главный экран: фаза, прогноз и карточка дня.
class TodayPage extends ConsumerWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CalendarState state = ref.watch(calendarControllerProvider);
    final DateTime today = DateTime.now().dateOnly;
    final Widget header = executeHeader(context, today);
    final Widget phase = executePhaseCard(context, state);
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            header,
            const SizedBox(height: 10),
            phase,
            const SizedBox(height: 8),
            Expanded(
              child: DayDetailsCard(
                date: today,
                showDateTitle: false,
                noteMaxLines: 2,
                isCompact: true,
                showSaveButton: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget executeHeader(BuildContext context, DateTime today) {
    return Row(
      children: [
        const SakuraMark(),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.appName,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            Text(
              DateFormat('EEEE, d MMMM', 'ru').format(today),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: SakuraColors.wood),
            ),
          ],
        ),
      ],
    );
  }

  Widget executePhaseCard(BuildContext context, CalendarState state) {
    return SectionCard(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
      child: Column(
        children: [
          Text(
            'День ${state.forecast.cycleDay}',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: SakuraColors.deepBlossom,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            state.forecast.currentPhase.title,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            executeStatusText(state),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: SakuraColors.sakura,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            state.forecast.currentPhase.hint,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  String executeStatusText(CalendarState state) {
    if (state.forecast.currentPhase == CyclePhase.menstruation) {
      return 'Идут месячные';
    }
    if (state.forecast.isLate) {
      final int delay =
          state.forecast.cycleDay - state.forecast.averageCycleLength;
      return 'Задержка $delay ${executePluralDays(delay)}';
    }
    return 'До месячных ${state.forecast.daysUntilPeriod} ${executePluralDays(state.forecast.daysUntilPeriod)}';
  }
}
