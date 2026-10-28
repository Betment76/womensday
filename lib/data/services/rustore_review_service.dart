import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_rustore_review/flutter_rustore_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// RuStore In-app Review: системная форма оценки без своего UI.
/// Вызывается только в естественный момент — после успешного сохранения дня,
/// не раньше 5 сохранений и не чаще раза в 30 дней (рекомендации RuStore).
class RustoreReviewService {
  RustoreReviewService({required this._preferences});

  final SharedPreferences _preferences;
  bool _isInitialized = false;

  static const String _usageCountKey = 'review_usage_count';
  static const String _requestedKey = 'review_requested';
  static const String _lastRequestKey = 'review_last_request_ms';
  static const int _minUsageCount = 5;
  static const int _minDaysBetweenRequests = 30;

  Future<void> executeInitialize() async {
    if (_isInitialized || !Platform.isAndroid) {
      return;
    }
    try {
      await RustoreReviewClient.initialize();
      _isInitialized = true;
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[RuStoreReview] init: $error');
      }
    }
  }

  /// Учитывает использование и в подходящий момент показывает форму оценки.
  Future<void> executeMaybeRequestReview() async {
    if (!_isInitialized || !Platform.isAndroid) {
      return;
    }
    try {
      final SharedPreferences preferences = _preferences;
      if (preferences.getBool(_requestedKey) ?? false) {
        return;
      }
      final int count = (preferences.getInt(_usageCountKey) ?? 0) + 1;
      await preferences.setInt(_usageCountKey, count);
      if (count < _minUsageCount) {
        return;
      }
      final int lastMs = preferences.getInt(_lastRequestKey) ?? 0;
      final double daysSince =
          (DateTime.now().millisecondsSinceEpoch - lastMs) / 86400000;
      if (lastMs > 0 && daysSince < _minDaysBetweenRequests) {
        return;
      }
      await RustoreReviewClient.request();
      await RustoreReviewClient.review();
      await preferences.setBool(_requestedKey, true);
      await preferences.setInt(
        _lastRequestKey,
        DateTime.now().millisecondsSinceEpoch,
      );
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[RuStoreReview] request: $error');
      }
    }
  }
}
