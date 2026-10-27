import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womensday/core/di/injection.dart';
import 'package:womensday/domain/entities/cycle_settings.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';

/// Ключ языка интерфейса в SharedPreferences.
const String kAppLocaleKey = 'app_locale_code';

/// Выбранная локаль приложения (ru / en).
class LocaleController extends Notifier<Locale> {
  @override
  Locale build() {
    final String code =
        getIt<SharedPreferences>().getString(kAppLocaleKey) ?? 'ru';
    return Locale(code);
  }

  Future<void> executeSetLocale(String languageCode) async {
    if (languageCode != 'ru' && languageCode != 'en') {
      return;
    }
    await getIt<SharedPreferences>().setString(kAppLocaleKey, languageCode);
    state = Locale(languageCode);
  }
}

final NotifierProvider<LocaleController, Locale> localeControllerProvider =
    NotifierProvider<LocaleController, Locale>(LocaleController.new);

/// Смена языка и перепланирование напоминания с новым текстом.
Future<void> executeApplyLocale(WidgetRef ref, String languageCode) async {
  await ref.read(localeControllerProvider.notifier).executeSetLocale(
    languageCode,
  );
  final CycleSettings settings = ref.read(calendarControllerProvider).data.settings;
  await ref
      .read(calendarControllerProvider.notifier)
      .executeUpdateSettings(settings);
}
