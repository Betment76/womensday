import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:womensday/app.dart';
import 'package:womensday/core/constants/distribution_config.dart';
import 'package:womensday/core/di/calendar_bootstrap.dart';
import 'package:womensday/core/di/injection.dart';
import 'package:womensday/data/services/app_update_service.dart';
import 'package:womensday/data/services/premium_entitlement_service.dart';
import 'package:womensday/data/services/yandex_ads_service.dart';

/// Старт до runApp — только быстрые локальные операции: первый кадр не должен
/// ждать SDK и сеть (иначе система считает окно незамерещивающимся, ANR).
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  for (final String code in <String>[
    'ru',
    'en',
    'de',
    'es',
    'pt',
    'fr',
    'it',
    'tr',
    'ja',
    'ko',
    'pl',
    'nl',
    'uk',
    'id',
    'hi',
    'vi',
    'th',
    'ar',
    'zh',
    'cs',
    'ro',
    'hu',
    'el',
  ]) {
    await initializeDateFormatting(code);
  }
  await executeDependencyInjection();
  runApp(const ProviderScope(child: SakuraApp()));
  // Всё сетевое и тяжёлое — после первого кадра, в фоне.
  if (DistributionConfig.isGooglePlay) {
    unawaited(getIt<YandexAdsService>().executeDeactivatePremium());
  }
  if (DistributionConfig.paymentsEnabled) {
    unawaited(getIt<PremiumEntitlementService>().executeReconcile());
  }
  // Проверка обновлений магазина (RuStore / Google Play по флавору).
  unawaited(getIt<AppUpdateService>().executeCheckAndApply());
  // Реклама при открытии: только для тех, кто уже прошёл онбординг.
  if (getIt<CalendarBootstrap>().data.isOnboardingCompleted) {
    unawaited(getIt<YandexAdsService>().executeShowAppOpen());
  }
}
