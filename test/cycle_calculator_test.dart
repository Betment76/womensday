import 'package:flutter_test/flutter_test.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/core/extensions/plural_extension.dart';
import 'package:womensday/domain/entities/cycle_forecast.dart';
import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/cycle_settings.dart';
import 'package:womensday/domain/entities/day_log.dart';
import 'package:womensday/domain/entities/period_cycle.dart';
import 'package:womensday/domain/services/cycle_calculator.dart';

void main() {
  final CycleCalculator calculator = CycleCalculator();
  final DateTime start = DateTime(2026, 8, 1);

  test('подряд идущие дни собираются в один цикл', () {
    final Set<DateTime> periodDays = <DateTime>{
      start,
      start.add(const Duration(days: 1)),
      start.add(const Duration(days: 2)),
      start.add(const Duration(days: 3)),
      start.add(const Duration(days: 4)),
    };
    final List<PeriodCycle> actual = calculator.executeBuildCycles(periodDays);
    expect(actual, hasLength(1));
    expect(actual.first.start, start);
    expect(actual.first.duration, 5);
  });

  test('разрыв в днях даёт два цикла', () {
    final Set<DateTime> periodDays = <DateTime>{
      start,
      start.add(const Duration(days: 1)),
      start.add(const Duration(days: 28)),
      start.add(const Duration(days: 29)),
    };
    final List<PeriodCycle> actual = calculator.executeBuildCycles(periodDays);
    expect(actual, hasLength(2));
    expect(actual.first.lengthToNext, 28);
  });

  test('прогноз считает овуляцию за 14 дней до следующих месячных', () {
    final Map<String, DayLog> logs = executePeriodLogs(
      start: start,
      duration: 5,
    );
    final CycleForecast actual = calculator.executeForecast(
      CycleForecastInput(
        settings: CycleSettings(
          cycleLength: 28,
          periodDuration: 5,
          lastPeriodStart: start,
          areRemindersEnabled: false,
        ),
        logs: logs,
        today: start.add(const Duration(days: 10)),
      ),
    );
    expect(actual.averageCycleLength, 28);
    expect(actual.cycleDay, 11);
    expect(actual.currentPhase, CyclePhase.fertile);
    expect(
      actual.ovulationDays.contains(start.add(const Duration(days: 14))),
      isTrue,
    );
  });

  test('в дни месячных фаза menstruation', () {
    final Map<String, DayLog> logs = executePeriodLogs(
      start: start,
      duration: 5,
    );
    final CycleForecast actual = calculator.executeForecast(
      CycleForecastInput(
        settings: CycleSettings(
          cycleLength: 28,
          periodDuration: 5,
          lastPeriodStart: start,
          areRemindersEnabled: false,
        ),
        logs: logs,
        today: start.add(const Duration(days: 2)),
      ),
    );
    expect(actual.currentPhase, CyclePhase.menstruation);
  });

  test('после длины цикла фаза late', () {
    final Map<String, DayLog> logs = executePeriodLogs(
      start: start,
      duration: 5,
    );
    final CycleForecast actual = calculator.executeForecast(
      CycleForecastInput(
        settings: CycleSettings(
          cycleLength: 28,
          periodDuration: 5,
          lastPeriodStart: start,
          areRemindersEnabled: false,
        ),
        logs: logs,
        today: start.add(const Duration(days: 30)),
      ),
    );
    expect(actual.isLate, isTrue);
    expect(actual.currentPhase, CyclePhase.late);
  });

  test('регулярность unknown при одном цикле', () {
    final PeriodCycle cycle = PeriodCycle(
      start: start,
      end: start.add(const Duration(days: 4)),
    );
    expect(
      calculator.executeResolveRegularity(<PeriodCycle>[cycle]),
      CycleRegularity.unknown,
    );
  });

  test('русские формы слова день', () {
    expect(executePluralDays(1), 'день');
    expect(executePluralDays(2), 'дня');
    expect(executePluralDays(5), 'дней');
    expect(executePluralDays(21), 'день');
  });
}

Map<String, DayLog> executePeriodLogs({
  required DateTime start,
  required int duration,
}) {
  final Map<String, DayLog> logs = <String, DayLog>{};
  for (int day = 0; day < duration; day++) {
    final DateTime date = start.add(Duration(days: day)).dateOnly;
    logs[date.storageKey] = DayLog(date: date, isPeriod: true);
  }
  return logs;
}
