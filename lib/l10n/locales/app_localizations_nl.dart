import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Нидерландская локализация.
class AppLocalizationsNl extends AppLocalizations {
  @override
  String get languageCode => 'nl';

  @override
  String get appName => 'Menstruatiekalender';

  @override
  String get appSubtitle => 'Cycluskalender';

  @override
  String get navToday => 'Vandaag';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navStats => 'Cycli';

  @override
  String get navSettings => 'Meer';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get cycleLengthLabel => 'Gebruikelijke cycluslengte';

  @override
  String get periodDurationLabel => 'Duur van de menstruatie';

  @override
  String get daysUnit => 'dagen';

  @override
  String get reminderTitle => 'Herinnering';

  @override
  String get reminderSubtitle =>
      'Een dag voordat de menstruatie wordt verwacht';

  @override
  String get languageTitle => 'Taal';

  @override
  String get aboutTitle => 'Over';

  @override
  String get aboutSubtitle => 'Cyclusfasen en juridische documenten';

  @override
  String get resetData => 'Alle gegevens wissen';

  @override
  String get resetDialogTitle => 'Gegevens wissen?';

  @override
  String get resetDialogBody =>
      'Kalender, notities en instellingen worden verwijderd. De introductie begint opnieuw.';

  @override
  String get cancel => 'Annuleren';

  @override
  String get writeToDeveloper => 'Schrijf naar de ontwikkelaar';

  @override
  String get addressCopied => 'Adres gekopieerd';

  @override
  String get emailFieldLabel => 'E-mail';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Wissen';

  @override
  String get loadCalendarError => 'Kalender kon niet worden geladen';

  @override
  String get persistError => 'Gegevens konden niet worden opgeslagen';

  @override
  String get pdfExportError => 'PDF kon niet worden gemaakt';

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String get dayN => 'Dag';

  @override
  String dayNumber(int n) => 'Dag $n';

  @override
  String get periodActive => 'Menstruatie bezig';

  @override
  String delayDays(int n) => '$n ${pluralDays(n)} te laat';

  @override
  String daysUntilPeriod(int n) => 'Nog $n ${pluralDays(n)} tot de menstruatie';

