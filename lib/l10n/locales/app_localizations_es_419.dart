/// Испанская локализация для Латинской Америки (es-419).
library;

import 'package:womensday/l10n/locales/app_localizations_es.dart';

/// Латиноамериканский испанский: отличается только магазинным названием,
/// остальные строки наследуются от [AppLocalizationsEs].
class AppLocalizationsEs419 extends AppLocalizationsEs {
  @override
  String get appName => 'Calendario Menstrual Fácil';
}
