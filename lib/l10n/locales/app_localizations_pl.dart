import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Польская локализация (pl).
class AppLocalizationsPl extends AppLocalizations {
  @override
  String get languageCode => 'pl';

  @override
  String get appName => 'Kalendarz Miesiączki';

  @override
  String get appSubtitle => 'Kalendarz cyklu';

  @override
  String get navToday => 'Dziś';

  @override
  String get navCalendar => 'Kalendarz';

  @override
  String get navStats => 'Cykle';

  @override
  String get navSettings => 'Więcej';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get cycleLengthLabel => 'Typowa długość cyklu';

  @override
  String get periodDurationLabel => 'Czas trwania miesiączki';

  @override
  String get daysUnit => 'dni';

  @override
  String get reminderTitle => 'Przypomnienie';

  @override
  String get reminderSubtitle => 'Dzień przed przewidywaną miesiączką';

  @override
  String get languageTitle => 'Język';

  @override
  String get aboutTitle => 'O aplikacji';

  @override
  String get aboutSubtitle => 'Fazy cyklu i dokumenty prawne';

  @override
  String get resetData => 'Usuń wszystkie dane';

  @override
  String get resetDialogTitle => 'Usunąć dane?';

  @override
  String get resetDialogBody =>
      'Kalendarz, notatki i ustawienia zostaną usunięte. Onboarding zacznie się od nowa.';

  @override
  String get cancel => 'Anuluj';

  @override
  String get writeToDeveloper => 'Napisz do dewelopera';

  @override
  String get addressCopied => 'Adres skopiowany';

  @override
  String get emailFieldLabel => 'E-mail';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Usuń';

  @override
  String get loadCalendarError => 'Nie udało się wczytać kalendarza';

  @override
  String get persistError => 'Nie udało się zapisać danych';

  @override
  String get pdfExportError => 'Nie udało się przygotować PDF';

  @override
  String get retry => 'Ponów';

  @override
  String get dayN => 'Dzień';

  @override
  String dayNumber(int n) => 'Dzień $n';

  @override
  String get periodActive => 'Trwa miesiączka';

  @override
  String delayDays(int n) => 'Opóźnienie: $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => 'Miesiączka za $n ${pluralDays(n)}';

