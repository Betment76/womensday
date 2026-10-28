import 'dart:convert';
import 'dart:io';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:womensday/core/constants/appmetrica_secrets.dart';
import 'package:womensday/core/constants/distribution_config.dart';

/// Яндекс AppMetrica: сессии, краши, экраны и события продукта.
class AppMetricaService {
  bool _isInitialized = false;

  Future<void> executeInitialize() async {
    if (_isInitialized) {
      return;
    }
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final int appBuildNumber = int.tryParse(packageInfo.buildNumber) ?? 0;
      await AppMetrica.activate(
        AppMetricaConfig(
          AppMetricaSecrets.apiKey,
          logs: kDebugMode,
          locationTracking: false,
          sessionTimeout: 30,
          crashReporting: true,
          flutterCrashReporting: true,
          nativeCrashReporting: Platform.isAndroid,
          sessionsAutoTrackingEnabled: true,
          appOpenTrackingEnabled: true,
          // Покупки есть только в rustore-сборке; выручка шлётся вручную
          // (RuStore Pay и СБП авто-трекингом Google Play Billing не покрываются).
          revenueAutoTrackingEnabled: DistributionConfig.paymentsEnabled,
          // Рекламные идентификаторы: только rustore (атрибуция Директа).
          // В googleplay-сборке не собираем — health-категория, минимум для Data safety.
          advIdentifiersTracking: DistributionConfig.isRuStore,
          anrMonitoring: true,
          anrMonitoringTimeout: 5,
          appVersion: packageInfo.version,
          appBuildNumber: appBuildNumber > 0 ? appBuildNumber : null,
          // Один кабинет AppMetrica на оба магазина — метка канала в каждом событии.
          appEnvironment: <String?, String?>{
            'distribution': DistributionConfig.name,
          },
        ),
      );
      _isInitialized = true;
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[AppMetrica] Ошибка инициализации: $error');
      }
    }
  }

  Future<void> executeReportEvent(
    String eventName, {
    Map<String, Object>? attributes,
  }) async {
    if (!_isInitialized) {
      return;
    }
    try {
      if (attributes == null || attributes.isEmpty) {
        await AppMetrica.reportEvent(eventName);
        return;
      }
      await AppMetrica.reportEventWithMap(eventName, attributes);
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[AppMetrica] Ошибка события $eventName: $error');
      }
    }
  }

  Future<void> executeReportScreen(String screenName) async {
    await executeReportEvent('screen_$screenName');
  }

  /// Доход от покупки премиума (RuStore Pay / СБП) — вручную, в рублях.
  Future<void> executeReportRevenue({
    required int amountRubles,
    required String productId,
    Map<String, Object?> payload = const <String, Object?>{},
  }) async {
    if (!_isInitialized) {
      return;
    }
    try {
      await AppMetrica.reportRevenue(
        AppMetricaRevenue(
          Decimal.fromInt(amountRubles),
          'RUB',
          quantity: 1,
          productId: productId,
          payload: payload.isEmpty ? null : jsonEncode(payload),
        ),
      );
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[AppMetrica] Ошибка Revenue: $error');
      }
    }
  }
}
