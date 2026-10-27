import 'package:womensday/core/constants/distribution_config.dart';

/// Идентификаторы блоков РСЯ по каналу дистрибуции (compile-time флейвор).
abstract final class YandexAdsIds {
  /// RuStore: реклама при открытии приложения.
  static const String _rustoreAppOpen = 'R-M-20052446-2';

  /// RuStore: межстраничный блок.
  static const String _rustoreInterstitial = 'R-M-20052446-1';

  /// Google Play: реклама при открытии приложения.
  static const String _googlePlayAppOpen = 'R-M-20123831-1';

  /// Google Play: межстраничный блок.
  static const String _googlePlayInterstitial = 'R-M-20123831-2';

  /// Блок, показываемый при открытии приложения.
  static String get appOpen {
    return DistributionConfig.isGooglePlay
        ? _googlePlayAppOpen
        : _rustoreAppOpen;
  }

  /// Межстраничный блок.
  static String get interstitial {
    return DistributionConfig.isGooglePlay
        ? _googlePlayInterstitial
        : _rustoreInterstitial;
  }
}
