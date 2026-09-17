import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_rustore_review/flutter_rustore_review.dart';

/// RuStore In-app Review: системная форма оценки без своего UI.
class RustoreReviewService {
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

  Future<void> executeRequest() async {
    if (!_isInitialized || !Platform.isAndroid) {
      return;
    }
    try {
      await RustoreReviewClient.request();
      await RustoreReviewClient.review();
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[RuStoreReview] request: $error');
      }
    }
  }
}
