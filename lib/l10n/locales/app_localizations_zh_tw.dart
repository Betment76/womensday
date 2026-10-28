import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Локализация традиционным китайским (Тайвань).
class AppLocalizationsZhTw extends AppLocalizations {
  @override
  String get languageCode => 'zh';

  @override
  String get appName => '生理期日曆 經期記錄';

  @override
  String get appSubtitle => '週期日曆';

  @override
  String get navToday => '今天';

  @override
  String get navCalendar => '日曆';

  @override
  String get navStats => '週期';

  @override
  String get navSettings => '更多';

  @override
  String get settingsTitle => '設定';

  @override
  String get cycleLengthLabel => '一般週期長度';

  @override
  String get periodDurationLabel => '經期天數';

  @override
  String get daysUnit => '天';

  @override
  String get reminderTitle => '提醒';

  @override
  String get reminderSubtitle => '在預測經期開始的前一天';

  @override
  String get languageTitle => '語言';

  @override
  String get aboutTitle => '關於';

  @override
  String get aboutSubtitle => '週期階段與法律文件';

  @override
  String get resetData => '重設所有資料';

  @override
  String get resetDialogTitle => '要重設資料嗎？';

  @override
  String get resetDialogBody => '日曆、備註與設定將被刪除，新手引導會重新開始。';

  @override
  String get cancel => '取消';

  @override
  String get writeToDeveloper => '聯絡開發者';

  @override
  String get addressCopied => '已複製地址';

  @override
  String get emailFieldLabel => '電子郵件';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => '重設';

  @override
  String get loadCalendarError => '無法載入日曆';

  @override
  String get persistError => '無法儲存資料';

  @override
  String get pdfExportError => '無法產生 PDF';

  @override
  String get retry => '重試';

  @override
  String get dayN => '第';

  @override
  String dayNumber(int n) => '第 $n 天';

  @override
  String get periodActive => '經期中';

  @override
  String delayDays(int n) => '延遲 $n 天';

  @override
  String daysUntilPeriod(int n) => '距月經還有 $n 天';

