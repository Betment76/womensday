import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/domain/entities/cycle_forecast.dart';
import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/cycle_settings.dart';
import 'package:womensday/domain/entities/day_log.dart';
import 'package:womensday/domain/entities/period_cycle.dart';

/// Входные данные для прогноза цикла.
class CycleForecastInput {
  const CycleForecastInput({
    required this.settings,
    required this.logs,
    required this.today,
  });

  final CycleSettings settings;
  final Map<String, DayLog> logs;
  final DateTime today;
}

/// Расчёт фаз, средних значений и прогноза.
class CycleCalculator {
  CycleForecast executeForecast(CycleForecastInput input) {
    final DateTime today = input.today.dateOnly;
    final Set<DateTime> actualPeriodDays = executeCollectPeriodDays(input.logs);
    final List<PeriodCycle> cycles = executeBuildCycles(actualPeriodDays);
    final int averageCycleLength = executeAverageCycleLength(
      cycles: cycles,
      fallback: input.settings.cycleLength,
    );
    final int averagePeriodDuration = executeAveragePeriodDuration(
      cycles: cycles,
      fallback: input.settings.periodDuration,
    );
    final DateTime currentStart = executeCurrentCycleStart(
      cycles: cycles,
      fallbackStart: input.settings.lastPeriodStart.dateOnly,
    );
    final DateTime nextPeriodStart = currentStart.add(
      Duration(days: averageCycleLength),
    );
    final Set<DateTime> predictedPeriodDays = executeCollectPredictedPeriodDays(
      lastStart: currentStart,
      averageCycleLength: averageCycleLength,
      averagePeriodDuration: averagePeriodDuration,
      today: today,
    )..removeWhere(actualPeriodDays.contains);
    final Set<DateTime> ovulationDays = executeCollectOvulationDays(
      cycleStarts: executeCollectCycleStarts(
        cycles: cycles,
        currentStart: currentStart,
        averageCycleLength: averageCycleLength,
      ),
      averageCycleLength: averageCycleLength,
    );
    final Set<DateTime> fertileDays = executeCollectFertileDays(ovulationDays);
    final int cycleDay = today.difference(currentStart).inDays + 1;
    final bool isLate = cycleDay > averageCycleLength;
    final int daysUntilPeriod = isLate
        ? 0
        : nextPeriodStart.difference(today).inDays;
    return CycleForecast(
      cycles: cycles,
      averageCycleLength: averageCycleLength,
      averagePeriodDuration: averagePeriodDuration,
      actualPeriodDays: actualPeriodDays,
      predictedPeriodDays: predictedPeriodDays,
      ovulationDays: ovulationDays,
      fertileDays: fertileDays,
      currentPhase: executeResolvePhase(
        today: today,
        currentStart: currentStart,
        averageCycleLength: averageCycleLength,
        averagePeriodDuration: averagePeriodDuration,
        ovulationDays: ovulationDays,
        fertileDays: fertileDays,
        actualPeriodDays: actualPeriodDays,
      ),
      cycleDay: cycleDay < 1 ? 1 : cycleDay,
      daysUntilPeriod: daysUntilPeriod,
      isLate: isLate,
      regularity: executeResolveRegularity(cycles),
      currentCycleStart: currentStart,
      nextPeriodStart: nextPeriodStart,
    );
  }

  Set<DateTime> executeCollectPeriodDays(Map<String, DayLog> logs) {
    return logs.values
        .where((DayLog log) => log.isPeriod)
        .map((DayLog log) => log.date.dateOnly)
        .toSet();
  }

  List<PeriodCycle> executeBuildCycles(Set<DateTime> periodDays) {
    if (periodDays.isEmpty) {
      return const <PeriodCycle>[];
    }
    final List<DateTime> sorted = periodDays.toList()..sort();
    final List<PeriodCycle> cycles = <PeriodCycle>[];
    DateTime groupStart = sorted.first;
    DateTime groupEnd = sorted.first;
    for (int i = 1; i < sorted.length; i++) {
      final DateTime current = sorted[i];
      if (current.difference(groupEnd).inDays == 1) {
        groupEnd = current;
        continue;
      }
      cycles.add(PeriodCycle(start: groupStart, end: groupEnd));
      groupStart = current;
      groupEnd = current;
    }
    cycles.add(PeriodCycle(start: groupStart, end: groupEnd));
    return executeAttachCycleLengths(cycles);
  }

  List<PeriodCycle> executeAttachCycleLengths(List<PeriodCycle> cycles) {
    return List<PeriodCycle>.generate(cycles.length, (int index) {
      if (index == cycles.length - 1) {
        return cycles[index];
      }
      final int length = cycles[index + 1].start
          .difference(cycles[index].start)
          .inDays;
      return cycles[index].copyWith(lengthToNext: length);
    });
  }

  int executeAverageCycleLength({
    required List<PeriodCycle> cycles,
    required int fallback,
  }) {
    final List<int> lengths = cycles
        .map((PeriodCycle cycle) => cycle.lengthToNext)
        .whereType<int>()
        .where((int length) => length >= AppConstants.minCycleLength)
        .toList();
    return executeAverageOrFallback(lengths, fallback);
  }

  int executeAveragePeriodDuration({
    required List<PeriodCycle> cycles,
    required int fallback,
  }) {
    if (cycles.isEmpty) {
      return fallback;
    }
    final List<PeriodCycle> recent = executeTakeRecent(cycles);
    final int sum = recent.fold<int>(
      0,
      (int acc, PeriodCycle cycle) => acc + cycle.duration,
    );
    return (sum / recent.length).round();
  }

