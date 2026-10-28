import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Хинди-локализация: строки интерфейса для языка `hi`.
/// Структура повторяет [AppLocalizationsEn], интерполяции сохранены точь-в-точь.
class AppLocalizationsHi extends AppLocalizations {
  @override
  String get languageCode => 'hi';

  @override
  String get appName => 'Period Tracker: मासिक कैलेंडर';

  @override
  String get appSubtitle => 'मासिक चक्र कैलेंडर';

  @override
  String get navToday => 'आज';

  @override
  String get navCalendar => 'कैलेंडर';

  @override
  String get navStats => 'चक्र';

  @override
  String get navSettings => 'और';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get cycleLengthLabel => 'चक्र की आम लंबाई';

  @override
  String get periodDurationLabel => 'पीरियड्स की अवधि';

  @override
  String get daysUnit => 'दिन';

  @override
  String get reminderTitle => 'रिमाइंडर';

  @override
  String get reminderSubtitle => 'पीरियड्स की अनुमानित तारीख से एक दिन पहले';

  @override
  String get languageTitle => 'भाषा';

  @override
  String get aboutTitle => 'ऐप के बारे में';

  @override
  String get aboutSubtitle => 'चक्र की अवस्थाएँ और कानूनी दस्तावेज़';

  @override
  String get resetData => 'सारा डेटा मिटाएँ';

  @override
  String get resetDialogTitle => 'डेटा मिटाएँ?';

  @override
  String get resetDialogBody =>
      'कैलेंडर, नोट्स और सेटिंग्स मिट जाएँगी। ऑनबोर्डिंग फिर से शुरू होगा।';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get writeToDeveloper => 'डेवलपर को लिखें';

  @override
  String get addressCopied => 'पता कॉपी हो गया';

  @override
  String get emailFieldLabel => 'ईमेल';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'मिटाएँ';

  @override
  String get loadCalendarError => 'कैलेंडर लोड नहीं हो सका';

  @override
  String get persistError => 'डेटा सेव नहीं हो सका';

  @override
  String get pdfExportError => 'PDF तैयार नहीं हो सका';

  @override
  String get retry => 'फिर कोशिश करें';

  @override
  String get dayN => 'दिन';

  @override
  String dayNumber(int n) => 'दिन $n';

  @override
  String get periodActive => 'पीरियड्स चल रहे हैं';

  @override
  String delayDays(int n) => '$n दिन देर';

  @override
  String daysUntilPeriod(int n) => 'पीरियड्स में $n दिन बाकी';

