import 'package:flutter/foundation.dart';

/// Идентификаторы блоков РСЯ. Боевые — из кабинета Яндекса, demo — только debug.
abstract final class YandexAdsIds {
  static const String productionBanner = '';
  static const String productionInterstitial = 'R-M-20052446-1';
  static const String demoBanner = 'demo-banner-yandex';
  static const String demoInterstitial = 'demo-interstitial-yandex';

  static String get banner {
    if (productionBanner.isNotEmpty) {
      return productionBanner;
    }
    return kDebugMode ? demoBanner : '';
  }

  static String get interstitial {
    if (productionInterstitial.isNotEmpty) {
      return productionInterstitial;
    }
    return kDebugMode ? demoInterstitial : '';
  }
}
