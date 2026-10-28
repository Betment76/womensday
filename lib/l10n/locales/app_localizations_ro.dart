import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Румынская локализация (ro).
class AppLocalizationsRo extends AppLocalizations {
  @override
  String get languageCode => 'ro';

  @override
  String get appName => 'Calendar Menstrual';

  @override
  String get appSubtitle => 'Calendarul ciclului';

  @override
  String get navToday => 'Azi';

  @override
  String get navCalendar => 'Calendar';

  @override
  String get navStats => 'Cicluri';

  @override
  String get navSettings => 'Mai mult';

  @override
  String get settingsTitle => 'Setări';

  @override
  String get cycleLengthLabel => 'Durata obișnuită a ciclului';

  @override
  String get periodDurationLabel => 'Durata menstruației';

  @override
  String get daysUnit => 'zile';

  @override
  String get reminderTitle => 'Memento';

  @override
  String get reminderSubtitle =>
      'Cu o zi înainte de data prevăzută a menstruației';

  @override
  String get languageTitle => 'Limbă';

  @override
  String get aboutTitle => 'Despre aplicație';

  @override
  String get aboutSubtitle => 'Fazele ciclului și documentele legale';

  @override
  String get resetData => 'Șterge toate datele';

  @override
  String get resetDialogTitle => 'Ștergi datele?';

  @override
  String get resetDialogBody =>
      'Calendarul, notele și setările vor fi șterse. Introducerea va începe din nou.';

  @override
  String get cancel => 'Anulează';

  @override
  String get writeToDeveloper => 'Scrie dezvoltatorului';

  @override
  String get addressCopied => 'Adresă copiată';

  @override
  String get emailFieldLabel => 'E-mail';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Șterge';

  @override
  String get loadCalendarError => 'Calendarul nu a putut fi încărcat';

  @override
  String get persistError => 'Datele nu au putut fi salvate';

  @override
  String get pdfExportError => 'PDF-ul nu a putut fi pregătit';

  @override
  String get retry => 'Reîncearcă';

  @override
  String get dayN => 'Ziua';

  @override
  String dayNumber(int n) => 'Ziua $n';

  @override
  String get periodActive => 'Menstruația este în curs';

  @override
  String delayDays(int n) => 'Întârziere de $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => '$n ${pluralDays(n)} până la menstruație';

