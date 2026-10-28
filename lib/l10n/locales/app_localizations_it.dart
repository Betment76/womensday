import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Итальянская локализация.
class AppLocalizationsIt extends AppLocalizations {
  @override
  String get languageCode => 'it';

  @override
  String get appName => 'Calendario Mestruale';

  @override
  String get appSubtitle => 'Calendario del ciclo';

  @override
  String get navToday => 'Oggi';

  @override
  String get navCalendar => 'Calendario';

  @override
  String get navStats => 'Cicli';

  @override
  String get navSettings => 'Altro';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get cycleLengthLabel => 'Durata abituale del ciclo';

  @override
  String get periodDurationLabel => 'Durata delle mestruazioni';

  @override
  String get daysUnit => 'giorni';

  @override
  String get reminderTitle => 'Promemoria';

  @override
  String get reminderSubtitle => 'Un giorno prima delle mestruazioni previste';

  @override
  String get languageTitle => 'Lingua';

  @override
  String get aboutTitle => 'Informazioni';

  @override
  String get aboutSubtitle => 'Fasi del ciclo e documenti legali';

  @override
  String get resetData => 'Cancella tutti i dati';

  @override
  String get resetDialogTitle => 'Cancellare i dati?';

  @override
  String get resetDialogBody =>
      'Calendario, note e impostazioni verranno eliminati. L’onboarding ricomincerà.';

  @override
  String get cancel => 'Annulla';

  @override
  String get writeToDeveloper => 'Scrivi allo sviluppatore';

  @override
  String get addressCopied => 'Indirizzo copiato';

  @override
  String get emailFieldLabel => 'Email';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Cancella';

  @override
  String get loadCalendarError => 'Impossibile caricare il calendario';

  @override
  String get persistError => 'Impossibile salvare i dati';

  @override
  String get pdfExportError => 'Impossibile preparare il PDF';

  @override
  String get retry => 'Riprova';

  @override
  String get dayN => 'Giorno';

  @override
  String dayNumber(int n) => 'Giorno $n';

  @override
  String get periodActive => 'Mestruazioni in corso';

  @override
  String delayDays(int n) => 'Ritardo di $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => 'Mestruazioni tra $n ${pluralDays(n)}';