  @override
  String pluralDays(int count) => count == 1 ? 'dag' : 'dagen';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Menstruatie',
      CyclePhase.follicular => 'Follikelfase',
      CyclePhase.fertile => 'Vruchtbare periode',
      CyclePhase.ovulation => 'Eisprong',
      CyclePhase.luteal => 'Luteale fase',
      CyclePhase.late => 'Vertraagde cyclus',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Rust uit als je dat nodig hebt.',
      CyclePhase.follicular => 'Je energie komt vaak terug.',
      CyclePhase.fertile => 'Grotere kans op bevruchting.',
      CyclePhase.ovulation => 'Geschatte dag van de eisprong.',
      CyclePhase.luteal => 'Neem het rustiger aan en luister naar je lichaam.',
      CyclePhase.late =>
        'Je cyclus is langer dan gebruikelijk — noteer de menstruatie zodra die begint.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Top',
      Mood.good => 'Goed',
      Mood.okay => 'Prima',
      Mood.low => 'Somber',
      Mood.irritable => 'Prikkelbaar',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Hoofdpijn',
      Symptom.tenderBreasts => 'Gevoelige borsten',
      Symptom.backache => 'Rugpijn',
      Symptom.acne => 'Huidproblemen',
      Symptom.abdominalPain => 'Buikpijn',
      Symptom.bloating => 'Opgeblazen gevoel',
      Symptom.cramps => 'Krampen',
      Symptom.fatigue => 'Vermoeidheid',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Licht',
      FlowIntensity.medium => 'Normaal',
      FlowIntensity.heavy => 'Zwaar',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Nog te weinig gegevens',
      CycleRegularity.stable => 'Stabiele cyclus',
      CycleRegularity.mild => 'Kleine schommelingen',
      CycleRegularity.irregular => 'Tot nu toe onregelmatig',
    };
  }

  @override
  String get period => 'Menstruatie';

  @override
  String get flow => 'Bloedverlies';

  @override
  String get mood => 'Stemming';

  @override
  String get wellbeing => 'Welzijn';

  @override
  String get noteHint => 'Notitie';

  @override
  String get noteHintShort => 'Korte notitie indien gewenst';

  @override
  String get save => 'Opslaan';

  @override
  String get calendarTitle => 'Kalender';

  @override
  String get legendPeriod => 'Menstruatie';

  @override
  String get legendForecast => 'Voorspelling';

  @override
  String get legendFertile => 'Vruchtbaar';

  @override
  String get legendOvulation => 'Eisprong';

  @override
  String get statsTitle => 'Cycli';

  @override
  String get statsCycleLength => 'Cycluslengte';

  @override
  String get statsPeriodDuration => 'Menstruatie';

  @override
  String get statsRecentCycles => 'Recente cycli';

  @override
  String get statsEmptyHistory =>
      'Noteer je menstruatie — hier verschijnt je geschiedenis.';

  @override
  String get statsCurrentCycle => 'huidige cyclus';

  @override
  String get exportDoctorPdf => 'Exporteren voor de arts';

  @override
  String get exportDoctorPdfLoading => 'PDF wordt voorbereid…';

  @override
  String get exportDoctorPdfHint =>
      'Je kunt het bestand naar je arts sturen. Tot je de PDF deelt, blijven de gegevens op dit apparaat.';

  @override
  String get legalDocumentLoadError => 'Document kon niet worden geladen.';

  @override
  String get onboardingWelcomeTitle => 'Een rustige kalender voor jou';

  @override
  String get onboardingWelcomeBody =>
      'Noteer je menstruatie met één tik. Voorspelling, eisprong en welzijn blijven alleen op dit apparaat.';

  @override
  String get onboardingDateTitle => 'Wanneer begon je laatste menstruatie?';

  @override
  String get pickDate => 'Datum kiezen';

  @override
  String get datePickerHelp => 'Begin van je laatste menstruatie';

  @override
  String get onboardingNext => 'Volgende';

  @override
  String get onboardingBack => 'Terug';

  @override
  String get onboardingStart => 'Beginnen';

  @override
  String get aboutPhasesTitle => 'Hoe de fasen worden berekend';

  @override
  String get aboutPhasesBody1 =>
      'Je cyclus wordt opgebouwd uit je notities: opeenvolgende menstruatiedagen vormen één cyclus. De gemiddelde cycluslengte en menstruatieduur worden berekend over de laatste 6 cycli; bij weinig historie worden de waarden uit de instellingen gebruikt.';

  @override
  String get aboutPhasesBody2 =>
      'Eisprong: cycluslengte min 14 dagen vanaf het begin van de cyclus. Vruchtbare periode: 5 dagen vóór de eisprong en 1 dag erna. Voorspelling van de volgende menstruatie: begin van de laatste cyclus plus de gemiddelde lengte.';

  @override
  String get aboutPhasesBody3 =>
      'De fasen zijn een richtlijn, geen medische diagnose. De app vervangt geen arts en is geen anticonceptiemiddel. Gegevens blijven alleen op dit apparaat.';

  @override
  String get legalSectionTitle => 'Juridische documenten';

  @override
  String get allMoiSoftApps => 'Alle MoiSoft-apps';

  @override
  String get privacyPolicyTitle => 'Privacybeleid';

  @override
  String get userAgreementTitle => 'Gebruiksvoorwaarden';

  @override
  String get publicOfferTitle => 'Openbaar aanbod';

  @override
  String get consentPdTitle => 'Toestemming gegevensverwerking';

  @override
  String get versionLabel => 'Versie';

  @override
  String get reminderNotificationBody =>
      'Volgens de voorspelling kan je menstruatie morgen beginnen.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Export voor de arts — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Dit document is opgebouwd uit notities op het apparaat. Het is geen medisch rapport en geen diagnose.';

  @override
  String get pdfSectionCycles => 'Cycli';

  @override
  String get pdfSectionDiary => 'Dagboek';

  @override
  String get pdfSummaryRegularity => 'Regelmaat';

  @override
  String get pdfCyclesEmpty => 'Nog geen cycli genoteerd.';

  @override
  String get pdfDiaryEmpty => 'Geen dagboeknotities voor deze periode.';

  @override
  String get pdfColStart => 'Begin';

  @override
  String get pdfColEnd => 'Einde';

  @override
  String get pdfColPeriodDays => 'Menstruatie';

  @override
  String get pdfColCycleLength => 'Cycluslengte';

  @override
  String get pdfColDate => 'Datum';

  @override
  String get pdfColNote => 'Notitie';

  @override
  String get pdfYes => 'ja';

  @override
  String get pdfNo => 'nee';

  @override
  String get pdfCurrentCycleShort => 'huidig';

  @override
  String get pdfDiaryContinuation => 'Dagboek (vervolg)';

  @override
  String pdfPageFooter(int page, int pages) => 'Pagina $page van $pages';

  @override
  String get pdfShareSubject => 'Menstruatiekalender: export voor de arts';

  @override
  String get premiumBuyTitle => 'Premium kopen';

  @override
  String get premiumAfterPaymentHint =>
      'Na de betaling verdwijnt alle reclame. Bewaar je bestelnummer.';

  @override
  String get premiumPaySbp => 'Betalen via SBP';

  @override
  String get premiumPayRustore => 'Betalen in RuStore';

  @override
  String get premiumConsentPrefix => 'Ik ga akkoord met de ';

  @override
  String get premiumConsentOfferLink => 'openbare aanbieding';

  @override
  String get premiumConsentAnd => ' en ';

  @override
  String get premiumConsentPdLink => 'de toestemming voor gegevensverwerking';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Betaling kon niet worden geopend';

  @override
  String get premiumRustoreUnavailable =>
      'RuStore-betalingen zijn niet beschikbaar. Installeer RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'Premium geactiveerd. Reclame is uitgeschakeld.';

  @override
  String get premiumPurchaseFailed =>
      'Aankoop mislukt. Probeer het later opnieuw.';

  @override
  String get premiumActiveLabel =>
      'Premium is actief. Reclame is uitgeschakeld.';

  @override
  String get premiumRestoreButton => 'Aankoop herstellen';

  @override
  String get premiumRestoreTitle => 'Aankoop herstellen';

  @override
  String get premiumRestoreBody =>
      'Voer het bestelnummer van je bon of van het scherm na de betaling in.';

  @override
  String get premiumOrderIdLabel => 'Bestelnummer';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Ben je je nummer kwijt? Mail naar $email';

  @override
  String get premiumRestoreAction => 'Herstellen';

  @override
  String get premiumRestoreViaRustore => 'Herstellen via RuStore';

  @override
  String get premiumEnterOrderId => 'Voer het bestelnummer in';

  @override
  String get premiumRestoreSuccess => 'Aankoop hersteld. Premium geactiveerd.';

  @override
  String get premiumRestoreNotFound =>
      'Betaling niet gevonden of niet geslaagd. Controleer het bestelnummer.';

  @override
  String get premiumRestoreCheckFailed =>
      'Betaling kon niet worden gecontroleerd';

  @override
  String get premiumRestoreRustoreSuccess =>
      'RuStore-aankoop hersteld. Premium geactiveerd.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Geen actieve RuStore-aankoop gevonden.';

  @override
  String get premiumRestoreRustoreFailed =>
      'RuStore-aankoop kon niet worden hersteld';

  @override
  String get premiumPaymentDescription => 'Premium: zonder reclame';

  @override
  String get paymentOpeningBank => 'T-Bank-betaling wordt geopend…';

  @override
  String get paymentOpenFormFailed =>
      'Betaalformulier kon niet worden geopend.';

  @override
  String get paymentReturnHint =>
      'Keer na de betaling terug naar de app. De status wordt automatisch bijgewerkt.';

  @override
  String get paymentWaiting => 'Wachten op betaling…';

  @override
  String paymentBankStatus(String status) => 'Status: $status';

  @override
  String get paymentSuccess => 'Betaling geslaagd';

  @override
  String get paymentNotCompleted => 'Betaling niet afgerond';

  @override
  String get paymentFailedTitle => 'Betaling mislukt';

  @override
  String get paymentFailedBody =>
      'Probeer het opnieuw of kies een andere betaalmethode in je bankapp.';

  @override
  String get paymentGotIt => 'Begrepen';

  @override
  String get paymentPremiumActivatedTitle => 'Premium geactiveerd';

  @override
  String get paymentSaveOrderHint =>
      'Bewaar het bestelnummer — je hebt het nodig om je aankoop te herstellen.';

  @override
  String paymentSheetTitle(int rubles) => 'Betaling $rubles ₽';

  @override
  String get paymentOrderCopied => 'Bestelnummer gekopieerd';

  @override
  String get paymentSessionNotFound => 'Betalingssessie niet gevonden';

  @override
  String get paymentCopyOrder => 'Kopiëren';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}-${start.month}-${start.year} — ${end.day}-${end.month}-${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
