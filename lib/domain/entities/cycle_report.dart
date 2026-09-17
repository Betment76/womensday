import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/day_log.dart';
import 'package:womensday/domain/entities/period_cycle.dart';

/// Снимок календаря для выгрузки врачу.
class CycleReport {
  const CycleReport({
    required this.generatedAt,
    required this.averageCycleLength,
    required this.averagePeriodDuration,
    required this.regularity,
    required this.cycles,
    required this.logs,
  });

  final DateTime generatedAt;
  final int averageCycleLength;
  final int averagePeriodDuration;
  final CycleRegularity regularity;
  final List<PeriodCycle> cycles;
  final List<DayLog> logs;
}
