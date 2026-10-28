/// Турецкая локализация строк интерфейса (tr).
library;

import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Турецкие строки интерфейса.
class AppLocalizationsTr extends AppLocalizations {
  @override
  String get languageCode => 'tr';

  @override
  String get appName => 'Adet Takvimi: Döngü Kaydı';

  @override
  String get appSubtitle => 'Döngü takvimi';

  @override
  String get navToday => 'Bugün';

  @override
  String get navCalendar => 'Takvim';

  @override
  String get navStats => 'Döngüler';

  @override
  String get navSettings => 'Daha fazla';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get cycleLengthLabel => 'Tipik döngü uzunluğu';

  @override
  String get periodDurationLabel => 'Adet süresi';

  @override
  String get daysUnit => 'gün';

  @override
  String get reminderTitle => 'Hatırlatma';

  @override
  String get reminderSubtitle => 'Tahmini adetten bir gün önce';

  @override
  String get languageTitle => 'Dil';

  @override
  String get aboutTitle => 'Hakkında';

  @override
  String get aboutSubtitle => 'Döngü evreleri ve yasal belgeler';

  @override
  String get resetData => 'Tüm verileri sıfırla';

  @override
  String get resetDialogTitle => 'Veriler sıfırlansın mı?';

  @override
  String get resetDialogBody =>
      'Takvim, notlar ve ayarlar silinecek. Tanıtım ekranları yeniden başlayacak.';

  @override
  String get cancel => 'İptal';

  @override
  String get writeToDeveloper => 'Geliştiriciye yaz';

  @override
  String get addressCopied => 'Adres kopyalandı';

  @override
  String get emailFieldLabel => 'E-posta';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Sıfırla';

  @override
  String get loadCalendarError => 'Takvim yüklenemedi';

  @override
  String get persistError => 'Veriler kaydedilemedi';

  @override
  String get pdfExportError => 'PDF hazırlanamadı';

  @override
  String get retry => 'Tekrar dene';

  @override
  String get dayN => 'Gün';

  @override
  String dayNumber(int n) => 'Gün $n';

  @override
  String get periodActive => 'Adet dönemi sürüyor';

  @override
  String delayDays(int n) => '$n ${pluralDays(n)} gecikme';

  @override
  String daysUntilPeriod(int n) => 'Adete $n ${pluralDays(n)} kaldı';

