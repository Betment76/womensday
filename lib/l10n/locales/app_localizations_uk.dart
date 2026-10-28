import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Украинская локализация (uk).
class AppLocalizationsUk extends AppLocalizations {
  @override
  String get languageCode => 'uk';

  @override
  String get appName => 'Жіночий календар: місячні';

  @override
  String get appSubtitle => 'Календар циклу';

  @override
  String get navToday => 'Сьогодні';

  @override
  String get navCalendar => 'Календар';

  @override
  String get navStats => 'Цикли';

  @override
  String get navSettings => 'Більше';

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get cycleLengthLabel => 'Звичайна тривалість циклу';

  @override
  String get periodDurationLabel => 'Тривалість місячних';

  @override
  String get daysUnit => 'днів';

  @override
  String get reminderTitle => 'Нагадування';

  @override
  String get reminderSubtitle => 'За день до прогнозованих місячних';

  @override
  String get languageTitle => 'Мова';

  @override
  String get aboutTitle => 'Про застосунок';

  @override
  String get aboutSubtitle => 'Фази циклу та юридичні документи';

  @override
  String get resetData => 'Скинути всі дані';

  @override
  String get resetDialogTitle => 'Скинути дані?';

  @override
  String get resetDialogBody =>
      'Календар, нотатки та налаштування буде видалено. Онбординг почнеться спочатку.';

  @override
  String get cancel => 'Скасувати';

  @override
  String get writeToDeveloper => 'Написати розробнику';

  @override
  String get addressCopied => 'Адресу скопійовано';

  @override
  String get emailFieldLabel => 'Email';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Скинути';

  @override
  String get loadCalendarError => 'Не вдалося завантажити календар';

  @override
  String get persistError => 'Не вдалося зберегти дані';

  @override
  String get pdfExportError => 'Не вдалося підготувати PDF';

  @override
  String get retry => 'Повторити';

  @override
  String get dayN => 'День';

  @override
  String dayNumber(int n) => 'День $n';

  @override
  String get periodActive => 'Тривають місячні';

  @override
  String delayDays(int n) => 'Затримка $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => 'До місячних $n ${pluralDays(n)}';

