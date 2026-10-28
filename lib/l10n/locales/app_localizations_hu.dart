import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Венгерская локализация (hu).
class AppLocalizationsHu extends AppLocalizations {
  @override
  String get languageCode => 'hu';

  @override
  String get appName => 'Menstruációs Naptár';

  @override
  String get appSubtitle => 'Ciklusnaptár';

  @override
  String get navToday => 'Ma';

  @override
  String get navCalendar => 'Naptár';

  @override
  String get navStats => 'Ciklusok';

  @override
  String get navSettings => 'Több';

  @override
  String get settingsTitle => 'Beállítások';

  @override
  String get cycleLengthLabel => 'Szokásos ciklushossz';

  @override
  String get periodDurationLabel => 'A menstruáció hossza';

  @override
  String get daysUnit => 'nap';

  @override
  String get reminderTitle => 'Emlékeztető';

  @override
  String get reminderSubtitle => 'Egy nappal a várható menstruáció előtt';

  @override
  String get languageTitle => 'Nyelv';

  @override
  String get aboutTitle => 'Az alkalmazásról';

  @override
  String get aboutSubtitle => 'Ciklusfázisok és jogi dokumentumok';

  @override
  String get resetData => 'Összes adat törlése';

  @override
  String get resetDialogTitle => 'Törlöd az adatokat?';

  @override
  String get resetDialogBody =>
      'A naptár, a jegyzetek és a beállítások törlődnek. A bevezető újrakezdődik.';

  @override
  String get cancel => 'Mégse';

  @override
  String get writeToDeveloper => 'Írj a fejlesztőnek';

  @override
  String get addressCopied => 'Cím kimásolva';

  @override
  String get emailFieldLabel => 'E-mail';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Törlés';

  @override
  String get loadCalendarError => 'A naptárat nem sikerült betölteni';

  @override
  String get persistError => 'Az adatokat nem sikerült menteni';

  @override
  String get pdfExportError => 'A PDF-et nem sikerült elkészíteni';

  @override
  String get retry => 'Újra';

  @override
  String get dayN => 'Nap';

  @override
  String dayNumber(int n) => '$n. nap';

  @override
  String get periodActive => 'Menstruáció folyamatban';

  @override
  String delayDays(int n) => 'Késés: $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => '$n ${pluralDays(n)} a menstruációig';

