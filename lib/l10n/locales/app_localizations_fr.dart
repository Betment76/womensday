import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Французская локализация.
class AppLocalizationsFr extends AppLocalizations {
  @override
  String get languageCode => 'fr';

  @override
  String get appName => 'Calendrier Menstruel';

  @override
  String get appSubtitle => 'Calendrier de cycle';

  @override
  String get navToday => 'Aujourd’hui';

  @override
  String get navCalendar => 'Calendrier';

  @override
  String get navStats => 'Cycles';

  @override
  String get navSettings => 'Plus';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get cycleLengthLabel => 'Durée habituelle du cycle';

  @override
  String get periodDurationLabel => 'Durée des règles';

  @override
  String get daysUnit => 'jours';

  @override
  String get reminderTitle => 'Rappel';

  @override
  String get reminderSubtitle => 'Un jour avant les règles prévues';

  @override
  String get languageTitle => 'Langue';

  @override
  String get aboutTitle => 'À propos';

  @override
  String get aboutSubtitle => 'Phases du cycle et documents légaux';

  @override
  String get resetData => 'Réinitialiser toutes les données';

  @override
  String get resetDialogTitle => 'Réinitialiser les données ?';

  @override
  String get resetDialogBody =>
      'Le calendrier, les notes et les paramètres seront supprimés. L’onboarding recommencera.';

  @override
  String get cancel => 'Annuler';

  @override
  String get writeToDeveloper => 'Contacter le développeur';

  @override
  String get addressCopied => 'Adresse copiée';

  @override
  String get emailFieldLabel => 'E-mail';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Réinitialiser';

  @override
  String get loadCalendarError => 'Impossible de charger le calendrier';

  @override
  String get persistError => 'Impossible d’enregistrer les données';

  @override
  String get pdfExportError => 'Impossible de préparer le PDF';

  @override
  String get retry => 'Réessayer';

  @override
  String get dayN => 'Jour';

  @override
  String dayNumber(int n) => 'Jour $n';

  @override
  String get periodActive => 'Règles en cours';

  @override
  String delayDays(int n) => 'Retard de $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => '$n ${pluralDays(n)} avant les règles';