  @override
  String pluralDays(int count) {
    final int absCount = count.abs();
    if (absCount == 1) {
      return 'dzień';
    }
    return 'dni';
  }

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Miesiączka',
      CyclePhase.follicular => 'Faza folikularna',
      CyclePhase.fertile => 'Okno płodne',
      CyclePhase.ovulation => 'Owulacja',
      CyclePhase.luteal => 'Faza lutealna',
      CyclePhase.late => 'Opóźnienie',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation =>
        'Zadbaj o siebie i odpoczywaj, gdy potrzebujesz.',
      CyclePhase.follicular => 'Energii zwykle przybywa.',
      CyclePhase.fertile => 'Wyższe prawdopodobieństwo poczęcia.',
      CyclePhase.ovulation => 'Szacowany dzień owulacji.',
      CyclePhase.luteal => 'Możesz zwolnić i posłuchać siebie.',
      CyclePhase.late =>
        'Cykl jest dłuższy niż zwykle — zaznacz początek, gdy się zacznie.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Świetnie',
      Mood.good => 'Dobrze',
      Mood.okay => 'Przeciętnie',
      Mood.low => 'Smutno',
      Mood.irritable => 'Rozdrażnienie',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Boli głowa',
      Symptom.tenderBreasts => 'Boli pierś',
      Symptom.backache => 'Bolą plecy',
      Symptom.acne => 'Problemy ze skórą',
      Symptom.abdominalPain => 'Boli brzuch',
      Symptom.bloating => 'Wzdęcia',
      Symptom.cramps => 'Skurcze',
      Symptom.fatigue => 'Zmęczenie',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Słabe',
      FlowIntensity.medium => 'Umiarkowane',
      FlowIntensity.heavy => 'Obfite',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Na razie za mało danych',
      CycleRegularity.stable => 'Cykl jest stabilny',
      CycleRegularity.mild => 'Drobne wahania',
      CycleRegularity.irregular => 'Cykl jest jeszcze nieregularny',
    };
  }

  @override
  String get period => 'Miesiączka';

  @override
  String get flow => 'Wydzieliny';

  @override
  String get mood => 'Nastrój';

  @override
  String get wellbeing => 'Samopoczucie';

  @override
  String get noteHint => 'Notatka';

  @override
  String get noteHintShort => 'Krótko, jeśli chcesz';

  @override
  String get save => 'Zapisz';

  @override
  String get calendarTitle => 'Kalendarz';

  @override
  String get legendPeriod => 'Miesiączka';

  @override
  String get legendForecast => 'Prognoza';

  @override
  String get legendFertile => 'Dni płodne';

  @override
  String get legendOvulation => 'Owulacja';

  @override
  String get statsTitle => 'Cykle';

  @override
  String get statsCycleLength => 'Długość cyklu';

  @override
  String get statsPeriodDuration => 'Miesiączka';

  @override
  String get statsRecentCycles => 'Ostatnie cykle';

  @override
  String get statsEmptyHistory =>
      'Zaznacz miesiączkę — tutaj pojawi się historia.';

  @override
  String get statsCurrentCycle => 'aktualny cykl';

  @override
  String get exportDoctorPdf => 'Eksport dla lekarza';

  @override
  String get exportDoctorPdfLoading => 'Przygotowujemy PDF…';

  @override
  String get exportDoctorPdfHint =>
      'Plik możesz wysłać lekarzowi. Dopóki nie wyślesz PDF, dane pozostają na tym urządzeniu.';

  @override
  String get legalDocumentLoadError => 'Nie udało się wczytać dokumentu.';

  @override
  String get onboardingWelcomeTitle => 'Cichy kalendarz dla Ciebie';

  @override
  String get onboardingWelcomeBody =>
      'Zaznaczaj miesiączkę jednym dotknięciem. Prognoza, owulacja i samopoczucie zostają tylko na tym urządzeniu.';

  @override
  String get onboardingDateTitle => 'Kiedy zaczęła się ostatnia miesiączka?';

  @override
  String get pickDate => 'Wybierz datę';

  @override
  String get datePickerHelp => 'Początek ostatniej miesiączki';

  @override
  String get onboardingNext => 'Dalej';

  @override
  String get onboardingBack => 'Wstecz';

  @override
  String get onboardingStart => 'Zaczynamy';

  @override
  String get aboutPhasesTitle => 'Jak wyliczane są fazy';

  @override
  String get aboutPhasesBody1 =>
      'Cykl budujemy z Twoich zaznaczeń: kolejne dni miesiączki to jeden cykl. Średnia długość cyklu i czas trwania miesiączki liczone są z ostatnich 6 cykli. Jeśli historia jest jeszcze krótka, używane są wartości z ustawień.';

  @override
  String get aboutPhasesBody2 =>
      'Owulacja: długość cyklu minus 14 dni od początku cyklu. Okno płodne: 5 dni przed owulacją i 1 dzień po. Prognoza następnej miesiączki: początek ostatniego cyklu plus średnia długość.';

  @override
  String get aboutPhasesBody3 =>
      'Miesiączka, faza folikularna, okno płodne, owulacja, faza lutealna i opóźnienie to wskazówka, a nie diagnoza medyczna. Aplikacja nie zastępuje wizyty u lekarza i nie jest środkiem antykoncepcji. Dane pozostają tylko na tym urządzeniu.';

  @override
  String get legalSectionTitle => 'Dokumenty prawne';

  @override
  String get allMoiSoftApps => 'Wszystkie aplikacje MoiSoft';

  @override
  String get privacyPolicyTitle => 'Polityka prywatności';

  @override
  String get userAgreementTitle => 'Umowa użytkownika';

  @override
  String get publicOfferTitle => 'Oferta publiczna';

  @override
  String get consentPdTitle => 'Zgoda na przetwarzanie danych osobowych';

  @override
  String get versionLabel => 'Wersja';

  @override
  String get reminderNotificationBody =>
      'Jutro według prognozy może zacząć się miesiączka.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Eksport dla lekarza — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Dokument powstał na podstawie zaznaczeń użytkownika na urządzeniu. Nie jest opinią ani diagnozą medyczną.';

  @override
  String get pdfSectionCycles => 'Cykle';

  @override
  String get pdfSectionDiary => 'Dziennik';

  @override
  String get pdfSummaryRegularity => 'Regularność';

  @override
  String get pdfCyclesEmpty => 'Cykle nie są jeszcze zaznaczone.';

  @override
  String get pdfDiaryEmpty => 'Brak wpisów w dzienniku za ten okres.';

  @override
  String get pdfColStart => 'Początek';

  @override
  String get pdfColEnd => 'Koniec';

  @override
  String get pdfColPeriodDays => 'Miesiączka';

  @override
  String get pdfColCycleLength => 'Długość cyklu';

  @override
  String get pdfColDate => 'Data';

  @override
  String get pdfColNote => 'Notatka';

  @override
  String get pdfYes => 'tak';

  @override
  String get pdfNo => 'nie';

  @override
  String get pdfCurrentCycleShort => 'aktualny';

  @override
  String get pdfDiaryContinuation => 'Dziennik (c.d.)';

  @override
  String pdfPageFooter(int page, int pages) => 'Str. $page z $pages';

  @override
  String get pdfShareSubject => 'Kalendarz Miesiączki: eksport dla lekarza';

  @override
  String get premiumBuyTitle => 'Kup premium';

  @override
  String get premiumAfterPaymentHint =>
      'Po opłaceniu wszystkie reklamy zostaną wyłączone. Zapisz numer zamówienia.';

  @override
  String get premiumPaySbp => 'Zapłać przez SBP';

  @override
  String get premiumPayRustore => 'Zapłać w RuStore';

  @override
  String get premiumConsentPrefix => 'Akceptuję ';

  @override
  String get premiumConsentOfferLink => 'ofertę publiczną';

  @override
  String get premiumConsentAnd => ' oraz ';

  @override
  String get premiumConsentPdLink => 'zgodę na przetwarzanie danych osobowych';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Nie udało się otworzyć płatności';

  @override
  String get premiumRustoreUnavailable =>
      'Płatności RuStore są niedostępne. Zainstaluj RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'Premium aktywowane. Reklamy są wyłączone.';

  @override
  String get premiumPurchaseFailed =>
      'Zakup się nie powiódł. Spróbuj ponownie później.';

  @override
  String get premiumActiveLabel =>
      'Premium jest aktywne. Reklamy są wyłączone.';

  @override
  String get premiumRestoreButton => 'Przywróć zakup';

  @override
  String get premiumRestoreTitle => 'Przywróć zakup';

  @override
  String get premiumRestoreBody =>
      'Wpisz numer zamówienia z paragonu lub z ekranu po płatności.';

  @override
  String get premiumOrderIdLabel => 'Numer zamówienia';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Jeśli numer został utracony — napisz na $email';

  @override
  String get premiumRestoreAction => 'Przywróć';

  @override
  String get premiumRestoreViaRustore => 'Przywróć przez RuStore';

  @override
  String get premiumEnterOrderId => 'Wpisz numer zamówienia';

  @override
  String get premiumRestoreSuccess => 'Zakup przywrócony. Premium aktywowane.';

  @override
  String get premiumRestoreNotFound =>
      'Nie znaleziono płatności lub nie zakończyła się sukcesem. Sprawdź numer zamówienia.';

  @override
  String get premiumRestoreCheckFailed =>
      'Nie udało się zweryfikować płatności';

  @override
  String get premiumRestoreRustoreSuccess =>
      'Zakup RuStore przywrócony. Premium aktywowane.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Nie znaleziono aktywnego zakupu RuStore.';

  @override
  String get premiumRestoreRustoreFailed =>
      'Nie udało się przywrócić zakupu RuStore';

  @override
  String get premiumPaymentDescription => 'Premium: wyłączenie reklam';

  @override
  String get paymentOpeningBank => 'Otwieramy stronę płatności T-Bank…';

  @override
  String get paymentOpenFormFailed =>
      'Nie udało się otworzyć formularza płatności.';

  @override
  String get paymentReturnHint =>
      'Po opłaceniu wróć do aplikacji. Status zaktualizuje się sam.';

  @override
  String get paymentWaiting => 'Oczekiwanie na płatność…';

  @override
  String paymentBankStatus(String status) => 'Status: $status';

  @override
  String get paymentSuccess => 'Płatność zakończona sukcesem';

  @override
  String get paymentNotCompleted => 'Płatność nie została zakończona';

  @override
  String get paymentFailedTitle => 'Płatność nie powiodła się';

  @override
  String get paymentFailedBody =>
      'Spróbuj ponownie lub skorzystaj z innej metody płatności w swoim banku.';

  @override
  String get paymentGotIt => 'Rozumiem';

  @override
  String get paymentPremiumActivatedTitle => 'Premium aktywowane';

  @override
  String get paymentSaveOrderHint =>
      'Zapisz numer zamówienia — przyda się do przywrócenia zakupu.';

  @override
  String paymentSheetTitle(int rubles) => 'Płatność $rubles ₽';

  @override
  String get paymentOrderCopied => 'Numer zamówienia skopiowany';

  @override
  String get paymentSessionNotFound => 'Nie znaleziono sesji płatności';

  @override
  String get paymentCopyOrder => 'Kopiuj';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}.${start.month}.${start.year} — ${end.day}.${end.month}.${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
