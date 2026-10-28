/// Арабская локализация строк интерфейса (ar, RTL).
library;

import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Арабские строки интерфейса.
class AppLocalizationsAr extends AppLocalizations {
  @override
  String get languageCode => 'ar';

  @override
  String get appName => 'تقويم الدورة الشهرية';

  @override
  String get appSubtitle => 'تقويم الدورة';

  @override
  String get navToday => 'اليوم';

  @override
  String get navCalendar => 'التقويم';

  @override
  String get navStats => 'الدورات';

  @override
  String get navSettings => 'المزيد';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get cycleLengthLabel => 'طول الدورة المعتاد';

  @override
  String get periodDurationLabel => 'مدة الحيض';

  @override
  String get daysUnit => 'يوم';

  @override
  String get reminderTitle => 'تذكير';

  @override
  String get reminderSubtitle => 'قبل يوم واحد من الموعد المتوقع للحيض';

  @override
  String get languageTitle => 'اللغة';

  @override
  String get aboutTitle => 'حول التطبيق';

  @override
  String get aboutSubtitle => 'مراحل الدورة والمستندات القانونية';

  @override
  String get resetData => 'إعادة تعيين جميع البيانات';

  @override
  String get resetDialogTitle => 'إعادة تعيين البيانات؟';

  @override
  String get resetDialogBody =>
      'سيتم حذف التقويم والملاحظات والإعدادات. ستبدأ شاشات الترحيب من جديد.';

  @override
  String get cancel => 'إلغاء';

  @override
  String get writeToDeveloper => 'مراسلة المطوّر';

  @override
  String get addressCopied => 'تم نسخ العنوان';

  @override
  String get emailFieldLabel => 'البريد الإلكتروني';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'إعادة تعيين';

  @override
  String get loadCalendarError => 'تعذّر تحميل التقويم';

  @override
  String get persistError => 'تعذّر حفظ البيانات';

  @override
  String get pdfExportError => 'تعذّر إعداد ملف PDF';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get dayN => 'يوم';

  @override
  String dayNumber(int n) => 'اليوم $n';

  @override
  String get periodActive => 'الحيض مستمر';

  @override
  String delayDays(int n) => 'تأخير $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => '$n ${pluralDays(n)} حتى الحيض';