  @override
  String pluralDays(int count) => count == 1 ? 'giorno' : 'giorni';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Mestruazioni',
      CyclePhase.follicular => 'Fase follicolare',
      CyclePhase.fertile => 'Finestra fertile',
      CyclePhase.ovulation => 'Ovulazione',
      CyclePhase.luteal => 'Fase luteale',
      CyclePhase.late => 'Ciclo in ritardo',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Riposati se ne hai bisogno.',
      CyclePhase.follicular => 'L’energia spesso aumenta.',
      CyclePhase.fertile => 'Maggiore probabilità di concepimento.',
      CyclePhase.ovulation => 'Giorno stimato dell’ovulazione.',
      CyclePhase.luteal => 'Rallenta e ascolta il tuo corpo.',
      CyclePhase.late =>
        'Il ciclo è più lungo del solito — registra il giorno in cui iniziano le mestruazioni.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Ottimo',
      Mood.good => 'Bene',
      Mood.okay => 'Così così',
      Mood.low => 'Triste',
      Mood.irritable => 'Irritabile',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Mal di testa',
      Symptom.tenderBreasts => 'Seno sensibile',
      Symptom.backache => 'Mal di schiena',
      Symptom.acne => 'Problemi di pelle',
      Symptom.abdominalPain => 'Dolori addominali',
      Symptom.bloating => 'Gonfiore',
      Symptom.cramps => 'Crampi',
      Symptom.fatigue => 'Stanchezza',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Scarsa',
      FlowIntensity.medium => 'Media',
      FlowIntensity.heavy => 'Abbondante',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Ancora pochi dati',
      CycleRegularity.stable => 'Ciclo stabile',
      CycleRegularity.mild => 'Piccole variazioni',
      CycleRegularity.irregular => 'Per ora irregolare',
    };
  }

  @override
  String get period => 'Mestruazioni';

  @override
  String get flow => 'Flusso';

  @override
  String get mood => 'Umore';

  @override
  String get wellbeing => 'Benessere';

  @override
  String get noteHint => 'Nota';

  @override
  String get noteHintShort => 'Nota breve se necessario';

  @override
  String get save => 'Salva';

  @override
  String get calendarTitle => 'Calendario';

  @override
  String get legendPeriod => 'Mestruazioni';

  @override
  String get legendForecast => 'Previsione';

  @override
  String get legendFertile => 'Fertile';

  @override
  String get legendOvulation => 'Ovulazione';

  @override
  String get statsTitle => 'Cicli';

  @override
  String get statsCycleLength => 'Durata del ciclo';

  @override
  String get statsPeriodDuration => 'Mestruazioni';

  @override
  String get statsRecentCycles => 'Cicli recenti';

  @override
  String get statsEmptyHistory =>
      'Registra le mestruazioni — qui comparirà lo storico.';

  @override
  String get statsCurrentCycle => 'ciclo in corso';

  @override
  String get exportDoctorPdf => 'Esporta per il medico';

  @override
  String get exportDoctorPdfLoading => 'Preparazione del PDF…';

  @override
  String get exportDoctorPdfHint =>
      'Puoi inviare il file al medico. Finché non condividi il PDF, i dati restano su questo dispositivo.';

  @override
  String get legalDocumentLoadError => 'Impossibile caricare il documento.';

  @override
  String get onboardingWelcomeTitle => 'Un calendario tranquillo, per te';

  @override
  String get onboardingWelcomeBody =>
      'Registra le mestruazioni con un tocco. Previsioni, ovulazione e benessere restano solo su questo dispositivo.';

  @override
  String get onboardingDateTitle =>
      'Quando sono iniziate le ultime mestruazioni?';

  @override
  String get pickDate => 'Scegli la data';

  @override
  String get datePickerHelp => 'Inizio delle ultime mestruazioni';

  @override
  String get onboardingNext => 'Avanti';

  @override
  String get onboardingBack => 'Indietro';

  @override
  String get onboardingStart => 'Inizia';

  @override
  String get aboutPhasesTitle => 'Come vengono calcolate le fasi';

  @override
  String get aboutPhasesBody1 =>
      'Il ciclo si costruisce dalle tue registrazioni: i giorni di mestruazioni consecutivi formano un ciclo. La durata media del ciclo e la durata delle mestruazioni si calcolano sugli ultimi 6 cicli; se lo storico è breve, si usano i valori delle impostazioni.';

  @override
  String get aboutPhasesBody2 =>
      'Ovulazione: durata del ciclo meno 14 giorni dall’inizio del ciclo. Finestra fertile: 5 giorni prima dell’ovulazione e 1 giorno dopo. Previsione delle prossime mestruazioni: inizio dell’ultimo ciclo più la durata media.';

  @override
  String get aboutPhasesBody3 =>
      'Le fasi sono un orientamento, non una diagnosi medica. L’app non sostituisce un medico e non è un metodo contraccettivo. I dati restano solo su questo dispositivo.';

  @override
  String get legalSectionTitle => 'Documenti legali';

  @override
  String get allMoiSoftApps => 'Tutte le app MoiSoft';

  @override
  String get privacyPolicyTitle => 'Informativa sulla privacy';

  @override
  String get userAgreementTitle => 'Condizioni d’uso';

  @override
  String get publicOfferTitle => 'Offerta pubblica';

  @override
  String get consentPdTitle => 'Consenso al trattamento dei dati';

  @override
  String get versionLabel => 'Versione';

  @override
  String get reminderNotificationBody =>
      'Secondo le previsioni, le mestruazioni potrebbero iniziare domani.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Esporta per il medico — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Questo documento è generato dalle registrazioni sul dispositivo. Non è un referto medico né una diagnosi.';

  @override
  String get pdfSectionCycles => 'Cicli';

  @override
  String get pdfSectionDiary => 'Diario';

  @override
  String get pdfSummaryRegularity => 'Regolarità';

  @override
  String get pdfCyclesEmpty => 'Nessun ciclo registrato finora.';

  @override
  String get pdfDiaryEmpty => 'Nessuna voce del diario per questo periodo.';

  @override
  String get pdfColStart => 'Inizio';

  @override
  String get pdfColEnd => 'Fine';

  @override
  String get pdfColPeriodDays => 'Mestruazioni';

  @override
  String get pdfColCycleLength => 'Durata del ciclo';

  @override
  String get pdfColDate => 'Data';

  @override
  String get pdfColNote => 'Nota';

  @override
  String get pdfYes => 'sì';

  @override
  String get pdfNo => 'no';

  @override
  String get pdfCurrentCycleShort => 'in corso';

  @override
  String get pdfDiaryContinuation => 'Diario (continua)';

  @override
  String pdfPageFooter(int page, int pages) => 'Pagina $page di $pages';

  @override
  String get pdfShareSubject => 'Calendario Mestruale: esporta per il medico';

  @override
  String get premiumBuyTitle => 'Acquista Premium';

  @override
  String get premiumAfterPaymentHint =>
      'Dopo il pagamento, tutte le pubblicità vengono rimosse. Conserva il numero d’ordine.';

  @override
  String get premiumPaySbp => 'Paga con SBP';

  @override
  String get premiumPayRustore => 'Paga su RuStore';

  @override
  String get premiumConsentPrefix => 'Accetto l’';

  @override
  String get premiumConsentOfferLink => 'offerta pubblica';

  @override
  String get premiumConsentAnd => ' e ';

  @override
  String get premiumConsentPdLink =>
      'il consenso al trattamento dei dati personali';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Impossibile aprire il pagamento';

  @override
  String get premiumRustoreUnavailable =>
      'I pagamenti RuStore non sono disponibili. Installa RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'Premium attivato. Pubblicità disattivata.';

  @override
  String get premiumPurchaseFailed =>
      'Acquisto non riuscito. Riprova più tardi.';

  @override
  String get premiumActiveLabel => 'Premium attivo. Pubblicità disattivata.';

  @override
  String get premiumRestoreButton => 'Ripristina acquisto';

  @override
  String get premiumRestoreTitle => 'Ripristina acquisto';

  @override
  String get premiumRestoreBody =>
      'Inserisci il numero d’ordine dello scontrino o della schermata successiva al pagamento.';

  @override
  String get premiumOrderIdLabel => 'Numero d’ordine';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Se hai perso il numero, scrivi a $email';

  @override
  String get premiumRestoreAction => 'Ripristina';

  @override
  String get premiumRestoreViaRustore => 'Ripristina via RuStore';

  @override
  String get premiumEnterOrderId => 'Inserisci il numero d’ordine';

  @override
  String get premiumRestoreSuccess =>
      'Acquisto ripristinato. Premium attivato.';

  @override
  String get premiumRestoreNotFound =>
      'Pagamento non trovato o non andato a buon fine. Controlla il numero d’ordine.';

  @override
  String get premiumRestoreCheckFailed => 'Impossibile verificare il pagamento';

  @override
  String get premiumRestoreRustoreSuccess =>
      'Acquisto RuStore ripristinato. Premium attivato.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Nessun acquisto RuStore attivo trovato.';

  @override
  String get premiumRestoreRustoreFailed =>
      'Impossibile ripristinare l’acquisto RuStore';

  @override
  String get premiumPaymentDescription => 'Premium: nessuna pubblicità';

  @override
  String get paymentOpeningBank => 'Apertura del pagamento T-Bank…';

  @override
  String get paymentOpenFormFailed =>
      'Impossibile aprire il modulo di pagamento.';

  @override
  String get paymentReturnHint =>
      'Dopo il pagamento torna nell’app. Lo stato si aggiornerà automaticamente.';

  @override
  String get paymentWaiting => 'In attesa di pagamento…';

  @override
  String paymentBankStatus(String status) => 'Stato: $status';

  @override
  String get paymentSuccess => 'Pagamento riuscito';

  @override
  String get paymentNotCompleted => 'Pagamento non completato';

  @override
  String get paymentFailedTitle => 'Pagamento non riuscito';

  @override
  String get paymentFailedBody =>
      'Riprova o usa un altro metodo di pagamento nella tua app bancaria.';

  @override
  String get paymentGotIt => 'Ho capito';

  @override
  String get paymentPremiumActivatedTitle => 'Premium attivato';

  @override
  String get paymentSaveOrderHint =>
      'Conserva il numero d’ordine — ti servirà per ripristinare l’acquisto.';

  @override
  String paymentSheetTitle(int rubles) => 'Pagamento $rubles ₽';

  @override
  String get paymentOrderCopied => 'Numero d’ordine copiato';

  @override
  String get paymentSessionNotFound => 'Sessione di pagamento non trovata';

  @override
  String get paymentCopyOrder => 'Copia';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
