/// Греческая локализация строк интерфейса (el).
library;

import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Греческие строки интерфейса.
class AppLocalizationsEl extends AppLocalizations {
  @override
  String get languageCode => 'el';

  @override
  String get appName => 'Ημερολόγιο Περιόδου';

  @override
  String get appSubtitle => 'Ημερολόγιο κύκλου';

  @override
  String get navToday => 'Σήμερα';

  @override
  String get navCalendar => 'Ημερολόγιο';

  @override
  String get navStats => 'Κύκλοι';

  @override
  String get navSettings => 'Άλλα';

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get cycleLengthLabel => 'Τυπικό μήκος κύκλου';

  @override
  String get periodDurationLabel => 'Διάρκεια περιόδου';

  @override
  String get daysUnit => 'ημέρες';

  @override
  String get reminderTitle => 'Υπενθύμιση';

  @override
  String get reminderSubtitle => 'Μία ημέρα πριν την αναμενόμενη περίοδο';

  @override
  String get languageTitle => 'Γλώσσα';

  @override
  String get aboutTitle => 'Σχετικά';

  @override
  String get aboutSubtitle => 'Φάσεις κύκλου και νομικά έγγραφα';

  @override
  String get resetData => 'Επαναφορά όλων των δεδομένων';

  @override
  String get resetDialogTitle => 'Επαναφορά δεδομένων;';

  @override
  String get resetDialogBody =>
      'Το ημερολόγιο, οι σημειώσεις και οι ρυθμίσεις θα διαγραφούν. Η εισαγωγή θα ξεκινήσει από την αρχή.';

  @override
  String get cancel => 'Άκυρο';

  @override
  String get writeToDeveloper => 'Γράψτε στον προγραμματιστή';

  @override
  String get addressCopied => 'Η διεύθυνση αντιγράφηκε';

  @override
  String get emailFieldLabel => 'Email';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Επαναφορά';

  @override
  String get loadCalendarError => 'Δεν ήταν δυνατή η φόρτωση του ημερολογίου';

  @override
  String get persistError => 'Δεν ήταν δυνατή η αποθήκευση των δεδομένων';

  @override
  String get pdfExportError => 'Δεν ήταν δυνατή η προετοιμασία του PDF';

  @override
  String get retry => 'Δοκιμή ξανά';

  @override
  String get dayN => 'Ημέρα';

  @override
  String dayNumber(int n) => 'Ημέρα $n';

  @override
  String get periodActive => 'Η περίοδος είναι σε εξέλιξη';

  @override
  String delayDays(int n) => 'Καθυστέρηση $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => '$n ${pluralDays(n)} έως την περίοδο';

