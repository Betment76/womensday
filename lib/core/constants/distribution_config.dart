/// Канал дистрибуции сборки (compile-time через `--dart-define`).
abstract final class DistributionConfig {
  static const String _raw = String.fromEnvironment(
    'DISTRIBUTION',
    defaultValue: 'rustore',
  );

  /// Сборка для RuStore: реклама и покупка премиума (СБП, RuStore Pay).
  static bool get isRuStore => _raw == 'rustore';

  /// Сборка для Google Play: только реклама, без оплат и RuStore SDK.
  static bool get isGooglePlay => _raw == 'googleplay';

  static bool get paymentsEnabled => isRuStore;

  static bool get ruStoreSdkEnabled => isRuStore;
}
