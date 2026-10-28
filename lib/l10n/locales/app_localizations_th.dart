import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Тайская локализация: строки интерфейса для языка `th`.
/// Структура повторяет [AppLocalizationsEn], интерполяции сохранены точь-в-точь.
class AppLocalizationsTh extends AppLocalizations {
  @override
  String get languageCode => 'th';

  @override
  String get appName => 'ปฏิทินประจำเดือน';

  @override
  String get appSubtitle => 'ปฏิทินรอบเดือน';

  @override
  String get navToday => 'วันนี้';

  @override
  String get navCalendar => 'ปฏิทิน';

  @override
  String get navStats => 'รอบเดือน';

  @override
  String get navSettings => 'อื่น ๆ';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get cycleLengthLabel => 'ความยาวรอบเดือนปกติ';

  @override
  String get periodDurationLabel => 'ระยะเวลาที่มีประจำเดือน';

  @override
  String get daysUnit => 'วัน';

  @override
  String get reminderTitle => 'การแจ้งเตือน';

  @override
  String get reminderSubtitle => 'หนึ่งวันก่อนวันคาดว่าจะมีประจำเดือน';

  @override
  String get languageTitle => 'ภาษา';

  @override
  String get aboutTitle => 'เกี่ยวกับ';

  @override
  String get aboutSubtitle => 'ระยะของรอบเดือนและเอกสารทางกฎหมาย';

  @override
  String get resetData => 'ล้างข้อมูลทั้งหมด';

  @override
  String get resetDialogTitle => 'ล้างข้อมูลหรือไม่?';

  @override
  String get resetDialogBody =>
      'ปฏิทิน บันทึก และการตั้งค่าจะถูกลบ และแอปจะกลับไปเริ่มต้นใหม่';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get writeToDeveloper => 'ติดต่อนักพัฒนา';

  @override
  String get addressCopied => 'คัดลอกที่อยู่แล้ว';

  @override
  String get emailFieldLabel => 'อีเมล';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'ล้างข้อมูล';

  @override
  String get loadCalendarError => 'โหลดปฏิทินไม่สำเร็จ';

  @override
  String get persistError => 'บันทึกข้อมูลไม่สำเร็จ';

  @override
  String get pdfExportError => 'สร้าง PDF ไม่สำเร็จ';

  @override
  String get retry => 'ลองอีกครั้ง';

  @override
  String get dayN => 'วัน';

  @override
  String dayNumber(int n) => 'วันที่ $n';

  @override
  String get periodActive => 'กำลังมีประจำเดือน';

  @override
  String delayDays(int n) => 'ล่าช้า $n วัน';

  @override
  String daysUntilPeriod(int n) => 'อีก $n วันจะมีประจำเดือน';