  @override
  String pluralDays(int count) => '天';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => '月經',
      CyclePhase.follicular => '濾泡期',
      CyclePhase.fertile => '受孕期',
      CyclePhase.ovulation => '排卵日',
      CyclePhase.luteal => '黃體期',
      CyclePhase.late => '延遲',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => '好好休息，照顧一下自己。',
      CyclePhase.follicular => '活力通常會慢慢增加。',
      CyclePhase.fertile => '受孕的機率比較高。',
      CyclePhase.ovulation => '預估的排卵日。',
      CyclePhase.luteal => '可以放慢腳步，聽聽身體的聲音。',
      CyclePhase.late => '週期比平常長——月經來的時候再記錄一下吧。',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => '超好',
      Mood.good => '不錯',
      Mood.okay => '還好',
      Mood.low => '低落',
      Mood.irritable => '煩躁',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => '頭痛',
      Symptom.tenderBreasts => '胸部脹痛',
      Symptom.backache => '腰痠背痛',
      Symptom.acne => '皮膚問題',
      Symptom.abdominalPain => '腹痛',
      Symptom.bloating => '腹脹',
      Symptom.cramps => '經痛',
      Symptom.fatigue => '疲倦',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => '少量',
      FlowIntensity.medium => '普通',
      FlowIntensity.heavy => '偏多',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => '資料還不夠多',
      CycleRegularity.stable => '週期很穩定',
      CycleRegularity.mild => '有些小起伏',
      CycleRegularity.irregular => '目前還不太規律',
    };
  }

  @override
  String get period => '月經';

  @override
  String get flow => '經量';

  @override
  String get mood => '心情';

  @override
  String get wellbeing => '身體狀況';

  @override
  String get noteHint => '備註';

  @override
  String get noteHintShort => '有需要就簡單寫幾句';

  @override
  String get save => '儲存';

  @override
  String get calendarTitle => '日曆';

  @override
  String get legendPeriod => '月經';

  @override
  String get legendForecast => '預測';

  @override
  String get legendFertile => '受孕期';

  @override
  String get legendOvulation => '排卵日';

  @override
  String get statsTitle => '週期';

  @override
  String get statsCycleLength => '週期長度';

  @override
  String get statsPeriodDuration => '經期天數';

  @override
  String get statsRecentCycles => '最近的週期';

  @override
  String get statsEmptyHistory => '記錄月經後，這裡就會出現歷史。';

  @override
  String get statsCurrentCycle => '目前週期';

  @override
  String get exportDoctorPdf => '匯出給醫師';

  @override
  String get exportDoctorPdfLoading => '正在產生 PDF…';

  @override
  String get exportDoctorPdfHint => '檔案可以傳給醫師看。在你分享 PDF 之前，資料都只留在這部裝置上。';

  @override
  String get legalDocumentLoadError => '無法載入文件。';

  @override
  String get onboardingWelcomeTitle => '專屬於你的安靜日曆';

  @override
  String get onboardingWelcomeBody => '輕輕一點就能記錄月經。預測、排卵和身體狀況，都只留在這部裝置上。';

  @override
  String get onboardingDateTitle => '上次月經是什麼時候開始的？';

  @override
  String get pickDate => '選擇日期';

  @override
  String get datePickerHelp => '上次月經開始日';

  @override
  String get onboardingNext => '下一步';

  @override
  String get onboardingBack => '返回';

  @override
  String get onboardingStart => '開始使用';

  @override
  String get aboutPhasesTitle => '階段是怎麼算的';

  @override
  String get aboutPhasesBody1 =>
      '週期根據你的記錄來計算：連續的月經日算同一個週期。平均週期長度和經期天數取最近 6 個週期計算；如果紀錄還不夠，就使用設定中的數值。';

  @override
  String get aboutPhasesBody2 =>
      '排卵日：週期開始日加「週期長度減 14 天」。受孕期：排卵日前 5 天到後 1 天。下次月經預測：上一個週期的開始日加平均長度。';

  @override
  String get aboutPhasesBody3 =>
      '各階段僅供參考，不是醫療診斷。本 App 不能取代醫師診療，也不是避孕工具。資料只留在這部裝置上。';

  @override
  String get legalSectionTitle => '法律文件';

  @override
  String get allMoiSoftApps => '所有 MoiSoft 應用程式';

  @override
  String get privacyPolicyTitle => '隱私權政策';

  @override
  String get userAgreementTitle => '使用者條款';

  @override
  String get publicOfferTitle => '公開要約';

  @override
  String get consentPdTitle => '個人資料處理同意書';

  @override
  String get versionLabel => '版本';

  @override
  String get reminderNotificationBody => '依照預測，月經明天可能會開始。';

  @override
  String pdfDoctorExportSubtitle(String dateKey) => '醫師用匯出 — $dateKey';

  @override
  String get pdfDisclaimer => '本文件由裝置上的使用者記錄產生，並非醫療報告或診斷。';

  @override
  String get pdfSectionCycles => '週期';

  @override
  String get pdfSectionDiary => '日記';

  @override
  String get pdfSummaryRegularity => '規律性';

  @override
  String get pdfCyclesEmpty => '還沒有記錄任何週期。';

  @override
  String get pdfDiaryEmpty => '這段期間沒有日記記錄。';

  @override
  String get pdfColStart => '開始';

  @override
  String get pdfColEnd => '結束';

  @override
  String get pdfColPeriodDays => '月經';

  @override
  String get pdfColCycleLength => '週期長度';

  @override
  String get pdfColDate => '日期';

  @override
  String get pdfColNote => '備註';

  @override
  String get pdfYes => '是';

  @override
  String get pdfNo => '否';

  @override
  String get pdfCurrentCycleShort => '目前';

  @override
  String get pdfDiaryContinuation => '日記（續）';

  @override
  String pdfPageFooter(int page, int pages) => '第 $page 頁，共 $pages 頁';

  @override
  String get pdfShareSubject => '生理期日曆 經期記錄：醫師用匯出';

  @override
  String get premiumBuyTitle => '購買進階版';

  @override
  String get premiumAfterPaymentHint => '付款後會關閉所有廣告。請記下訂單編號。';

  @override
  String get premiumPaySbp => '透過 SBP 付款';

  @override
  String get premiumPayRustore => '在 RuStore 付款';

  @override
  String get premiumConsentPrefix => '我同意';

  @override
  String get premiumConsentOfferLink => '公開要約';

  @override
  String get premiumConsentAnd => '與';

  @override
  String get premiumConsentPdLink => '個人資料處理同意書';

  @override
  String get premiumConsentSuffix => '。';

  @override
  String get premiumOpenPaymentFailed => '無法開啟付款';

  @override
  String get premiumRustoreUnavailable => '無法使用 RuStore 付款，請安裝 RuStore。';

  @override
  String get premiumActivatedAdsOff => '進階版已啟用，廣告已關閉。';

  @override
  String get premiumPurchaseFailed => '購買失敗，請稍後再試。';

  @override
  String get premiumActiveLabel => '進階版已啟用，廣告已關閉。';

  @override
  String get premiumRestoreButton => '還原購買';

  @override
  String get premiumRestoreTitle => '還原購買';

  @override
  String get premiumRestoreBody => '請輸入收據或付款完成畫面上的訂單編號。';

  @override
  String get premiumOrderIdLabel => '訂單編號';

  @override
  String premiumRestoreSupportLine(String email) => '如果編號遺失了，請來信 $email';

  @override
  String get premiumRestoreAction => '還原';

  @override
  String get premiumRestoreViaRustore => '透過 RuStore 還原';

  @override
  String get premiumEnterOrderId => '請輸入訂單編號';

  @override
  String get premiumRestoreSuccess => '購買已還原，進階版已啟用。';

  @override
  String get premiumRestoreNotFound => '找不到付款或付款未成功，請確認訂單編號。';

  @override
  String get premiumRestoreCheckFailed => '無法確認付款';

  @override
  String get premiumRestoreRustoreSuccess => 'RuStore 購買已還原，進階版已啟用。';

  @override
  String get premiumRestoreRustoreNotFound => '找不到有效的 RuStore 購買。';

  @override
  String get premiumRestoreRustoreFailed => '無法還原 RuStore 購買';

  @override
  String get premiumPaymentDescription => '進階版：關閉廣告';

  @override
  String get paymentOpeningBank => '正在開啟 T-Bank 付款頁面…';

  @override
  String get paymentOpenFormFailed => '無法開啟付款表單。';

  @override
  String get paymentReturnHint => '付款後請回到 App，狀態會自動更新。';

  @override
  String get paymentWaiting => '等待付款中…';

  @override
  String paymentBankStatus(String status) => '狀態：$status';

  @override
  String get paymentSuccess => '付款成功';

  @override
  String get paymentNotCompleted => '付款尚未完成';

  @override
  String get paymentFailedTitle => '付款失敗';

  @override
  String get paymentFailedBody => '請再試一次，或在您的銀行應用程式中使用其他付款方式。';

  @override
  String get paymentGotIt => '知道了';

  @override
  String get paymentPremiumActivatedTitle => '進階版已啟用';

  @override
  String get paymentSaveOrderHint => '請保存訂單編號——還原購買時需要它。';

  @override
  String paymentSheetTitle(int rubles) => '付款 $rubles ₽';

  @override
  String get paymentOrderCopied => '訂單編號已複製';

  @override
  String get paymentSessionNotFound => '找不到付款工作階段';

  @override
  String get paymentCopyOrder => '複製';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays${pluralDays(lengthDays)}';
  }
}