  @override
  String pluralDays(int count) => 'nap';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Menstruáció',
      CyclePhase.follicular => 'Follikuláris fázis',
      CyclePhase.fertile => 'Termékeny ablak',
      CyclePhase.ovulation => 'Ovuláció',
      CyclePhase.luteal => 'Luteális fázis',
      CyclePhase.late => 'Késés',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation =>
        'Bánj gyengéden magaddal, és pihenj, ha szükséged van rá.',
      CyclePhase.follicular => 'Általában nő az energiád.',
      CyclePhase.fertile => 'Megnövekedett a fogamzás esélye.',
      CyclePhase.ovulation => 'Becsült ovulációs nap.',
      CyclePhase.luteal => 'Lassíthatsz, és figyelhetsz magadra.',
      CyclePhase.late =>
        'A ciklus a szokásosnál hosszabb — jelöld az elejét, amikor megkezdődik.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Remek',
      Mood.good => 'Jó',
      Mood.okay => 'Közepes',
      Mood.low => 'Szomorú',
      Mood.irritable => 'Idegesség',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Fejfájás',
      Symptom.tenderBreasts => 'Érzékeny mellek',
      Symptom.backache => 'Hátfájás',
      Symptom.acne => 'Bőrproblémák',
      Symptom.abdominalPain => 'Hasfájás',
      Symptom.bloating => 'Puffadás',
      Symptom.cramps => 'Görcsök',
      Symptom.fatigue => 'Fáradtság',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Gyenge',
      FlowIntensity.medium => 'Közepes',
      FlowIntensity.heavy => 'Erős',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Még kevés adat',
      CycleRegularity.stable => 'A ciklus stabil',
      CycleRegularity.mild => 'Kis ingadozás',
      CycleRegularity.irregular => 'A ciklus még egyenetlen',
    };
  }

  @override
  String get period => 'Menstruáció';

  @override
  String get flow => 'Folyás';

  @override
  String get mood => 'Hangulat';

  @override
  String get wellbeing => 'Közérzet';

  @override
  String get noteHint => 'Jegyzet';

  @override
  String get noteHintShort => 'Röviden, ha szeretnéd';

  @override
  String get save => 'Mentés';

  @override
  String get calendarTitle => 'Naptár';

  @override
  String get legendPeriod => 'Menstruáció';

  @override
  String get legendForecast => 'Előrejelzés';

  @override
  String get legendFertile => 'Termékeny napok';

  @override
  String get legendOvulation => 'Ovuláció';

  @override
  String get statsTitle => 'Ciklusok';

  @override
  String get statsCycleLength => 'Ciklushossz';

  @override
  String get statsPeriodDuration => 'Menstruáció';

  @override
  String get statsRecentCycles => 'Legutóbbi ciklusok';

  @override
  String get statsEmptyHistory =>
      'Jelöld meg a menstruációt — itt jelenik meg az előzmény.';

  @override
  String get statsCurrentCycle => 'aktuális ciklus';

  @override
  String get exportDoctorPdf => 'Exportálás orvosnak';

  @override
  String get exportDoctorPdfLoading => 'PDF elkészítése…';

  @override
  String get exportDoctorPdfHint =>
      'A fájlt elküldheted az orvosnak. Amíg nem küldöd el a PDF-et, az adatok ezen a készüléken maradnak.';

  @override
  String get legalDocumentLoadError => 'A dokumentumot nem sikerült betölteni.';

  @override
  String get onboardingWelcomeTitle => 'Csendes naptár, csak neked';

  @override
  String get onboardingWelcomeBody =>
      'Egyetlen koppintással jelölheted a menstruációt. Az előrejelzés, az ovuláció és a közérzet csak ezen a készüléken marad.';

  @override
  String get onboardingDateTitle => 'Mikor kezdődött az utolsó menstruációd?';

  @override
  String get pickDate => 'Dátum kiválasztása';

  @override
  String get datePickerHelp => 'Az utolsó menstruáció kezdete';

  @override
  String get onboardingNext => 'Következő';

  @override
  String get onboardingBack => 'Vissza';

  @override
  String get onboardingStart => 'Kezdjük el';

  @override
  String get aboutPhasesTitle => 'Hogyan számoljuk a fázisokat';

  @override
  String get aboutPhasesBody1 =>
      'A ciklus a te megjelöléseidből épül: az egymást követő menstruációs napok egy ciklust alkotnak. Az átlagos ciklushosszat és a menstruáció hosszát az utolsó 6 ciklusból számoljuk. Ha még kevés az adat, a beállítások értékeit használjuk.';

  @override
  String get aboutPhasesBody2 =>
      'Ovuláció: a ciklus hossza mínusz 14 nap a ciklus elejétől. Termékeny ablak: 5 nap az ovuláció előtt és 1 nap utána. A következő menstruáció előrejelzése: az utolsó ciklus kezdete plusz az átlagos hossz.';

  @override
  String get aboutPhasesBody3 =>
      'A menstruáció, a follikuláris fázis, a termékeny ablak, az ovuláció, a luteális fázis és a késés tájékoztató jellegű, nem orvosi diagnózis. Az alkalmazás nem helyettesíti az orvosi konzultációt, és nem fogamzásgátló eszköz. Az adatok csak ezen a készüléken maradnak.';

  @override
  String get legalSectionTitle => 'Jogi dokumentumok';

  @override
  String get allMoiSoftApps => 'Összes MoiSoft-alkalmazás';

  @override
  String get privacyPolicyTitle => 'Adatvédelmi nyilatkozat';

  @override
  String get userAgreementTitle => 'Felhasználási feltételek';

  @override
  String get publicOfferTitle => 'Nyilvános ajánlat';

  @override
  String get consentPdTitle => 'Hozzájárulás az adatkezeléshez';

  @override
  String get versionLabel => 'Verzió';

  @override
  String get reminderNotificationBody =>
      'Az előrejelzés szerint holnap megkezdődhet a menstruáció.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Exportálás orvosnak — $dateKey';

  @override
  String get pdfDisclaimer =>
      'A dokumentum a felhasználó készüléken tárolt megjelöléseiből készült. Nem orvosi lelet és nem diagnózis.';

  @override
  String get pdfSectionCycles => 'Ciklusok';

  @override
  String get pdfSectionDiary => 'Napló';

  @override
  String get pdfSummaryRegularity => 'Rendszeresség';

  @override
  String get pdfCyclesEmpty => 'Még nincsenek megjelölt ciklusok.';

  @override
  String get pdfDiaryEmpty => 'Nincs naplóbejegyzés erre az időszakra.';

  @override
  String get pdfColStart => 'Kezdete';

  @override
  String get pdfColEnd => 'Vége';

  @override
  String get pdfColPeriodDays => 'Menstruáció';

  @override
  String get pdfColCycleLength => 'Ciklushossz';

  @override
  String get pdfColDate => 'Dátum';

  @override
  String get pdfColNote => 'Jegyzet';

  @override
  String get pdfYes => 'igen';

  @override
  String get pdfNo => 'nem';

  @override
  String get pdfCurrentCycleShort => 'aktuális';

  @override
  String get pdfDiaryContinuation => 'Napló (folytatás)';

  @override
  String pdfPageFooter(int page, int pages) => 'Oldal: $page / $pages';

  @override
  String get pdfShareSubject => 'Menstruációs Naptár: exportálás orvosnak';

  @override
  String get premiumBuyTitle => 'Prémium vásárlása';

  @override
  String get premiumAfterPaymentHint =>
      'Fizetés után minden hirdetés kikapcsol. Mentsd el a rendelés számát.';

  @override
  String get premiumPaySbp => 'Fizetés SBP-vel';

  @override
  String get premiumPayRustore => 'Fizetés a RuStore-ban';

  @override
  String get premiumConsentPrefix => 'Elfogadom ';

  @override
  String get premiumConsentOfferLink => 'a nyilvános ajánlatot';

  @override
  String get premiumConsentAnd => ' és ';

  @override
  String get premiumConsentPdLink => 'az adatkezelési hozzájárulást';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'A fizetést nem sikerült megnyitni';

  @override
  String get premiumRustoreUnavailable =>
      'A RuStore-fizetések nem érhetők el. Telepítsd a RuStore-t.';

  @override
  String get premiumActivatedAdsOff =>
      'A prémium aktiválva. A hirdetések kikapcsolva.';

  @override
  String get premiumPurchaseFailed =>
      'A vásárlás nem sikerült. Próbáld újra később.';

  @override
  String get premiumActiveLabel => 'A prémium aktív. A hirdetések kikapcsolva.';

  @override
  String get premiumRestoreButton => 'Vásárlás visszaállítása';

  @override
  String get premiumRestoreTitle => 'Vásárlás visszaállítása';

  @override
  String get premiumRestoreBody =>
      'Add meg a rendelés számát a bizonylatról vagy a fizetés utáni képernyőről.';

  @override
  String get premiumOrderIdLabel => 'Rendelés száma';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Ha elvesztetted a számot — írj ide: $email';

  @override
  String get premiumRestoreAction => 'Visszaállítás';

  @override
  String get premiumRestoreViaRustore => 'Visszaállítás RuStore-ból';

  @override
  String get premiumEnterOrderId => 'Add meg a rendelés számát';

  @override
  String get premiumRestoreSuccess =>
      'A vásárlás visszaállítva. A prémium aktiválva.';

  @override
  String get premiumRestoreNotFound =>
      'A fizetés nem található vagy nem volt sikeres. Ellenőrizd a rendelés számát.';

  @override
  String get premiumRestoreCheckFailed => 'A fizetést nem sikerült ellenőrizni';

  @override
  String get premiumRestoreRustoreSuccess =>
      'A RuStore-vásárlás visszaállítva. A prémium aktiválva.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Nem található aktív RuStore-vásárlás.';

  @override
  String get premiumRestoreRustoreFailed =>
      'A RuStore-vásárlást nem sikerült visszaállítani';

  @override
  String get premiumPaymentDescription => 'Prémium: hirdetések nélkül';

  @override
  String get paymentOpeningBank => 'T-Bank fizetési oldal megnyitása…';

  @override
  String get paymentOpenFormFailed =>
      'A fizetési űrlapot nem sikerült megnyitni.';

  @override
  String get paymentReturnHint =>
      'Fizetés után térj vissza az alkalmazásba. Az állapot magától frissül.';

  @override
  String get paymentWaiting => 'Várakozás a fizetésre…';

  @override
  String paymentBankStatus(String status) => 'Állapot: $status';

  @override
  String get paymentSuccess => 'A fizetés sikeres volt';

  @override
  String get paymentNotCompleted => 'A fizetés nem fejeződött be';

  @override
  String get paymentFailedTitle => 'A fizetés nem sikerült';

  @override
  String get paymentFailedBody =>
      'Próbáld újra, vagy használj más fizetési módot a bankodban.';

  @override
  String get paymentGotIt => 'Rendben';

  @override
  String get paymentPremiumActivatedTitle => 'Prémium aktiválva';

  @override
  String get paymentSaveOrderHint =>
      'Mentsd el a rendelés számát — a vásárlás visszaállításához kell.';

  @override
  String paymentSheetTitle(int rubles) => 'Fizetés: $rubles ₽';

  @override
  String get paymentOrderCopied => 'Rendelésszám kimásolva';

  @override
  String get paymentSessionNotFound => 'A fizetési munkamenet nem található';

  @override
  String get paymentCopyOrder => 'Másolás';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}.${start.month}.${start.year} — ${end.day}.${end.month}.${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
