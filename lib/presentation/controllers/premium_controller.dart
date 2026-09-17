import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:womensday/core/di/injection.dart';
import 'package:womensday/data/services/premium_entitlement_service.dart';
import 'package:womensday/data/services/yandex_ads_service.dart';

/// Премиум: реклама выключена после оплаты.
class PremiumController extends Notifier<bool> {
  @override
  bool build() {
    return getIt<YandexAdsService>().isPremium;
  }

  Future<void> executeActivate({
    required String paymentId,
    required String orderId,
  }) async {
    await getIt<PremiumEntitlementService>().executeActivate(
      paymentId: paymentId,
      orderId: orderId,
    );
    state = true;
  }

  Future<void> executeReconcile() async {
    await getIt<PremiumEntitlementService>().executeReconcile();
    state = getIt<YandexAdsService>().isPremium;
  }

  Future<bool> executeRestore(String orderId) async {
    final bool restored = await getIt<PremiumEntitlementService>()
        .executeRestore(orderId);
    state = getIt<YandexAdsService>().isPremium;
    return restored;
  }
}

final NotifierProvider<PremiumController, bool> premiumControllerProvider =
    NotifierProvider<PremiumController, bool>(PremiumController.new);
