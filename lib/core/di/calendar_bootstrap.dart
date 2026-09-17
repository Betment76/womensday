import 'package:womensday/domain/entities/calendar_data.dart';

/// Результат первой загрузки календаря при старте.
class CalendarBootstrap {
  const CalendarBootstrap({required this.data, this.errorMessage});

  final CalendarData data;
  final String? errorMessage;
}
