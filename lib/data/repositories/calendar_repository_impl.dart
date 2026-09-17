import 'package:womensday/data/datasources/calendar_local_datasource.dart';
import 'package:womensday/domain/entities/calendar_data.dart';
import 'package:womensday/domain/repositories/calendar_repository.dart';

/// Репозиторий календаря над локальным источником.
class CalendarRepositoryImpl implements CalendarRepository {
  CalendarRepositoryImpl(this._datasource);

  final CalendarLocalDatasource _datasource;

  @override
  Future<CalendarData> loadCalendar() {
    return _datasource.loadCalendar();
  }

  @override
  Future<void> saveCalendar(CalendarData data) {
    return _datasource.saveCalendar(data);
  }
}
