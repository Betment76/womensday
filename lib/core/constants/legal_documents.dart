import 'package:womensday/core/constants/distribution_config.dart';

/// Юридический документ из assets для экрана просмотра.
class LegalDocument {
  const LegalDocument({required this.title, required this.assetPath});

  final String title;
  final String assetPath;
}

/// Список юрдокументов приложения.
class LegalDocuments {
  static const String _privacyPolicyRuStoreAsset =
      'assets/legal/rustore/privacy_policy.txt';
  static const String _privacyPolicyGooglePlayAsset =
      'assets/legal/googleplay/privacy_policy.txt';

  static LegalDocument get privacyPolicy => LegalDocument(
    title: 'Политика конфиденциальности',
    assetPath: DistributionConfig.isGooglePlay
        ? _privacyPolicyGooglePlayAsset
        : _privacyPolicyRuStoreAsset,
  );

  static const LegalDocument userAgreement = LegalDocument(
    title: 'Пользовательское соглашение',
    assetPath: 'assets/legal/user_agreement.txt',
  );
  static const LegalDocument publicOffer = LegalDocument(
    title: 'Публичная оферта',
    assetPath: 'assets/legal/public_offer.txt',
  );
  static const LegalDocument consentPd = LegalDocument(
    title: 'Согласие на обработку ПД',
    assetPath: 'assets/legal/consent_pd.txt',
  );

  /// Документы экрана «О приложении»: в googleplay оплата недоступна,
  /// поэтому соглашение, оферта и согласие на ПД не показываются.
  static List<LegalDocument> get all => DistributionConfig.isGooglePlay
      ? <LegalDocument>[privacyPolicy]
      : <LegalDocument>[privacyPolicy, userAgreement, publicOffer, consentPd];

  static bool isPrivacyPolicyAsset(String assetPath) {
    return assetPath == _privacyPolicyRuStoreAsset ||
        assetPath == _privacyPolicyGooglePlayAsset;
  }
}
