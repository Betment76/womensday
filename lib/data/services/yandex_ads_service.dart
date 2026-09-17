import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womensday/core/constants/tbank_config.dart';
import 'package:womensday/core/constants/yandex_ads_ids.dart';
import 'package:yandex_mobileads/mobile_ads.dart';

/// Яндекс Mobile Ads (РСЯ): инициализация SDK и interstitial.
class YandexAdsService {
  YandexAdsService(this._preferences)
    : isPremiumListenable = ValueNotifier<bool>(
        _preferences.getBool(TBankConfig.adsRemovedKey) == true,
      );

  final SharedPreferences _preferences;
  final ValueNotifier<bool> isPremiumListenable;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  bool get isPremium => isPremiumListenable.value;

  bool get isAdsEnabled => !isPremium;

  Future<void> executeActivatePremium() async {
    await _preferences.setBool(TBankConfig.adsRemovedKey, true);
    isPremiumListenable.value = true;
  }

  Future<void> executeDeactivatePremium() async {
    await _preferences.setBool(TBankConfig.adsRemovedKey, false);
    isPremiumListenable.value = false;
    await executeInitialize();
  }

  Future<void> executeInitialize() async {
    if (_isInitialized || !isAdsEnabled) {
      return;
    }
    try {
      await YandexAds.initialize();
      await YandexAds.setLocationTracking(false);
      await YandexAds.setLogging(kDebugMode);
      _isInitialized = true;
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[YandexAds] Ошибка инициализации: $error');
      }
    }
  }

  Future<void> executeShowInterstitial() async {
    if (!isAdsEnabled) {
      return;
    }
    if (!_isInitialized) {
      await executeInitialize();
    }
    if (!_isInitialized || YandexAdsIds.interstitial.isEmpty) {
      return;
    }
    InterstitialAd? ad;
    try {
      final InterstitialAdLoader loader = InterstitialAdLoader();
      ad = await loader.loadAd(
        adRequest: AdRequest(adUnitId: YandexAdsIds.interstitial),
      );
      await ad.show();
      await ad.waitForDismiss();
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[YandexAds] Interstitial: $error');
      }
    } finally {
      await ad?.destroy();
    }
  }
}
