/// Индонезийская локализация строк интерфейса (id).
library;

import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Индонезийские строки интерфейса.
class AppLocalizationsId extends AppLocalizations {
  @override
  String get languageCode => 'id';

  @override
  String get appName => 'Kalender Menstruasi';

  @override
  String get appSubtitle => 'Kalender siklus';

  @override
  String get navToday => 'Hari ini';

  @override
  String get navCalendar => 'Kalender';

  @override
  String get navStats => 'Siklus';

  @override
  String get navSettings => 'Lainnya';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get cycleLengthLabel => 'Panjang siklus biasa';

  @override
  String get periodDurationLabel => 'Durasi menstruasi';

  @override
  String get daysUnit => 'hari';

  @override
  String get reminderTitle => 'Pengingat';

  @override
  String get reminderSubtitle => 'Sehari sebelum perkiraan menstruasi';

  @override
  String get languageTitle => 'Bahasa';

  @override
  String get aboutTitle => 'Tentang';

  @override
  String get aboutSubtitle => 'Fase siklus dan dokumen hukum';

  @override
  String get resetData => 'Reset semua data';

  @override
  String get resetDialogTitle => 'Reset data?';

  @override
  String get resetDialogBody =>
      'Kalender, catatan, dan pengaturan akan dihapus. Onboarding akan dimulai lagi.';

  @override
  String get cancel => 'Batal';

  @override
  String get writeToDeveloper => 'Hubungi pengembang';

  @override
  String get addressCopied => 'Alamat disalin';

  @override
  String get emailFieldLabel => 'Surel';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Reset';

  @override
  String get loadCalendarError => 'Tidak dapat memuat kalender';

  @override
  String get persistError => 'Tidak dapat menyimpan data';

  @override
  String get pdfExportError => 'Tidak dapat menyiapkan PDF';

  @override
  String get retry => 'Coba lagi';

  @override
  String get dayN => 'Hari';

  @override
  String dayNumber(int n) => 'Hari $n';

  @override
  String get periodActive => 'Menstruasi sedang berlangsung';

  @override
  String delayDays(int n) => 'Terlambat $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => '$n ${pluralDays(n)} lagi hingga menstruasi';