  @override
  String pluralDays(int count) => 'วัน';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'ประจำเดือน',
      CyclePhase.follicular => 'ระยะฟอลลิคูลาร์',
      CyclePhase.fertile => 'ช่วงมีโอกาสตั้งครรภ์',
      CyclePhase.ovulation => 'การตกไข่',
      CyclePhase.luteal => 'ระยะลูทีอัล',
      CyclePhase.late => 'รอบเดือนล่าช้า',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'พักผ่อนตามที่ร่างกายต้องการเลย',
      CyclePhase.follicular => 'พลังงานมักจะเพิ่มขึ้น',
      CyclePhase.fertile => 'โอกาสตั้งครรภ์สูงขึ้น',
      CyclePhase.ovulation => 'วันตกไข่โดยประมาณ',
      CyclePhase.luteal => 'ช้าลงและฟังเสียงร่างกายของตัวเอง',
      CyclePhase.late => 'รอบนี้ยาวกว่าปกติ — บันทึกเมื่อเริ่มมีประจำเดือน',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'เยี่ยมมาก',
      Mood.good => 'ดี',
      Mood.okay => 'ปกติ',
      Mood.low => 'เศร้า',
      Mood.irritable => 'หงุดหงิด',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'ปวดหัว',
      Symptom.tenderBreasts => 'เต้านมตึงปวด',
      Symptom.backache => 'ปวดหลัง',
      Symptom.acne => 'ผิวออกสิว',
      Symptom.abdominalPain => 'ปวดท้อง',
      Symptom.bloating => 'ท้องอืด',
      Symptom.cramps => 'ปวดเกร็ง',
      Symptom.fatigue => 'อ่อนเพลีย',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'น้อย',
      FlowIntensity.medium => 'ปานกลาง',
      FlowIntensity.heavy => 'มาก',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'ยังมีข้อมูลไม่พอ',
      CycleRegularity.stable => 'รอบเดือนสม่ำเสมอ',
      CycleRegularity.mild => 'ผันผวนเล็กน้อย',
      CycleRegularity.irregular => 'รอบเดือนยังไม่สม่ำเสมอ',
    };
  }

  @override
  String get period => 'ประจำเดือน';

  @override
  String get flow => 'ปริมาณเลือด';

  @override
  String get mood => 'อารมณ์';

  @override
  String get wellbeing => 'สุขภาพ';

  @override
  String get noteHint => 'บันทึก';

  @override
  String get noteHintShort => 'บันทึกสั้น ๆ ถ้าต้องการ';

  @override
  String get save => 'บันทึก';

  @override
  String get calendarTitle => 'ปฏิทิน';

  @override
  String get legendPeriod => 'ประจำเดือน';

  @override
  String get legendForecast => 'คาดการณ์';

  @override
  String get legendFertile => 'โอกาสตั้งครรภ์';

  @override
  String get legendOvulation => 'การตกไข่';

  @override
  String get statsTitle => 'รอบเดือน';

  @override
  String get statsCycleLength => 'ความยาวรอบเดือน';

  @override
  String get statsPeriodDuration => 'ประจำเดือน';

  @override
  String get statsRecentCycles => 'รอบเดือนล่าสุด';

  @override
  String get statsEmptyHistory =>
      'บันทึกประจำเดือนของคุณ — ประวัติจะปรากฏที่นี่';

  @override
  String get statsCurrentCycle => 'รอบเดือนปัจจุบัน';

  @override
  String get exportDoctorPdf => 'ส่งออกให้แพทย์';

  @override
  String get exportDoctorPdfLoading => 'กำลังสร้าง PDF…';

  @override
  String get exportDoctorPdfHint =>
      'ส่งไฟล์ให้แพทย์ได้ ข้อมูลจะอยู่บนอุปกรณ์นี้จนกว่าคุณจะแชร์ PDF';

  @override
  String get legalDocumentLoadError => 'โหลดเอกสารไม่สำเร็จ';

  @override
  String get onboardingWelcomeTitle => 'ปฏิทินส่วนตัวสำหรับคุณ';

  @override
  String get onboardingWelcomeBody =>
      'บันทึกประจำเดือนเพียงแตะเดียว การคาดการณ์ การตกไข่ และสุขภาพจะอยู่บนอุปกรณ์นี้เท่านั้น';

  @override
  String get onboardingDateTitle => 'ประจำเดือนครั้งล่าสุดเริ่มเมื่อไหร่?';

  @override
  String get pickDate => 'เลือกวันที่';

  @override
  String get datePickerHelp => 'วันเริ่มประจำเดือนครั้งล่าสุด';

  @override
  String get onboardingNext => 'ถัดไป';

  @override
  String get onboardingBack => 'ย้อนกลับ';

  @override
  String get onboardingStart => 'เริ่มใช้งาน';

  @override
  String get aboutPhasesTitle => 'ระยะต่าง ๆ คำนวณอย่างไร';

  @override
  String get aboutPhasesBody1 =>
      'รอบเดือนคำนวณจากวันที่คุณบันทึก: วันมีประจำเดือนติดต่อกันนับเป็นหนึ่งรอบ ความยาวรอบเฉลี่ยและจำนวนวันที่มีประจำเดือนคำนวณจาก 6 รอบล่าสุด ถ้าประวัติยังน้อย จะใช้ค่าจากการตั้งค่า';

  @override
  String get aboutPhasesBody2 =>
      'การตกไข่: ความยาวรอบเดือนลบ 14 วันนับจากวันเริ่มรอบ ช่วงมีโอกาสตั้งครรภ์: 5 วันก่อนตกไข่และ 1 วันหลังตกไข่ การคาดการณ์ประจำเดือนครั้งถัดไป: วันเริ่มรอบล่าสุดบวกความยาวเฉลี่ย';

  @override
  String get aboutPhasesBody3 =>
      'ระยะต่าง ๆ เป็นเพียงแนวทาง ไม่ใช่การวินิจฉัยทางการแพทย์ แอปไม่ทดแทนการปรึกษาแพทย์และไม่ใช่วิธีคุมกำเนิด ข้อมูลจะอยู่บนอุปกรณ์นี้เท่านั้น';

  @override
  String get legalSectionTitle => 'เอกสารทางกฎหมาย';

  @override
  String get allMoiSoftApps => 'แอปทั้งหมดของ MoiSoft';

  @override
  String get privacyPolicyTitle => 'นโยบายความเป็นส่วนตัว';

  @override
  String get userAgreementTitle => 'ข้อตกลงการใช้งาน';

  @override
  String get publicOfferTitle => 'ข้อเสนอสาธารณะ';

  @override
  String get consentPdTitle => 'ความยินยอมเกี่ยวกับข้อมูลส่วนบุคคล';

  @override
  String get versionLabel => 'เวอร์ชัน';

  @override
  String get reminderNotificationBody =>
      'ตามการคาดการณ์ ประจำเดือนอาจเริ่มในวันพรุ่งนี้';

  @override
  String pdfDoctorExportSubtitle(String dateKey) => 'ส่งออกให้แพทย์ — $dateKey';

  @override
  String get pdfDisclaimer =>
      'เอกสารนี้สร้างจากบันทึกของผู้ใช้บนอุปกรณ์ ไม่ใช่รายงานหรือการวินิจฉัยทางการแพทย์';

  @override
  String get pdfSectionCycles => 'รอบเดือน';

  @override
  String get pdfSectionDiary => 'สมุดบันทึก';

  @override
  String get pdfSummaryRegularity => 'ความสม่ำเสมอ';

  @override
  String get pdfCyclesEmpty => 'ยังไม่มีการบันทึกรอบเดือน';

  @override
  String get pdfDiaryEmpty => 'ไม่มีบันทึกในสมุดบันทึกสำหรับช่วงนี้';

  @override
  String get pdfColStart => 'เริ่ม';

  @override
  String get pdfColEnd => 'สิ้นสุด';

  @override
  String get pdfColPeriodDays => 'ประจำเดือน';

  @override
  String get pdfColCycleLength => 'ความยาวรอบเดือน';

  @override
  String get pdfColDate => 'วันที่';

  @override
  String get pdfColNote => 'บันทึก';

  @override
  String get pdfYes => 'มี';

  @override
  String get pdfNo => 'ไม่มี';

  @override
  String get pdfCurrentCycleShort => 'ปัจจุบัน';

  @override
  String get pdfDiaryContinuation => 'สมุดบันทึก (ต่อ)';

  @override
  String pdfPageFooter(int page, int pages) => 'หน้า $page/$pages';

  @override
  String get pdfShareSubject => 'ปฏิทินประจำเดือน: ส่งออกให้แพทย์';

  @override
  String get premiumBuyTitle => 'ซื้อพรีเมียม';

  @override
  String get premiumAfterPaymentHint =>
      'หลังชำระเงิน โฆษณาทั้งหมดจะถูกปิด อย่าลืมบันทึกหมายเลขคำสั่งซื้อ';

  @override
  String get premiumPaySbp => 'ชำระผ่าน SBP';

  @override
  String get premiumPayRustore => 'ชำระผ่าน RuStore';

  @override
  String get premiumConsentPrefix => 'ฉันยอมรับ';

  @override
  String get premiumConsentOfferLink => 'ข้อเสนอสาธารณะ';

  @override
  String get premiumConsentAnd => ' และ ';

  @override
  String get premiumConsentPdLink => 'ความยินยอมเกี่ยวกับข้อมูลส่วนบุคคล';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'เปิดการชำระเงินไม่สำเร็จ';

  @override
  String get premiumRustoreUnavailable =>
      'การชำระเงินผ่าน RuStore ใช้ไม่ได้ กรุณาติดตั้ง RuStore';

  @override
  String get premiumActivatedAdsOff => 'เปิดใช้พรีเมียมแล้ว ปิดโฆษณาแล้ว';

  @override
  String get premiumPurchaseFailed => 'ซื้อไม่สำเร็จ ลองอีกครั้งภายหลัง';

  @override
  String get premiumActiveLabel => 'พรีเมียมใช้งานอยู่ ปิดโฆษณาแล้ว';

  @override
  String get premiumRestoreButton => 'กู้คืนการซื้อ';

  @override
  String get premiumRestoreTitle => 'กู้คืนการซื้อ';

  @override
  String get premiumRestoreBody =>
      'กรอกหมายเลขคำสั่งซื้อจากใบเสร็จหรือหน้าจอหลังชำระเงิน';

  @override
  String get premiumOrderIdLabel => 'หมายเลขคำสั่งซื้อ';

  @override
  String premiumRestoreSupportLine(String email) =>
      'หากลืมหมายเลข ติดต่อ $email ได้';

  @override
  String get premiumRestoreAction => 'กู้คืน';

  @override
  String get premiumRestoreViaRustore => 'กู้คืนผ่าน RuStore';

  @override
  String get premiumEnterOrderId => 'กรอกหมายเลขคำสั่งซื้อ';

  @override
  String get premiumRestoreSuccess => 'กู้คืนการซื้อแล้ว เปิดใช้พรีเมียมแล้ว';

  @override
  String get premiumRestoreNotFound =>
      'ไม่พบการชำระเงินหรือชำระไม่สำเร็จ กรุณาตรวจสอบหมายเลขคำสั่งซื้อ';

  @override
  String get premiumRestoreCheckFailed => 'ตรวจสอบการชำระเงินไม่สำเร็จ';

  @override
  String get premiumRestoreRustoreSuccess =>
      'กู้คืนการซื้อ RuStore แล้ว เปิดใช้พรีเมียมแล้ว';

  @override
  String get premiumRestoreRustoreNotFound =>
      'ไม่พบการซื้อ RuStore ที่ใช้งานอยู่';

  @override
  String get premiumRestoreRustoreFailed => 'กู้คืนการซื้อ RuStore ไม่สำเร็จ';

  @override
  String get premiumPaymentDescription => 'พรีเมียม: ไม่มีโฆษณา';

  @override
  String get paymentOpeningBank => 'กำลังเปิดหน้าชำระเงิน T-Bank…';

  @override
  String get paymentOpenFormFailed => 'เปิดแบบฟอร์มชำระเงินไม่สำเร็จ';

  @override
  String get paymentReturnHint =>
      'หลังชำระเงิน กลับเข้าแอปได้เลย สถานะจะอัปเดตเอง';

  @override
  String get paymentWaiting => 'กำลังรอการชำระเงิน…';

  @override
  String paymentBankStatus(String status) => 'สถานะ: $status';

  @override
  String get paymentSuccess => 'ชำระเงินสำเร็จ';

  @override
  String get paymentNotCompleted => 'การชำระเงินยังไม่เสร็จสิ้น';

  @override
  String get paymentFailedTitle => 'ชำระเงินไม่สำเร็จ';

  @override
  String get paymentFailedBody =>
      'ลองอีกครั้งหรือใช้วิธีชำระเงินอื่นในแอปธนาคารของคุณ';

  @override
  String get paymentGotIt => 'รับทราบ';

  @override
  String get paymentPremiumActivatedTitle => 'เปิดใช้พรีเมียมแล้ว';

  @override
  String get paymentSaveOrderHint =>
      'บันทึกหมายเลขคำสั่งซื้อไว้ — จำเป็นสำหรับกู้คืนการซื้อ';

  @override
  String paymentSheetTitle(int rubles) => 'ชำระเงิน $rubles ₽';

  @override
  String get paymentOrderCopied => 'คัดลอกหมายเลขคำสั่งซื้อแล้ว';

  @override
  String get paymentSessionNotFound => 'ไม่พบเซสชันการชำระเงิน';

  @override
  String get paymentCopyOrder => 'คัดลอก';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
