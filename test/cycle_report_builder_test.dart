import 'package:flutter_test/flutter_test.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/domain/entities/calendar_data.dart';
import 'package:womensday/domain/entities/cycle_forecast.dart';
import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/cycle_report.dart';
import 'package:womensday/domain/entities/cycle_settings.dart';
import 'package:womensday/domain/entities/day_log.dart';
import 'package:womensday/domain/entities/period_cycle.dart';
import 'package:womensday/domain/services/cycle_report_builder.dart';

void main() {
  final CycleReportBuilder builder = CycleReportBuilder();
  final DateTime today = DateTime(2026, 9, 7);

  test('берёт последние 12 циклов и дневник в их диапазоне', () {
    final List<PeriodCycle> cycles = List<PeriodCycle>.generate(14, (int index) {
      final DateTime start = DateTime(2025, 8, 1).add(Duration(days: index * 28));
      return PeriodCycle(
        start: start,
        end: start.add(const Duration(days: 4)),
        lengthToNext: index == 13 ? null : 28,
      );
    });
    final PeriodCycle firstKept = cycles[2];
    final DateTime inside = firstKept.start;
    final DateTime before = firstKept.start.subtract(const Duration(days: 1));
    final Map<String, DayLog> logs = <String, DayLog>{
      before.storageKey: DayLog(date: before, note: 'старая'),
      inside.storageKey: DayLog(date: inside, isPeriod: true),
      today.storageKey: DayLog(date: today, note: 'сегодня'),
    };
    final CycleReport actual = builder.executeBuild(
      data: CalendarData(
        isOnboardingCompleted: true,
        settings: CycleSettings.createDefault(),
        logs: logs,
      ),
      forecast: executeForecast(cycles: cycles),
      generatedAt: today,
      today: today,
    );
    expect(actual.cycles, hasLength(12));
    expect(actual.cycles.first.start, firstKept.start);
    expect(actual.logs, hasLength(2));
    expect(actual.logs.first.date, inside);
    expect(actual.logs.last.date, today);
  });

  test('пустые циклы не включают записи без содержания', () {
    final DateTime emptyDate = today.subtract(const Duration(days: 2));
    final CycleReport actual = builder.executeBuild(
      data: CalendarData(
        isOnboardingCompleted: true,
        settings: CycleSettings.createDefault(),
        logs: <String, DayLog>{
          emptyDate.storageKey: DayLog(date: emptyDate),
        },
      ),
      forecast: executeForecast(cycles: const <PeriodCycle>[]),
      generatedAt: today,
      today: today,
    );
    expect(actual.cycles, isEmpty);
    expect(actual.logs, isEmpty);
    expect(actual.averageCycleLength, 28);
  });
}

CycleForecast executeForecast({required List<PeriodCycle> cycles}) {
  return CycleForecast(
    cycles: cycles,
    averageCycleLength: 28,
    averagePeriodDuration: 5,
    actualPeriodDays: <DateTime>{},
    predictedPeriodDays: <DateTime>{},
    ovulationDays: <DateTime>{},
    fertileDays: <DateTime>{},
    currentPhase: CyclePhase.follicular,
    cycleDay: 1,
    daysUntilPeriod: 28,
    isLate: false,
    regularity: CycleRegularity.stable,
  );
}
