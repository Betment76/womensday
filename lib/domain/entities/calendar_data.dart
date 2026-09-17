import 'package:womensday/domain/entities/cycle_settings.dart';
import 'package:womensday/domain/entities/day_log.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';

/// Полный снимок данных календаря.
class CalendarData {
  const CalendarData({
    required this.isOnboardingCompleted,
    required this.settings,
    required this.logs,
  });
  final bool isOnboardingCompleted;
  final CycleSettings settings;
  final Map<String, DayLog> logs;
  factory CalendarData.createEmpty() {
    return CalendarData(
      isOnboardingCompleted: false,
      settings: CycleSettings.createDefault(),
      logs: <String, DayLog>{},
    );
  }
  DayLog logFor(DateTime date) {
    final DateTime day = date.dateOnly;
    return logs[day.storageKey] ?? DayLog(date: day);
  }

  CalendarData copyWith({
    bool? isOnboardingCompleted,
    CycleSettings? settings,
    Map<String, DayLog>? logs,
  }) {
    return CalendarData(
      isOnboardingCompleted:
          isOnboardingCompleted ?? this.isOnboardingCompleted,
      settings: settings ?? this.settings,
      logs: logs ?? this.logs,
    );
  }
}
