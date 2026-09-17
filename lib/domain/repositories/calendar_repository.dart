import 'package:womensday/domain/entities/calendar_data.dart';

/// Контракт хранения календаря.
abstract class CalendarRepository {
  Future<CalendarData> loadCalendar();
  Future<void> saveCalendar(CalendarData data);
}
