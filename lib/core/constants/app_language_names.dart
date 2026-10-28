import 'package:flutter/material.dart';
import 'package:womensday/core/utils/system_locale.dart';

/// Результат выбора в шторке языка: конкретный язык или «как в системе».
sealed class LocalePickResult {
  const LocalePickResult();
}

/// Выбран конкретный язык.
class PickedLocale extends LocalePickResult {
  const PickedLocale(this.locale);

  final Locale locale;
}

/// Выбрано следование за языком телефона.
class SystemLocalePicked extends LocalePickResult {
  const SystemLocalePicked();
}

/// Запись языка: локаль + название на самом языке.
class AppLanguageOption {
  const AppLanguageOption({required this.locale, required this.nativeName});

  final Locale locale;
  final String nativeName;
}

/// Справочник языков Google Play-сборки для шторки выбора (названия нативные).
abstract final class AppLanguageNames {
  static const List<AppLanguageOption> googlePlayOptions = <AppLanguageOption>[
    AppLanguageOption(locale: Locale('en'), nativeName: 'English'),
    AppLanguageOption(locale: Locale('ru'), nativeName: 'Русский'),
    AppLanguageOption(locale: Locale('de'), nativeName: 'Deutsch'),
    AppLanguageOption(locale: Locale('es'), nativeName: 'Español (España)'),
    AppLanguageOption(
      locale: Locale('es', '419'),
      nativeName: 'Español (Latinoamérica)',
    ),
    AppLanguageOption(
      locale: Locale('pt', 'BR'),
      nativeName: 'Português (Brasil)',
    ),
    AppLanguageOption(locale: Locale('fr'), nativeName: 'Français'),
    AppLanguageOption(locale: Locale('it'), nativeName: 'Italiano'),
    AppLanguageOption(locale: Locale('tr'), nativeName: 'Türkçe'),
    AppLanguageOption(locale: Locale('ja'), nativeName: '日本語'),
    AppLanguageOption(locale: Locale('ko'), nativeName: '한국어'),
    AppLanguageOption(locale: Locale('pl'), nativeName: 'Polski'),
    AppLanguageOption(locale: Locale('nl'), nativeName: 'Nederlands'),
    AppLanguageOption(locale: Locale('uk'), nativeName: 'Українська'),
    AppLanguageOption(locale: Locale('id'), nativeName: 'Bahasa Indonesia'),
    AppLanguageOption(locale: Locale('hi'), nativeName: 'हिन्दी'),
    AppLanguageOption(locale: Locale('vi'), nativeName: 'Tiếng Việt'),
    AppLanguageOption(locale: Locale('th'), nativeName: 'ไทย'),
    AppLanguageOption(locale: Locale('ar'), nativeName: 'العربية'),
    AppLanguageOption(locale: Locale('zh', 'TW'), nativeName: '繁體中文'),
    AppLanguageOption(locale: Locale('cs'), nativeName: 'Čeština'),
    AppLanguageOption(locale: Locale('ro'), nativeName: 'Română'),
    AppLanguageOption(locale: Locale('hu'), nativeName: 'Magyar'),
    AppLanguageOption(locale: Locale('el'), nativeName: 'Ελληνικά'),
  ];

  /// Название текущей локали на её языке; для неизвестной — код.
  static String nativeName(Locale locale) {
    for (final AppLanguageOption option in googlePlayOptions) {
      if (option.locale.languageCode == locale.languageCode &&
          option.locale.countryCode == locale.countryCode) {
        return option.nativeName;
      }
    }
    return locale.languageCode.toUpperCase();
  }

  /// Шторка выбора языка для googleplay-сборки; null — выбор отменён.
  static Future<LocalePickResult?> executeShowPicker(
    BuildContext context,
    Locale current,
  ) {
    return showModalBottomSheet<LocalePickResult>(
      context: context,
      builder: (BuildContext sheetContext) {
        final Locale system = executeResolveSystemLocale();
        return SafeArea(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: googlePlayOptions.length + 1,
            itemBuilder: (BuildContext itemContext, int index) {
              if (index == 0) {
                return ListTile(
                  leading: const Icon(Icons.phone_android),
                  title: Text(nativeName(system)),
                  onTap: () =>
                      Navigator.pop(sheetContext, const SystemLocalePicked()),
                );
              }
              final AppLanguageOption option = googlePlayOptions[index - 1];
              final bool isSelected =
                  option.locale.languageCode == current.languageCode &&
                  option.locale.countryCode == current.countryCode;
              return ListTile(
                title: Text(option.nativeName),
                trailing: isSelected ? const Icon(Icons.check) : null,
                onTap: () =>
                    Navigator.pop(sheetContext, PickedLocale(option.locale)),
              );
            },
          ),
        );
      },
    );
  }
}
