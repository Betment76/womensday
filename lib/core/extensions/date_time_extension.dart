import 'package:intl/intl.dart';

/// Удобные операции с датой без времени.
extension DateTimeExtension on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);

  String get storageKey {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateOnly);
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
