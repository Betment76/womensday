import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/domain/entities/calendar_data.dart';
import 'package:womensday/domain/entities/cycle_forecast.dart';
import 'package:womensday/domain/entities/cycle_report.dart';
import 'package:womensday/domain/entities/day_log.dart';
import 'package:womensday/domain/entities/period_cycle.dart';

/// Сборка снимка календаря для PDF.
class CycleReportBuilder {
  CycleReport executeBuild({
    required CalendarData data,
    required CycleForecast forecast,
    required DateTime generatedAt,
    required DateTime today,
  }) {
    final DateTime todayDate = today.dateOnly;
    final List<PeriodCycle> cycles = executeTakeRecentCycles(forecast.cycles);
    final DateTime rangeStart = executeResolveRangeStart(
      cycles: cycles,
      today: todayDate,
    );
    return CycleReport(
      generatedAt: generatedAt,
      averageCycleLength: forecast.averageCycleLength,
      averagePeriodDuration: forecast.averagePeriodDuration,
      regularity: forecast.regularity,
      cycles: cycles,
      logs: executeCollectLogs(
        logs: data.logs,
        rangeStart: rangeStart,
        today: todayDate,
      ),
    );
  }

  List<PeriodCycle> executeTakeRecentCycles(List<PeriodCycle> cycles) {
    if (cycles.length <= AppConstants.maxDisplayedCycles) {
      return List<PeriodCycle>.from(cycles);
    }
    return cycles.sublist(cycles.length - AppConstants.maxDisplayedCycles);
  }

  DateTime executeResolveRangeStart({
    required List<PeriodCycle> cycles,
    required DateTime today,
  }) {
    if (cycles.isEmpty) {
      return today.subtract(
        const Duration(days: AppConstants.maxReportLogs - 1),
      );
    }
    return cycles.first.start.dateOnly;
  }

  List<DayLog> executeCollectLogs({
    required Map<String, DayLog> logs,
    required DateTime rangeStart,
    required DateTime today,
  }) {
    final List<DayLog> collected =
        logs.values.where((DayLog log) => log.hasContent).where((DayLog log) {
          final DateTime date = log.date.dateOnly;
          return !date.isBefore(rangeStart) && !date.isAfter(today);
        }).toList()..sort(
          (DayLog left, DayLog right) => left.date.compareTo(right.date),
        );
    if (collected.length <= AppConstants.maxReportLogs) {
      return collected;
    }
    return collected.sublist(collected.length - AppConstants.maxReportLogs);
  }
}
