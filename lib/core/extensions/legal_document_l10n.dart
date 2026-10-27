import 'package:womensday/core/constants/legal_documents.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Локализованные заголовки юрдокументов (тексты в assets без смены языка).
extension LegalDocumentL10n on LegalDocument {
  String localizedTitle(AppLocalizations l10n) {
    if (LegalDocuments.isPrivacyPolicyAsset(assetPath)) {
      return l10n.privacyPolicyTitle;
    }
    if (assetPath == LegalDocuments.userAgreement.assetPath) {
      return l10n.userAgreementTitle;
    }
    if (assetPath == LegalDocuments.publicOffer.assetPath) {
      return l10n.publicOfferTitle;
    }
    if (assetPath == LegalDocuments.consentPd.assetPath) {
      return l10n.consentPdTitle;
    }
    return title;
  }
}
