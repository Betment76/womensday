import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_rustore_pay/api/flutter_rustore_pay_client.dart';
import 'package:flutter_rustore_pay/model/purchase.dart';
import 'package:flutter_rustore_pay/model/purchase_availability.dart';
import 'package:flutter_rustore_pay/model/purchase_result.dart';
import 'package:flutter_rustore_pay/model/ru_store_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womensday/core/constants/rustore_config.dart';
import 'package:womensday/data/services/yandex_ads_service.dart';

/// Покупка премиума через RuStore Pay SDK.
class RustorePayService {
  RustorePayService({required this._ads});

  final YandexAdsService _ads;
  bool _isInitialized = false;

  Future<bool> executeInitialize() async {
    if (_isInitialized) {
      return true;
    }
    if (!Platform.isAndroid) {
      return false;
    }
    try {
      final PurchaseAvailabilityResult availability = await RuStorePayClient
          .instance.purchaseInteractor
          .getPurchaseAvailability();
      if (availability is Available) {
        _isInitialized = true;
        return true;
      }
      if (kDebugMode) {
        debugPrint('[RuStorePay] недоступен: $availability');
      }
      return false;
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[RuStorePay] init: $error');
      }
      return false;
    }
  }

  Future<bool> executeIsAvailable() async {
    if (!_isInitialized) {
      final bool ok = await executeInitialize();
      if (!ok) {
        return false;
      }
    }
    try {
      final bool isInstalled = await RuStorePayClient.instance.ruStoreUtils
          .isRuStoreInstalled();
      if (!isInstalled) {
        return false;
      }
      final PurchaseAvailabilityResult result = await RuStorePayClient
          .instance.purchaseInteractor
          .getPurchaseAvailability();
      return result is Available;
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[RuStorePay] availability: $error');
      }
      return false;
    }
  }

  Future<bool> executePurchase() async {
    if (!_isInitialized) {
      final bool ok = await executeInitialize();
      if (!ok) {
        return false;
      }
    }
    try {
      final ProductPurchaseResult result = await RuStorePayClient
          .instance.purchaseInteractor
          .purchase(RuStoreConfig.premiumProductId);
      final String purchaseId = result.purchaseId;
      if (purchaseId.isEmpty) {
        return false;
      }
      await _executeSavePurchase(purchaseId);
      return true;
    } on RuStoreException catch (error) {
      if (kDebugMode) {
        debugPrint('[RuStorePay] purchase error: $error');
      }
      return false;
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[RuStorePay] purchase: $error');
      }
      return false;
    }
  }

  Future<void> executeRestore() async {
    if (!_isInitialized) {
      final bool ok = await executeInitialize();
      if (!ok) {
        return;
      }
    }
    try {
      final List<Purchase> purchases = await RuStorePayClient
          .instance.purchaseInteractor
          .getPurchases();
      for (final Purchase purchase in purchases) {
        if (purchase is ProductPurchase &&
            purchase.productId == RuStoreConfig.premiumProductId) {
          final String purchaseId = purchase.purchaseId;
          if (purchaseId.isNotEmpty) {
            await _executeSavePurchase(purchaseId);
          }
          return;
        }
      }
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[RuStorePay] restore: $error');
      }
    }
  }

  Future<void> _executeSavePurchase(String purchaseId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(RuStoreConfig.premiumPurchasedKey, true);
    await prefs.setString(RuStoreConfig.lastPurchaseIdKey, purchaseId);
    await _ads.executeActivatePremium();
  }
}
