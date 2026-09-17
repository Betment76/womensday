import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';

/// Пользовательские параметры цикла.
class CycleSettings {
  const CycleSettings({
    required this.cycleLength,
    required this.periodDuration,
    required this.lastPeriodStart,
    required this.areRemindersEnabled,
  });

  final int cycleLength;
  final int periodDuration;
  final DateTime lastPeriodStart;
  final bool areRemindersEnabled;

  factory CycleSettings.createDefault() {
    return CycleSettings(
      cycleLength: AppConstants.defaultCycleLength,
      periodDuration: AppConstants.defaultPeriodDuration,
      lastPeriodStart: DateTime.now().dateOnly,
      areRemindersEnabled: true,
    );
  }

  CycleSettings copyWith({
    int? cycleLength,
    int? periodDuration,
    DateTime? lastPeriodStart,
    bool? areRemindersEnabled,
  }) {
    return CycleSettings(
      cycleLength: cycleLength ?? this.cycleLength,
      periodDuration: periodDuration ?? this.periodDuration,
      lastPeriodStart: lastPeriodStart ?? this.lastPeriodStart,
      areRemindersEnabled: areRemindersEnabled ?? this.areRemindersEnabled,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cycleLength': cycleLength,
      'periodDuration': periodDuration,
      'lastPeriodStart': lastPeriodStart.storageKey,
      'areRemindersEnabled': areRemindersEnabled,
    };
  }

  factory CycleSettings.fromJson(Map<String, dynamic> json) {
    return CycleSettings(
      cycleLength:
          json['cycleLength'] as int? ?? AppConstants.defaultCycleLength,
      periodDuration:
          json['periodDuration'] as int? ?? AppConstants.defaultPeriodDuration,
      lastPeriodStart: DateTime.parse(
        json['lastPeriodStart'] as String? ?? DateTime.now().storageKey,
      ).dateOnly,
      areRemindersEnabled: json['areRemindersEnabled'] as bool? ?? true,
    );
  }
}
