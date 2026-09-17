import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:womensday/domain/entities/calendar_data.dart';
import 'package:womensday/domain/entities/cycle_settings.dart';
import 'package:womensday/domain/entities/day_log.dart';

/// Локальное JSON-хранилище на SharedPreferences.
class CalendarLocalDatasource {
  CalendarLocalDatasource(this._preferences);

  static const String _storageKey = 'sakura_calendar_data';
  final SharedPreferences _preferences;

  Future<CalendarData> loadCalendar() async {
    final String? raw = _preferences.getString(_storageKey);
    if (raw == null || raw.isEmpty) {
      return CalendarData.createEmpty();
    }
    try {
      final Map<String, dynamic> json = jsonDecode(raw) as Map<String, dynamic>;
      final Map<String, dynamic> rawLogs =
          json['logs'] as Map<String, dynamic>? ?? <String, dynamic>{};
      final Map<String, DayLog> logs = <String, DayLog>{};
      rawLogs.forEach((String key, dynamic value) {
        logs[key] = DayLog.fromJson(value as Map<String, dynamic>);
      });
      return CalendarData(
        isOnboardingCompleted: json['isOnboardingCompleted'] as bool? ?? false,
        settings: CycleSettings.fromJson(
          json['settings'] as Map<String, dynamic>? ?? <String, dynamic>{},
        ),
        logs: logs,
      );
    } catch (_) {
      return CalendarData.createEmpty();
    }
  }

  Future<void> saveCalendar(CalendarData data) async {
    final Map<String, dynamic> logsJson = <String, dynamic>{};
    data.logs.forEach((String key, DayLog log) {
      logsJson[key] = log.toJson();
    });
    final String raw = jsonEncode(<String, dynamic>{
      'isOnboardingCompleted': data.isOnboardingCompleted,
      'settings': data.settings.toJson(),
      'logs': logsJson,
    });
    await _preferences.setString(_storageKey, raw);
  }
}
