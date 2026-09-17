import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/period_cycle.dart';

/// Готовый прогноз для экранов календаря.
class CycleForecast {
  const CycleForecast({
    required this.cycles,
    required this.averageCycleLength,
    required this.averagePeriodDuration,
    required this.actualPeriodDays,
    required this.predictedPeriodDays,
    required this.ovulationDays,
    required this.fertileDays,
    required this.currentPhase,
    required this.cycleDay,
    required this.daysUntilPeriod,
    required this.isLate,
    required this.regularity,
    this.currentCycleStart,
    this.nextPeriodStart,
  });

  final List<PeriodCycle> cycles;
  final int averageCycleLength;
  final int averagePeriodDuration;
  final Set<DateTime> actualPeriodDays;
  final Set<DateTime> predictedPeriodDays;
  final Set<DateTime> ovulationDays;
  final Set<DateTime> fertileDays;
  final CyclePhase currentPhase;
  final int cycleDay;
  final int daysUntilPeriod;
  final bool isLate;
  final CycleRegularity regularity;
  final DateTime? currentCycleStart;
  final DateTime? nextPeriodStart;

  factory CycleForecast.createEmpty({
    required int cycleLength,
    required int periodDuration,
  }) {
    return CycleForecast(
      cycles: const <PeriodCycle>[],
      averageCycleLength: cycleLength,
      averagePeriodDuration: periodDuration,
      actualPeriodDays: <DateTime>{},
      predictedPeriodDays: <DateTime>{},
      ovulationDays: <DateTime>{},
      fertileDays: <DateTime>{},
      currentPhase: CyclePhase.follicular,
      cycleDay: 1,
      daysUntilPeriod: cycleLength,
      isLate: false,
      regularity: CycleRegularity.unknown,
    );
  }
}
