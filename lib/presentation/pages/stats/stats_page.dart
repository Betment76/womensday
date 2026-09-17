import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/extensions/plural_extension.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/domain/entities/cycle_forecast.dart';
import 'package:womensday/domain/entities/period_cycle.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';
import 'package:womensday/presentation/widgets/export_doctor_report_button.dart';
import 'package:womensday/presentation/widgets/section_card.dart';

/// Средние значения и история циклов.
class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CycleForecast forecast = ref
        .watch(calendarControllerProvider)
        .forecast;
    final List<PeriodCycle> displayedCycles = executeTakeDisplayedCycles(
      forecast.cycles,
    );
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        children: [
          Text(
            'Циклы',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: executeStatTile(
                  context,
                  title: 'Длина цикла',
                  value: '${forecast.averageCycleLength}',
                  unit: executePluralDays(forecast.averageCycleLength),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: executeStatTile(
                  context,
                  title: 'Месячные',
                  value: '${forecast.averagePeriodDuration}',
                  unit: executePluralDays(forecast.averagePeriodDuration),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SectionCard(
            child: Row(
              children: [
                const Icon(Icons.favorite_outline, color: SakuraColors.sakura),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    forecast.regularity.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const ExportDoctorReportButton(),
          const SizedBox(height: 16),
          Text(
            'Последние циклы',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          if (displayedCycles.isEmpty)
            const SectionCard(
              child: Text('Отметьте месячные — здесь появится история.'),
            )
          else
            ...displayedCycles.reversed.map(
              (PeriodCycle cycle) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: executeCycleTile(context, cycle),
              ),
            ),
        ],
      ),
    );
  }

  List<PeriodCycle> executeTakeDisplayedCycles(List<PeriodCycle> cycles) {
    if (cycles.length <= AppConstants.maxDisplayedCycles) {
      return cycles;
    }
    return cycles.sublist(cycles.length - AppConstants.maxDisplayedCycles);
  }

  Widget executeStatTile(
    BuildContext context, {
    required String title,
    required String value,
    required String unit,
  }) {
    return SectionCard(
      child: Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 6),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: SakuraColors.deepBlossom,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(unit),
        ],
      ),
    );
  }

  Widget executeCycleTile(BuildContext context, PeriodCycle cycle) {
    final DateFormat formatter = DateFormat('d MMM', 'ru');
    final String range =
        '${formatter.format(cycle.start)} — ${formatter.format(cycle.end)}';
    final String lengthLabel = cycle.lengthToNext == null
        ? 'текущий цикл'
        : '${cycle.lengthToNext} ${executePluralDays(cycle.lengthToNext!)}';
    return SectionCard(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  range,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                Text(
                  'Месячные ${cycle.duration} ${executePluralDays(cycle.duration)}',
                ),
              ],
            ),
          ),
          Text(lengthLabel, style: const TextStyle(color: SakuraColors.sakura)),
        ],
      ),
    );
  }
}
