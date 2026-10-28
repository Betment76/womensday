import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Вьетнамская локализация: строки интерфейса для языка `vi`.
/// Структура повторяет [AppLocalizationsEn], интерполяции сохранены точь-в-точь.
class AppLocalizationsVi extends AppLocalizations {
  @override
  String get languageCode => 'vi';

  @override
  String get appName => 'Lịch Kinh Nguyệt & Chu Kỳ';

  @override
  String get appSubtitle => 'Lịch chu kỳ';

  @override
  String get navToday => 'Hôm nay';

  @override
  String get navCalendar => 'Lịch';

  @override
  String get navStats => 'Chu kỳ';

  @override
  String get navSettings => 'Thêm';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get cycleLengthLabel => 'Độ dài chu kỳ thông thường';

  @override
  String get periodDurationLabel => 'Số ngày có kinh';

  @override
  String get daysUnit => 'ngày';

  @override
  String get reminderTitle => 'Nhắc nhở';

  @override
  String get reminderSubtitle => 'Một ngày trước ngày dự kiến có kinh';

  @override
  String get languageTitle => 'Ngôn ngữ';

  @override
  String get aboutTitle => 'Giới thiệu';

  @override
  String get aboutSubtitle => 'Giai đoạn chu kỳ và tài liệu pháp lý';

  @override
  String get resetData => 'Xóa tất cả dữ liệu';

  @override
  String get resetDialogTitle => 'Xóa dữ liệu?';

  @override
  String get resetDialogBody =>
      'Lịch, ghi chú và cài đặt sẽ bị xóa. Ứng dụng sẽ quay lại màn hình chào mừng.';

  @override
  String get cancel => 'Hủy';

  @override
  String get writeToDeveloper => 'Liên hệ nhà phát triển';

  @override
  String get addressCopied => 'Đã sao chép địa chỉ';

  @override
  String get emailFieldLabel => 'Email';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Xóa';

  @override
  String get loadCalendarError => 'Không thể tải lịch';

  @override
  String get persistError => 'Không thể lưu dữ liệu';

  @override
  String get pdfExportError => 'Không thể tạo PDF';

  @override
  String get retry => 'Thử lại';

  @override
  String get dayN => 'Ngày';

  @override
  String dayNumber(int n) => 'Ngày $n';

  @override
  String get periodActive => 'Đang có kinh';

  @override
  String delayDays(int n) => 'Trễ $n ngày';

  @override
  String daysUntilPeriod(int n) => 'Còn $n ngày đến kỳ';

