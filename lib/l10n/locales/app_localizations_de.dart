import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Немецкая локализация.
class AppLocalizationsDe extends AppLocalizations {
  @override
  String get languageCode => 'de';

  @override
  String get appName => 'Periode & Zyklus Kalender';

  @override
  String get appSubtitle => 'Zykluskalender';

  @override
  String get navToday => 'Heute';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navStats => 'Zyklen';

  @override
  String get navSettings => 'Mehr';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get cycleLengthLabel => 'Übliche Zykluslänge';

  @override
  String get periodDurationLabel => 'Dauer der Periode';

  @override
  String get daysUnit => 'Tage';

  @override
  String get reminderTitle => 'Erinnerung';

  @override
  String get reminderSubtitle => 'Einen Tag vor der vorhergesagten Periode';

  @override
  String get languageTitle => 'Sprache';

  @override
  String get aboutTitle => 'Über die App';

  @override
  String get aboutSubtitle => 'Zyklusphasen und rechtliche Dokumente';

  @override
  String get resetData => 'Alle Daten zurücksetzen';

  @override
  String get resetDialogTitle => 'Daten zurücksetzen?';

  @override
  String get resetDialogBody =>
      'Kalender, Notizen und Einstellungen werden gelöscht. Das Onboarding beginnt von vorn.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get writeToDeveloper => 'Entwickler kontaktieren';

  @override
  String get addressCopied => 'Adresse kopiert';

  @override
  String get emailFieldLabel => 'E-Mail';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Zurücksetzen';

  @override
  String get loadCalendarError => 'Kalender konnte nicht geladen werden';

  @override
  String get persistError => 'Daten konnten nicht gespeichert werden';

  @override
  String get pdfExportError => 'PDF konnte nicht erstellt werden';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get dayN => 'Tag';

  @override
  String dayNumber(int n) => 'Tag $n';

  @override
  String get periodActive => 'Periode läuft';

  @override
  String delayDays(int n) => '$n ${pluralDays(n)} Verspätung';

  @override
  String daysUntilPeriod(int n) => 'Noch $n ${pluralDays(n)} bis zur Periode';

