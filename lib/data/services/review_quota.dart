import 'package:shared_preferences/shared_preferences.dart';

/// Общая квота запроса оценки: не раньше 5 сохранений дня, не чаще раза
/// в 30 дней, однократно. Одна на оба магазина — ключи в SharedPreferences
/// общие, смена флавора не сбрасывает счётчик.
class ReviewQuota {
  ReviewQuota(this._preferences);

  final SharedPreferences _preferences;

  static const String _usageCountKey = 'review_usage_count';
  static const String _requestedKey = 'review_requested';
  static const String _lastRequestKey = 'review_last_request_ms';
  static const int _minUsageCount = 5;
  static const int _minDaysBetweenRequests = 30;

  /// Учитывает использование и сообщает, можно ли показать форму оценки.
  bool executeShouldRequestReview() {
    if (_preferences.getBool(_requestedKey) ?? false) {
      return false;
    }
    final int count = _preferences.getInt(_usageCountKey) ?? 0;
    if (count < _minUsageCount) {
      return false;
    }
    final int lastMs = _preferences.getInt(_lastRequestKey) ?? 0;
    if (lastMs == 0) {
      return true;
    }
    final double daysSince =
        (DateTime.now().millisecondsSinceEpoch - lastMs) / 86400000;
    return daysSince >= _minDaysBetweenRequests;
  }

  /// Фиксирует показ формы оценки.
  Future<void> executeMarkRequested() async {
    await _preferences.setBool(_requestedKey, true);
    await _preferences.setInt(
      _lastRequestKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// Учитывает использование (вызывать при каждом сохранении дня).
  Future<void> executeRegisterUsage() async {
    final int count = (_preferences.getInt(_usageCountKey) ?? 0) + 1;
    await _preferences.setInt(_usageCountKey, count);
  }
}
