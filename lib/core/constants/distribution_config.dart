import 'package:flutter/services.dart' show appFlavor;

/// Канал дистрибуции сборки (compile-time через `--dart-define=DISTRIBUTION`).
/// Если define не передан, берётся имя флавора сборки (`--flavor`), чтобы
/// googleplay-сборка без define не повела себя как rustore.
abstract final class DistributionConfig {
  static const String _raw = String.fromEnvironment('DISTRIBUTION');

  static String get _channel =>
      _raw.isNotEmpty ? _raw : (appFlavor ?? 'rustore');

  /// Сборка для RuStore: реклама и покупка премиума (СБП, RuStore Pay).
  static bool get isRuStore => _channel == 'rustore';

  /// Сборка для Google Play: только реклама, без оплат и RuStore SDK.
  static bool get isGooglePlay => _channel == 'googleplay';

  /// Имя канала для метрик аналитики (`rustore` / `googleplay`).
  static String get name => _channel;

  static bool get paymentsEnabled => isRuStore;

  static bool get ruStoreSdkEnabled => isRuStore;
}
