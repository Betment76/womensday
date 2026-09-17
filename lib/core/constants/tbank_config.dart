import 'package:flutter/foundation.dart';

/// Конфигурация оплаты через PayTbank (pay.мойсофт.рф).
/// Ключи терминалов только на сервере. app_id нужно добавить в config.php.
abstract final class TBankConfig {
  static const String backendBaseUrl = 'https://pay.xn--i1afgbohn.xn--p1ai';
  static const String appId = 'womensday.moysoft.rf';
  static const String appToken = appId;
  static const String successUrl =
      'https://pay.xn--i1afgbohn.xn--p1ai/success.php?app=womensday.moysoft.rf';
  static const String failUrl =
      'https://pay.xn--i1afgbohn.xn--p1ai/fail.php?app=womensday.moysoft.rf';
  static const String paymentReturnScheme = 'womensday';
  static const double premiumAmountRubles = 299;
  static const String premiumDescription = 'Премиум: отключение рекламы';
  static const Duration requestTimeout = Duration(seconds: 20);
  static const Duration statusPollInterval = Duration(seconds: 3);
  static const String adsRemovedKey = 'ads_payment_completed';
  static const String lastPaymentIdKey = 'premium_last_payment_id';
  static const String lastOrderIdKey = 'premium_last_order_id';

  /// Debug и profile — тестовый терминал. Release — только боевой.
  static String get mode => kReleaseMode ? 'prod' : 'test';
}
