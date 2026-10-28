import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Корейская локализация.
class AppLocalizationsKo extends AppLocalizations {
  @override
  String get languageCode => 'ko';

  @override
  String get appName => '여성 달력 · 생리 주기 기록';

  @override
  String get appSubtitle => '주기 캘린더';

  @override
  String get navToday => '오늘';

  @override
  String get navCalendar => '캘린더';

  @override
  String get navStats => '주기';

  @override
  String get navSettings => '더보기';

  @override
  String get settingsTitle => '설정';

  @override
  String get cycleLengthLabel => '평소 주기 길이';

  @override
  String get periodDurationLabel => '생리 기간';

  @override
  String get daysUnit => '일';

  @override
  String get reminderTitle => '알림';

  @override
  String get reminderSubtitle => '예상 생리 시작 하루 전';

  @override
  String get languageTitle => '언어';

  @override
  String get aboutTitle => '앱 정보';

  @override
  String get aboutSubtitle => '주기 단계와 법적 문서';

  @override
  String get resetData => '모든 데이터 초기화';

  @override
  String get resetDialogTitle => '데이터를 초기화할까요?';

  @override
  String get resetDialogBody => '캘린더, 메모, 설정이 삭제되고 온보딩이 다시 시작돼요.';

  @override
  String get cancel => '취소';

  @override
  String get writeToDeveloper => '개발자에게 문의';

  @override
  String get addressCopied => '주소가 복사되었어요';

  @override
  String get emailFieldLabel => '이메일';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => '초기화';

  @override
  String get loadCalendarError => '캘린더를 불러올 수 없어요';

  @override
  String get persistError => '데이터를 저장할 수 없어요';

  @override
  String get pdfExportError => 'PDF를 만들 수 없어요';

  @override
  String get retry => '다시 시도';

  @override
  String get dayN => '일차';

  @override
  String dayNumber(int n) => '$n일차';

  @override
  String get periodActive => '생리 중';

  @override
  String delayDays(int n) => '$n일 지연';

  @override
  String daysUntilPeriod(int n) => '생리까지 $n일 남음';

