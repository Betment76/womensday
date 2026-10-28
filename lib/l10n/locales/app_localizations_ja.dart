import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Японская локализация.
class AppLocalizationsJa extends AppLocalizations {
  @override
  String get languageCode => 'ja';

  @override
  String get appName => '生理カレンダー 周期記録';

  @override
  String get appSubtitle => '周期カレンダー';

  @override
  String get navToday => '今日';

  @override
  String get navCalendar => 'カレンダー';

  @override
  String get navStats => '周期';

  @override
  String get navSettings => 'その他';

  @override
  String get settingsTitle => '設定';

  @override
  String get cycleLengthLabel => '普段の周期の長さ';

  @override
  String get periodDurationLabel => '生理の日数';

  @override
  String get daysUnit => '日間';

  @override
  String get reminderTitle => 'リマインダー';

  @override
  String get reminderSubtitle => '生理予測日の前日にお知らせ';

  @override
  String get languageTitle => '言語';

  @override
  String get aboutTitle => 'アプリについて';

  @override
  String get aboutSubtitle => '周期のフェーズと法的文書';

  @override
  String get resetData => 'すべてのデータをリセット';

  @override
  String get resetDialogTitle => 'データをリセットしますか？';

  @override
  String get resetDialogBody => 'カレンダー・メモ・設定が削除され、初期設定からやり直します。';

  @override
  String get cancel => 'キャンセル';

  @override
  String get writeToDeveloper => '開発者に連絡';

  @override
  String get addressCopied => 'アドレスをコピーしました';

  @override
  String get emailFieldLabel => 'メール';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'リセット';

  @override
  String get loadCalendarError => 'カレンダーを読み込めませんでした';

  @override
  String get persistError => 'データを保存できませんでした';

  @override
  String get pdfExportError => 'PDFを準備できませんでした';

  @override
  String get retry => '再試行';

  @override
  String get dayN => '日目';

  @override
  String dayNumber(int n) => '$n 日目';

  @override
  String get periodActive => '生理中';

  @override
  String delayDays(int n) => '遅れ $n 日';

  @override
  String daysUntilPeriod(int n) => '生理まであと $n 日';

