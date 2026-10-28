import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Чешская локализация (cs).
class AppLocalizationsCs extends AppLocalizations {
  @override
  String get languageCode => 'cs';

  @override
  String get appName => 'Kalendář Menstruace';

  @override
  String get appSubtitle => 'Kalendář cyklu';

  @override
  String get navToday => 'Dnes';

  @override
  String get navCalendar => 'Kalendář';

  @override
  String get navStats => 'Cykly';

  @override
  String get navSettings => 'Více';

  @override
  String get settingsTitle => 'Nastavení';

  @override
  String get cycleLengthLabel => 'Typická délka cyklu';

  @override
  String get periodDurationLabel => 'Délka menstruace';

  @override
  String get daysUnit => 'dní';

  @override
  String get reminderTitle => 'Připomínka';

  @override
  String get reminderSubtitle => 'Den před předpokládanou menstruací';

  @override
  String get languageTitle => 'Jazyk';

  @override
  String get aboutTitle => 'O aplikaci';

  @override
  String get aboutSubtitle => 'Fáze cyklu a právní dokumenty';

  @override
  String get resetData => 'Smazat všechna data';

  @override
  String get resetDialogTitle => 'Smazat data?';

  @override
  String get resetDialogBody =>
      'Kalendář, poznámky a nastavení budou smazány. Onboarding začne znovu.';

  @override
  String get cancel => 'Zrušit';

  @override
  String get writeToDeveloper => 'Napsat vývojáři';

  @override
  String get addressCopied => 'Adresa zkopírována';

  @override
  String get emailFieldLabel => 'E-mail';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Smazat';

  @override
  String get loadCalendarError => 'Kalendář se nepodařilo načíst';

  @override
  String get persistError => 'Data se nepodařilo uložit';

  @override
  String get pdfExportError => 'PDF se nepodařilo připravit';

  @override
  String get retry => 'Zkusit znovu';

  @override
  String get dayN => 'Den';

  @override
  String dayNumber(int n) => 'Den $n';

  @override
  String get periodActive => 'Probíhá menstruace';

  @override
  String delayDays(int n) => 'Zpoždění o $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => 'Do menstruace zbývá $n ${pluralDays(n)}';

