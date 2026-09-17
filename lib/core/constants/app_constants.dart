import 'package:flutter/animation.dart';

/// Константы приложения «Мой женский календарь».
class AppConstants {
  static const String appName = 'Мой женский календарь';
  static const String appSubtitle = 'Календарь цикла';
  static const int defaultCycleLength = 28;
  static const int defaultPeriodDuration = 5;
  static const int minCycleLength = 21;
  static const int maxCycleLength = 45;
  static const int minPeriodDuration = 2;
  static const int maxPeriodDuration = 10;
  static const int lutealPhaseDays = 14;
  static const int fertileDaysBeforeOvulation = 5;
  static const int fertileDaysAfterOvulation = 1;
  static const int maxCyclesForAverage = 6;
  static const int maxDisplayedCycles = 12;
  static const int maxReportLogs = 180;
  static const int forecastCycleCount = 6;
  static const int noteSaveDebounceMs = 400;
  static const Duration animationDuration = Duration(milliseconds: 280);
  static const Curve animationCurve = Curves.easeOutCubic;
  static const String supportEmail = 'support@мойсофт.рф';
  static const int reminderHour = 9;
  static const int reminderDaysBefore = 1;
}
