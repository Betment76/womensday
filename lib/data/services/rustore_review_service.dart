import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_rustore_review/flutter_rustore_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womensday/data/services/app_review_service.dart';
import 'package:womensday/data/services/review_quota.dart';

/// RuStore In-app Review: системная форма оценки без своего UI.
/// Вызывается только в естественный момент — после успешного сохранения дня.
class RustoreReviewService implements AppReviewService {
  RustoreReviewService({required this._preferences});

  final SharedPreferences _preferences;
  bool _isInitialized = false;

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

  @override
  Future<void> executeMaybeRequestReview() async {
    if (!_isInitialized || !Platform.isAndroid) {
      return;
    }
    final ReviewQuota quota = ReviewQuota(_preferences);
    await quota.executeRegisterUsage();
    if (!quota.executeShouldRequestReview()) {
      return;
    }
    try {
      await RustoreReviewClient.request();
      await RustoreReviewClient.review();
      await quota.executeMarkRequested();
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[RuStoreReview] request: $error');
      }
    }
  }
}
