import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womensday/data/services/app_review_service.dart';
import 'package:womensday/data/services/review_quota.dart';

/// Оценка через Google Play In-App Review: форму показывает Play по своей квоте.
class GooglePlayReviewService implements AppReviewService {
  GooglePlayReviewService({required this._preferences});

  final SharedPreferences _preferences;
  final InAppReview _review = InAppReview.instance;

  @override
  Future<void> executeMaybeRequestReview() async {
    if (!Platform.isAndroid) {
      return;
    }
    final ReviewQuota quota = ReviewQuota(_preferences);
    await quota.executeRegisterUsage();
    if (!quota.executeShouldRequestReview()) {
      return;
    }
    try {
      if (!await _review.isAvailable()) {
        return;
      }
      await _review.requestReview();
      await quota.executeMarkRequested();
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[GooglePlayReview] request: $error');
      }
    }
  }
}