  int executeAverageOrFallback(List<int> values, int fallback) {
    if (values.isEmpty) {
      return fallback;
    }
    final List<int> recent = values.length > AppConstants.maxCyclesForAverage
        ? values.sublist(values.length - AppConstants.maxCyclesForAverage)
        : values;
    final int sum = recent.fold<int>(0, (int acc, int value) => acc + value);
    return (sum / recent.length).round();
  }

  DateTime executeCurrentCycleStart({
    required List<PeriodCycle> cycles,
    required DateTime fallbackStart,
  }) {
    if (cycles.isEmpty) {
      return fallbackStart;
    }
    return cycles.last.start;
  }

  Set<DateTime> executeCollectPredictedPeriodDays({
    required DateTime lastStart,
    required int averageCycleLength,
    required int averagePeriodDuration,
    required DateTime today,
  }) {
    final Set<DateTime> predicted = <DateTime>{};
    DateTime cursor = lastStart.dateOnly;
    for (int i = 0; i < AppConstants.forecastCycleCount; i++) {
      for (int day = 0; day < averagePeriodDuration; day++) {
        final DateTime date = cursor.add(Duration(days: day)).dateOnly;
        if (!date.isBefore(today)) {
          predicted.add(date);
        }
      }
      cursor = cursor.add(Duration(days: averageCycleLength));
    }
    return predicted;
  }

  List<DateTime> executeCollectCycleStarts({
    required List<PeriodCycle> cycles,
    required DateTime currentStart,
    required int averageCycleLength,
  }) {
    final List<DateTime> starts = cycles
        .map((PeriodCycle cycle) => cycle.start)
        .toList();
    if (starts.isEmpty || !starts.last.isSameDay(currentStart)) {
      starts.add(currentStart);
    }
    DateTime cursor = currentStart.add(Duration(days: averageCycleLength));
    for (int i = 0; i < AppConstants.forecastCycleCount; i++) {
      starts.add(cursor);
      cursor = cursor.add(Duration(days: averageCycleLength));
    }
    return starts;
  }

  Set<DateTime> executeCollectOvulationDays({
    required List<DateTime> cycleStarts,
    required int averageCycleLength,
  }) {
    final int ovulationOffset =
        averageCycleLength - AppConstants.lutealPhaseDays;
    if (ovulationOffset < 1) {
      return <DateTime>{};
    }
    return cycleStarts
        .map(
          (DateTime start) =>
              start.add(Duration(days: ovulationOffset)).dateOnly,
        )
        .toSet();
  }

  Set<DateTime> executeCollectFertileDays(Set<DateTime> ovulationDays) {
    final Set<DateTime> fertileDays = <DateTime>{};
    for (final DateTime ovulation in ovulationDays) {
      for (
        int offset = -AppConstants.fertileDaysBeforeOvulation;
        offset <= AppConstants.fertileDaysAfterOvulation;
        offset++
      ) {
        fertileDays.add(ovulation.add(Duration(days: offset)).dateOnly);
      }
    }
    return fertileDays;
  }

  CyclePhase executeResolvePhase({
    required DateTime today,
    required DateTime currentStart,
    required int averageCycleLength,
    required int averagePeriodDuration,
    required Set<DateTime> ovulationDays,
    required Set<DateTime> fertileDays,
    required Set<DateTime> actualPeriodDays,
  }) {
    if (actualPeriodDays.contains(today) ||
        (!today.isBefore(currentStart) &&
            today.difference(currentStart).inDays < averagePeriodDuration)) {
      return CyclePhase.menstruation;
    }
    if (today.difference(currentStart).inDays + 1 > averageCycleLength) {
      return CyclePhase.late;
    }
    if (ovulationDays.contains(today)) {
      return CyclePhase.ovulation;
    }
    if (fertileDays.contains(today)) {
      return CyclePhase.fertile;
    }
    final int ovulationOffset =
        averageCycleLength - AppConstants.lutealPhaseDays;
    final DateTime ovulation = currentStart.add(
      Duration(days: ovulationOffset),
    );
    if (today.isAfter(ovulation)) {
      return CyclePhase.luteal;
    }
    return CyclePhase.follicular;
  }

  List<PeriodCycle> executeTakeRecent(List<PeriodCycle> cycles) {
    if (cycles.length <= AppConstants.maxCyclesForAverage) {
      return cycles;
    }
    return cycles.sublist(cycles.length - AppConstants.maxCyclesForAverage);
  }

  CycleRegularity executeResolveRegularity(List<PeriodCycle> cycles) {
    final List<int> recent = executeTakeRecent(
      cycles,
    ).map((PeriodCycle cycle) => cycle.lengthToNext).whereType<int>().toList();
    if (recent.length < 2) {
      return CycleRegularity.unknown;
    }
    final double average =
        recent.fold<int>(0, (int acc, int value) => acc + value) /
        recent.length;
    final double variance =
        recent.fold<double>(
          0,
          (double acc, int value) =>
              acc + (value - average) * (value - average),
        ) /
        recent.length;
    if (variance <= 9) {
      return CycleRegularity.stable;
    }
    if (variance <= 25) {
      return CycleRegularity.mild;
    }
    return CycleRegularity.irregular;
  }
}