  @override
  String pluralDays(int count) => 'gün';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Adet',
      CyclePhase.follicular => 'Folliküler evre',
      CyclePhase.fertile => 'Doğurganlık penceresi',
      CyclePhase.ovulation => 'Yumurtlama',
      CyclePhase.luteal => 'Luteal evre',
      CyclePhase.late => 'Geciken döngü',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Gerekirse dinlenin, kendinize iyi bakın.',
      CyclePhase.follicular => 'Enerjiniz genellikle artar.',
      CyclePhase.fertile => 'Hamile kalma olasılığı daha yüksek.',
      CyclePhase.ovulation => 'Tahmini yumurtlama günü.',
      CyclePhase.luteal => 'Yavaşlayıp kendinizi dinleyebilirsiniz.',
      CyclePhase.late =>
        'Döngü her zamankinden uzun — adet başladığında işaretleyin.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Harika',
      Mood.good => 'İyi',
      Mood.okay => 'İdare eder',
      Mood.low => 'Üzgün',
      Mood.irritable => 'Sinirli',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Baş ağrısı',
      Symptom.tenderBreasts => 'Göğüs hassasiyeti',
      Symptom.backache => 'Sırt ağrısı',
      Symptom.acne => 'Cilt sorunları',
      Symptom.abdominalPain => 'Karın ağrısı',
      Symptom.bloating => 'Şişkinlik',
      Symptom.cramps => 'Kramplar',
      Symptom.fatigue => 'Yorgunluk',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Hafif',
      FlowIntensity.medium => 'Normal',
      FlowIntensity.heavy => 'Yoğun',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Henüz yeterli veri yok',
      CycleRegularity.stable => 'Düzenli döngü',
      CycleRegularity.mild => 'Küçük dalgalanmalar',
      CycleRegularity.irregular => 'Şimdilik düzensiz',
    };
  }

  @override
  String get period => 'Adet';

  @override
  String get flow => 'Akış';

  @override
  String get mood => 'Ruh hâli';

  @override
  String get wellbeing => 'Genel durum';

  @override
  String get noteHint => 'Not';

  @override
  String get noteHintShort => 'İstersen kısa bir not';

  @override
  String get save => 'Kaydet';

  @override
  String get calendarTitle => 'Takvim';

  @override
  String get legendPeriod => 'Adet';

  @override
  String get legendForecast => 'Tahmin';

  @override
  String get legendFertile => 'Doğurgan';

  @override
  String get legendOvulation => 'Yumurtlama';

  @override
  String get statsTitle => 'Döngüler';

  @override
  String get statsCycleLength => 'Döngü uzunluğu';

  @override
  String get statsPeriodDuration => 'Adet';

  @override
  String get statsRecentCycles => 'Son döngüler';

  @override
  String get statsEmptyHistory =>
      'Adetinizi işaretleyin — geçmiş burada görünecek.';

  @override
  String get statsCurrentCycle => 'mevcut döngü';

  @override
  String get exportDoctorPdf => 'Doktor için dışa aktar';

  @override
  String get exportDoctorPdfLoading => 'PDF hazırlanıyor…';

  @override
  String get exportDoctorPdfHint =>
      'Dosyayı doktorunuza gönderebilirsiniz. PDF\'i paylaşana kadar veriler bu cihazda kalır.';

  @override
  String get legalDocumentLoadError => 'Belge yüklenemedi.';

  @override
  String get onboardingWelcomeTitle => 'Kendin için sakin bir takvim';

  @override
  String get onboardingWelcomeBody =>
      'Adetinizi tek dokunuşla işaretleyin. Tahmin, yumurtlama ve genel durum yalnızca bu cihazda kalır.';

  @override
  String get onboardingDateTitle => 'Son adetiniz ne zaman başladı?';

  @override
  String get pickDate => 'Tarih seç';

  @override
  String get datePickerHelp => 'Son adetin başlangıcı';

  @override
  String get onboardingNext => 'İleri';

  @override
  String get onboardingBack => 'Geri';

  @override
  String get onboardingStart => 'Başlayalım';

  @override
  String get aboutPhasesTitle => 'Evreler nasıl hesaplanır';

  @override
  String get aboutPhasesBody1 =>
      'Döngünüz işaretlediğiniz günlerden oluşur: ardışık adet günleri tek bir döngü sayılır. Ortalama döngü uzunluğu ve adet süresi son 6 döngüye göre hesaplanır; geçmiş kısaysa ayarlardaki değerler kullanılır.';

  @override
  String get aboutPhasesBody2 =>
      'Yumurtlama: döngü başlangıcından döngü uzunluğu eksi 14 gün. Doğurganlık penceresi: yumurtlamadan 5 gün önce ve 1 gün sonra. Sonraki adet tahmini: son döngü başlangıcı artı ortalama uzunluk.';

  @override
  String get aboutPhasesBody3 =>
      'Evreler yol göstericidir, tıbbi teşhis değildir. Uygulama doktor yerine geçmez ve doğum kontrol yöntemi değildir. Veriler yalnızca bu cihazda kalır.';

  @override
  String get legalSectionTitle => 'Yasal belgeler';

  @override
  String get allMoiSoftApps => 'Tüm MoiSoft uygulamaları';

  @override
  String get privacyPolicyTitle => 'Gizlilik politikası';

  @override
  String get userAgreementTitle => 'Kullanıcı sözleşmesi';

  @override
  String get publicOfferTitle => 'Genel teklif';

  @override
  String get consentPdTitle => 'Kişisel veri onayı';

  @override
  String get versionLabel => 'Sürüm';

  @override
  String get reminderNotificationBody =>
      'Tahmine göre adetiniz yarın başlayabilir.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Doktor için çıktı — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Bu belge, cihazdaki kullanıcı kayıtlarından oluşturulmuştur. Tıbbi rapor veya teşhis değildir.';

  @override
  String get pdfSectionCycles => 'Döngüler';

  @override
  String get pdfSectionDiary => 'Günlük';

  @override
  String get pdfSummaryRegularity => 'Düzenlilik';

  @override
  String get pdfCyclesEmpty => 'Henüz döngü işaretlenmedi.';

  @override
  String get pdfDiaryEmpty => 'Bu dönemde günlük kaydı yok.';

  @override
  String get pdfColStart => 'Başlangıç';

  @override
  String get pdfColEnd => 'Bitiş';

  @override
  String get pdfColPeriodDays => 'Adet';

  @override
  String get pdfColCycleLength => 'Döngü uzunluğu';

  @override
  String get pdfColDate => 'Tarih';

  @override
  String get pdfColNote => 'Not';

  @override
  String get pdfYes => 'evet';

  @override
  String get pdfNo => 'hayır';

  @override
  String get pdfCurrentCycleShort => 'mevcut';

  @override
  String get pdfDiaryContinuation => 'Günlük (devam)';

  @override
  String pdfPageFooter(int page, int pages) => 'Sayfa $page / $pages';

  @override
  String get pdfShareSubject => 'Adet Takvimi: Döngü Kaydı — doktor için çıktı';

  @override
  String get premiumBuyTitle => 'Premium satın al';

  @override
  String get premiumAfterPaymentHint =>
      'Ödeme sonrası tüm reklamlar kaldırılır. Sipariş numaranızı kaydedin.';

  @override
  String get premiumPaySbp => 'FPS (SBP) ile öde';

  @override
  String get premiumPayRustore => 'RuStore\'da öde';

  @override
  String get premiumConsentPrefix => 'Kabul ediyorum: ';

  @override
  String get premiumConsentOfferLink => 'genel teklif';

  @override
  String get premiumConsentAnd => ' ve ';

  @override
  String get premiumConsentPdLink => 'kişisel veri onayı';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Ödeme ekranı açılamadı';

  @override
  String get premiumRustoreUnavailable =>
      'RuStore ödemeleri kullanılamıyor. RuStore\'u yükleyin.';

  @override
  String get premiumActivatedAdsOff => 'Premium etkin. Reklamlar kapatıldı.';

  @override
  String get premiumPurchaseFailed =>
      'Satın alma başarısız oldu. Daha sonra tekrar deneyin.';

  @override
  String get premiumActiveLabel => 'Premium etkin. Reklamlar kapatıldı.';

  @override
  String get premiumRestoreButton => 'Satın almayı geri yükle';

  @override
  String get premiumRestoreTitle => 'Satın almayı geri yükle';

  @override
  String get premiumRestoreBody =>
      'Fişinizdeki veya ödeme sonrası ekrandaki sipariş numarasını girin.';

  @override
  String get premiumOrderIdLabel => 'Sipariş numarası';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Numarayı kaybettiyseniz $email adresine yazın';

  @override
  String get premiumRestoreAction => 'Geri yükle';

  @override
  String get premiumRestoreViaRustore => 'RuStore ile geri yükle';

  @override
  String get premiumEnterOrderId => 'Sipariş numarasını girin';

  @override
  String get premiumRestoreSuccess =>
      'Satın alma geri yüklendi. Premium etkinleştirildi.';

  @override
  String get premiumRestoreNotFound =>
      'Ödeme bulunamadı veya başarısız oldu. Sipariş numarasını kontrol edin.';

  @override
  String get premiumRestoreCheckFailed => 'Ödeme doğrulanamadı';

  @override
  String get premiumRestoreRustoreSuccess =>
      'RuStore satın alması geri yüklendi. Premium etkinleştirildi.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Etkin RuStore satın alması bulunamadı.';

  @override
  String get premiumRestoreRustoreFailed =>
      'RuStore satın alması geri yüklenemedi';

  @override
  String get premiumPaymentDescription => 'Premium: reklamsız';

  @override
  String get paymentOpeningBank => 'T-Bank ödeme ekranı açılıyor…';

  @override
  String get paymentOpenFormFailed => 'Ödeme formu açılamadı.';

  @override
  String get paymentReturnHint =>
      'Ödeme sonrası uygulamaya geri dönün. Durum otomatik güncellenecek.';

  @override
  String get paymentWaiting => 'Ödeme bekleniyor…';

  @override
  String paymentBankStatus(String status) => 'Durum: $status';

  @override
  String get paymentSuccess => 'Ödeme başarılı';

  @override
  String get paymentNotCompleted => 'Ödeme tamamlanmadı';

  @override
  String get paymentFailedTitle => 'Ödeme başarısız';

  @override
  String get paymentFailedBody =>
      'Tekrar deneyin veya bankanızın uygulamasında başka bir ödeme yöntemi kullanın.';

  @override
  String get paymentGotIt => 'Anladım';

  @override
  String get paymentPremiumActivatedTitle => 'Premium etkinleştirildi';

  @override
  String get paymentSaveOrderHint =>
      'Sipariş numarasını kaydedin — satın almayı geri yüklemek için gerekli.';

  @override
  String paymentSheetTitle(int rubles) => 'Ödeme $rubles ₽';

  @override
  String get paymentOrderCopied => 'Sipariş numarası kopyalandı';

  @override
  String get paymentSessionNotFound => 'Ödeme oturumu bulunamadı';

  @override
  String get paymentCopyOrder => 'Kopyala';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