  @override
  String pluralDays(int count) {
    final int absCount = count.abs();
    final int n = absCount % 100;
    final int n1 = n % 10;
    if (n > 10 && n < 20) {
      return 'днів';
    }
    if (n1 == 1) {
      return 'день';
    }
    if (n1 >= 2 && n1 <= 4) {
      return 'дні';
    }
    return 'днів';
  }

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Місячні',
      CyclePhase.follicular => 'Фолікулярна фаза',
      CyclePhase.fertile => 'Фертильне вікно',
      CyclePhase.ovulation => 'Овуляція',
      CyclePhase.luteal => 'Лютеїнова фаза',
      CyclePhase.late => 'Затримка',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation =>
        'Бережіть себе та відпочивайте, якщо потрібно.',
      CyclePhase.follicular => 'Енергії зазвичай стає більше.',
      CyclePhase.fertile => 'Підвищена ймовірність зачаття.',
      CyclePhase.ovulation => 'Ймовірний день овуляції.',
      CyclePhase.luteal => 'Можна сповільнитися та прислухатися до себе.',
      CyclePhase.late =>
        'Цикл довший за звичайний — позначте початок, коли почнеться.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Чудово',
      Mood.good => 'Добре',
      Mood.okay => 'Нормально',
      Mood.low => 'Сумно',
      Mood.irritable => 'Роздратування',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Болить голова',
      Symptom.tenderBreasts => 'Болить груди',
      Symptom.backache => 'Болить спина',
      Symptom.acne => 'Проблеми зі шкірою',
      Symptom.abdominalPain => 'Болить живіт',
      Symptom.bloating => 'Здуття',
      Symptom.cramps => 'Спазми',
      Symptom.fatigue => 'Втома',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Слабкі',
      FlowIntensity.medium => 'Звичайні',
      FlowIntensity.heavy => 'Рясні',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Поки мало даних',
      CycleRegularity.stable => 'Цикл стабільний',
      CycleRegularity.mild => 'Невеликі коливання',
      CycleRegularity.irregular => 'Цикл поки нерівний',
    };
  }

  @override
  String get period => 'Місячні';

  @override
  String get flow => 'Виділення';

  @override
  String get mood => 'Настрій';

  @override
  String get wellbeing => 'Самопочуття';

  @override
  String get noteHint => 'Нотатка';

  @override
  String get noteHintShort => 'Коротко, якщо потрібно';

  @override
  String get save => 'Зберегти';

  @override
  String get calendarTitle => 'Календар';

  @override
  String get legendPeriod => 'Місячні';

  @override
  String get legendForecast => 'Прогноз';

  @override
  String get legendFertile => 'Фертильні';

  @override
  String get legendOvulation => 'Овуляція';

  @override
  String get statsTitle => 'Цикли';

  @override
  String get statsCycleLength => 'Тривалість циклу';

  @override
  String get statsPeriodDuration => 'Місячні';

  @override
  String get statsRecentCycles => 'Останні цикли';

  @override
  String get statsEmptyHistory => 'Позначте місячні — тут з’явиться історія.';

  @override
  String get statsCurrentCycle => 'поточний цикл';

  @override
  String get exportDoctorPdf => 'Вивантажити для лікаря';

  @override
  String get exportDoctorPdfLoading => 'Готуємо PDF…';

  @override
  String get exportDoctorPdfHint =>
      'Файл можна надіслати лікарю. Поки ви самі не надішлете PDF, дані залишаються на пристрої.';

  @override
  String get legalDocumentLoadError => 'Не вдалося завантажити документ.';

  @override
  String get onboardingWelcomeTitle => 'Тихий календар для себе';

  @override
  String get onboardingWelcomeBody =>
      'Позначайте місячні одним дотиком. Прогноз, овуляція та самопочуття залишаються лише на цьому пристрої.';

  @override
  String get onboardingDateTitle => 'Коли почалися останні місячні?';

  @override
  String get pickDate => 'Вибрати дату';

  @override
  String get datePickerHelp => 'Початок останніх місячних';

  @override
  String get onboardingNext => 'Далі';

  @override
  String get onboardingBack => 'Назад';

  @override
  String get onboardingStart => 'Почати';

  @override
  String get aboutPhasesTitle => 'Як розраховуються фази';

  @override
  String get aboutPhasesBody1 =>
      'Цикл будується за вашими позначками: поспіль ідучі дні місячних — один цикл. Середня тривалість циклу та тривалість місячних розраховуються за останні 6 циклів. Якщо історії ще мало, беруться значення з налаштувань.';

  @override
  String get aboutPhasesBody2 =>
      'Овуляція: тривалість циклу мінус 14 днів від початку циклу. Фертильне вікно: 5 днів до овуляції та 1 день після. Прогноз наступних місячних: початок останнього циклу плюс середня тривалість.';

  @override
  String get aboutPhasesBody3 =>
      'Місячні, фолікулярна фаза, фертильне вікно, овуляція, лютеїнова фаза та затримка — орієнтир, а не медичний діагноз. Застосунок не замінює консультацію лікаря та не є засобом контрацепції. Дані залишаються лише на цьому пристрої.';

  @override
  String get legalSectionTitle => 'Юридичні документи';

  @override
  String get allMoiSoftApps => 'Усі застосунки МійСофт';

  @override
  String get privacyPolicyTitle => 'Політика конфіденційності';

  @override
  String get userAgreementTitle => 'Користувальницька угода';

  @override
  String get publicOfferTitle => 'Публічна оферта';

  @override
  String get consentPdTitle => 'Згода на обробку персональних даних';

  @override
  String get versionLabel => 'Версія';

  @override
  String get reminderNotificationBody =>
      'Завтра за прогнозом можуть початися місячні.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Вивантаження для лікаря — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Документ зібрано з позначок користувача на пристрої. Це не медичний висновок і не діагноз.';

  @override
  String get pdfSectionCycles => 'Цикли';

  @override
  String get pdfSectionDiary => 'Щоденник';

  @override
  String get pdfSummaryRegularity => 'Регулярність';

  @override
  String get pdfCyclesEmpty => 'Цикли ще не позначено.';

  @override
  String get pdfDiaryEmpty => 'У щоденнику немає позначок за цей період.';

  @override
  String get pdfColStart => 'Початок';

  @override
  String get pdfColEnd => 'Кінець';

  @override
  String get pdfColPeriodDays => 'Місячні';

  @override
  String get pdfColCycleLength => 'Тривалість циклу';

  @override
  String get pdfColDate => 'Дата';

  @override
  String get pdfColNote => 'Нотатка';

  @override
  String get pdfYes => 'так';

  @override
  String get pdfNo => 'ні';

  @override
  String get pdfCurrentCycleShort => 'поточний';

  @override
  String get pdfDiaryContinuation => 'Щоденник, продовження';

  @override
  String pdfPageFooter(int page, int pages) => 'Стор. $page з $pages';

  @override
  String get pdfShareSubject => 'Жіночий календар: вивантаження для лікаря';

  @override
  String get premiumBuyTitle => 'Купити преміум';

  @override
  String get premiumAfterPaymentHint =>
      'Після оплати вимикається вся реклама. Збережіть номер замовлення.';

  @override
  String get premiumPaySbp => 'Оплатити через СБП';

  @override
  String get premiumPayRustore => 'Оплатити в RuStore';

  @override
  String get premiumConsentPrefix => 'Погоджуюся з ';

  @override
  String get premiumConsentOfferLink => 'офертою';

  @override
  String get premiumConsentAnd => ' та ';

  @override
  String get premiumConsentPdLink => 'згодою на обробку персональних даних';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Не вдалося відкрити оплату';

  @override
  String get premiumRustoreUnavailable =>
      'Платежі RuStore недоступні. Встановіть RuStore.';

  @override
  String get premiumActivatedAdsOff => 'Преміум активовано. Рекламу вимкнено.';

  @override
  String get premiumPurchaseFailed => 'Покупка не вдалася. Спробуйте пізніше.';

  @override
  String get premiumActiveLabel => 'Преміум активний. Рекламу вимкнено.';

  @override
  String get premiumRestoreButton => 'Відновити покупку';

  @override
  String get premiumRestoreTitle => 'Відновити покупку';

  @override
  String get premiumRestoreBody =>
      'Введіть номер замовлення з чека або з екрана після оплати.';

  @override
  String get premiumOrderIdLabel => 'Номер замовлення';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Якщо номер утрачено — напишіть на $email';

  @override
  String get premiumRestoreAction => 'Відновити';

  @override
  String get premiumRestoreViaRustore => 'Відновити через RuStore';

  @override
  String get premiumEnterOrderId => 'Введіть номер замовлення';

  @override
  String get premiumRestoreSuccess => 'Покупку відновлено. Преміум активовано.';

  @override
  String get premiumRestoreNotFound =>
      'Платіж не знайдено або він не був успішним. Перевірте номер замовлення.';

  @override
  String get premiumRestoreCheckFailed => 'Не вдалося перевірити платіж';

  @override
  String get premiumRestoreRustoreSuccess =>
      'Покупку RuStore відновлено. Преміум активовано.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Активну покупку RuStore не знайдено.';

  @override
  String get premiumRestoreRustoreFailed =>
      'Не вдалося відновити покупку RuStore';

  @override
  String get premiumPaymentDescription => 'Преміум: вимкнення реклами';

  @override
  String get paymentOpeningBank => 'Відкриваємо форму Т-Банку…';

  @override
  String get paymentOpenFormFailed => 'Не вдалося відкрити форму оплати.';

  @override
  String get paymentReturnHint =>
      'Після оплати поверніться до застосунку. Статус оновиться сам.';

  @override
  String get paymentWaiting => 'Очікування оплати…';

  @override
  String paymentBankStatus(String status) => 'Статус: $status';

  @override
  String get paymentSuccess => 'Оплата пройшла успішно';

  @override
  String get paymentNotCompleted => 'Платіж не завершено';

  @override
  String get paymentFailedTitle => 'Оплата не пройшла';

  @override
  String get paymentFailedBody =>
      'Спробуйте ще раз або скористайтеся іншим способом оплати у вашому банку.';

  @override
  String get paymentGotIt => 'Зрозуміло';

  @override
  String get paymentPremiumActivatedTitle => 'Преміум активовано';

  @override
  String get paymentSaveOrderHint =>
      'Збережіть номер замовлення — він потрібен, щоб відновити покупку.';

  @override
  String paymentSheetTitle(int rubles) => 'Оплата $rubles ₽';

  @override
  String get paymentOrderCopied => 'Номер замовлення скопійовано';

  @override
  String get paymentSessionNotFound => 'Сесію оплати не знайдено';

  @override
  String get paymentCopyOrder => 'Копіювати';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
