import 'dart:io';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:womensday/core/constants/appmetrica_secrets.dart';

/// Яндекс AppMetrica: сессии, краши, экраны и события продукта.
class AppMetricaService {
  bool _isInitialized = false;

  Future<void> executeInitialize() async {
    if (_isInitialized) {
      return;
    }
    if (kAppMetricaApiKey.isEmpty) {
      if (kDebugMode) {
        debugPrint('[AppMetrica] Нет API-ключа, аналитика выключена');
      }
      return;
    }
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final int appBuildNumber = int.tryParse(packageInfo.buildNumber) ?? 0;
      await AppMetrica.activate(
        AppMetricaConfig(
          kAppMetricaApiKey,
          logs: kDebugMode,
          locationTracking: false,
          sessionTimeout: 30,
          crashReporting: true,
          flutterCrashReporting: true,
          nativeCrashReporting: Platform.isAndroid,
          sessionsAutoTrackingEnabled: true,
          appOpenTrackingEnabled: true,
          revenueAutoTrackingEnabled: true,
          advIdentifiersTracking: Platform.isAndroid,
          anrMonitoring: true,
          anrMonitoringTimeout: 5,
          appVersion: packageInfo.version,
          appBuildNumber: appBuildNumber > 0 ? appBuildNumber : null,
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
}