  @override
  String pluralDays(int count) => 'ngày';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Kỳ kinh nguyệt',
      CyclePhase.follicular => 'Giai đoạn nang noãn',
      CyclePhase.fertile => 'Cửa sổ thụ thai',
      CyclePhase.ovulation => 'Rụng trứng',
      CyclePhase.luteal => 'Giai đoạn hoàng thể',
      CyclePhase.late => 'Trễ kinh',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Hãy nghỉ ngơi nếu bạn cần.',
      CyclePhase.follicular => 'Năng lượng thường tăng lên.',
      CyclePhase.fertile => 'Khả năng thụ thai cao hơn.',
      CyclePhase.ovulation => 'Ngày rụng trứng dự kiến.',
      CyclePhase.luteal => 'Hãy chậm lại và lắng nghe cơ thể mình.',
      CyclePhase.late =>
        'Chu kỳ dài hơn thường lệ — hãy ghi lại khi kỳ kinh bắt đầu.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Tuyệt vời',
      Mood.good => 'Tốt',
      Mood.okay => 'Bình thường',
      Mood.low => 'Buồn',
      Mood.irritable => 'Dễ cáu gắt',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Đau đầu',
      Symptom.tenderBreasts => 'Đau tức ngực',
      Symptom.backache => 'Đau lưng',
      Symptom.acne => 'Da nổi mụn',
      Symptom.abdominalPain => 'Đau bụng',
      Symptom.bloating => 'Chướng bụng',
      Symptom.cramps => 'Đau quặn',
      Symptom.fatigue => 'Mệt mỏi',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Ít',
      FlowIntensity.medium => 'Vừa',
      FlowIntensity.heavy => 'Nhiều',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Chưa đủ dữ liệu',
      CycleRegularity.stable => 'Chu kỳ ổn định',
      CycleRegularity.mild => 'Dao động nhẹ',
      CycleRegularity.irregular => 'Chu kỳ chưa đều',
    };
  }

  @override
  String get period => 'Kỳ kinh';

  @override
  String get flow => 'Lượng kinh';

  @override
  String get mood => 'Tâm trạng';

  @override
  String get wellbeing => 'Sức khỏe';

  @override
  String get noteHint => 'Ghi chú';

  @override
  String get noteHintShort => 'Ghi chú ngắn nếu cần';

  @override
  String get save => 'Lưu';

  @override
  String get calendarTitle => 'Lịch';

  @override
  String get legendPeriod => 'Kỳ kinh';

  @override
  String get legendForecast => 'Dự đoán';

  @override
  String get legendFertile => 'Thụ thai';

  @override
  String get legendOvulation => 'Rụng trứng';

  @override
  String get statsTitle => 'Chu kỳ';

  @override
  String get statsCycleLength => 'Độ dài chu kỳ';

  @override
  String get statsPeriodDuration => 'Kỳ kinh';

  @override
  String get statsRecentCycles => 'Chu kỳ gần đây';

  @override
  String get statsEmptyHistory =>
      'Ghi lại kỳ kinh của bạn — lịch sử sẽ xuất hiện tại đây.';

  @override
  String get statsCurrentCycle => 'chu kỳ hiện tại';

  @override
  String get exportDoctorPdf => 'Xuất cho bác sĩ';

  @override
  String get exportDoctorPdfLoading => 'Đang tạo PDF…';

  @override
  String get exportDoctorPdfHint =>
      'Bạn có thể gửi tệp cho bác sĩ. Cho đến khi bạn chia sẻ PDF, dữ liệu vẫn nằm trên thiết bị này.';

  @override
  String get legalDocumentLoadError => 'Không thể tải tài liệu.';

  @override
  String get onboardingWelcomeTitle => 'Lịch yên bình dành riêng cho bạn';

  @override
  String get onboardingWelcomeBody =>
      'Ghi lại kỳ kinh chỉ với một chạm. Dự đoán, rụng trứng và sức khỏe của bạn chỉ được lưu trên thiết bị này.';

  @override
  String get onboardingDateTitle => 'Kỳ kinh gần nhất của bạn bắt đầu khi nào?';

  @override
  String get pickDate => 'Chọn ngày';

  @override
  String get datePickerHelp => 'Ngày bắt đầu kỳ kinh gần nhất';

  @override
  String get onboardingNext => 'Tiếp';

  @override
  String get onboardingBack => 'Quay lại';

  @override
  String get onboardingStart => 'Bắt đầu';

  @override
  String get aboutPhasesTitle => 'Cách tính các giai đoạn';

  @override
  String get aboutPhasesBody1 =>
      'Chu kỳ được tính từ các ngày bạn ghi lại: những ngày có kinh liên tiếp tạo thành một chu kỳ. Độ dài chu kỳ trung bình và số ngày có kinh được tính theo 6 chu kỳ gần nhất; nếu chưa có đủ lịch sử, ứng dụng dùng giá trị trong cài đặt.';

  @override
  String get aboutPhasesBody2 =>
      'Rụng trứng: độ dài chu kỳ trừ 14 ngày kể từ ngày bắt đầu chu kỳ. Cửa sổ thụ thai: 5 ngày trước rụng trứng và 1 ngày sau. Dự đoán kỳ kinh tiếp theo: ngày bắt đầu chu kỳ gần nhất cộng độ dài trung bình.';

  @override
  String get aboutPhasesBody3 =>
      'Các giai đoạn chỉ mang tính tham khảo, không phải chẩn đoán y khoa. Ứng dụng không thay thế bác sĩ và không phải là biện pháp tránh thai. Dữ liệu chỉ được lưu trên thiết bị này.';

  @override
  String get legalSectionTitle => 'Tài liệu pháp lý';

  @override
  String get allMoiSoftApps => 'Tất cả ứng dụng MoiSoft';

  @override
  String get privacyPolicyTitle => 'Chính sách bảo mật';

  @override
  String get userAgreementTitle => 'Thoả thuận người dùng';

  @override
  String get publicOfferTitle => 'Đề nghị công khai';

  @override
  String get consentPdTitle => 'Đồng ý xử lý dữ liệu cá nhân';

  @override
  String get versionLabel => 'Phiên bản';

  @override
  String get reminderNotificationBody =>
      'Theo dự đoán, kỳ kinh của bạn có thể bắt đầu vào ngày mai.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Xuất cho bác sĩ — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Tài liệu được tạo từ dữ liệu người dùng trên thiết bị. Đây không phải báo cáo hay chẩn đoán y khoa.';

  @override
  String get pdfSectionCycles => 'Chu kỳ';

  @override
  String get pdfSectionDiary => 'Nhật ký';

  @override
  String get pdfSummaryRegularity => 'Độ đều';

  @override
  String get pdfCyclesEmpty => 'Chưa ghi lại chu kỳ nào.';

  @override
  String get pdfDiaryEmpty =>
      'Không có ghi chú nào trong nhật ký cho giai đoạn này.';

  @override
  String get pdfColStart => 'Bắt đầu';

  @override
  String get pdfColEnd => 'Kết thúc';

  @override
  String get pdfColPeriodDays => 'Kỳ kinh';

  @override
  String get pdfColCycleLength => 'Độ dài chu kỳ';

  @override
  String get pdfColDate => 'Ngày';

  @override
  String get pdfColNote => 'Ghi chú';

  @override
  String get pdfYes => 'có';

  @override
  String get pdfNo => 'không';

  @override
  String get pdfCurrentCycleShort => 'hiện tại';

  @override
  String get pdfDiaryContinuation => 'Nhật ký (tiếp theo)';

  @override
  String pdfPageFooter(int page, int pages) => 'Trang $page/$pages';

  @override
  String get pdfShareSubject => 'Lịch Kinh Nguyệt & Chu Kỳ: xuất cho bác sĩ';

  @override
  String get premiumBuyTitle => 'Mua bản Premium';

  @override
  String get premiumAfterPaymentHint =>
      'Sau khi thanh toán, tất cả quảng cáo sẽ bị xóa. Hãy lưu số đơn hàng của bạn.';

  @override
  String get premiumPaySbp => 'Thanh toán qua SBP';

  @override
  String get premiumPayRustore => 'Thanh toán trong RuStore';

  @override
  String get premiumConsentPrefix => 'Tôi đồng ý với ';

  @override
  String get premiumConsentOfferLink => 'đề nghị công khai';

  @override
  String get premiumConsentAnd => ' và ';

  @override
  String get premiumConsentPdLink => 'việc xử lý dữ liệu cá nhân';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Không thể mở thanh toán';

  @override
  String get premiumRustoreUnavailable =>
      'Thanh toán RuStore không khả dụng. Hãy cài đặt RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'Đã kích hoạt Premium. Quảng cáo đã bị tắt.';

  @override
  String get premiumPurchaseFailed =>
      'Mua không thành công. Vui lòng thử lại sau.';

  @override
  String get premiumActiveLabel => 'Premium đang hoạt động. Quảng cáo đã tắt.';

  @override
  String get premiumRestoreButton => 'Khôi phục giao dịch mua';

  @override
  String get premiumRestoreTitle => 'Khôi phục giao dịch mua';

  @override
  String get premiumRestoreBody =>
      'Nhập số đơn hàng từ biên lai hoặc màn hình sau khi thanh toán.';

  @override
  String get premiumOrderIdLabel => 'Số đơn hàng';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Nếu mất số đơn hàng, hãy liên hệ $email';

  @override
  String get premiumRestoreAction => 'Khôi phục';

  @override
  String get premiumRestoreViaRustore => 'Khôi phục qua RuStore';

  @override
  String get premiumEnterOrderId => 'Nhập số đơn hàng';

  @override
  String get premiumRestoreSuccess =>
      'Đã khôi phục giao dịch mua. Premium đã được kích hoạt.';

  @override
  String get premiumRestoreNotFound =>
      'Không tìm thấy thanh toán hoặc thanh toán không thành công. Vui lòng kiểm tra số đơn hàng.';

  @override
  String get premiumRestoreCheckFailed => 'Không thể kiểm tra thanh toán';

  @override
  String get premiumRestoreRustoreSuccess =>
      'Đã khôi phục giao dịch RuStore. Premium đã được kích hoạt.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Không tìm thấy giao dịch RuStore nào đang hoạt động.';

  @override
  String get premiumRestoreRustoreFailed =>
      'Không thể khôi phục giao dịch RuStore';

  @override
  String get premiumPaymentDescription => 'Premium: không quảng cáo';

  @override
  String get paymentOpeningBank => 'Đang mở trang thanh toán T-Bank…';

  @override
  String get paymentOpenFormFailed => 'Không thể mở biểu mẫu thanh toán.';

  @override
  String get paymentReturnHint =>
      'Sau khi thanh toán, hãy quay lại ứng dụng. Trạng thái sẽ tự động cập nhật.';

  @override
  String get paymentWaiting => 'Đang chờ thanh toán…';

  @override
  String paymentBankStatus(String status) => 'Trạng thái: $status';

  @override
  String get paymentSuccess => 'Thanh toán thành công';

  @override
  String get paymentNotCompleted => 'Thanh toán chưa hoàn tất';

  @override
  String get paymentFailedTitle => 'Thanh toán thất bại';

  @override
  String get paymentFailedBody =>
      'Vui lòng thử lại hoặc dùng phương thức thanh toán khác trong ứng dụng ngân hàng của bạn.';

  @override
  String get paymentGotIt => 'Đã hiểu';

  @override
  String get paymentPremiumActivatedTitle => 'Đã kích hoạt Premium';

  @override
  String get paymentSaveOrderHint =>
      'Hãy lưu số đơn hàng — bạn cần nó để khôi phục giao dịch mua.';

  @override
  String paymentSheetTitle(int rubles) => 'Thanh toán $rubles ₽';

  @override
  String get paymentOrderCopied => 'Đã sao chép số đơn hàng';

  @override
  String get paymentSessionNotFound => 'Không tìm thấy phiên thanh toán';

  @override
  String get paymentCopyOrder => 'Sao chép';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