  @override
  String pluralDays(int count) => 'दिन';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'पीरियड्स',
      CyclePhase.follicular => 'फॉलिक्यूलर अवस्था',
      CyclePhase.fertile => 'फर्टाइल विंडो',
      CyclePhase.ovulation => 'ओवुलेशन',
      CyclePhase.luteal => 'ल्यूटियल अवस्था',
      CyclePhase.late => 'देरी',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'ज़रूरत हो तो आराम करें।',
      CyclePhase.follicular => 'ऊर्जा आमतौर पर बढ़ती है।',
      CyclePhase.fertile => 'गर्भधारण की संभावना ज़्यादा है।',
      CyclePhase.ovulation => 'अनुमानित ओवुलेशन दिन।',
      CyclePhase.luteal => 'थोड़ा धीमे चलें और खुद को सुनें।',
      CyclePhase.late =>
        'चक्र आम से लंबा है — पीरियड्स शुरू होते ही दर्ज करें।',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'शानदार',
      Mood.good => 'अच्छा',
      Mood.okay => 'ठीक-ठाक',
      Mood.low => 'उदास',
      Mood.irritable => 'चिड़चिड़ापन',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'सिर दर्द',
      Symptom.tenderBreasts => 'स्तनों में दर्द',
      Symptom.backache => 'पीठ दर्द',
      Symptom.acne => 'त्वचा में दाने',
      Symptom.abdominalPain => 'पेट दर्द',
      Symptom.bloating => 'पेट फूलना',
      Symptom.cramps => 'सिकुड़न',
      Symptom.fatigue => 'थकान',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'हल्की',
      FlowIntensity.medium => 'सामान्य',
      FlowIntensity.heavy => 'ज़्यादा',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'अभी डेटा कम है',
      CycleRegularity.stable => 'चक्र नियमित है',
      CycleRegularity.mild => 'हल्का उतार-चढ़ाव',
      CycleRegularity.irregular => 'चक्र अभी अनियमित है',
    };
  }

  @override
  String get period => 'पीरियड्स';

  @override
  String get flow => 'फ्लो';

  @override
  String get mood => 'मूड';

  @override
  String get wellbeing => 'सेहत';

  @override
  String get noteHint => 'नोट';

  @override
  String get noteHintShort => 'चाहें तो छोटा नोट';

  @override
  String get save => 'सेव करें';

  @override
  String get calendarTitle => 'कैलेंडर';

  @override
  String get legendPeriod => 'पीरियड्स';

  @override
  String get legendForecast => 'अनुमान';

  @override
  String get legendFertile => 'फर्टाइल दिन';

  @override
  String get legendOvulation => 'ओवुलेशन';

  @override
  String get statsTitle => 'चक्र';

  @override
  String get statsCycleLength => 'चक्र की लंबाई';

  @override
  String get statsPeriodDuration => 'पीरियड्स';

  @override
  String get statsRecentCycles => 'हाल के चक्र';

  @override
  String get statsEmptyHistory => 'पीरियड्स दर्ज करें — यहाँ इतिहास दिखेगा।';

  @override
  String get statsCurrentCycle => 'मौजूदा चक्र';

  @override
  String get exportDoctorPdf => 'डॉक्टर के लिए रिपोर्ट';

  @override
  String get exportDoctorPdfLoading => 'PDF तैयार हो रही है…';

  @override
  String get exportDoctorPdfHint =>
      'फ़ाइल डॉक्टर को भेजी जा सकती है। जब तक आप PDF भेज नहीं देतीं, डेटा इसी डिवाइस पर रहता है।';

  @override
  String get legalDocumentLoadError => 'दस्तावेज़ लोड नहीं हो सका।';

  @override
  String get onboardingWelcomeTitle => 'सिर्फ़ आपके लिए एक शांत कैलेंडर';

  @override
  String get onboardingWelcomeBody =>
      'एक टैप में पीरियड्स दर्ज करें। अनुमान, ओवुलेशन और सेहत की जानकारी सिर्फ़ इसी डिवाइस पर रहती है।';

  @override
  String get onboardingDateTitle => 'आखिरी पीरियड्स कब शुरू हुए थे?';

  @override
  String get pickDate => 'तारीख चुनें';

  @override
  String get datePickerHelp => 'आखिरी पीरियड्स की शुरुआत';

  @override
  String get onboardingNext => 'आगे';

  @override
  String get onboardingBack => 'पीछे';

  @override
  String get onboardingStart => 'शुरू करें';

  @override
  String get aboutPhasesTitle => 'अवस्थाओं की गणना कैसे होती है';

  @override
  String get aboutPhasesBody1 =>
      'चक्र आपकी डाली गई एंट्री से बनता है: लगातार पीरियड्स के दिन एक चक्र होते हैं। चक्र की औसत लंबाई और पीरियड्स की अवधि पिछले 6 चक्रों से निकाली जाती है। अगर इतिहास अभी कम है, तो सेटिंग्स की वैल्यू इस्तेमाल होती है।';

  @override
  String get aboutPhasesBody2 =>
      'ओवुलेशन: चक्र शुरू होने से चक्र की लंबाई घटा 14 दिन। फर्टाइल विंडो: ओवुलेशन से 5 दिन पहले और 1 दिन बाद। अगले पीरियड्स का अनुमान: आखिरी चक्र की शुरुआत और औसत लंबाई का योग।';

  @override
  String get aboutPhasesBody3 =>
      'पीरियड्स, फॉलिक्यूलर अवस्था, फर्टाइल विंडो, ओवुलेशन, ल्यूटियल अवस्था और देरी — संकेत मात्र हैं, मेडिकल निदान नहीं। ऐप डॉक्टर की सलाह का विकल्प नहीं और गर्भनिरोधक साधन नहीं है। डेटा सिर्फ़ इसी डिवाइस पर रहता है।';

  @override
  String get legalSectionTitle => 'कानूनी दस्तावेज़';

  @override
  String get allMoiSoftApps => 'सभी MoiSoft ऐप्स';

  @override
  String get privacyPolicyTitle => 'गोपनीयता नीति';

  @override
  String get userAgreementTitle => 'उपयोगकर्ता अनुबंध';

  @override
  String get publicOfferTitle => 'सार्वजनिक ऑफर';

  @override
  String get consentPdTitle => 'पर्सनल डेटा सहमति';

  @override
  String get versionLabel => 'वर्शन';

  @override
  String get reminderNotificationBody =>
      'अनुमान के मुताबिक कल पीरियड्स शुरू हो सकते हैं।';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'डॉक्टर के लिए रिपोर्ट — $dateKey';

  @override
  String get pdfDisclaimer =>
      'यह दस्तावेज़ डिवाइस पर उपयोगकर्ता की एंट्री से बना है। यह मेडिकल रिपोर्ट या निदान नहीं है।';

  @override
  String get pdfSectionCycles => 'चक्र';

  @override
  String get pdfSectionDiary => 'डायरी';

  @override
  String get pdfSummaryRegularity => 'नियमितता';

  @override
  String get pdfCyclesEmpty => 'अभी कोई चक्र दर्ज नहीं है।';

  @override
  String get pdfDiaryEmpty => 'इस अवधि के लिए डायरी में कोई एंट्री नहीं है।';

  @override
  String get pdfColStart => 'शुरू';

  @override
  String get pdfColEnd => 'अंत';

  @override
  String get pdfColPeriodDays => 'पीरियड्स';

  @override
  String get pdfColCycleLength => 'चक्र की लंबाई';

  @override
  String get pdfColDate => 'तारीख';

  @override
  String get pdfColNote => 'नोट';

  @override
  String get pdfYes => 'हाँ';

  @override
  String get pdfNo => 'नहीं';

  @override
  String get pdfCurrentCycleShort => 'मौजूदा';

  @override
  String get pdfDiaryContinuation => 'डायरी, जारी';

  @override
  String pdfPageFooter(int page, int pages) => 'पेज $page / $pages';

  @override
  String get pdfShareSubject => 'Period Tracker: डॉक्टर के लिए रिपोर्ट';

  @override
  String get premiumBuyTitle => 'प्रीमियम खरीदें';

  @override
  String get premiumAfterPaymentHint =>
      'पेमेंट के बाद सारा विज्ञापन बंद हो जाता है। ऑर्डर नंबर सेव कर लें।';

  @override
  String get premiumPaySbp => 'SBP से भुगतान करें';

  @override
  String get premiumPayRustore => 'RuStore में भुगतान करें';

  @override
  String get premiumConsentPrefix => 'मैं सहमत हूँ ';

  @override
  String get premiumConsentOfferLink => 'ऑफर';

  @override
  String get premiumConsentAnd => ' और ';

  @override
  String get premiumConsentPdLink => 'डेटा सहमति';

  @override
  String get premiumConsentSuffix => '।';

  @override
  String get premiumOpenPaymentFailed => 'पेमेंट नहीं खोला जा सका';

  @override
  String get premiumRustoreUnavailable =>
      'RuStore पेमेंट उपलब्ध नहीं है। RuStore इंस्टॉल करें।';

  @override
  String get premiumActivatedAdsOff =>
      'प्रीमियम चालू हो गया। विज्ञापन बंद हैं।';

  @override
  String get premiumPurchaseFailed =>
      'खरीदारी नहीं हो सकी। बाद में कोशिश करें।';

  @override
  String get premiumActiveLabel => 'प्रीमियम चालू है। विज्ञापन बंद हैं।';

  @override
  String get premiumRestoreButton => 'खरीदारी पुनः प्राप्त करें';

  @override
  String get premiumRestoreTitle => 'खरीदारी पुनः प्राप्त करें';

  @override
  String get premiumRestoreBody =>
      'रसीद या पेमेंट के बाद की स्क्रीन से ऑर्डर नंबर डालें।';

  @override
  String get premiumOrderIdLabel => 'ऑर्डर नंबर';

  @override
  String premiumRestoreSupportLine(String email) =>
      'अगर नंबर खो गया है, तो $email पर लिखें';

  @override
  String get premiumRestoreAction => 'पुनः प्राप्त करें';

  @override
  String get premiumRestoreViaRustore => 'RuStore से पुनः प्राप्त करें';

  @override
  String get premiumEnterOrderId => 'ऑर्डर नंबर डालें';

  @override
  String get premiumRestoreSuccess =>
      'खरीदारी पुनः प्राप्त हो गई। प्रीमियम चालू हो गया।';

  @override
  String get premiumRestoreNotFound =>
      'पेमेंट नहीं मिला या सफल नहीं था। ऑर्डर नंबर जाँचें।';

  @override
  String get premiumRestoreCheckFailed => 'पेमेंट जाँचा नहीं जा सका';

  @override
  String get premiumRestoreRustoreSuccess =>
      'RuStore खरीदारी पुनः प्राप्त हो गई। प्रीमियम चालू हो गया।';

  @override
  String get premiumRestoreRustoreNotFound =>
      'कोई सक्रिय RuStore खरीदारी नहीं मिली।';

  @override
  String get premiumRestoreRustoreFailed =>
      'RuStore खरीदारी पुनः प्राप्त नहीं हो सकी';

  @override
  String get premiumPaymentDescription => 'प्रीमियम: विज्ञापन हटाना';

  @override
  String get paymentOpeningBank => 'T-Bank का पेमेंट फ़ॉर्म खुल रहा है…';

  @override
  String get paymentOpenFormFailed => 'पेमेंट फ़ॉर्म नहीं खोला जा सका।';

  @override
  String get paymentReturnHint =>
      'पेमेंट के बाद ऐप पर वापस आएँ। स्टेटस अपने आप अपडेट हो जाएगा।';

  @override
  String get paymentWaiting => 'पेमेंट की प्रतीक्षा…';

  @override
  String paymentBankStatus(String status) => 'स्थिति: $status';

  @override
  String get paymentSuccess => 'पेमेंट सफल रहा';

  @override
  String get paymentNotCompleted => 'पेमेंट पूरा नहीं हुआ';

  @override
  String get paymentFailedTitle => 'पेमेंट नहीं हो पाया';

  @override
  String get paymentFailedBody =>
      'फिर कोशिश करें या अपने बैंक ऐप में कोई दूसरा तरीका आज़माएँ।';

  @override
  String get paymentGotIt => 'ठीक है';

  @override
  String get paymentPremiumActivatedTitle => 'प्रीमियम चालू हो गया';

  @override
  String get paymentSaveOrderHint =>
      'ऑर्डर नंबर सेव करें — खरीदारी पुनः पाने के लिए ज़रूरी है।';

  @override
  String paymentSheetTitle(int rubles) => 'भुगतान $rubles ₽';

  @override
  String get paymentOrderCopied => 'ऑर्डर नंबर कॉपी हो गया';

  @override
  String get paymentSessionNotFound => 'पेमेंट सेशन नहीं मिला';

  @override
  String get paymentCopyOrder => 'कॉपी करें';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
