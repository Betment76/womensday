/// Юридический документ из assets для экрана просмотра.
class LegalDocument {
  const LegalDocument({required this.title, required this.assetPath});

  final String title;
  final String assetPath;
}

/// Список юрдокументов приложения.
class LegalDocuments {
  static const LegalDocument privacyPolicy = LegalDocument(
    title: 'Политика конфиденциальности',
    assetPath: 'assets/legal/privacy_policy.txt',
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
  static const List<LegalDocument> all = <LegalDocument>[
    privacyPolicy,
    userAgreement,
    publicOffer,
    consentPd,
  ];
}
