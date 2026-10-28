import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/di/injection.dart';
import 'package:womensday/core/utils/system_locale.dart';
import 'package:womensday/domain/entities/cycle_settings.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';

/// Выбранная локаль приложения: ручной выбор или следование за системой.
class LocaleController extends Notifier<Locale> {
  @override
  Locale build() {
    final String? stored = getIt<SharedPreferences>().getString(
      AppConstants.localeKey,
    );
    if (stored != null) {
      return _executeParseLocale(stored);
    }
    _executeSubscribeToSystemChanges();
    return executeResolveSystemLocale();
  }

  Future<void> executeSetLocale(Locale locale) async {
    await getIt<SharedPreferences>().setString(
      AppConstants.localeKey,
      _executeFormatLocale(locale),
    );
    state = locale;
  }

  /// Вернуться к автоопределению по языку телефона.
  Future<void> executeUseSystemLocale() async {
    await getIt<SharedPreferences>().remove(AppConstants.localeKey);
    _executeSubscribeToSystemChanges();
    state = executeResolveSystemLocale();
  }

  void _executeSubscribeToSystemChanges() {
    PlatformDispatcher.instance.onLocaleChanged = () {
      state = executeResolveSystemLocale();
    };
    ref.onDispose(() {
      PlatformDispatcher.instance.onLocaleChanged = null;
    });
  }

  static Locale _executeParseLocale(String code) {
    final List<String> parts = code.split('_');
    if (parts.length == 2) {
      return Locale(parts[0], parts[1]);
    }
    return Locale(code);
  }

  static String _executeFormatLocale(Locale locale) {
    final String? country = locale.countryCode;
    if (country == null) {
      return locale.languageCode;
    }
    return '${locale.languageCode}_$country';
  }
}

final NotifierProvider<LocaleController, Locale> localeControllerProvider =
    NotifierProvider<LocaleController, Locale>(LocaleController.new);

/// Смена языка и перепланирование напоминания с новым текстом.
/// [locale] == null — вернуться к языку телефона.
Future<void> executeApplyLocale(WidgetRef ref, Locale? locale) async {
  final LocaleController controller = ref.read(
    localeControllerProvider.notifier,
  );
  if (locale == null) {
    await controller.executeUseSystemLocale();
  } else {
    await controller.executeSetLocale(locale);
  }
  final CycleSettings settings = ref
      .read(calendarControllerProvider)
      .data
      .settings;
  await ref
      .read(calendarControllerProvider.notifier)
      .executeUpdateSettings(settings);
}
