import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womensday/core/di/calendar_bootstrap.dart';
import 'package:womensday/data/datasources/calendar_local_datasource.dart';
import 'package:womensday/data/repositories/calendar_repository_impl.dart';
import 'package:womensday/data/services/appmetrica_service.dart';
import 'package:womensday/data/services/doctor_pdf_service.dart';
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
  final NotificationService notificationService = NotificationService();
  try {
    await notificationService.executeInitialize();
  } catch (_) {
    // Напоминания недоступны на текущей платформе — календарь работает без них.
  }
  getIt.registerSingleton<SharedPreferences>(preferences);
  getIt.registerSingleton<NotificationService>(notificationService);
  getIt.registerSingleton<ReminderScheduler>(notificationService);
  final AppMetricaService appMetricaService = AppMetricaService();
  await appMetricaService.executeInitialize();
  getIt.registerSingleton<AppMetricaService>(appMetricaService);
  final RustoreReviewService rustoreReviewService = RustoreReviewService();
  await rustoreReviewService.executeInitialize();
  getIt.registerSingleton<RustoreReviewService>(rustoreReviewService);
  getIt.registerSingleton<RustoreUpdateService>(RustoreUpdateService());
  final YandexAdsService yandexAdsService = YandexAdsService(preferences);
  await yandexAdsService.executeInitialize();
  getIt.registerSingleton<YandexAdsService>(yandexAdsService);
  final http.Client tbankClient = await TBankHttpClient.getClient();
  getIt.registerSingleton<TBankPaymentService>(
    TBankPaymentService(client: tbankClient),
  );
  final RustorePayService rustorePayService = RustorePayService(
    ads: yandexAdsService,
  );
  await rustorePayService.executeInitialize();
  getIt.registerSingleton<RustorePayService>(rustorePayService);
  getIt.registerSingleton<PremiumEntitlementService>(
    PremiumEntitlementService(
      preferences: preferences,
      ads: yandexAdsService,
      payments: getIt<TBankPaymentService>(),
      rustorePay: getIt<RustorePayService>(),
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
  getIt.registerLazySingleton<DoctorReportExporter>(DoctorPdfService.new);
  getIt.registerSingleton<CalendarBootstrap>(await executeLoadBootstrap());
}

Future<CalendarBootstrap> executeLoadBootstrap() async {
  try {
    final CalendarData data = await getIt<CalendarRepository>().loadCalendar();
    return CalendarBootstrap(data: data);
  } catch (_) {
    return CalendarBootstrap(
      data: CalendarData.createEmpty(),
      errorMessage: 'Не удалось загрузить календарь',
    );
  }
}
