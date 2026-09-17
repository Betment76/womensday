import 'package:shared_preferences/shared_preferences.dart';
import 'package:womensday/core/constants/rustore_config.dart';
import 'package:womensday/core/constants/tbank_config.dart';
import 'package:womensday/data/services/rustore_pay_service.dart';
import 'package:womensday/data/services/tbank_payment_service.dart';
import 'package:womensday/data/services/yandex_ads_service.dart';
import 'package:womensday/domain/entities/payment_session.dart';

/// Активация премиума и снятие при возврате, как в «Водном балансе».
class PremiumEntitlementService {
  PremiumEntitlementService({
    required this._preferences,
    required this._ads,
    required this._payments,
    required this._rustorePay,
  });

  final SharedPreferences _preferences;
  final YandexAdsService _ads;
  final TBankPaymentService _payments;
  final RustorePayService _rustorePay;

  Future<void> executeRememberPayment({
    required String paymentId,
    required String orderId,
  }) async {
    await _preferences.setString(TBankConfig.lastPaymentIdKey, paymentId);
    await _preferences.setString(TBankConfig.lastOrderIdKey, orderId);
  }

  Future<void> executeActivate({
    required String paymentId,
    required String orderId,
  }) async {
    await executeRememberPayment(paymentId: paymentId, orderId: orderId);
    await _ads.executeActivatePremium();
  }

  Future<bool> executeRestore(String orderId) async {
    final String digits = orderId.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) {
      return false;
    }
    final PaymentStatus status = await _payments.executeFetchStatus(
      orderId: digits,
    );
    await _executeApplyPaidStatus(status);
    return _ads.isPremium;
  }

  Future<void> executeDeactivate() async {
    await _preferences.remove(TBankConfig.lastPaymentIdKey);
    await _preferences.remove(TBankConfig.lastOrderIdKey);
    await _ads.executeDeactivatePremium();
  }

  Future<void> executeReconcile() async {
    await _rustorePay.executeRestore();
    final bool rustorePurchased =
        _preferences.getBool(RuStoreConfig.premiumPurchasedKey) ?? false;
    if (rustorePurchased && _ads.isPremium) {
      return;
    }
    final String paymentId =
        _preferences.getString(TBankConfig.lastPaymentIdKey) ?? '';
    if (paymentId.isNotEmpty) {
      try {
        final PaymentStatus status = await _payments.executeFetchStatus(
          paymentId: paymentId,
        );
        await _executeApplyPaidStatus(status);
        return;
      } catch (_) {}
    }
    final String orderId =
        _preferences.getString(TBankConfig.lastOrderIdKey) ?? '';
    if (orderId.isEmpty) {
      return;
    }
    try {
      final PaymentStatus status = await _payments.executeFetchStatus(
        orderId: orderId,
      );
      await _executeApplyPaidStatus(status);
    } catch (_) {}
  }

  Future<void> _executeApplyPaidStatus(PaymentStatus status) async {
    if (status.isPaid) {
      await _ads.executeActivatePremium();
      final String paymentId = status.paymentId ?? '';
      final String orderId = status.orderId ?? '';
      if (paymentId.isNotEmpty) {
        await _preferences.setString(TBankConfig.lastPaymentIdKey, paymentId);
      }
      if (orderId.isNotEmpty) {
        await _preferences.setString(TBankConfig.lastOrderIdKey, orderId);
      }
      return;
    }
    if (status.isRefunded) {
      await executeDeactivate();
    }
  }
}