  @override
  String pluralDays(int count) => 'hari';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Menstruasi',
      CyclePhase.follicular => 'Fase folikular',
      CyclePhase.fertile => 'Jendela subur',
      CyclePhase.ovulation => 'Ovulasi',
      CyclePhase.luteal => 'Fase luteal',
      CyclePhase.late => 'Siklus terlambat',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Istirahatlah jika perlu.',
      CyclePhase.follicular => 'Energi sering meningkat.',
      CyclePhase.fertile => 'Peluang kehamilan lebih tinggi.',
      CyclePhase.ovulation => 'Perkiraan hari ovulasi.',
      CyclePhase.luteal => 'Perlambat dan dengarkan tubuh Anda.',
      CyclePhase.late =>
        'Siklus lebih panjang dari biasanya — catat saat menstruasi dimulai.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Luar biasa',
      Mood.good => 'Baik',
      Mood.okay => 'Cukup',
      Mood.low => 'Sedih',
      Mood.irritable => 'Mudah tersinggung',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Sakit kepala',
      Symptom.tenderBreasts => 'Payudara terasa nyeri',
      Symptom.backache => 'Sakit punggung',
      Symptom.acne => 'Masalah kulit',
      Symptom.abdominalPain => 'Nyeri perut',
      Symptom.bloating => 'Kembung',
      Symptom.cramps => 'Kram',
      Symptom.fatigue => 'Lelah',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Sedikit',
      FlowIntensity.medium => 'Sedang',
      FlowIntensity.heavy => 'Banyak',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Data belum cukup',
      CycleRegularity.stable => 'Siklus stabil',
      CycleRegularity.mild => 'Variasi kecil',
      CycleRegularity.irregular => 'Belum teratur',
    };
  }

  @override
  String get period => 'Menstruasi';

  @override
  String get flow => 'Aliran';

  @override
  String get mood => 'Suasana hati';

  @override
  String get wellbeing => 'Kondisi tubuh';

  @override
  String get noteHint => 'Catatan';

  @override
  String get noteHintShort => 'Catatan singkat jika perlu';

  @override
  String get save => 'Simpan';

  @override
  String get calendarTitle => 'Kalender';

  @override
  String get legendPeriod => 'Menstruasi';

  @override
  String get legendForecast => 'Perkiraan';

  @override
  String get legendFertile => 'Subur';

  @override
  String get legendOvulation => 'Ovulasi';

  @override
  String get statsTitle => 'Siklus';

  @override
  String get statsCycleLength => 'Panjang siklus';

  @override
  String get statsPeriodDuration => 'Menstruasi';

  @override
  String get statsRecentCycles => 'Siklus terbaru';

  @override
  String get statsEmptyHistory =>
      'Catat menstruasi — riwayat akan muncul di sini.';

  @override
  String get statsCurrentCycle => 'siklus saat ini';

  @override
  String get exportDoctorPdf => 'Ekspor untuk dokter';

  @override
  String get exportDoctorPdfLoading => 'Menyiapkan PDF…';

  @override
  String get exportDoctorPdfHint =>
      'Anda dapat mengirim berkas ke dokter. Sampai Anda membagikan PDF, data tetap berada di perangkat ini.';

  @override
  String get legalDocumentLoadError => 'Tidak dapat memuat dokumen.';

  @override
  String get onboardingWelcomeTitle => 'Kalender tenang untuk Anda';

  @override
  String get onboardingWelcomeBody =>
      'Catat menstruasi dengan sekali ketuk. Perkiraan, ovulasi, dan kondisi tubuh tetap hanya di perangkat ini.';

  @override
  String get onboardingDateTitle => 'Kapan menstruasi terakhir Anda dimulai?';

  @override
  String get pickDate => 'Pilih tanggal';

  @override
  String get datePickerHelp => 'Awal menstruasi terakhir';

  @override
  String get onboardingNext => 'Lanjut';

  @override
  String get onboardingBack => 'Kembali';

  @override
  String get onboardingStart => 'Mulai';

  @override
  String get aboutPhasesTitle => 'Cara fase dihitung';

  @override
  String get aboutPhasesBody1 =>
      'Siklus Anda dibangun dari hari yang dicatat: hari menstruasi berturut-turut dihitung satu siklus. Rata-rata panjang siklus dan durasi menstruasi dihitung dari 6 siklus terakhir; jika riwayat masih sedikit, digunakan nilai dari pengaturan.';

  @override
  String get aboutPhasesBody2 =>
      'Ovulasi: panjang siklus dikurangi 14 hari dari awal siklus. Jendela subur: 5 hari sebelum ovulasi dan 1 hari sesudahnya. Perkiraan menstruasi berikutnya: awal siklus terakhir ditambah rata-rata panjang.';

  @override
  String get aboutPhasesBody3 =>
      'Fase bersifat sebagai panduan, bukan diagnosis medis. Aplikasi tidak menggantikan dokter dan bukan alat kontrasepsi. Data tetap hanya di perangkat ini.';

  @override
  String get legalSectionTitle => 'Dokumen hukum';

  @override
  String get allMoiSoftApps => 'Semua aplikasi MoiSoft';

  @override
  String get privacyPolicyTitle => 'Kebijakan privasi';

  @override
  String get userAgreementTitle => 'Perjanjian pengguna';

  @override
  String get publicOfferTitle => 'Penawaran publik';

  @override
  String get consentPdTitle => 'Persetujuan data pribadi';

  @override
  String get versionLabel => 'Versi';

  @override
  String get reminderNotificationBody =>
      'Berdasarkan perkiraan, menstruasi mungkin dimulai besok.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Ekspor untuk dokter — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Dokumen ini dibuat dari catatan pengguna di perangkat. Ini bukan laporan atau diagnosis medis.';

  @override
  String get pdfSectionCycles => 'Siklus';

  @override
  String get pdfSectionDiary => 'Diari';

  @override
  String get pdfSummaryRegularity => 'Keteraturan';

  @override
  String get pdfCyclesEmpty => 'Belum ada siklus yang dicatat.';

  @override
  String get pdfDiaryEmpty => 'Tidak ada catatan diari untuk periode ini.';

  @override
  String get pdfColStart => 'Mulai';

  @override
  String get pdfColEnd => 'Selesai';

  @override
  String get pdfColPeriodDays => 'Menstruasi';

  @override
  String get pdfColCycleLength => 'Panjang siklus';

  @override
  String get pdfColDate => 'Tanggal';

  @override
  String get pdfColNote => 'Catatan';

  @override
  String get pdfYes => 'ya';

  @override
  String get pdfNo => 'tidak';

  @override
  String get pdfCurrentCycleShort => 'saat ini';

  @override
  String get pdfDiaryContinuation => 'Diari (lanjutan)';

  @override
  String pdfPageFooter(int page, int pages) => 'Halaman $page dari $pages';

  @override
  String get pdfShareSubject => 'Kalender Menstruasi: ekspor untuk dokter';

  @override
  String get premiumBuyTitle => 'Beli premium';

  @override
  String get premiumAfterPaymentHint =>
      'Setelah pembayaran, semua iklan dihapus. Simpan nomor pesanan Anda.';

  @override
  String get premiumPaySbp => 'Bayar via FPS (SBP)';

  @override
  String get premiumPayRustore => 'Bayar di RuStore';

  @override
  String get premiumConsentPrefix => 'Saya menyetujui ';

  @override
  String get premiumConsentOfferLink => 'penawaran publik';

  @override
  String get premiumConsentAnd => ' dan ';

  @override
  String get premiumConsentPdLink => 'persetujuan data pribadi';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Tidak dapat membuka pembayaran';

  @override
  String get premiumRustoreUnavailable =>
      'Pembayaran RuStore tidak tersedia. Instal RuStore.';

  @override
  String get premiumActivatedAdsOff => 'Premium aktif. Iklan dinonaktifkan.';

  @override
  String get premiumPurchaseFailed => 'Pembelian gagal. Coba lagi nanti.';

  @override
  String get premiumActiveLabel => 'Premium aktif. Iklan dinonaktifkan.';

  @override
  String get premiumRestoreButton => 'Pulihkan pembelian';

  @override
  String get premiumRestoreTitle => 'Pulihkan pembelian';

  @override
  String get premiumRestoreBody =>
      'Masukkan nomor pesanan dari struk atau layar setelah pembayaran.';

  @override
  String get premiumOrderIdLabel => 'Nomor pesanan';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Jika nomor hilang, hubungi $email';

  @override
  String get premiumRestoreAction => 'Pulihkan';

  @override
  String get premiumRestoreViaRustore => 'Pulihkan melalui RuStore';

  @override
  String get premiumEnterOrderId => 'Masukkan nomor pesanan';

  @override
  String get premiumRestoreSuccess =>
      'Pembelian dipulihkan. Premium diaktifkan.';

  @override
  String get premiumRestoreNotFound =>
      'Pembayaran tidak ditemukan atau tidak berhasil. Periksa nomor pesanan.';

  @override
  String get premiumRestoreCheckFailed =>
      'Tidak dapat memverifikasi pembayaran';

  @override
  String get premiumRestoreRustoreSuccess =>
      'Pembelian RuStore dipulihkan. Premium diaktifkan.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Tidak ada pembelian RuStore yang aktif.';

  @override
  String get premiumRestoreRustoreFailed =>
      'Tidak dapat memulihkan pembelian RuStore';

  @override
  String get premiumPaymentDescription => 'Premium: tanpa iklan';

  @override
  String get paymentOpeningBank => 'Membuka pembayaran T-Bank…';

  @override
  String get paymentOpenFormFailed =>
      'Tidak dapat membuka formulir pembayaran.';

  @override
  String get paymentReturnHint =>
      'Setelah membayar, kembali ke aplikasi. Status akan diperbarui otomatis.';

  @override
  String get paymentWaiting => 'Menunggu pembayaran…';

  @override
  String paymentBankStatus(String status) => 'Status: $status';

  @override
  String get paymentSuccess => 'Pembayaran berhasil';

  @override
  String get paymentNotCompleted => 'Pembayaran tidak selesai';

  @override
  String get paymentFailedTitle => 'Pembayaran gagal';

  @override
  String get paymentFailedBody =>
      'Coba lagi atau gunakan metode pembayaran lain di aplikasi bank Anda.';

  @override
  String get paymentGotIt => 'Mengerti';

  @override
  String get paymentPremiumActivatedTitle => 'Premium diaktifkan';

  @override
  String get paymentSaveOrderHint =>
      'Simpan nomor pesanan — diperlukan untuk memulihkan pembelian.';

  @override
  String paymentSheetTitle(int rubles) => 'Pembayaran $rubles ₽';

  @override
  String get paymentOrderCopied => 'Nomor pesanan disalin';

  @override
  String get paymentSessionNotFound => 'Sesi pembayaran tidak ditemukan';

  @override
  String get paymentCopyOrder => 'Salin';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
