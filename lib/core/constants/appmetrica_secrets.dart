import 'package:womensday/core/constants/distribution_config.dart';

/// API-ключи AppMetrica по каналу дистрибуции (ключ клиентский, виден в APK).
/// Ключи из кабинета AppMetrica: приложение → «Настройки» → «Основной API-ключ».
abstract final class AppMetricaSecrets {
  static const String _rustoreApiKey = 'bc9fc91e-2308-4ac3-9c8e-976afd63b64c';
  static const String _googlePlayApiKey =
      'bc9fc91e-2308-4ac3-9c8e-976afd63b64c';

  /// Ключ активной сборки — всегда зашит в код, без guard'ов на пустоту.
  static String get apiKey {
    return DistributionConfig.isGooglePlay ? _googlePlayApiKey : _rustoreApiKey;
  }
}