  @override
  String pluralDays(int count) => count == 1 ? 'ημέρα' : 'ημέρες';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Περίοδος',
      CyclePhase.follicular => 'Θυλακιώδης φάση',
      CyclePhase.fertile => 'Γόνιμο παράθυρο',
      CyclePhase.ovulation => 'Ωορρηξία',
      CyclePhase.luteal => 'Ωχρινική φάση',
      CyclePhase.late => 'Καθυστερημένος κύκλος',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Ξεκουραστείτε αν το χρειάζεστε.',
      CyclePhase.follicular => 'Η ενέργεια συχνά αυξάνεται.',
      CyclePhase.fertile => 'Υψηλότερη πιθανότητα σύλληψης.',
      CyclePhase.ovulation => 'Εκτιμώμενη ημέρα ωορρηξίας.',
      CyclePhase.luteal => 'Επιβραδύνετε και ακούστε το σώμα σας.',
      CyclePhase.late =>
        'Ο κύκλος είναι μεγαλύτερος από το συνηθισμένο — καταγράψτε την περίοδο όταν ξεκινήσει.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Υπέροχα',
      Mood.good => 'Καλά',
      Mood.okay => 'Μέτρια',
      Mood.low => 'Λυπημένη',
      Mood.irritable => 'Ερεθισμένη',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Πονοκέφαλος',
      Symptom.tenderBreasts => 'Ευαισθησία στήθους',
      Symptom.backache => 'Πόνος στην πλάτη',
      Symptom.acne => 'Προβλήματα δέρματος',
      Symptom.abdominalPain => 'Πόνος στην κοιλιά',
      Symptom.bloating => 'Φούσκωμα',
      Symptom.cramps => 'Κράμπες',
      Symptom.fatigue => 'Κόπωση',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Αδύνατη',
      FlowIntensity.medium => 'Κανονική',
      FlowIntensity.heavy => 'Έντονη',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Δεν υπάρχουν ακόμη αρκετά δεδομένα',
      CycleRegularity.stable => 'Σταθερός κύκλος',
      CycleRegularity.mild => 'Μικρές διακυμάνσεις',
      CycleRegularity.irregular => 'Μέχρι τώρα ακανόνιστος',
    };
  }

  @override
  String get period => 'Περίοδος';

  @override
  String get flow => 'Ροή';

  @override
  String get mood => 'Διάθεση';

  @override
  String get wellbeing => 'Ευεξία';

  @override
  String get noteHint => 'Σημείωση';

  @override
  String get noteHintShort => 'Σύντομη σημείωση αν θέλετε';

  @override
  String get save => 'Αποθήκευση';

  @override
  String get calendarTitle => 'Ημερολόγιο';

  @override
  String get legendPeriod => 'Περίοδος';

  @override
  String get legendForecast => 'Πρόβλεψη';

  @override
  String get legendFertile => 'Γόνιμες';

  @override
  String get legendOvulation => 'Ωορρηξία';

  @override
  String get statsTitle => 'Κύκλοι';

  @override
  String get statsCycleLength => 'Μήκος κύκλου';

  @override
  String get statsPeriodDuration => 'Περίοδος';

  @override
  String get statsRecentCycles => 'Πρόσφατοι κύκλοι';

  @override
  String get statsEmptyHistory =>
      'Καταγράψτε την περίοδό σας — το ιστορικό θα εμφανιστεί εδώ.';

  @override
  String get statsCurrentCycle => 'τρέχων κύκλος';

  @override
  String get exportDoctorPdf => 'Εξαγωγή για γιατρό';

  @override
  String get exportDoctorPdfLoading => 'Προετοιμασία PDF…';

  @override
  String get exportDoctorPdfHint =>
      'Μπορείτε να στείλετε το αρχείο στον γιατρό σας. Μέχρι να μοιραστείτε το PDF, τα δεδομένα παραμένουν σε αυτή τη συσκευή.';

  @override
  String get legalDocumentLoadError =>
      'Δεν ήταν δυνατή η φόρτωση του εγγράφου.';

  @override
  String get onboardingWelcomeTitle => 'Ένα ήρεμο ημερολόγιο για εσάς';

  @override
  String get onboardingWelcomeBody =>
      'Καταγράψτε την περίοδό σας με ένα άγγιγμα. Η πρόβλεψη, η ωορρηξία και η ευεξία παραμένουν μόνο σε αυτή τη συσκευή.';

  @override
  String get onboardingDateTitle => 'Πότε ξεκίνησε η τελευταία σας περίοδος;';

  @override
  String get pickDate => 'Επιλογή ημερομηνίας';

  @override
  String get datePickerHelp => 'Έναρξη τελευταίας περιόδου';

  @override
  String get onboardingNext => 'Επόμενο';

  @override
  String get onboardingBack => 'Πίσω';

  @override
  String get onboardingStart => 'Ας ξεκινήσουμε';

  @override
  String get aboutPhasesTitle => 'Πώς υπολογίζονται οι φάσεις';

  @override
  String get aboutPhasesBody1 =>
      'Ο κύκλος σας δημιουργείται από τις καταγραφές: οι συνεχόμενες ημέρες περιόδου αποτελούν έναν κύκλο. Το μέσο μήκος κύκλου και η διάρκεια περιόδου υπολογίζονται από τους τελευταίους 6 κύκλους· αν το ιστορικό είναι μικρό, χρησιμοποιούνται οι τιμές των ρυθμίσεων.';

  @override
  String get aboutPhasesBody2 =>
      'Ωορρηξία: μήκος κύκλου μείον 14 ημέρες από την έναρξη του κύκλου. Γόνιμο παράθυρο: 5 ημέρες πριν την ωορρηξία και 1 ημέρα μετά. Πρόβλεψη επόμενης περιόδου: έναρξη τελευταίου κύκλου συν το μέσο μήκος.';

  @override
  String get aboutPhasesBody3 =>
      'Οι φάσεις είναι ενδεικτικές, όχι ιατρική διάγνωση. Η εφαρμογή δεν αντικαθιστά τον γιατρό και δεν αποτελεί μέθοδο αντισύλληψης. Τα δεδομένα παραμένουν μόνο σε αυτή τη συσκευή.';

  @override
  String get legalSectionTitle => 'Νομικά έγγραφα';

  @override
  String get allMoiSoftApps => 'Όλες οι εφαρμογές MoiSoft';

  @override
  String get privacyPolicyTitle => 'Πολιτική απορρήτου';

  @override
  String get userAgreementTitle => 'Συμφωνία χρήστη';

  @override
  String get publicOfferTitle => 'Δημόσια προσφορά';

  @override
  String get consentPdTitle => 'Συναίνεση για προσωπικά δεδομένα';

  @override
  String get versionLabel => 'Έκδοση';

  @override
  String get reminderNotificationBody =>
      'Σύμφωνα με την πρόβλεψη, η περίοδός σας μπορεί να ξεκινήσει αύριο.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Εξαγωγή για γιατρό — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Το έγγραφο δημιουργήθηκε από τις καταγραφές χρήστη στη συσκευή. Δεν αποτελεί ιατρική αναφορά ή διάγνωση.';

  @override
  String get pdfSectionCycles => 'Κύκλοι';

  @override
  String get pdfSectionDiary => 'Ημερολόγιο';

  @override
  String get pdfSummaryRegularity => 'Κανονικότητα';

  @override
  String get pdfCyclesEmpty => 'Δεν έχουν καταγραφεί κύκλοι ακόμη.';

  @override
  String get pdfDiaryEmpty => 'Δεν υπάρχουν καταγραφές για αυτή την περίοδο.';

  @override
  String get pdfColStart => 'Έναρξη';

  @override
  String get pdfColEnd => 'Λήξη';

  @override
  String get pdfColPeriodDays => 'Περίοδος';

  @override
  String get pdfColCycleLength => 'Μήκος κύκλου';

  @override
  String get pdfColDate => 'Ημερομηνία';

  @override
  String get pdfColNote => 'Σημείωση';

  @override
  String get pdfYes => 'ναι';

  @override
  String get pdfNo => 'όχι';

  @override
  String get pdfCurrentCycleShort => 'τρέχων';

  @override
  String get pdfDiaryContinuation => 'Ημερολόγιο (συνέχεια)';

  @override
  String pdfPageFooter(int page, int pages) => 'Σελίδα $page από $pages';

  @override
  String get pdfShareSubject => 'Ημερολόγιο Περιόδου: εξαγωγή για γιατρό';

  @override
  String get premiumBuyTitle => 'Αγορά premium';

  @override
  String get premiumAfterPaymentHint =>
      'Μετά την πληρωμή αφαιρούνται όλες οι διαφημίσεις. Κρατήστε τον αριθμό παραγγελίας.';

  @override
  String get premiumPaySbp => 'Πληρωμή μέσω FPS (SBP)';

  @override
  String get premiumPayRustore => 'Πληρωμή στο RuStore';

  @override
  String get premiumConsentPrefix => 'Αποδέχομαι τη ';

  @override
  String get premiumConsentOfferLink => 'δημόσια προσφορά';

  @override
  String get premiumConsentAnd => ' και ';

  @override
  String get premiumConsentPdLink => 'τη συναίνεση για προσωπικά δεδομένα';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed =>
      'Δεν ήταν δυνατό το άνοιγμα της πληρωμής';

  @override
  String get premiumRustoreUnavailable =>
      'Οι πληρωμές RuStore δεν είναι διαθέσιμες. Εγκαταστήστε το RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'Το premium ενεργοποιήθηκε. Οι διαφημίσεις απενεργοποιήθηκαν.';

  @override
  String get premiumPurchaseFailed =>
      'Η αγορά απέτυχε. Δοκιμάστε ξανά αργότερα.';

  @override
  String get premiumActiveLabel =>
      'Το premium είναι ενεργό. Οι διαφημίσεις είναι απενεργοποιημένες.';

  @override
  String get premiumRestoreButton => 'Επαναφορά αγοράς';

  @override
  String get premiumRestoreTitle => 'Επαναφορά αγοράς';

  @override
  String get premiumRestoreBody =>
      'Εισάγετε τον αριθμό παραγγελίας από την απόδειξη ή την οθόνη μετά την πληρωμή.';

  @override
  String get premiumOrderIdLabel => 'Αριθμός παραγγελίας';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Αν χάσατε τον αριθμό, γράψτε στο $email';

  @override
  String get premiumRestoreAction => 'Επαναφορά';

  @override
  String get premiumRestoreViaRustore => 'Επαναφορά μέσω RuStore';

  @override
  String get premiumEnterOrderId => 'Εισάγετε τον αριθμό παραγγελίας';

  @override
  String get premiumRestoreSuccess =>
      'Η αγορά επαναφέρθηκε. Το premium ενεργοποιήθηκε.';

  @override
  String get premiumRestoreNotFound =>
      'Η πληρωμή δεν βρέθηκε ή δεν ολοκληρώθηκε. Ελέγξτε τον αριθμό παραγγελίας.';

  @override
  String get premiumRestoreCheckFailed =>
      'Δεν ήταν δυνατή η επαλήθευση της πληρωμής';

  @override
  String get premiumRestoreRustoreSuccess =>
      'Η αγορά RuStore επαναφέρθηκε. Το premium ενεργοποιήθηκε.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Δεν βρέθηκε ενεργή αγορά RuStore.';

  @override
  String get premiumRestoreRustoreFailed =>
      'Δεν ήταν δυνατή η επαναφορά της αγοράς RuStore';

  @override
  String get premiumPaymentDescription => 'Premium: χωρίς διαφημίσεις';

  @override
  String get paymentOpeningBank => 'Άνοιγμα πληρωμής T-Bank…';

  @override
  String get paymentOpenFormFailed =>
      'Δεν ήταν δυνατό το άνοιγμα της φόρμας πληρωμής.';

  @override
  String get paymentReturnHint =>
      'Μετά την πληρωμή επιστρέψτε στην εφαρμογή. Η κατάσταση θα ενημερωθεί αυτόματα.';

  @override
  String get paymentWaiting => 'Αναμονή πληρωμής…';

  @override
  String paymentBankStatus(String status) => 'Κατάσταση: $status';

  @override
  String get paymentSuccess => 'Η πληρωμή ολοκληρώθηκε επιτυχώς';

  @override
  String get paymentNotCompleted => 'Η πληρωμή δεν ολοκληρώθηκε';

  @override
  String get paymentFailedTitle => 'Η πληρωμή απέτυχε';

  @override
  String get paymentFailedBody =>
      'Δοκιμάστε ξανά ή χρησιμοποιήστε άλλη μέθοδο πληρωμής στην τράπεζά σας.';

  @override
  String get paymentGotIt => 'Το κατάλαβα';

  @override
  String get paymentPremiumActivatedTitle => 'Το premium ενεργοποιήθηκε';

  @override
  String get paymentSaveOrderHint =>
      'Κρατήστε τον αριθμό παραγγελίας — τον χρειάζεστε για την επαναφορά της αγοράς.';

  @override
  String paymentSheetTitle(int rubles) => 'Πληρωμή $rubles ₽';

  @override
  String get paymentOrderCopied => 'Ο αριθμός παραγγελίας αντιγράφηκε';

  @override
  String get paymentSessionNotFound => 'Η συνεδρία πληρωμής δεν βρέθηκε';

  @override
  String get paymentCopyOrder => 'Αντιγραφή';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
