import 'package:womensday/core/constants/distribution_config.dart';

/// Внешние ссылки МойСофт по каналу дистрибуции.
abstract final class AppLinks {
  /// Сайт МойСофт (punycode для url_launcher).
  static const String _moiSoftSite =
      'https://xn--i1afgbohn.xn--p1ai/index.html';

  /// Каталог приложений разработчика в Google Play.
  static const String _googlePlayCatalog =
      'https://play.google.com/store/apps/dev?id=8254852579622364092';

  /// Ссылка логотипа МойСофт: rustore — сайт, googleplay — каталог в Google Play.
  static String get moiSoftApps {
    return DistributionConfig.isGooglePlay ? _googlePlayCatalog : _moiSoftSite;
  }
}
