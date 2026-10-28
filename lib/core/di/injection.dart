import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womensday/core/constants/calendar_message_codes.dart';
import 'package:womensday/core/constants/distribution_config.dart';
import 'package:womensday/core/di/calendar_bootstrap.dart';
import 'package:womensday/data/datasources/calendar_local_datasource.dart';
import 'package:womensday/data/repositories/calendar_repository_impl.dart';
import 'package:womensday/data/services/app_review_service.dart';
import 'package:womensday/data/services/app_update_service.dart';
import 'package:womensday/data/services/appmetrica_service.dart';
import 'package:womensday/data/services/doctor_pdf_service.dart';
import 'package:womensday/data/services/google_play_review_service.dart';
import 'package:womensday/data/services/google_play_update_service.dart';
import 'package:womensday/data/services/notification_service.dart';
import 'package:womensday/data/services/premium_entitlement_service.dart';
import 'package:womensday/data/services/rustore_pay_service.dart';
import 'package:womensday/data/services/rustore_review_service.dart';
import 'package:womensday/data/services/rustore_update_service.dart';
import 'package:womensday/data/services/tbank_http_client.dart';
import 'package:womensday/data/services/tbank_payment_service.dart';
import 'package:womensday/data/services/yandex_ads_service.dart';
import 'package:womensday/domain/entities/calendar_data.dart';
import 'package:womensday/domain/repositories/calendar_repository.dart';
import 'package:womensday/domain/services/cycle_calculator.dart';
import 'package:womensday/domain/services/cycle_report_builder.dart';
import 'package:womensday/domain/services/doctor_report_exporter.dart';
import 'package:womensday/domain/services/reminder_scheduler.dart';

/// Контейнер зависимостей.
final GetIt getIt = GetIt.instance;

Future<void> executeDependencyInjection() async {
  await getIt.reset();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final NotificationService notificationService = NotificationService(
    preferences: preferences,
  );
  getIt.registerSingleton<SharedPreferences>(preferences);
  getIt.registerSingleton<NotificationService>(notificationService);
  getIt.registerSingleton<ReminderScheduler>(notificationService);
  // Напоминания недоступны на текущей платформе — календарь работает без них.
  unawaited(executeInitIgnoringErrors(notificationService.executeInitialize()));
  final AppMetricaService appMetricaService = AppMetricaService();
  getIt.registerSingleton<AppMetricaService>(appMetricaService);
  unawaited(appMetricaService.executeInitialize());
  if (DistributionConfig.isGooglePlay) {
    getIt.registerSingleton<AppUpdateService>(GooglePlayUpdateService());
    getIt.registerSingleton<AppReviewService>(
      GooglePlayReviewService(preferences: preferences),
    );
  }
  if (DistributionConfig.ruStoreSdkEnabled) {
    final RustoreReviewService rustoreReviewService = RustoreReviewService(
      preferences: preferences,
    );
    getIt.registerSingleton<AppReviewService>(rustoreReviewService);
    getIt.registerSingleton<AppUpdateService>(RustoreUpdateService());
    unawaited(rustoreReviewService.executeInitialize());
  }
  final YandexAdsService yandexAdsService = YandexAdsService(preferences);
  getIt.registerSingleton<YandexAdsService>(yandexAdsService);
  unawaited(yandexAdsService.executeInitialize());
  TBankPaymentService? tbankPayments;
  RustorePayService? rustorePay;
  if (DistributionConfig.paymentsEnabled) {
    final http.Client tbankClient = await TBankHttpClient.getClient();
    tbankPayments = TBankPaymentService(client: tbankClient);
    getIt.registerSingleton<TBankPaymentService>(tbankPayments);
    rustorePay = RustorePayService(ads: yandexAdsService);
    getIt.registerSingleton<RustorePayService>(rustorePay);
    unawaited(rustorePay.executeInitialize());
  }
  getIt.registerSingleton<PremiumEntitlementService>(
    PremiumEntitlementService(
      preferences: preferences,
      ads: yandexAdsService,
      payments: tbankPayments,
      rustorePay: rustorePay,
    ),
  );
  getIt.registerLazySingleton<CalendarLocalDatasource>(
    () => CalendarLocalDatasource(getIt<SharedPreferences>()),
  );
  getIt.registerLazySingleton<CalendarRepository>(
    () => CalendarRepositoryImpl(getIt<CalendarLocalDatasource>()),
  );
  getIt.registerLazySingleton<CycleCalculator>(CycleCalculator.new);
  getIt.registerLazySingleton<CycleReportBuilder>(CycleReportBuilder.new);
  getIt.registerLazySingleton<DoctorReportExporter>(
    () => DoctorPdfService(preferences: preferences),
  );

  getIt.registerSingleton<CalendarBootstrap>(await executeLoadBootstrap());
}

/// Нефатальная инициализация: ошибка не должна мешать старту приложения.
Future<void> executeInitIgnoringErrors(Future<void> init) async {
  try {
    await init;
  } catch (_) {
    // Сервис продолжает работать без инициализации.
  }
}

Future<CalendarBootstrap> executeLoadBootstrap() async {
  try {
    final CalendarData data = await getIt<CalendarRepository>().loadCalendar();
    return CalendarBootstrap(data: data);
  } catch (_) {
    return CalendarBootstrap(
      data: CalendarData.createEmpty(),
      errorMessage: CalendarMessageCode.loadFailed,
    );
  }
}
