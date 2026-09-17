import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:womensday/core/di/calendar_bootstrap.dart';
import 'package:womensday/core/di/injection.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/domain/entities/calendar_data.dart';
import 'package:womensday/domain/entities/cycle_forecast.dart';
import 'package:womensday/domain/entities/cycle_report.dart';
import 'package:womensday/domain/entities/cycle_settings.dart';
import 'package:womensday/domain/entities/day_log.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/period_cycle.dart';
import 'package:womensday/domain/repositories/calendar_repository.dart';
import 'package:womensday/domain/services/cycle_calculator.dart';
import 'package:womensday/domain/services/cycle_report_builder.dart';
import 'package:womensday/domain/services/doctor_report_exporter.dart';
import 'package:womensday/domain/services/reminder_scheduler.dart';

/// Состояние календаря для экранов.
class CalendarState {
  const CalendarState({
    required this.isLoading,
    required this.hasLoadError,
    required this.data,
    required this.forecast,
    this.errorMessage,
    this.persistErrorMessage,
  });

  final bool isLoading;
  final bool hasLoadError;
  final CalendarData data;
  final CycleForecast forecast;
  final String? errorMessage;
  final String? persistErrorMessage;

  factory CalendarState.createInitial() {
    final CycleSettings settings = CycleSettings.createDefault();
    return CalendarState(
      isLoading: true,
      hasLoadError: false,
      data: CalendarData.createEmpty(),
      forecast: CycleForecast.createEmpty(
        cycleLength: settings.cycleLength,
        periodDuration: settings.periodDuration,
      ),
    );
  }
}

/// Контроллер календаря: загрузка, прогноз и сохранение.
class CalendarController extends Notifier<CalendarState> {
  late final CalendarRepository _repository;
  late final CycleCalculator _calculator;
  late final ReminderScheduler _reminders;
  late final CycleReportBuilder _reportBuilder;
  late final DoctorReportExporter _reportExporter;

  @override
  CalendarState build() {
    _repository = getIt<CalendarRepository>();
    _calculator = getIt<CycleCalculator>();
    _reminders = getIt<ReminderScheduler>();
    _reportBuilder = getIt<CycleReportBuilder>();
    _reportExporter = getIt<DoctorReportExporter>();
    final CalendarBootstrap boot = getIt<CalendarBootstrap>();
    if (boot.errorMessage != null) {
      return CalendarState(
        isLoading: false,
        hasLoadError: true,
        errorMessage: boot.errorMessage,
        data: CalendarData.createEmpty(),
        forecast: CycleForecast.createEmpty(
          cycleLength: CycleSettings.createDefault().cycleLength,
          periodDuration: CycleSettings.createDefault().periodDuration,
        ),
      );
    }
    return executeCreateState(boot.data);
  }

  Future<void> executeLoad() async {
    state = CalendarState.createInitial();
    try {
      final CalendarData data = await _repository.loadCalendar();
      executeApplyData(data);
    } catch (_) {
      state = CalendarState(
        isLoading: false,
        hasLoadError: true,
        errorMessage: 'Не удалось загрузить календарь',
        data: CalendarData.createEmpty(),
        forecast: CycleForecast.createEmpty(
          cycleLength: CycleSettings.createDefault().cycleLength,
          periodDuration: CycleSettings.createDefault().periodDuration,
        ),
      );
    }
  }

  Future<void> executeCompleteOnboarding({
    required DateTime lastPeriodStart,
    required int cycleLength,
    required int periodDuration,
  }) async {
    final DateTime start = lastPeriodStart.dateOnly;
    final DateTime today = DateTime.now().dateOnly;
    final Map<String, DayLog> logs = <String, DayLog>{};
    for (int day = 0; day < periodDuration; day++) {
      final DateTime date = start.add(Duration(days: day)).dateOnly;
      if (date.isAfter(today)) {
        break;
      }
      logs[date.storageKey] = DayLog(
        date: date,
        isPeriod: true,
        flow: FlowIntensity.medium,
      );
    }
    await executePersist(
      CalendarData(
        isOnboardingCompleted: true,
        settings: CycleSettings(
          cycleLength: cycleLength,
          periodDuration: periodDuration,
          lastPeriodStart: start,
          areRemindersEnabled: true,
        ),
        logs: logs,
      ),
    );
  }