  @override
  String pluralDays(int count) => count == 1 ? 'jour' : 'jours';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Règles',
      CyclePhase.follicular => 'Phase folliculaire',
      CyclePhase.fertile => 'Période fertile',
      CyclePhase.ovulation => 'Ovulation',
      CyclePhase.luteal => 'Phase lutéale',
      CyclePhase.late => 'Cycle en retard',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Reposez-vous si nécessaire.',
      CyclePhase.follicular => 'L’énergie revient souvent.',
      CyclePhase.fertile => 'Probabilité de conception plus élevée.',
      CyclePhase.ovulation => 'Jour d’ovulation estimé.',
      CyclePhase.luteal => 'Ralentissez et écoutez votre corps.',
      CyclePhase.late =>
        'Le cycle est plus long que d’habitude — notez les règles dès qu’elles commencent.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Super',
      Mood.good => 'Bien',
      Mood.okay => 'Correct',
      Mood.low => 'Triste',
      Mood.irritable => 'Irritable',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Maux de tête',
      Symptom.tenderBreasts => 'Sensibilité des seins',
      Symptom.backache => 'Maux de dos',
      Symptom.acne => 'Problèmes de peau',
      Symptom.abdominalPain => 'Douleurs abdominales',
      Symptom.bloating => 'Ballonnements',
      Symptom.cramps => 'Crampes',
      Symptom.fatigue => 'Fatigue',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Faible',
      FlowIntensity.medium => 'Moyen',
      FlowIntensity.heavy => 'Abondant',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Pas encore assez de données',
      CycleRegularity.stable => 'Cycle stable',
      CycleRegularity.mild => 'Légères variations',
      CycleRegularity.irregular => 'Irrégulier pour l’instant',
    };
  }

  @override
  String get period => 'Règles';

  @override
  String get flow => 'Flux';

  @override
  String get mood => 'Humeur';

  @override
  String get wellbeing => 'Bien-être';

  @override
  String get noteHint => 'Note';

  @override
  String get noteHintShort => 'Note courte si besoin';

  @override
  String get save => 'Enregistrer';

  @override
  String get calendarTitle => 'Calendrier';

  @override
  String get legendPeriod => 'Règles';

  @override
  String get legendForecast => 'Prévision';

  @override
  String get legendFertile => 'Fertile';

  @override
  String get legendOvulation => 'Ovulation';

  @override
  String get statsTitle => 'Cycles';

  @override
  String get statsCycleLength => 'Durée du cycle';

  @override
  String get statsPeriodDuration => 'Règles';

  @override
  String get statsRecentCycles => 'Cycles récents';

  @override
  String get statsEmptyHistory =>
      'Notez vos règles — l’historique apparaîtra ici.';

  @override
  String get statsCurrentCycle => 'cycle en cours';

  @override
  String get exportDoctorPdf => 'Exporter pour le médecin';

  @override
  String get exportDoctorPdfLoading => 'Préparation du PDF…';

  @override
  String get exportDoctorPdfHint =>
      'Vous pouvez envoyer le fichier à votre médecin. Tant que le PDF n’est pas partagé, les données restent sur cet appareil.';

  @override
  String get legalDocumentLoadError => 'Impossible de charger le document.';

  @override
  String get onboardingWelcomeTitle => 'Un calendrier rien que pour vous';

  @override
  String get onboardingWelcomeBody =>
      'Notez vos règles en un geste. Prévisions, ovulation et bien-être restent sur cet appareil uniquement.';

  @override
  String get onboardingDateTitle =>
      'Quand vos dernières règles ont-elles commencé ?';

  @override
  String get pickDate => 'Choisir une date';

  @override
  String get datePickerHelp => 'Début des dernières règles';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get onboardingBack => 'Retour';

  @override
  String get onboardingStart => 'Commencer';

  @override
  String get aboutPhasesTitle => 'Comment les phases sont calculées';

  @override
  String get aboutPhasesBody1 =>
      'Votre cycle est construit à partir de vos notes : des jours de règles consécutifs forment un cycle. La durée moyenne du cycle et la durée des règles sont calculées sur les 6 derniers cycles ; si l’historique est court, les valeurs des paramètres sont utilisées.';

  @override
  String get aboutPhasesBody2 =>
      'Ovulation : durée du cycle moins 14 jours à partir du début du cycle. Période fertile : 5 jours avant l’ovulation et 1 jour après. Prévision des prochaines règles : début du dernier cycle plus durée moyenne.';

  @override
  String get aboutPhasesBody3 =>
      'Les phases sont indicatives et ne constituent pas un diagnostic médical. L’application ne remplace pas un médecin et ne sert pas de contraception. Les données restent sur cet appareil uniquement.';

  @override
  String get legalSectionTitle => 'Documents légaux';

  @override
  String get allMoiSoftApps => 'Toutes les applications MoiSoft';

  @override
  String get privacyPolicyTitle => 'Politique de confidentialité';

  @override
  String get userAgreementTitle => 'Conditions d’utilisation';

  @override
  String get publicOfferTitle => 'Offre publique';

  @override
  String get consentPdTitle => 'Consentement au traitement des données';

  @override
  String get versionLabel => 'Version';

  @override
  String get reminderNotificationBody =>
      'Selon les prévisions, vos règles peuvent commencer demain.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Export pour le médecin — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Ce document est créé à partir des notes saisies sur l’appareil. Il ne s’agit ni d’un avis médical ni d’un diagnostic.';

  @override
  String get pdfSectionCycles => 'Cycles';

  @override
  String get pdfSectionDiary => 'Journal';

  @override
  String get pdfSummaryRegularity => 'Régularité';

  @override
  String get pdfCyclesEmpty => 'Aucun cycle enregistré pour le moment.';

  @override
  String get pdfDiaryEmpty => 'Aucune entrée de journal pour cette période.';

  @override
  String get pdfColStart => 'Début';

  @override
  String get pdfColEnd => 'Fin';

  @override
  String get pdfColPeriodDays => 'Règles';

  @override
  String get pdfColCycleLength => 'Durée du cycle';

  @override
  String get pdfColDate => 'Date';

  @override
  String get pdfColNote => 'Note';

  @override
  String get pdfYes => 'oui';

  @override
  String get pdfNo => 'non';

  @override
  String get pdfCurrentCycleShort => 'en cours';

  @override
  String get pdfDiaryContinuation => 'Journal (suite)';

  @override
  String pdfPageFooter(int page, int pages) => 'Page $page sur $pages';

  @override
  String get pdfShareSubject => 'Calendrier Menstruel : export pour le médecin';

  @override
  String get premiumBuyTitle => 'Acheter Premium';

  @override
  String get premiumAfterPaymentHint =>
      'Après le paiement, toutes les publicités sont supprimées. Conservez votre numéro de commande.';

  @override
  String get premiumPaySbp => 'Payer via SBP';

  @override
  String get premiumPayRustore => 'Payer dans RuStore';

  @override
  String get premiumConsentPrefix => 'J’accepte l’';

  @override
  String get premiumConsentOfferLink => 'offre publique';

  @override
  String get premiumConsentAnd => ' et ';

  @override
  String get premiumConsentPdLink => 'le consentement aux données personnelles';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Impossible d’ouvrir le paiement';

  @override
  String get premiumRustoreUnavailable =>
      'Les paiements RuStore sont indisponibles. Installez RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'Premium activé. Publicités désactivées.';

  @override
  String get premiumPurchaseFailed => 'L’achat a échoué. Réessayez plus tard.';

  @override
  String get premiumActiveLabel => 'Premium est actif. Publicités désactivées.';

  @override
  String get premiumRestoreButton => 'Restaurer l’achat';

  @override
  String get premiumRestoreTitle => 'Restaurer l’achat';

  @override
  String get premiumRestoreBody =>
      'Saisissez le numéro de commande figurant sur le reçu ou sur l’écran après le paiement.';

  @override
  String get premiumOrderIdLabel => 'Numéro de commande';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Si vous avez perdu le numéro, écrivez à $email';

  @override
  String get premiumRestoreAction => 'Restaurer';

  @override
  String get premiumRestoreViaRustore => 'Restaurer via RuStore';

  @override
  String get premiumEnterOrderId => 'Saisissez le numéro de commande';

  @override
  String get premiumRestoreSuccess => 'Achat restauré. Premium activé.';

  @override
  String get premiumRestoreNotFound =>
      'Paiement introuvable ou non abouti. Vérifiez le numéro de commande.';

  @override
  String get premiumRestoreCheckFailed => 'Impossible de vérifier le paiement';

  @override
  String get premiumRestoreRustoreSuccess =>
      'Achat RuStore restauré. Premium activé.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Aucun achat RuStore actif trouvé.';

  @override
  String get premiumRestoreRustoreFailed =>
      'Impossible de restaurer l’achat RuStore';

  @override
  String get premiumPaymentDescription => 'Premium : sans publicité';

  @override
  String get paymentOpeningBank => 'Ouverture du paiement T-Bank…';

  @override
  String get paymentOpenFormFailed =>
      'Impossible d’ouvrir le formulaire de paiement.';

  @override
  String get paymentReturnHint =>
      'Après le paiement, revenez dans l’application. Le statut se mettra à jour automatiquement.';

  @override
  String get paymentWaiting => 'En attente de paiement…';

  @override
  String paymentBankStatus(String status) => 'Statut : $status';

  @override
  String get paymentSuccess => 'Paiement réussi';

  @override
  String get paymentNotCompleted => 'Paiement non finalisé';

  @override
  String get paymentFailedTitle => 'Échec du paiement';

  @override
  String get paymentFailedBody =>
      'Réessayez ou utilisez un autre moyen de paiement dans votre application bancaire.';

  @override
  String get paymentGotIt => 'Compris';

  @override
  String get paymentPremiumActivatedTitle => 'Premium activé';

  @override
  String get paymentSaveOrderHint =>
      'Conservez le numéro de commande — il est nécessaire pour restaurer l’achat.';

  @override
  String paymentSheetTitle(int rubles) => 'Paiement $rubles ₽';

  @override
  String get paymentOrderCopied => 'Numéro de commande copié';

  @override
  String get paymentSessionNotFound => 'Session de paiement introuvable';

  @override
  String get paymentCopyOrder => 'Copier';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