  @override
  String pluralDays(int count) {
    final int absCount = count.abs();
    final int n = absCount % 100;
    final int n1 = n % 10;
    if (n == 1) {
      return 'den';
    }
    if (n1 >= 2 && n1 <= 4 && (n < 12 || n > 14)) {
      return 'dny';
    }
    return 'dní';
  }

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Menstruace',
      CyclePhase.follicular => 'Folikulární fáze',
      CyclePhase.fertile => 'Plodné okno',
      CyclePhase.ovulation => 'Ovulace',
      CyclePhase.luteal => 'Luteální fáze',
      CyclePhase.late => 'Zpoždění',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Pečuj o sebe a odpočívej, když potřebuješ.',
      CyclePhase.follicular => 'Energie obvykle přibývá.',
      CyclePhase.fertile => 'Vyšší pravděpodobnost početí.',
      CyclePhase.ovulation => 'Předpokládaný den ovulace.',
      CyclePhase.luteal => 'Můžeš zpomalit a naslouchat svému tělu.',
      CyclePhase.late =>
        'Cyklus je delší než obvykle — zaznač začátek, až se objeví.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Skvěle',
      Mood.good => 'Dobře',
      Mood.okay => 'Normálně',
      Mood.low => 'Smutno',
      Mood.irritable => 'Podráždění',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Bolí hlava',
      Symptom.tenderBreasts => 'Bolí prsa',
      Symptom.backache => 'Bolí záda',
      Symptom.acne => 'Problémy s kůží',
      Symptom.abdominalPain => 'Bolí břicho',
      Symptom.bloating => 'Nadýmání',
      Symptom.cramps => 'Křeče',
      Symptom.fatigue => 'Únava',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Slabá',
      FlowIntensity.medium => 'Běžná',
      FlowIntensity.heavy => 'Silná',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Zatím málo dat',
      CycleRegularity.stable => 'Cyklus je stabilní',
      CycleRegularity.mild => 'Malé výkyvy',
      CycleRegularity.irregular => 'Cyklus zatím kolísá',
    };
  }

  @override
  String get period => 'Menstruace';

  @override
  String get flow => 'Výtok';

  @override
  String get mood => 'Nálada';

  @override
  String get wellbeing => 'Pocit';

  @override
  String get noteHint => 'Poznámka';

  @override
  String get noteHintShort => 'Stručně, pokud chceš';

  @override
  String get save => 'Uložit';

  @override
  String get calendarTitle => 'Kalendář';

  @override
  String get legendPeriod => 'Menstruace';

  @override
  String get legendForecast => 'Předpověď';

  @override
  String get legendFertile => 'Plodné dny';

  @override
  String get legendOvulation => 'Ovulace';

  @override
  String get statsTitle => 'Cykly';

  @override
  String get statsCycleLength => 'Délka cyklu';

  @override
  String get statsPeriodDuration => 'Menstruace';

  @override
  String get statsRecentCycles => 'Poslední cykly';

  @override
  String get statsEmptyHistory => 'Označ menstruaci — tady se objeví historie.';

  @override
  String get statsCurrentCycle => 'aktuální cyklus';

  @override
  String get exportDoctorPdf => 'Export pro lékaře';

  @override
  String get exportDoctorPdfLoading => 'Připravujeme PDF…';

  @override
  String get exportDoctorPdfHint =>
      'Soubor můžeš poslat lékaři. Dokud PDF neodešleš, data zůstávají na tomto zařízení.';

  @override
  String get legalDocumentLoadError => 'Dokument se nepodařilo načíst.';

  @override
  String get onboardingWelcomeTitle => 'Tichý kalendář jen pro tebe';

  @override
  String get onboardingWelcomeBody =>
      'Označuj menstruaci jedním klepnutím. Předpověď, ovulace i pocit zůstávají jen na tomto zařízení.';

  @override
  String get onboardingDateTitle => 'Kdy začala poslední menstruace?';

  @override
  String get pickDate => 'Vybrat datum';

  @override
  String get datePickerHelp => 'Začátek poslední menstruace';

  @override
  String get onboardingNext => 'Dál';

  @override
  String get onboardingBack => 'Zpět';

  @override
  String get onboardingStart => 'Začít';

  @override
  String get aboutPhasesTitle => 'Jak se počítají fáze';

  @override
  String get aboutPhasesBody1 =>
      'Cyklus se skládá z tvých zápisů: po sobě jdoucí dny menstruace tvoří jeden cyklus. Průměrná délka cyklu a délka menstruace se počítají z posledních 6 cyklů. Pokud je historie ještě krátká, použijí se hodnoty z nastavení.';

  @override
  String get aboutPhasesBody2 =>
      'Ovulace: délka cyklu minus 14 dní od začátku cyklu. Plodné okno: 5 dní před ovulací a 1 den po ní. Předpověď další menstruace: začátek posledního cyklu plus průměrná délka.';

  @override
  String get aboutPhasesBody3 =>
      'Menstruace, folikulární fáze, plodné okno, ovulace, luteální fáze a zpoždění jsou vodítko, nikoli lékařská diagnóza. Aplikace nenahrazuje lékaře ani antikoncepci. Data zůstávají jen na tomto zařízení.';

  @override
  String get legalSectionTitle => 'Právní dokumenty';

  @override
  String get allMoiSoftApps => 'Všechny aplikace MoiSoft';

  @override
  String get privacyPolicyTitle => 'Zásady ochrany osobních údajů';

  @override
  String get userAgreementTitle => 'Uživatelská smlouva';

  @override
  String get publicOfferTitle => 'Veřejná nabídka';

  @override
  String get consentPdTitle => 'Souhlas se zpracováním osobních údajů';

  @override
  String get versionLabel => 'Verze';

  @override
  String get reminderNotificationBody =>
      'Zítra podle předpovědi může začít menstruace.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Export pro lékaře — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Dokument je sestaven ze zápisů uživatelky v zařízení. Nejde o lékařskou zprávu ani diagnózu.';

  @override
  String get pdfSectionCycles => 'Cykly';

  @override
  String get pdfSectionDiary => 'Deník';

  @override
  String get pdfSummaryRegularity => 'Pravidelnost';

  @override
  String get pdfCyclesEmpty => 'Cykly zatím nejsou označeny.';

  @override
  String get pdfDiaryEmpty => 'V deníku nejsou žádné zápisy za toto období.';

  @override
  String get pdfColStart => 'Začátek';

  @override
  String get pdfColEnd => 'Konec';

  @override
  String get pdfColPeriodDays => 'Menstruace';

  @override
  String get pdfColCycleLength => 'Délka cyklu';

  @override
  String get pdfColDate => 'Datum';

  @override
  String get pdfColNote => 'Poznámka';

  @override
  String get pdfYes => 'ano';

  @override
  String get pdfNo => 'ne';

  @override
  String get pdfCurrentCycleShort => 'aktuální';

  @override
  String get pdfDiaryContinuation => 'Deník (pokračování)';

  @override
  String pdfPageFooter(int page, int pages) => 'Str. $page z $pages';

  @override
  String get pdfShareSubject => 'Kalendář Menstruace: export pro lékaře';

  @override
  String get premiumBuyTitle => 'Koupit premium';

  @override
  String get premiumAfterPaymentHint =>
      'Po zaplacení se vypnou všechny reklamy. Ulož si číslo objednávky.';

  @override
  String get premiumPaySbp => 'Zaplatit přes SBP';

  @override
  String get premiumPayRustore => 'Zaplatit v RuStore';

  @override
  String get premiumConsentPrefix => 'Souhlasím s ';

  @override
  String get premiumConsentOfferLink => 'veřejnou nabídkou';

  @override
  String get premiumConsentAnd => ' a ';

  @override
  String get premiumConsentPdLink => 'souhlasem se zpracováním osobních údajů';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Platbu se nepodařilo otevřít';

  @override
  String get premiumRustoreUnavailable =>
      'Platby RuStore nejsou dostupné. Nainstaluj RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'Premium aktivováno. Reklamy jsou vypnuté.';

  @override
  String get premiumPurchaseFailed => 'Nákup se nepovedl. Zkuste to později.';

  @override
  String get premiumActiveLabel => 'Premium je aktivní. Reklamy jsou vypnuté.';

  @override
  String get premiumRestoreButton => 'Obnovit nákup';

  @override
  String get premiumRestoreTitle => 'Obnovit nákup';

  @override
  String get premiumRestoreBody =>
      'Zadejte číslo objednávky z účtenky nebo z obrazovky po platbě.';

  @override
  String get premiumOrderIdLabel => 'Číslo objednávky';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Pokud číslo ztratíte — napište na $email';

  @override
  String get premiumRestoreAction => 'Obnovit';

  @override
  String get premiumRestoreViaRustore => 'Obnovit přes RuStore';

  @override
  String get premiumEnterOrderId => 'Zadejte číslo objednávky';

  @override
  String get premiumRestoreSuccess => 'Nákup obnoven. Premium aktivováno.';

  @override
  String get premiumRestoreNotFound =>
      'Platba nebyla nalezena nebo nebyla úspěšná. Zkontrolujte číslo objednávky.';

  @override
  String get premiumRestoreCheckFailed => 'Platbu se nepodařilo ověřit';

  @override
  String get premiumRestoreRustoreSuccess =>
      'Nákup RuStore obnoven. Premium aktivováno.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Aktivní nákup RuStore nebyl nalezen.';

  @override
  String get premiumRestoreRustoreFailed =>
      'Nákup RuStore se nepodařilo obnovit';

  @override
  String get premiumPaymentDescription => 'Premium: bez reklam';

  @override
  String get paymentOpeningBank => 'Otevíráme platební stránku T-Bank…';

  @override
  String get paymentOpenFormFailed =>
      'Platební formulář se nepodařilo otevřít.';

  @override
  String get paymentReturnHint =>
      'Po zaplacení se vraťte do aplikace. Stav se aktualizuje sám.';

  @override
  String get paymentWaiting => 'Čekáme na platbu…';

  @override
  String paymentBankStatus(String status) => 'Stav: $status';

  @override
  String get paymentSuccess => 'Platba proběhla úspěšně';

  @override
  String get paymentNotCompleted => 'Platba nebyla dokončena';

  @override
  String get paymentFailedTitle => 'Platba se nezdařila';

  @override
  String get paymentFailedBody =>
      'Zkuste to znovu nebo použijte jinou platební metodu ve své bance.';

  @override
  String get paymentGotIt => 'Rozumím';

  @override
  String get paymentPremiumActivatedTitle => 'Premium aktivováno';

  @override
  String get paymentSaveOrderHint =>
      'Uložte číslo objednávky — hodí se k obnovení nákupu.';

  @override
  String paymentSheetTitle(int rubles) => 'Platba $rubles ₽';

  @override
  String get paymentOrderCopied => 'Číslo objednávky zkopírováno';

  @override
  String get paymentSessionNotFound => 'Platební relace nebyla nalezena';

  @override
  String get paymentCopyOrder => 'Kopírovat';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}.${start.month}.${start.year} — ${end.day}.${end.month}.${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