  Future<void> executeTogglePeriod(DateTime date) async {
    final DayLog current = executeReadLog(date);
    final bool nextIsPeriod = !current.isPeriod;
    await executeSaveDayLog(
      current.copyWith(
        isPeriod: nextIsPeriod,
        flow: nextIsPeriod ? (current.flow ?? FlowIntensity.medium) : null,
        clearFlow: !nextIsPeriod,
      ),
    );
  }

  Future<void> executeSaveMood(DateTime date, Mood? mood) async {
    final DayLog current = executeReadLog(date);
    await executeSaveDayLog(
      current.copyWith(mood: mood, clearMood: mood == null),
    );
  }

  Future<void> executeSaveDayLog(DayLog log) async {
    final Map<String, DayLog> logs = Map<String, DayLog>.from(state.data.logs);
    final DayLog normalized = log.copyWith(date: log.date.dateOnly);
    final String key = normalized.date.storageKey;
    if (normalized.hasContent) {
      logs[key] = normalized;
    } else {
      logs.remove(key);
    }
    await executePersist(
      state.data.copyWith(
        logs: logs,
        settings: state.data.settings.copyWith(
          lastPeriodStart: executeResolveLastPeriodStart(logs),
        ),
      ),
    );
  }

  Future<void> executeUpdateSettings(CycleSettings settings) async {
    await executePersist(state.data.copyWith(settings: settings));
  }

  Future<void> executeResetData() async {
    await executePersist(CalendarData.createEmpty());
  }

  DayLog executeReadLog(DateTime date) {
    return state.data.logFor(date);
  }

  DateTime executeResolveLastPeriodStart(Map<String, DayLog> logs) {
    final List<PeriodCycle> cycles = _calculator.executeBuildCycles(
      _calculator.executeCollectPeriodDays(logs),
    );
    if (cycles.isEmpty) {
      return state.data.settings.lastPeriodStart;
    }
    return cycles.last.start;
  }

  Future<void> executePersist(CalendarData data) async {
    try {
      await _repository.saveCalendar(data);
      executeApplyData(data);
    } catch (_) {
      state = CalendarState(
        isLoading: false,
        hasLoadError: false,
        errorMessage: state.errorMessage,
        persistErrorMessage: 'Не удалось сохранить данные',
        data: state.data,
        forecast: state.forecast,
      );
    }
  }

  void executeApplyData(CalendarData data) {
    state = executeCreateState(data);
  }

  CalendarState executeCreateState(CalendarData data) {
    final CycleForecast forecast = _calculator.executeForecast(
      CycleForecastInput(
        settings: data.settings,
        logs: data.logs,
        today: DateTime.now().dateOnly,
      ),
    );
    _reminders
        .executeSyncReminder(
          nextPeriodStart: forecast.nextPeriodStart,
          areRemindersEnabled: data.settings.areRemindersEnabled,
        )
        .ignore();
    return CalendarState(
      isLoading: false,
      hasLoadError: false,
      data: data,
      forecast: forecast,
    );
  }

  Future<void> executeExportDoctorReport() async {
    executeSetPersistError(null);
    try {
      final DateTime now = DateTime.now();
      final CycleReport report = _reportBuilder.executeBuild(
        data: state.data,
        forecast: state.forecast,
        generatedAt: now,
        today: now.dateOnly,
      );
      await _reportExporter.executeShare(report);
    } catch (_) {
      executeSetPersistError('Не удалось подготовить PDF');
    }
  }

  void executeSetPersistError(String? message) {
    state = CalendarState(
      isLoading: state.isLoading,
      hasLoadError: state.hasLoadError,
      errorMessage: state.errorMessage,
      persistErrorMessage: message,
      data: state.data,
      forecast: state.forecast,
    );
  }
}

final NotifierProvider<CalendarController, CalendarState>
calendarControllerProvider =
    NotifierProvider<CalendarController, CalendarState>(CalendarController.new);

/// Выбранный день на экране календаря.
final StateProvider<DateTime> selectedCalendarDateProvider =
    StateProvider<DateTime>((Ref ref) {
      return DateTime.now().dateOnly;
    });
