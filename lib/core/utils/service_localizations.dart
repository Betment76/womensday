import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/utils/system_locale.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Строки для сервисов вне дерева виджетов (уведомления, PDF-экспорт):
/// ручной выбор языка или системная локаль, ограниченная набором сборки.
AppLocalizations executeResolveLocalizedStrings(
  SharedPreferences? preferences,
) {
  final String? stored = preferences?.getString(AppConstants.localeKey);
  if (stored != null) {
    final List<String> parts = stored.split('_');
    final Locale locale = parts.length == 2
        ? Locale(parts[0], parts[1])
        : Locale(stored);
    return AppLocalizations.lookup(locale);
  }
  return AppLocalizations.lookup(executeResolveSystemLocale());
}