  @override
  String pluralDays(int count) => '일';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => '생리',
      CyclePhase.follicular => '난포기',
      CyclePhase.fertile => '가임기',
      CyclePhase.ovulation => '배란일',
      CyclePhase.luteal => '황체기',
      CyclePhase.late => '지연',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => '몸이 원하면 천천히 쉬어 가세요.',
      CyclePhase.follicular => '에너지가 올라가는 시기예요.',
      CyclePhase.fertile => '임신 가능성이 높은 시기예요.',
      CyclePhase.ovulation => '예상 배란일이에요.',
      CyclePhase.luteal => '속도를 늦추고 내 몸에 귀 기울여 보세요.',
      CyclePhase.late => '평소보다 주기가 길어요. 생리가 시작되면 기록해 주세요.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => '최고',
      Mood.good => '좋음',
      Mood.okay => '보통',
      Mood.low => '저조',
      Mood.irritable => '예민',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => '두통',
      Symptom.tenderBreasts => '가슴 통증',
      Symptom.backache => '허리 통증',
      Symptom.acne => '피부 트러블',
      Symptom.abdominalPain => '복통',
      Symptom.bloating => '복부 팽만감',
      Symptom.cramps => '생리통',
      Symptom.fatigue => '피로',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => '적음',
      FlowIntensity.medium => '보통',
      FlowIntensity.heavy => '많음',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => '아직 데이터가 부족해요',
      CycleRegularity.stable => '주기가 안정적이에요',
      CycleRegularity.mild => '작은 변동이 있어요',
      CycleRegularity.irregular => '아직 불규칙적이에요',
    };
  }

  @override
  String get period => '생리';

  @override
  String get flow => '생리량';

  @override
  String get mood => '기분';

  @override
  String get wellbeing => '컨디션';

  @override
  String get noteHint => '메모';

  @override
  String get noteHintShort => '필요하면 짧게 메모';

  @override
  String get save => '저장';

  @override
  String get calendarTitle => '캘린더';

  @override
  String get legendPeriod => '생리';

  @override
  String get legendForecast => '예상';

  @override
  String get legendFertile => '가임기';

  @override
  String get legendOvulation => '배란일';

  @override
  String get statsTitle => '주기';

  @override
  String get statsCycleLength => '주기 길이';

  @override
  String get statsPeriodDuration => '생리 기간';

  @override
  String get statsRecentCycles => '최근 주기';

  @override
  String get statsEmptyHistory => '생리를 기록하면 여기에 히스토리가 쌓여요.';

  @override
  String get statsCurrentCycle => '현재 주기';

  @override
  String get exportDoctorPdf => '의사 공유용 내보내기';

  @override
  String get exportDoctorPdfLoading => 'PDF를 준비하고 있어요…';

  @override
  String get exportDoctorPdfHint =>
      '파일을 의사에게 보낼 수 있어요. PDF를 공유하기 전까지 데이터는 이 기기에만 저장돼요.';

  @override
  String get legalDocumentLoadError => '문서를 불러올 수 없어요.';

  @override
  String get onboardingWelcomeTitle => '나만의 조용한 캘린더';

  @override
  String get onboardingWelcomeBody =>
      '한 번의 터치로 생리를 기록해요. 예상일, 배란일, 컨디션 정보는 이 기기에만 저장돼요.';

  @override
  String get onboardingDateTitle => '마지막 생리는 언제 시작했나요?';

  @override
  String get pickDate => '날짜 선택';

  @override
  String get datePickerHelp => '마지막 생리 시작일';

  @override
  String get onboardingNext => '다음';

  @override
  String get onboardingBack => '이전';

  @override
  String get onboardingStart => '시작하기';

  @override
  String get aboutPhasesTitle => '단계 계산 방법';

  @override
  String get aboutPhasesBody1 =>
      '기록한 날짜로 주기가 만들어져요. 생리일이 연속된 구간이 하나의 주기예요. 평균 주기 길이와 생리 기간은 최근 6번의 주기로 계산해요. 기록이 아직 부족하면 설정 값을 사용해요.';

  @override
  String get aboutPhasesBody2 =>
      '배란일: 주기 시작일부터 주기 길이에서 14일을 뺀 날. 가임기: 배란일 5일 전부터 다음 날까지. 다음 생리 예상일: 마지막 주기 시작일에 평균 주기를 더한 날.';

  @override
  String get aboutPhasesBody3 =>
      '단계는 참고용이며 의학적 진단이 아니에요. 이 앱은 진료를 대신하지 않고 피임 도구도 아니에요. 데이터는 이 기기에만 저장돼요.';

  @override
  String get legalSectionTitle => '법적 문서';

  @override
  String get allMoiSoftApps => 'MoiSoft의 모든 앱';

  @override
  String get privacyPolicyTitle => '개인정보 처리방침';

  @override
  String get userAgreementTitle => '이용약관';

  @override
  String get publicOfferTitle => '공개 오퍼';

  @override
  String get consentPdTitle => '개인정보 수집·이용 동의';

  @override
  String get versionLabel => '버전';

  @override
  String get reminderNotificationBody => '예상대로라면 내일 생리가 시작될 수 있어요.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) => '의사 공유용 내보내기 — $dateKey';

  @override
  String get pdfDisclaimer =>
      '이 문서는 기기에 기록된 사용자 기록으로 만들었어요. 의학적 소견이나 진단이 아니에요.';

  @override
  String get pdfSectionCycles => '주기';

  @override
  String get pdfSectionDiary => '다이어리';

  @override
  String get pdfSummaryRegularity => '규칙성';

  @override
  String get pdfCyclesEmpty => '아직 기록된 주기가 없어요.';

  @override
  String get pdfDiaryEmpty => '이 기간에는 다이어리 기록이 없어요.';

  @override
  String get pdfColStart => '시작';

  @override
  String get pdfColEnd => '종료';

  @override
  String get pdfColPeriodDays => '생리';

  @override
  String get pdfColCycleLength => '주기 길이';

  @override
  String get pdfColDate => '날짜';

  @override
  String get pdfColNote => '메모';

  @override
  String get pdfYes => '예';

  @override
  String get pdfNo => '아니요';

  @override
  String get pdfCurrentCycleShort => '현재';

  @override
  String get pdfDiaryContinuation => '다이어리 (계속)';

  @override
  String pdfPageFooter(int page, int pages) => '$page / $pages 페이지';

  @override
  String get pdfShareSubject => '여성 달력 · 생리 주기 기록: 의사 공유용';

  @override
  String get premiumBuyTitle => '프리미엄 구매';

  @override
  String get premiumAfterPaymentHint => '결제 후 모든 광고가 사라져요. 주문 번호는 꼭 저장해 주세요.';

  @override
  String get premiumPaySbp => 'SBP로 결제';

  @override
  String get premiumPayRustore => 'RuStore에서 결제';

  @override
  String get premiumConsentPrefix => '';

  @override
  String get premiumConsentOfferLink => '공개 오퍼';

  @override
  String get premiumConsentAnd => ' 및 ';

  @override
  String get premiumConsentPdLink => '개인정보 수집·이용 동의';

  @override
  String get premiumConsentSuffix => '에 동의해요.';

  @override
  String get premiumOpenPaymentFailed => '결제 화면을 열 수 없어요';

  @override
  String get premiumRustoreUnavailable =>
      'RuStore 결제를 사용할 수 없어요. RuStore를 설치해 주세요.';

  @override
  String get premiumActivatedAdsOff => '프리미엄이 활성화됐어요. 광고가 꺼졌어요.';

  @override
  String get premiumPurchaseFailed => '구매에 실패했어요. 나중에 다시 시도해 주세요.';

  @override
  String get premiumActiveLabel => '프리미엄 사용 중. 광고가 꺼져 있어요.';

  @override
  String get premiumRestoreButton => '구매 복원';

  @override
  String get premiumRestoreTitle => '구매 복원';

  @override
  String get premiumRestoreBody => '영수증 또는 결제 후 화면에 표시된 주문 번호를 입력해 주세요.';

  @override
  String get premiumOrderIdLabel => '주문 번호';

  @override
  String premiumRestoreSupportLine(String email) =>
      '번호를 잃어버렸다면 $email 로 문의해 주세요';

  @override
  String get premiumRestoreAction => '복원';

  @override
  String get premiumRestoreViaRustore => 'RuStore로 복원';

  @override
  String get premiumEnterOrderId => '주문 번호를 입력해 주세요';

  @override
  String get premiumRestoreSuccess => '구매가 복원됐어요. 프리미엄이 활성화됐어요.';

  @override
  String get premiumRestoreNotFound =>
      '결제를 찾을 수 없거나 완료되지 않았어요. 주문 번호를 확인해 주세요.';

  @override
  String get premiumRestoreCheckFailed => '결제를 확인할 수 없어요';

  @override
  String get premiumRestoreRustoreSuccess => 'RuStore 구매가 복원됐어요. 프리미엄이 활성화됐어요.';

  @override
  String get premiumRestoreRustoreNotFound => '활성화된 RuStore 구매가 없어요.';

  @override
  String get premiumRestoreRustoreFailed => 'RuStore 구매를 복원할 수 없어요';

  @override
  String get premiumPaymentDescription => '프리미엄: 광고 제거';

  @override
  String get paymentOpeningBank => 'T-Bank 결제 화면을 여는 중…';

  @override
  String get paymentOpenFormFailed => '결제 폼을 열 수 없어요.';

  @override
  String get paymentReturnHint => '결제 후 앱으로 돌아오면 상태가 자동으로 업데이트돼요.';

  @override
  String get paymentWaiting => '결제를 기다리는 중…';

  @override
  String paymentBankStatus(String status) => '상태: $status';

  @override
  String get paymentSuccess => '결제가 완료됐어요';

  @override
  String get paymentNotCompleted => '결제가 완료되지 않았어요';

  @override
  String get paymentFailedTitle => '결제에 실패했어요';

  @override
  String get paymentFailedBody => '다시 시도하거나 은행 앱에서 다른 결제 수단을 이용해 주세요.';

  @override
  String get paymentGotIt => '확인';

  @override
  String get paymentPremiumActivatedTitle => '프리미엄이 활성화됐어요';

  @override
  String get paymentSaveOrderHint => '주문 번호를 저장해 주세요. 구매 복원에 필요해요.';

  @override
  String paymentSheetTitle(int rubles) => '결제 $rubles ₽';

  @override
  String get paymentOrderCopied => '주문 번호가 복사됐어요';

  @override
  String get paymentSessionNotFound => '결제 세션을 찾을 수 없어요';

  @override
  String get paymentCopyOrder => '복사';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year}~${end.day}/${end.month}/${end.year} · $lengthDays${pluralDays(lengthDays)}';
  }
}
