import 'dart:ui';

import 'package:womensday/core/constants/distribution_config.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Системная локаль телефона, ограниченная набором языков сборки:
/// точное совпадение (язык+страна), затем по языку, затем фолбэк сборки.
Locale executeResolveSystemLocale() {
  final Locale system = PlatformDispatcher.instance.locale;
  final List<Locale> supported = AppLocalizations.supportedLocales;
  for (final Locale candidate in supported) {
    if (candidate.languageCode == system.languageCode &&
        candidate.countryCode == system.countryCode) {
      return candidate;
    }
  }
  for (final Locale candidate in supported) {
    if (candidate.languageCode == system.languageCode) {
      return candidate;
    }
  }
  return DistributionConfig.isGooglePlay
      ? const Locale('en')
      : const Locale('ru');
}