  @override
  String pluralDays(int count) => '日';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => '生理',
      CyclePhase.follicular => '卵胞期',
      CyclePhase.fertile => '妊娠しやすい時期',
      CyclePhase.ovulation => '排卵日',
      CyclePhase.luteal => '黄体期',
      CyclePhase.late => '遅れ',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => '無理をしないで、必要ならゆっくり休みましょう。',
      CyclePhase.follicular => 'エネルギーがわいてくる時期です。',
      CyclePhase.fertile => '妊娠する可能性が高い時期です。',
      CyclePhase.ovulation => '排卵日の予測です。',
      CyclePhase.luteal => 'ペースを落として、からだの声を聞いてみましょう。',
      CyclePhase.late => 'いつもより周期が長くなっています。生理が始まったら記録してください。',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => '最高',
      Mood.good => 'いい気分',
      Mood.okay => 'まあまあ',
      Mood.low => '落ち込み気味',
      Mood.irritable => 'イライラする',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => '頭痛',
      Symptom.tenderBreasts => '胸の張り',
      Symptom.backache => '腰の痛み',
      Symptom.acne => '肌荒れ',
      Symptom.abdominalPain => '腹痛',
      Symptom.bloating => 'お腹の張り',
      Symptom.cramps => '生理痛',
      Symptom.fatigue => '疲れ',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => '少なめ',
      FlowIntensity.medium => '普通',
      FlowIntensity.heavy => '多め',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'まだデータが少ないです',
      CycleRegularity.stable => '周期は安定しています',
      CycleRegularity.mild => '少しゆらぎがあります',
      CycleRegularity.irregular => 'まだ不規則ぎみです',
    };
  }

  @override
  String get period => '生理';

  @override
  String get flow => '経血量';

  @override
  String get mood => '気分';

  @override
  String get wellbeing => '体調';

  @override
  String get noteHint => 'メモ';

  @override
  String get noteHintShort => '必要なら短くメモ';

  @override
  String get save => '保存';

  @override
  String get calendarTitle => 'カレンダー';

  @override
  String get legendPeriod => '生理';

  @override
  String get legendForecast => '予測';

  @override
  String get legendFertile => '妊娠しやすい';

  @override
  String get legendOvulation => '排卵日';

  @override
  String get statsTitle => '周期';

  @override
  String get statsCycleLength => '周期の長さ';

  @override
  String get statsPeriodDuration => '生理日数';

  @override
  String get statsRecentCycles => '最近の周期';

  @override
  String get statsEmptyHistory => '生理を記録すると、ここに履歴が表示されます。';

  @override
  String get statsCurrentCycle => '現在の周期';

  @override
  String get exportDoctorPdf => '医師用に書き出す';

  @override
  String get exportDoctorPdfLoading => 'PDFを準備しています…';

  @override
  String get exportDoctorPdfHint =>
      'ファイルはお医者さんに送れます。PDFを共有するまで、データはこの端末の中だけにあります。';

  @override
  String get legalDocumentLoadError => '文書を読み込めませんでした。';

  @override
  String get onboardingWelcomeTitle => 'あなた専用の静かなカレンダー';

  @override
  String get onboardingWelcomeBody =>
      'ワンタップで生理を記録。予測・排卵日・体調のデータは、この端末の中だけに残ります。';

  @override
  String get onboardingDateTitle => '最後の生理はいつ始まりましたか？';

  @override
  String get pickDate => '日付を選ぶ';

  @override
  String get datePickerHelp => '最後の生理の開始日';

  @override
  String get onboardingNext => '次へ';

  @override
  String get onboardingBack => '戻る';

  @override
  String get onboardingStart => 'はじめる';

  @override
  String get aboutPhasesTitle => 'フェーズの計算方法';

  @override
  String get aboutPhasesBody1 =>
      'あなたの記録から周期が組み立てられます。生理日が続いている間が1つの周期です。周期の平均の長さと生理の日数は、直近6周期から計算します。履歴がまだ少ないときは、設定の値を使います。';

  @override
  String get aboutPhasesBody2 =>
      '排卵日：周期の開始日から「周期の長さ − 14日」後。妊娠しやすい時期：排卵日の5日前から翌日まで。次の生理の予測：最後の周期の開始日プラス平均の長さ。';

  @override
  String get aboutPhasesBody3 =>
      'フェーズは目安であって、医学的な診断ではありません。このアプリは医師の診療の代わりにならず、避妊にも使えません。データはこの端末の中だけに残ります。';

  @override
  String get legalSectionTitle => '法的文書';

  @override
  String get allMoiSoftApps => 'MoiSoftのすべてのアプリ';

  @override
  String get privacyPolicyTitle => 'プライバシーポリシー';

  @override
  String get userAgreementTitle => '利用規約';

  @override
  String get publicOfferTitle => '公開オファー';

  @override
  String get consentPdTitle => '個人データの取り扱い同意';

  @override
  String get versionLabel => 'バージョン';

  @override
  String get reminderNotificationBody => '予測では、あす生理が始まるかもしれません。';

  @override
  String pdfDoctorExportSubtitle(String dateKey) => '医師用の書き出し — $dateKey';

  @override
  String get pdfDisclaimer => 'この文書は端末内のユーザーの記録から作成しています。医学的な報告や診断ではありません。';

  @override
  String get pdfSectionCycles => '周期';

  @override
  String get pdfSectionDiary => '日記';

  @override
  String get pdfSummaryRegularity => '規則性';

  @override
  String get pdfCyclesEmpty => 'まだ周期が記録されていません。';

  @override
  String get pdfDiaryEmpty => 'この期間の日記の記録はありません。';

  @override
  String get pdfColStart => '開始';

  @override
  String get pdfColEnd => '終了';

  @override
  String get pdfColPeriodDays => '生理';

  @override
  String get pdfColCycleLength => '周期の長さ';

  @override
  String get pdfColDate => '日付';

  @override
  String get pdfColNote => 'メモ';

  @override
  String get pdfYes => 'はい';

  @override
  String get pdfNo => 'いいえ';

  @override
  String get pdfCurrentCycleShort => '現在';

  @override
  String get pdfDiaryContinuation => '日記（続き）';

  @override
  String pdfPageFooter(int page, int pages) => '$page / $pages ページ';

  @override
  String get pdfShareSubject => '生理カレンダー 周期記録：医師用の書き出し';

  @override
  String get premiumBuyTitle => 'プレミアムを購入';

  @override
  String get premiumAfterPaymentHint =>
      'お支払い後、すべての広告が表示されなくなります。注文番号は控えておいてください。';

  @override
  String get premiumPaySbp => 'SBPで支払う';

  @override
  String get premiumPayRustore => 'RuStoreで支払う';

  @override
  String get premiumConsentPrefix => '';

  @override
  String get premiumConsentOfferLink => '公開オファー';

  @override
  String get premiumConsentAnd => 'と';

  @override
  String get premiumConsentPdLink => '個人データの取り扱い同意';

  @override
  String get premiumConsentSuffix => 'に同意します。';

  @override
  String get premiumOpenPaymentFailed => '決済画面を開けませんでした';

  @override
  String get premiumRustoreUnavailable =>
      'RuStore決済を利用できません。RuStoreをインストールしてください。';

  @override
  String get premiumActivatedAdsOff => 'プレミアムが有効になりました。広告はオフです。';

  @override
  String get premiumPurchaseFailed => '購入できませんでした。あとでもう一度お試しください。';

  @override
  String get premiumActiveLabel => 'プレミアムは有効です。広告はオフです。';

  @override
  String get premiumRestoreButton => '購入を復元';

  @override
  String get premiumRestoreTitle => '購入を復元';

  @override
  String get premiumRestoreBody => 'レシートまたはお支払い後の画面に表示された注文番号を入力してください。';

  @override
  String get premiumOrderIdLabel => '注文番号';

  @override
  String premiumRestoreSupportLine(String email) =>
      '番号をなくした場合は $email までご連絡ください';

  @override
  String get premiumRestoreAction => '復元';

  @override
  String get premiumRestoreViaRustore => 'RuStoreで復元';

  @override
  String get premiumEnterOrderId => '注文番号を入力してください';

  @override
  String get premiumRestoreSuccess => '購入を復元しました。プレミアムが有効になりました。';

  @override
  String get premiumRestoreNotFound => '支払いが見つからないか、完了していません。注文番号を確認してください。';

  @override
  String get premiumRestoreCheckFailed => '支払いを確認できませんでした';

  @override
  String get premiumRestoreRustoreSuccess =>
      'RuStoreの購入を復元しました。プレミアムが有効になりました。';

  @override
  String get premiumRestoreRustoreNotFound => '有効なRuStoreの購入が見つかりません。';

  @override
  String get premiumRestoreRustoreFailed => 'RuStoreの購入を復元できませんでした';

  @override
  String get premiumPaymentDescription => 'プレミアム：広告なし';

  @override
  String get paymentOpeningBank => 'T-Bankの決済画面を開いています…';

  @override
  String get paymentOpenFormFailed => '決済フォームを開けませんでした。';

  @override
  String get paymentReturnHint => 'お支払い後はアプリに戻ってください。ステータスは自動で更新されます。';

  @override
  String get paymentWaiting => 'お支払いを待っています…';

  @override
  String paymentBankStatus(String status) => 'ステータス：$status';

  @override
  String get paymentSuccess => '支払いが完了しました';

  @override
  String get paymentNotCompleted => '支払いが完了していません';

  @override
  String get paymentFailedTitle => '支払いが失敗しました';

  @override
  String get paymentFailedBody => 'もう一度試すか、銀行アプリで別の支払い方法をお試しください。';

  @override
  String get paymentGotIt => 'OK';

  @override
  String get paymentPremiumActivatedTitle => 'プレミアムが有効になりました';

  @override
  String get paymentSaveOrderHint => '注文番号を控えてください。購入を復元するときに必要です。';

  @override
  String paymentSheetTitle(int rubles) => 'お支払い $rubles ₽';

  @override
  String get paymentOrderCopied => '注文番号をコピーしました';

  @override
  String get paymentSessionNotFound => '支払いセッションが見つかりません';

  @override
  String get paymentCopyOrder => 'コピー';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year}〜${end.day}/${end.month}/${end.year} · $lengthDays${pluralDays(lengthDays)}';
  }
}