  @override
  String pluralDays(int count) => count == 1 ? 'Tag' : 'Tage';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Periode',
      CyclePhase.follicular => 'Follikelphase',
      CyclePhase.fertile => 'Fruchtbares Fenster',
      CyclePhase.ovulation => 'Eisprung',
      CyclePhase.luteal => 'Lutealphase',
      CyclePhase.late => 'Überfällig',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Ruh dich aus, wenn du es brauchst.',
      CyclePhase.follicular => 'Die Energie kommt oft zurück.',
      CyclePhase.fertile => 'Erhöhte Wahrscheinlichkeit einer Befruchtung.',
      CyclePhase.ovulation => 'Geschätzter Eisprungtag.',
      CyclePhase.luteal => 'Geh langsamer und hör auf deinen Körper.',
      CyclePhase.late =>
        'Der Zyklus ist länger als üblich — trage die Periode ein, sobald sie beginnt.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Super',
      Mood.good => 'Gut',
      Mood.okay => 'Okay',
      Mood.low => 'Traurig',
      Mood.irritable => 'Gereizt',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Kopfschmerzen',
      Symptom.tenderBreasts => 'Empfindliche Brust',
      Symptom.backache => 'Rückenschmerzen',
      Symptom.acne => 'Hautprobleme',
      Symptom.abdominalPain => 'Bauchschmerzen',
      Symptom.bloating => 'Blähbauch',
      Symptom.cramps => 'Krämpfe',
      Symptom.fatigue => 'Müdigkeit',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Schwach',
      FlowIntensity.medium => 'Mittel',
      FlowIntensity.heavy => 'Stark',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Noch nicht genug Daten',
      CycleRegularity.stable => 'Stabiler Zyklus',
      CycleRegularity.mild => 'Leichte Schwankungen',
      CycleRegularity.irregular => 'Bisher unregelmäßig',
    };
  }

  @override
  String get period => 'Periode';

  @override
  String get flow => 'Stärke';

  @override
  String get mood => 'Stimmung';

  @override
  String get wellbeing => 'Wohlbefinden';

  @override
  String get noteHint => 'Notiz';

  @override
  String get noteHintShort => 'Kurze Notiz, wenn nötig';

  @override
  String get save => 'Speichern';

  @override
  String get calendarTitle => 'Kalender';

  @override
  String get legendPeriod => 'Periode';

  @override
  String get legendForecast => 'Prognose';

  @override
  String get legendFertile => 'Fruchtbar';

  @override
  String get legendOvulation => 'Eisprung';

  @override
  String get statsTitle => 'Zyklen';

  @override
  String get statsCycleLength => 'Zykluslänge';

  @override
  String get statsPeriodDuration => 'Periode';

  @override
  String get statsRecentCycles => 'Letzte Zyklen';

  @override
  String get statsEmptyHistory =>
      'Trage deine Periode ein — hier erscheint deine Historie.';

  @override
  String get statsCurrentCycle => 'aktueller Zyklus';

  @override
  String get exportDoctorPdf => 'Für den Arzt exportieren';

  @override
  String get exportDoctorPdfLoading => 'PDF wird vorbereitet…';

  @override
  String get exportDoctorPdfHint =>
      'Du kannst die Datei an deinen Arzt senden. Bis du das PDF teilst, bleiben die Daten auf diesem Gerät.';

  @override
  String get legalDocumentLoadError => 'Dokument konnte nicht geladen werden.';

  @override
  String get onboardingWelcomeTitle => 'Ein ruhiger Kalender für dich';

  @override
  String get onboardingWelcomeBody =>
      'Trage deine Periode mit einem Tipp ein. Prognose, Eisprung und Wohlbefinden bleiben nur auf diesem Gerät.';

  @override
  String get onboardingDateTitle => 'Wann hat deine letzte Periode begonnen?';

  @override
  String get pickDate => 'Datum wählen';

  @override
  String get datePickerHelp => 'Beginn der letzten Periode';

  @override
  String get onboardingNext => 'Weiter';

  @override
  String get onboardingBack => 'Zurück';

  @override
  String get onboardingStart => 'Los geht’s';

  @override
  String get aboutPhasesTitle => 'Wie die Phasen berechnet werden';

  @override
  String get aboutPhasesBody1 =>
      'Dein Zyklus entsteht aus deinen Einträgen: aufeinanderfolgende Periodentage bilden einen Zyklus. Durchschnittliche Zykluslänge und Periodendauer werden aus den letzten 6 Zyklen berechnet; fehlt die Historie, werden die Werte aus den Einstellungen genutzt.';

  @override
  String get aboutPhasesBody2 =>
      'Eisprung: Zykluslänge minus 14 Tage ab Zyklusbeginn. Fruchtbares Fenster: 5 Tage vor dem Eisprung und 1 Tag danach. Prognose der nächsten Periode: Beginn des letzten Zyklus plus durchschnittliche Länge.';

  @override
  String get aboutPhasesBody3 =>
      'Die Phasen sind eine Orientierung, keine medizinische Diagnose. Die App ersetzt keinen Arzt und dient nicht als Verhütungsmittel. Die Daten bleiben nur auf diesem Gerät.';

  @override
  String get legalSectionTitle => 'Rechtliche Dokumente';

  @override
  String get allMoiSoftApps => 'Alle MoiSoft-Apps';

  @override
  String get privacyPolicyTitle => 'Datenschutzerklärung';

  @override
  String get userAgreementTitle => 'Nutzungsbedingungen';

  @override
  String get publicOfferTitle => 'Öffentliches Angebot';

  @override
  String get consentPdTitle => 'Einwilligung zur Datenverarbeitung';

  @override
  String get versionLabel => 'Version';

  @override
  String get reminderNotificationBody =>
      'Laut Prognose kann deine Periode morgen beginnen.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Export für den Arzt — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Dieses Dokument wurde aus Einträgen auf dem Gerät erstellt. Es ist kein medizinischer Befund und keine Diagnose.';

  @override
  String get pdfSectionCycles => 'Zyklen';

  @override
  String get pdfSectionDiary => 'Tagebuch';

  @override
  String get pdfSummaryRegularity => 'Regelmäßigkeit';

  @override
  String get pdfCyclesEmpty => 'Noch keine Zyklen eingetragen.';

  @override
  String get pdfDiaryEmpty => 'Keine Tagebucheinträge für diesen Zeitraum.';

  @override
  String get pdfColStart => 'Beginn';

  @override
  String get pdfColEnd => 'Ende';

  @override
  String get pdfColPeriodDays => 'Periode';

  @override
  String get pdfColCycleLength => 'Zykluslänge';

  @override
  String get pdfColDate => 'Datum';

  @override
  String get pdfColNote => 'Notiz';

  @override
  String get pdfYes => 'ja';

  @override
  String get pdfNo => 'nein';

  @override
  String get pdfCurrentCycleShort => 'aktuell';

  @override
  String get pdfDiaryContinuation => 'Tagebuch (Fortsetzung)';

  @override
  String pdfPageFooter(int page, int pages) => 'Seite $page von $pages';

  @override
  String get pdfShareSubject =>
      'Periode & Zyklus Kalender: Export für den Arzt';

  @override
  String get premiumBuyTitle => 'Premium kaufen';

  @override
  String get premiumAfterPaymentHint =>
      'Nach der Zahlung wird die gesamte Werbung entfernt. Speichere deine Bestellnummer.';

  @override
  String get premiumPaySbp => 'Über SBP bezahlen';

  @override
  String get premiumPayRustore => 'In RuStore bezahlen';

  @override
  String get premiumConsentPrefix => 'Ich stimme ';

  @override
  String get premiumConsentOfferLink => 'dem öffentlichen Angebot';

  @override
  String get premiumConsentAnd => ' und ';

  @override
  String get premiumConsentPdLink => 'der Datenschutzeinwilligung';

  @override
  String get premiumConsentSuffix => ' zu.';

  @override
  String get premiumOpenPaymentFailed => 'Zahlung konnte nicht geöffnet werden';

  @override
  String get premiumRustoreUnavailable =>
      'RuStore-Zahlungen sind nicht verfügbar. Installiere RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'Premium aktiviert. Werbung ist deaktiviert.';

  @override
  String get premiumPurchaseFailed =>
      'Kauf fehlgeschlagen. Versuche es später erneut.';

  @override
  String get premiumActiveLabel =>
      'Premium ist aktiv. Werbung ist deaktiviert.';

  @override
  String get premiumRestoreButton => 'Kauf wiederherstellen';

  @override
  String get premiumRestoreTitle => 'Kauf wiederherstellen';

  @override
  String get premiumRestoreBody =>
      'Gib die Bestellnummer aus der Quittung oder dem Bildschirm nach der Zahlung ein.';

  @override
  String get premiumOrderIdLabel => 'Bestellnummer';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Wenn du die Nummer verloren hast, schreibe an $email';

  @override
  String get premiumRestoreAction => 'Wiederherstellen';

  @override
  String get premiumRestoreViaRustore => 'Über RuStore wiederherstellen';

  @override
  String get premiumEnterOrderId => 'Bestellnummer eingeben';

  @override
  String get premiumRestoreSuccess =>
      'Kauf wiederhergestellt. Premium aktiviert.';

  @override
  String get premiumRestoreNotFound =>
      'Zahlung nicht gefunden oder nicht erfolgreich. Prüfe die Bestellnummer.';

  @override
  String get premiumRestoreCheckFailed => 'Zahlung konnte nicht geprüft werden';

  @override
  String get premiumRestoreRustoreSuccess =>
      'RuStore-Kauf wiederhergestellt. Premium aktiviert.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Kein aktiver RuStore-Kauf gefunden.';

  @override
  String get premiumRestoreRustoreFailed =>
      'RuStore-Kauf konnte nicht wiederhergestellt werden';

  @override
  String get premiumPaymentDescription => 'Premium: Ohne Werbung';

  @override
  String get paymentOpeningBank => 'T-Bank-Zahlung wird geöffnet…';

  @override
  String get paymentOpenFormFailed =>
      'Zahlungsformular konnte nicht geöffnet werden.';

  @override
  String get paymentReturnHint =>
      'Kehre nach der Zahlung in die App zurück. Der Status aktualisiert sich automatisch.';

  @override
  String get paymentWaiting => 'Warten auf Zahlung…';

  @override
  String paymentBankStatus(String status) => 'Status: $status';

  @override
  String get paymentSuccess => 'Zahlung erfolgreich';

  @override
  String get paymentNotCompleted => 'Zahlung nicht abgeschlossen';

  @override
  String get paymentFailedTitle => 'Zahlung fehlgeschlagen';

  @override
  String get paymentFailedBody =>
      'Versuche es erneut oder wähle eine andere Zahlungsmethode in deiner Banking-App.';

  @override
  String get paymentGotIt => 'Verstanden';

  @override
  String get paymentPremiumActivatedTitle => 'Premium aktiviert';

  @override
  String get paymentSaveOrderHint =>
      'Speichere die Bestellnummer — du brauchst sie, um den Kauf wiederherzustellen.';

  @override
  String paymentSheetTitle(int rubles) => 'Zahlung $rubles ₽';

  @override
  String get paymentOrderCopied => 'Bestellnummer kopiert';

  @override
  String get paymentSessionNotFound => 'Zahlungssitzung nicht gefunden';

  @override
  String get paymentCopyOrder => 'Kopieren';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}.${start.month}.${start.year} — ${end.day}.${end.month}.${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