  @override
  String pluralDays(int count) {
    final int absCount = count.abs();
    if (absCount == 1) {
      return 'zi';
    }
    return 'zile';
  }

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Menstruație',
      CyclePhase.follicular => 'Faza foliculară',
      CyclePhase.fertile => 'Fereastra fertilă',
      CyclePhase.ovulation => 'Ovulație',
      CyclePhase.luteal => 'Faza luteală',
      CyclePhase.late => 'Întârziere',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation =>
        'Ai grijă de tine și odihnește-te dacă e nevoie.',
      CyclePhase.follicular => 'Energia crește de obicei.',
      CyclePhase.fertile => 'Probabilitate mai mare de concepție.',
      CyclePhase.ovulation => 'Ziua estimată a ovulației.',
      CyclePhase.luteal => 'Poți încetini și să te asculți.',
      CyclePhase.late =>
        'Ciclul este mai lung decât de obicei — notează începutul când va începe.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Excelent',
      Mood.good => 'Bine',
      Mood.okay => 'Acceptabil',
      Mood.low => 'Tristețe',
      Mood.irritable => 'Iritabilitate',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Durere de cap',
      Symptom.tenderBreasts => 'Sâni sensibili',
      Symptom.backache => 'Durere de spate',
      Symptom.acne => 'Probleme cu pielea',
      Symptom.abdominalPain => 'Durere de burtă',
      Symptom.bloating => 'Balonare',
      Symptom.cramps => 'Crampe',
      Symptom.fatigue => 'Oboseală',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Slabă',
      FlowIntensity.medium => 'Moderată',
      FlowIntensity.heavy => 'Abundentă',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Încă prea puține date',
      CycleRegularity.stable => 'Ciclul este stabil',
      CycleRegularity.mild => 'Variații mici',
      CycleRegularity.irregular => 'Ciclul este încă neregulat',
    };
  }

  @override
  String get period => 'Menstruație';

  @override
  String get flow => 'Scurgeri';

  @override
  String get mood => 'Dispoziție';

  @override
  String get wellbeing => 'Stare generală';

  @override
  String get noteHint => 'Notă';

  @override
  String get noteHintShort => 'Scurt, dacă e nevoie';

  @override
  String get save => 'Salvează';

  @override
  String get calendarTitle => 'Calendar';

  @override
  String get legendPeriod => 'Menstruație';

  @override
  String get legendForecast => 'Prognoză';

  @override
  String get legendFertile => 'Zile fertile';

  @override
  String get legendOvulation => 'Ovulație';

  @override
  String get statsTitle => 'Cicluri';

  @override
  String get statsCycleLength => 'Durata ciclului';

  @override
  String get statsPeriodDuration => 'Menstruație';

  @override
  String get statsRecentCycles => 'Cicluri recente';

  @override
  String get statsEmptyHistory =>
      'Marchează menstruația — istoricul va apărea aici.';

  @override
  String get statsCurrentCycle => 'ciclul curent';

  @override
  String get exportDoctorPdf => 'Export pentru medic';

  @override
  String get exportDoctorPdfLoading => 'Pregătim PDF-ul…';

  @override
  String get exportDoctorPdfHint =>
      'Poți trimite fișierul medicului. Până când trimiți PDF-ul, datele rămân pe acest dispozitiv.';

  @override
  String get legalDocumentLoadError => 'Documentul nu a putut fi încărcat.';

  @override
  String get onboardingWelcomeTitle => 'Un calendar liniștit pentru tine';

  @override
  String get onboardingWelcomeBody =>
      'Marchează menstruația cu o singură atingere. Prognoza, ovulația și starea de bine rămân doar pe acest dispozitiv.';

  @override
  String get onboardingDateTitle => 'Când a început ultima menstruație?';

  @override
  String get pickDate => 'Alege data';

  @override
  String get datePickerHelp => 'Începutul ultimei menstruații';

  @override
  String get onboardingNext => 'Înainte';

  @override
  String get onboardingBack => 'Înapoi';

  @override
  String get onboardingStart => 'Începe';

  @override
  String get aboutPhasesTitle => 'Cum se calculează fazele';

  @override
  String get aboutPhasesBody1 =>
      'Ciclul se construiește din înregistrările tale: zilele consecutive de menstruație formează un ciclu. Durata medie a ciclului și durata menstruației se calculează pe ultimele 6 cicluri. Dacă istoricul este încă scurt, se folosesc valorile din setări.';

  @override
  String get aboutPhasesBody2 =>
      'Ovulația: durata ciclului minus 14 zile de la începutul ciclului. Fereastra fertilă: 5 zile înainte de ovulație și 1 zi după. Prognoza următoarei menstruații: începutul ultimului ciclu plus durata medie.';

  @override
  String get aboutPhasesBody3 =>
      'Menstruația, faza foliculară, fereastra fertilă, ovulația, faza luteală și întârzierea sunt un reper, nu un diagnostic medical. Aplicația nu înlocuiește consultul medicului și nu este un mijloc de contracepție. Datele rămân doar pe acest dispozitiv.';

  @override
  String get legalSectionTitle => 'Documente legale';

  @override
  String get allMoiSoftApps => 'Toate aplicațiile MoiSoft';

  @override
  String get privacyPolicyTitle => 'Politica de confidențialitate';

  @override
  String get userAgreementTitle => 'Acordul utilizatorului';

  @override
  String get publicOfferTitle => 'Oferta publică';

  @override
  String get consentPdTitle =>
      'Consimțământ pentru prelucrarea datelor personale';

  @override
  String get versionLabel => 'Versiune';

  @override
  String get reminderNotificationBody =>
      'Mâine, conform prognozei, poate începe menstruația.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Export pentru medic — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Documentul este creat din înregistrările utilizatoarei de pe dispozitiv. Nu este un raport sau un diagnostic medical.';

  @override
  String get pdfSectionCycles => 'Cicluri';

  @override
  String get pdfSectionDiary => 'Jurnal';

  @override
  String get pdfSummaryRegularity => 'Regularitate';

  @override
  String get pdfCyclesEmpty => 'Nu sunt cicluri marcate încă.';

  @override
  String get pdfDiaryEmpty =>
      'Nu există înregistrări în jurnal pentru această perioadă.';

  @override
  String get pdfColStart => 'Început';

  @override
  String get pdfColEnd => 'Sfârșit';

  @override
  String get pdfColPeriodDays => 'Menstruație';

  @override
  String get pdfColCycleLength => 'Durata ciclului';

  @override
  String get pdfColDate => 'Data';

  @override
  String get pdfColNote => 'Notă';

  @override
  String get pdfYes => 'da';

  @override
  String get pdfNo => 'nu';

  @override
  String get pdfCurrentCycleShort => 'curent';

  @override
  String get pdfDiaryContinuation => 'Jurnal (continuare)';

  @override
  String pdfPageFooter(int page, int pages) => 'Pag. $page din $pages';

  @override
  String get pdfShareSubject => 'Calendar Menstrual: export pentru medic';

  @override
  String get premiumBuyTitle => 'Cumpără premium';

  @override
  String get premiumAfterPaymentHint =>
      'După plată se dezactivează toate reclamele. Salvează numărul comenzii.';

  @override
  String get premiumPaySbp => 'Plătește prin SBP';

  @override
  String get premiumPayRustore => 'Plătește în RuStore';

  @override
  String get premiumConsentPrefix => 'Sunt de acord cu ';

  @override
  String get premiumConsentOfferLink => 'oferta publică';

  @override
  String get premiumConsentAnd => ' și cu ';

  @override
  String get premiumConsentPdLink => 'consimțământul pentru datele personale';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Plata nu a putut fi deschisă';

  @override
  String get premiumRustoreUnavailable =>
      'Plățile RuStore nu sunt disponibile. Instalează RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'Premium activat. Reclamele sunt dezactivate.';

  @override
  String get premiumPurchaseFailed =>
      'Achiziția a eșuat. Încearcă din nou mai târziu.';

  @override
  String get premiumActiveLabel =>
      'Premium este activ. Reclamele sunt dezactivate.';

  @override
  String get premiumRestoreButton => 'Restabilește achiziția';

  @override
  String get premiumRestoreTitle => 'Restabilește achiziția';

  @override
  String get premiumRestoreBody =>
      'Introdu numărul comenzii din chitanță sau de pe ecranul de după plată.';

  @override
  String get premiumOrderIdLabel => 'Numărul comenzii';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Dacă ai pierdut numărul — scrie la $email';

  @override
  String get premiumRestoreAction => 'Restabilește';

  @override
  String get premiumRestoreViaRustore => 'Restabilește prin RuStore';

  @override
  String get premiumEnterOrderId => 'Introdu numărul comenzii';

  @override
  String get premiumRestoreSuccess =>
      'Achiziția a fost restabilită. Premium activat.';

  @override
  String get premiumRestoreNotFound =>
      'Plata nu a fost găsită sau nu a reușit. Verifică numărul comenzii.';

  @override
  String get premiumRestoreCheckFailed => 'Plata nu a putut fi verificată';

  @override
  String get premiumRestoreRustoreSuccess =>
      'Achiziția RuStore a fost restabilită. Premium activat.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Nu a fost găsită nicio achiziție RuStore activă.';

  @override
  String get premiumRestoreRustoreFailed =>
      'Achiziția RuStore nu a putut fi restabilită';

  @override
  String get premiumPaymentDescription => 'Premium: fără reclame';

  @override
  String get paymentOpeningBank => 'Deschidem pagina de plată T-Bank…';

  @override
  String get paymentOpenFormFailed =>
      'Formularul de plată nu a putut fi deschis.';

  @override
  String get paymentReturnHint =>
      'După plată, revino în aplicație. Starea se va actualiza automat.';

  @override
  String get paymentWaiting => 'Se așteaptă plata…';

  @override
  String paymentBankStatus(String status) => 'Stare: $status';

  @override
  String get paymentSuccess => 'Plata a reușit';

  @override
  String get paymentNotCompleted => 'Plata nu a fost finalizată';

  @override
  String get paymentFailedTitle => 'Plata nu a reușit';

  @override
  String get paymentFailedBody =>
      'Încearcă din nou sau folosește altă metodă de plată din aplicația băncii tale.';

  @override
  String get paymentGotIt => 'Am înțeles';

  @override
  String get paymentPremiumActivatedTitle => 'Premium activat';

  @override
  String get paymentSaveOrderHint =>
      'Salvează numărul comenzii — îți trebuie pentru a restabili achiziția.';

  @override
  String paymentSheetTitle(int rubles) => 'Plată $rubles ₽';

  @override
  String get paymentOrderCopied => 'Numărul comenzii a fost copiat';

  @override
  String get paymentSessionNotFound => 'Sesiunea de plată nu a fost găsită';

  @override
  String get paymentCopyOrder => 'Copiază';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
