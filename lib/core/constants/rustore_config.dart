/// Конфигурация RuStore Pay SDK.
///
/// Значения нужно вписать из RuStore Консоли:
/// - [consoleApplicationId] — числовой ID из URL карточки приложения.
/// - [premiumProductId] — идентификатор непотребляемого товара «Премиум».
abstract final class RuStoreConfig {
  /// Числовой Console Application ID из RuStore Консоли.
  static const String consoleApplicationId = '2063757475';

  /// Application ID (package name) приложения.
  static const String applicationId = 'womensday.moysoft.rf';

  /// Product ID непотребляемого товара «Премиум: отключение рекламы».
  static const String premiumProductId = 'womenaday-premium';

  /// Deep link схема для возврата из RuStore Pay SDK после оплаты.
  static const String deeplinkScheme = 'womensdaypay';

  /// Ключ SharedPreferences для флага покупки через RuStore.
  static const String premiumPurchasedKey = 'rustore_premium_purchased';

  /// Ключ SharedPreferences для идентификатора покупки RuStore.
  static const String lastPurchaseIdKey = 'rustore_last_purchase_id';
}