  @override
  String pluralDays(int count) => count == 1 ? 'يوم' : 'أيام';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'الحيض',
      CyclePhase.follicular => 'المرحلة الجريبية',
      CyclePhase.fertile => 'نافذة الخصوبة',
      CyclePhase.ovulation => 'الإباضة',
      CyclePhase.luteal => 'المرحلة الصفراوية',
      CyclePhase.late => 'دورة متأخرة',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'ارتحي إذا احتجتِ واعتني بنفسكِ.',
      CyclePhase.follicular => 'عادةً تزداد طاقتكِ.',
      CyclePhase.fertile => 'احتمال الحمل أعلى.',
      CyclePhase.ovulation => 'اليوم المتوقع للإباضة.',
      CyclePhase.luteal => 'يمكنكِ التمهّل والاستماع إلى جسدكِ.',
      CyclePhase.late => 'الدورة أطول من المعتاد — سجّلي بداية الحيض عند بدئه.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'رائعة',
      Mood.good => 'جيدة',
      Mood.okay => 'عادية',
      Mood.low => 'حزينة',
      Mood.irritable => 'متضايقة',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'صداع',
      Symptom.tenderBreasts => 'ألم في الثدي',
      Symptom.backache => 'ألم في الظهر',
      Symptom.acne => 'مشاكل في البشرة',
      Symptom.abdominalPain => 'ألم في البطن',
      Symptom.bloating => 'انتفاخ',
      Symptom.cramps => 'تقلصات',
      Symptom.fatigue => 'تعب',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'خفيف',
      FlowIntensity.medium => 'متوسط',
      FlowIntensity.heavy => 'غزير',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'لا توجد بيانات كافية بعد',
      CycleRegularity.stable => 'دورة منتظمة',
      CycleRegularity.mild => 'تغيرات بسيطة',
      CycleRegularity.irregular => 'الدورة غير منتظمة حتى الآن',
    };
  }

  @override
  String get period => 'الحيض';

  @override
  String get flow => 'الإفرازات';

  @override
  String get mood => 'المزاج';

  @override
  String get wellbeing => 'الشعور العام';

  @override
  String get noteHint => 'ملاحظة';

  @override
  String get noteHintShort => 'ملاحظة قصيرة إذا رغبتِ';

  @override
  String get save => 'حفظ';

  @override
  String get calendarTitle => 'التقويم';

  @override
  String get legendPeriod => 'الحيض';

  @override
  String get legendForecast => 'التوقع';

  @override
  String get legendFertile => 'أيام الخصوبة';

  @override
  String get legendOvulation => 'الإباضة';

  @override
  String get statsTitle => 'الدورات';

  @override
  String get statsCycleLength => 'طول الدورة';

  @override
  String get statsPeriodDuration => 'الحيض';

  @override
  String get statsRecentCycles => 'الدورات الأخيرة';

  @override
  String get statsEmptyHistory => 'سجّلي الحيض — سيظهر السجل هنا.';

  @override
  String get statsCurrentCycle => 'الدورة الحالية';

  @override
  String get exportDoctorPdf => 'تصدير للطبيب';

  @override
  String get exportDoctorPdfLoading => 'جارٍ إعداد PDF…';

  @override
  String get exportDoctorPdfHint =>
      'يمكنكِ إرسال الملف إلى الطبيب. حتى تشاركي ملف PDF تبقى البيانات على هذا الجهاز.';

  @override
  String get legalDocumentLoadError => 'تعذّر تحميل المستند.';

  @override
  String get onboardingWelcomeTitle => 'تقويم هادئ لكِ';

  @override
  String get onboardingWelcomeBody =>
      'سجّلي الحيض بلمسة واحدة. تبقى التوقعات والإباضة والشعور العام على هذا الجهاز فقط.';

  @override
  String get onboardingDateTitle => 'متى بدأت آخر دورة شهرية؟';

  @override
  String get pickDate => 'اختيار التاريخ';

  @override
  String get datePickerHelp => 'بداية آخر حيض';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get onboardingBack => 'رجوع';

  @override
  String get onboardingStart => 'لنبدأ';

  @override
  String get aboutPhasesTitle => 'كيف تُحسب المراحل';

  @override
  String get aboutPhasesBody1 =>
      'تُبنى دورتكِ من أيامكِ المسجّلة: أيام الحيض المتتالية تُعدّ دورة واحدة. يُحسب متوسط طول الدورة ومدة الحيض من آخر 6 دورات؛ وإذا كان السجل قصيرًا تُستخدم القيم من الإعدادات.';

  @override
  String get aboutPhasesBody2 =>
      'الإباضة: طول الدورة ناقص 14 يومًا من بداية الدورة. نافذة الخصوبة: 5 أيام قبل الإباضة ويوم واحد بعدها. توقع الحيض القادم: بداية آخر دورة زائد متوسط الطول.';

  @override
  String get aboutPhasesBody3 =>
      'المراحل إرشادية وليست تشخيصًا طبيًا. التطبيق لا يُغني عن استشارة الطبيب ولا يُعد وسيلة لمنع الحمل. تبقى البيانات على هذا الجهاز فقط.';

  @override
  String get legalSectionTitle => 'المستندات القانونية';

  @override
  String get allMoiSoftApps => 'جميع تطبيقات MoiSoft';

  @override
  String get privacyPolicyTitle => 'سياسة الخصوصية';

  @override
  String get userAgreementTitle => 'اتفاقية المستخدم';

  @override
  String get publicOfferTitle => 'العرض العام';

  @override
  String get consentPdTitle => 'الموافقة على معالجة البيانات الشخصية';

  @override
  String get versionLabel => 'الإصدار';

  @override
  String get reminderNotificationBody => 'بحسب التوقع قد يبدأ الحيض غدًا.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) => 'تصدير للطبيب — $dateKey';

  @override
  String get pdfDisclaimer =>
      'أُعدّ هذا المستند من سجلات المستخدمة على الجهاز. وهو ليس تقريرًا طبيًا ولا تشخيصًا.';

  @override
  String get pdfSectionCycles => 'الدورات';

  @override
  String get pdfSectionDiary => 'اليوميات';

  @override
  String get pdfSummaryRegularity => 'الانتظام';

  @override
  String get pdfCyclesEmpty => 'لم تُسجّل أي دورات بعد.';

  @override
  String get pdfDiaryEmpty => 'لا توجد سجلات يوميات لهذه الفترة.';

  @override
  String get pdfColStart => 'البداية';

  @override
  String get pdfColEnd => 'النهاية';

  @override
  String get pdfColPeriodDays => 'الحيض';

  @override
  String get pdfColCycleLength => 'طول الدورة';

  @override
  String get pdfColDate => 'التاريخ';

  @override
  String get pdfColNote => 'ملاحظة';

  @override
  String get pdfYes => 'نعم';

  @override
  String get pdfNo => 'لا';

  @override
  String get pdfCurrentCycleShort => 'الحالية';

  @override
  String get pdfDiaryContinuation => 'اليوميات (تتمة)';

  @override
  String pdfPageFooter(int page, int pages) => 'صفحة $page من $pages';

  @override
  String get pdfShareSubject => 'تقويم الدورة الشهرية: تصدير للطبيب';

  @override
  String get premiumBuyTitle => 'شراء النسخة المميزة';

  @override
  String get premiumAfterPaymentHint =>
      'بعد الدفع تُزال جميع الإعلانات. احفظي رقم الطلب.';

  @override
  String get premiumPaySbp => 'الدفع عبر SBP';

  @override
  String get premiumPayRustore => 'الدفع عبر RuStore';

  @override
  String get premiumConsentPrefix => 'أوافق على ';

  @override
  String get premiumConsentOfferLink => 'العرض العام';

  @override
  String get premiumConsentAnd => ' و';

  @override
  String get premiumConsentPdLink => 'الموافقة على معالجة البيانات الشخصية';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'تعذّر فتح صفحة الدفع';

  @override
  String get premiumRustoreUnavailable =>
      'الدفع عبر RuStore غير متاح. ثبّتي تطبيق RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'تم تفعيل النسخة المميزة. تم إيقاف الإعلانات.';

  @override
  String get premiumPurchaseFailed => 'فشلت عملية الشراء. جرّبي لاحقًا.';

  @override
  String get premiumActiveLabel => 'النسخة المميزة مفعّلة. الإعلانات متوقفة.';

  @override
  String get premiumRestoreButton => 'استعادة الشراء';

  @override
  String get premiumRestoreTitle => 'استعادة الشراء';

  @override
  String get premiumRestoreBody =>
      'أدخلي رقم الطلب من الإيصال أو من الشاشة التي ظهرت بعد الدفع.';

  @override
  String get premiumOrderIdLabel => 'رقم الطلب';

  @override
  String premiumRestoreSupportLine(String email) =>
      'إذا فقدتِ الرقم فاكتبي إلى $email';

  @override
  String get premiumRestoreAction => 'استعادة';

  @override
  String get premiumRestoreViaRustore => 'الاستعادة عبر RuStore';

  @override
  String get premiumEnterOrderId => 'أدخلي رقم الطلب';

  @override
  String get premiumRestoreSuccess =>
      'تمت استعادة الشراء. تم تفعيل النسخة المميزة.';

  @override
  String get premiumRestoreNotFound =>
      'لم يُعثر على الدفعة أو أنها لم تكن ناجحة. تحققي من رقم الطلب.';

  @override
  String get premiumRestoreCheckFailed => 'تعذّر التحقق من الدفعة';

  @override
  String get premiumRestoreRustoreSuccess =>
      'تمت استعادة شراء RuStore. تم تفعيل النسخة المميزة.';

  @override
  String get premiumRestoreRustoreNotFound => 'لا يوجد شراء نشط عبر RuStore.';

  @override
  String get premiumRestoreRustoreFailed => 'تعذّرت استعادة الشراء عبر RuStore';

  @override
  String get premiumPaymentDescription => 'النسخة المميزة: بدون إعلانات';

  @override
  String get paymentOpeningBank => 'جارٍ فتح صفحة الدفع عبر T-Bank…';

  @override
  String get paymentOpenFormFailed => 'تعذّر فتح نموذج الدفع.';

  @override
  String get paymentReturnHint =>
      'بعد الدفع عودي إلى التطبيق. ستتحدّث الحالة تلقائيًا.';

  @override
  String get paymentWaiting => 'في انتظار الدفع…';

  @override
  String paymentBankStatus(String status) => 'الحالة: $status';

  @override
  String get paymentSuccess => 'تم الدفع بنجاح';

  @override
  String get paymentNotCompleted => 'لم تكتمل عملية الدفع';

  @override
  String get paymentFailedTitle => 'فشل الدفع';

  @override
  String get paymentFailedBody =>
      'جرّبي مرة أخرى أو استخدمي طريقة دفع أخرى في تطبيق بنككِ.';

  @override
  String get paymentGotIt => 'حسنًا';

  @override
  String get paymentPremiumActivatedTitle => 'تم تفعيل النسخة المميزة';

  @override
  String get paymentSaveOrderHint =>
      'احفظي رقم الطلب — ستحتاجينه لاستعادة الشراء.';

  @override
  String paymentSheetTitle(int rubles) => 'الدفع $rubles ₽';

  @override
  String get paymentOrderCopied => 'تم نسخ رقم الطلب';

  @override
  String get paymentSessionNotFound => 'لم يُعثر على جلسة الدفع';

  @override
  String get paymentCopyOrder => 'نسخ';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
