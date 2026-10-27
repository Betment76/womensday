import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:womensday/app.dart';
import 'package:womensday/core/constants/distribution_config.dart';
import 'package:womensday/core/di/calendar_bootstrap.dart';
import 'package:womensday/core/di/injection.dart';
import 'package:womensday/data/services/premium_entitlement_service.dart';
import 'package:womensday/data/services/rustore_update_service.dart';
import 'package:womensday/data/services/yandex_ads_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru');
  await initializeDateFormatting('en');
  await executeDependencyInjection();
  if (DistributionConfig.isGooglePlay) {
    await getIt<YandexAdsService>().executeDeactivatePremium();
  }
  if (DistributionConfig.paymentsEnabled) {
    await getIt<PremiumEntitlementService>().executeReconcile();
    unawaited(getIt<RustoreUpdateService>().executeCheckAndApply());
  }
  runApp(const ProviderScope(child: SakuraApp()));
  // Реклама при открытии: только для тех, кто уже прошёл онбординг.
  if (getIt<CalendarBootstrap>().data.isOnboardingCompleted) {
    unawaited(getIt<YandexAdsService>().executeShowAppOpen());
  }
}
