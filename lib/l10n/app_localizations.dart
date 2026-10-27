import 'package:flutter/material.dart';
import 'package:womensday/core/constants/calendar_message_codes.dart';
import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';

/// Строки интерфейса (ru / en).
abstract class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    Locale('en'),
  ];

  static AppLocalizations of(BuildContext context) {
    final AppLocalizations? value = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    assert(value != null, 'AppLocalizations not found in context');
    return value!;
  }

  /// Строки без [BuildContext] (уведомления, snackbar до дерева).
  static AppLocalizations lookup(Locale locale) {
    if (locale.languageCode == 'en') {
      return AppLocalizationsEn();
    }
    return AppLocalizationsRu();
  }

  String get languageCode;

  String get appName;
  String get appSubtitle;
  String get navToday;
  String get navCalendar;
  String get navStats;
  String get navSettings;
  String get settingsTitle;
  String get cycleLengthLabel;
  String get periodDurationLabel;
  String get daysUnit;
  String get reminderTitle;
  String get reminderSubtitle;
  String get languageTitle;
  String get aboutTitle;
  String get aboutSubtitle;
  String get resetData;
  String get resetDialogTitle;
  String get resetDialogBody;
  String get cancel;
  String get resetConfirm;
  String get loadCalendarError;
  String get persistError;
  String get pdfExportError;
  String get retry;
  String get dayN;
  String dayNumber(int n);
  String get periodActive;
  String delayDays(int n);
  String daysUntilPeriod(int n);
  String pluralDays(int count);
  String phaseTitle(CyclePhase phase);
  String phaseHint(CyclePhase phase);
  String moodTitle(Mood mood);
  String symptomTitle(Symptom symptom);
  String flowTitle(FlowIntensity flow);
  String regularityTitle(CycleRegularity regularity);
  String get period;
  String get flow;
  String get mood;
  String get wellbeing;
  String get noteHint;
  String get noteHintShort;
  String get save;
  String get calendarTitle;
  String get legendPeriod;
  String get legendForecast;
  String get legendFertile;
  String get legendOvulation;
  String get statsTitle;
  String get statsCycleLength;
  String get statsPeriodDuration;
  String get statsRecentCycles;
  String get statsEmptyHistory;
  String get statsCurrentCycle;
  String get exportDoctorPdf;
  String get exportDoctorPdfLoading;
  String get exportDoctorPdfHint;
  String get legalDocumentLoadError;
  String get onboardingWelcomeTitle;
  String get onboardingWelcomeBody;
  String get onboardingDateTitle;
  String get pickDate;
  String get datePickerHelp;
  String get onboardingNext;
  String get onboardingBack;
  String get onboardingStart;
  String get aboutPhasesTitle;
  String get aboutPhasesBody1;
  String get aboutPhasesBody2;
  String get aboutPhasesBody3;
  String get legalSectionTitle;
  String get legalSectionSubtitle;
  String get privacyPolicyTitle;
  String get userAgreementTitle;
  String get publicOfferTitle;
  String get consentPdTitle;
  String get versionLabel;
  String get reminderNotificationBody;
  String pdfDoctorExportSubtitle(String dateKey);
  String get pdfDisclaimer;
  String get pdfSectionCycles;
  String get pdfSectionDiary;
  String get pdfSummaryRegularity;
  String get pdfCyclesEmpty;
  String get pdfDiaryEmpty;
  String get pdfColStart;
  String get pdfColEnd;
  String get pdfColPeriodDays;
  String get pdfColCycleLength;
  String get pdfColDate;
  String get pdfColNote;
  String get pdfYes;
  String get pdfNo;
  String get pdfCurrentCycleShort;
  String get pdfDiaryContinuation;
  String pdfPageFooter(int page, int pages);
  String get pdfShareSubject;
  String get premiumBuyTitle;
  String get premiumAfterPaymentHint;
  String get premiumPaySbp;
  String get premiumPayRustore;
  String get premiumConsentPrefix;
  String get premiumConsentOfferLink;
  String get premiumConsentAnd;
  String get premiumConsentPdLink;
  String get premiumConsentSuffix;
  String get premiumOpenPaymentFailed;
  String get premiumRustoreUnavailable;
  String get premiumActivatedAdsOff;
  String get premiumPurchaseFailed;
  String get premiumActiveLabel;
  String get premiumRestoreButton;
  String get premiumRestoreTitle;
  String get premiumRestoreBody;
  String get premiumOrderIdLabel;
  String premiumRestoreSupportLine(String email);
  String get premiumRestoreAction;
  String get premiumRestoreViaRustore;
  String get premiumEnterOrderId;
  String get premiumRestoreSuccess;
  String get premiumRestoreNotFound;
  String get premiumRestoreCheckFailed;
  String get premiumRestoreRustoreSuccess;
  String get premiumRestoreRustoreNotFound;
  String get premiumRestoreRustoreFailed;
  String get premiumPaymentDescription;
  String get paymentOpeningBank;
  String get paymentOpenFormFailed;
  String get paymentReturnHint;
  String get paymentWaiting;
  String paymentBankStatus(String status);
  String get paymentSuccess;
  String get paymentNotCompleted;
  String get paymentFailedTitle;
  String get paymentFailedBody;
  String get paymentGotIt;
  String get paymentPremiumActivatedTitle;
  String get paymentSaveOrderHint;
  String paymentSheetTitle(int rubles);
  String get paymentOrderCopied;
  String get paymentSessionNotFound;
  String get paymentCopyOrder;
  String cycleRange(DateTime start, DateTime end, int lengthDays);

  String messageForCode(String code) {
    return switch (code) {
      CalendarMessageCode.loadFailed => loadCalendarError,
      CalendarMessageCode.pdfFailed => pdfExportError,
      CalendarMessageCode.persistFailed => persistError,
      _ => persistError,
    };
  }
}

class AppLocalizationsRu extends AppLocalizations {
  @override
  String get languageCode => 'ru';

  @override
  String get appName => 'Мой женский календарь';

  @override
  String get appSubtitle => 'Календарь цикла';

  @override
  String get navToday => 'Сегодня';

  @override
  String get navCalendar => 'Календарь';

  @override
  String get navStats => 'Циклы';

  @override
  String get navSettings => 'Ещё';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get cycleLengthLabel => 'Обычная длина цикла';

  @override
  String get periodDurationLabel => 'Длительность месячных';

  @override
  String get daysUnit => 'дней';

  @override
  String get reminderTitle => 'Напоминание';

  @override
  String get reminderSubtitle => 'За день до прогноза месячных';

  @override
  String get languageTitle => 'Язык';

  @override
  String get aboutTitle => 'О приложении';

  @override
  String get aboutSubtitle => 'Фазы цикла и юридические документы';

  @override
  String get resetData => 'Сбросить все данные';

  @override
  String get resetDialogTitle => 'Сбросить данные?';

  @override
  String get resetDialogBody =>
      'Календарь, заметки и настройки будут удалены. Онбординг начнётся заново.';

  @override
  String get cancel => 'Отмена';

  @override
  String get resetConfirm => 'Сбросить';

  @override
  String get loadCalendarError => 'Не удалось загрузить календарь';

  @override
  String get persistError => 'Не удалось сохранить данные';

  @override
  String get pdfExportError => 'Не удалось подготовить PDF';

  @override
  String get retry => 'Повторить';

  @override
  String get dayN => 'День';

  @override
  String dayNumber(int n) => 'День $n';

  @override
  String get periodActive => 'Идут месячные';

  @override
  String delayDays(int n) => 'Задержка $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => 'До месячных $n ${pluralDays(n)}';

  @override
  String pluralDays(int count) {
    final int absCount = count.abs();
    final int n = absCount % 100;
    final int n1 = n % 10;
    if (n > 10 && n < 20) {
      return 'дней';
    }
    if (n1 == 1) {
      return 'день';
    }
    if (n1 >= 2 && n1 <= 4) {
      return 'дня';
    }
    return 'дней';
  }

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Месячные',
      CyclePhase.follicular => 'Фолликулярная фаза',
      CyclePhase.fertile => 'Фертильное окно',
      CyclePhase.ovulation => 'Овуляция',
      CyclePhase.luteal => 'Лютеиновая фаза',
      CyclePhase.late => 'Задержка',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Берегите себя и отдыхайте, если нужно.',
      CyclePhase.follicular => 'Энергии обычно становится больше.',
      CyclePhase.fertile => 'Повышенная вероятность зачатия.',
      CyclePhase.ovulation => 'Предполагаемый день овуляции.',
      CyclePhase.luteal => 'Можно замедлиться и прислушаться к себе.',
      CyclePhase.late =>
        'Цикл длиннее обычного — отметьте начало, когда начнётся.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Отлично',
      Mood.good => 'Хорошо',
      Mood.okay => 'Нормально',
      Mood.low => 'Грустно',
      Mood.irritable => 'Раздражение',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Болит голова',
      Symptom.tenderBreasts => 'Болит грудь',
      Symptom.backache => 'Болит спина',
      Symptom.acne => 'Болит кожа',
      Symptom.abdominalPain => 'Болит живот',
      Symptom.bloating => 'Вздутие',
      Symptom.cramps => 'Спазмы',
      Symptom.fatigue => 'Усталость',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Слабые',
      FlowIntensity.medium => 'Обычные',
      FlowIntensity.heavy => 'Обильные',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Пока мало данных',
      CycleRegularity.stable => 'Цикл стабильный',
      CycleRegularity.mild => 'Небольшие колебания',
      CycleRegularity.irregular => 'Цикл пока неровный',
    };
  }

  @override
  String get period => 'Месячные';

  @override
  String get flow => 'Выделения';

  @override
  String get mood => 'Настроение';

  @override
  String get wellbeing => 'Самочувствие';

  @override
  String get noteHint => 'Заметка';

  @override
  String get noteHintShort => 'Коротко, если нужно';

  @override
  String get save => 'Сохранить';

  @override
  String get calendarTitle => 'Календарь';

  @override
  String get legendPeriod => 'Месячные';

  @override
  String get legendForecast => 'Прогноз';

  @override
  String get legendFertile => 'Фертильные';

  @override
  String get legendOvulation => 'Овуляция';

  @override
  String get statsTitle => 'Циклы';

  @override
  String get statsCycleLength => 'Длина цикла';

  @override
  String get statsPeriodDuration => 'Месячные';

  @override
  String get statsRecentCycles => 'Последние циклы';

  @override
  String get statsEmptyHistory => 'Отметьте месячные — здесь появится история.';

  @override
  String get statsCurrentCycle => 'текущий цикл';

  @override
  String get exportDoctorPdf => 'Выгрузить для врача';

  @override
  String get exportDoctorPdfLoading => 'Готовим PDF…';

  @override
  String get exportDoctorPdfHint =>
      'Файл можно отправить врачу. Пока вы сами не отправите PDF, данные остаются на устройстве.';

  @override
  String get legalDocumentLoadError => 'Не удалось загрузить документ.';

  @override
  String get onboardingWelcomeTitle => 'Тихий календарь для себя';

  @override
  String get onboardingWelcomeBody =>
      'Отмечайте месячные в одно касание. Прогноз, овуляция и самочувствие остаются только на этом устройстве.';

  @override
  String get onboardingDateTitle => 'Когда начались последние месячные?';

  @override
  String get pickDate => 'Выбрать дату';

  @override
  String get datePickerHelp => 'Начало последних месячных';

  @override
  String get onboardingNext => 'Далее';

  @override
  String get onboardingBack => 'Назад';

  @override
  String get onboardingStart => 'Начать';

  @override
  String get aboutPhasesTitle => 'Как считаются фазы';

  @override
  String get aboutPhasesBody1 =>
      'Цикл строится по вашим отметкам: подряд идущие дни месячных — один цикл. Средняя длина цикла и длительность месячных считаются по последним 6 циклам. Если истории ещё мало, берутся значения из настроек.';

  @override
  String get aboutPhasesBody2 =>
      'Овуляция: длина цикла минус 14 дней от начала текущего цикла. Фертильное окно: 5 дней до овуляции и 1 день после. Прогноз следующих месячных: начало последнего цикла плюс средняя длина.';

  @override
  String get aboutPhasesBody3 =>
      'Месячные, фолликулярная фаза, фертильное окно, овуляция, лютеиновая фаза и задержка — ориентир, а не медицинский диагноз. Приложение не заменяет консультацию врача и не является средством контрацепции. Данные остаются только на этом устройстве.';

  @override
  String get legalSectionTitle => 'Юридические документы';

  @override
  String get legalSectionSubtitle => 'ФЗ-152, политика, соглашение и оферта';

  @override
  String get privacyPolicyTitle => 'Политика конфиденциальности';

  @override
  String get userAgreementTitle => 'Пользовательское соглашение';

  @override
  String get publicOfferTitle => 'Публичная оферта';

  @override
  String get consentPdTitle => 'Согласие на обработку ПД';

  @override
  String get versionLabel => 'Версия';

  @override
  String get reminderNotificationBody =>
      'Завтра по прогнозу могут начаться месячные.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Выгрузка для врача — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Документ собран из отметок пользователя на устройстве. Это не медицинское заключение и не диагноз.';

  @override
  String get pdfSectionCycles => 'Циклы';

  @override
  String get pdfSectionDiary => 'Дневник';

  @override
  String get pdfSummaryRegularity => 'Регулярность';

  @override
  String get pdfCyclesEmpty => 'Циклы ещё не отмечены.';

  @override
  String get pdfDiaryEmpty => 'В дневнике нет отметок за этот период.';

  @override
  String get pdfColStart => 'Начало';

  @override
  String get pdfColEnd => 'Конец';

  @override
  String get pdfColPeriodDays => 'Месячные';

  @override
  String get pdfColCycleLength => 'Длина цикла';

  @override
  String get pdfColDate => 'Дата';

  @override
  String get pdfColNote => 'Заметка';

  @override
  String get pdfYes => 'да';

  @override
  String get pdfNo => 'нет';

  @override
  String get pdfCurrentCycleShort => 'текущий';

  @override
  String get pdfDiaryContinuation => 'Дневник, продолжение';

  @override
  String pdfPageFooter(int page, int pages) => 'Стр. $page из $pages';

  @override
  String get pdfShareSubject => 'Мой женский календарь: выгрузка для врача';

  @override
  String get premiumBuyTitle => 'Купить премиум';

  @override
  String get premiumAfterPaymentHint =>
      'После оплаты отключается вся реклама. Сохраните номер заказа.';

  @override
  String get premiumPaySbp => 'Оплатить СБП';

  @override
  String get premiumPayRustore => 'Оплатить в RuStore';

  @override
  String get premiumConsentPrefix => 'Согласен с ';

  @override
  String get premiumConsentOfferLink => 'офертой';

  @override
  String get premiumConsentAnd => ' и ';

  @override
  String get premiumConsentPdLink => 'согласием';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Не удалось открыть оплату';

  @override
  String get premiumRustoreUnavailable =>
      'Платежи RuStore недоступны. Установите RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'Премиум активирован. Реклама отключена.';

  @override
  String get premiumPurchaseFailed => 'Покупка не удалась. Попробуйте позже.';

  @override
  String get premiumActiveLabel => 'Премиум активен. Реклама отключена.';

  @override
  String get premiumRestoreButton => 'Восстановить покупку';

  @override
  String get premiumRestoreTitle => 'Восстановить покупку';

  @override
  String get premiumRestoreBody =>
      'Введите номер заказа из чека или с экрана после оплаты.';

  @override
  String get premiumOrderIdLabel => 'Номер заказа';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Если номер утерян — напишите на $email';

  @override
  String get premiumRestoreAction => 'Восстановить';

  @override
  String get premiumRestoreViaRustore => 'Восстановить через RuStore';

  @override
  String get premiumEnterOrderId => 'Введите номер заказа';

  @override
  String get premiumRestoreSuccess =>
      'Покупка восстановлена. Премиум активирован.';

  @override
  String get premiumRestoreNotFound =>
      'Платёж не найден или не был успешным. Проверьте номер заказа.';

  @override
  String get premiumRestoreCheckFailed => 'Не удалось проверить платёж';

  @override
  String get premiumRestoreRustoreSuccess =>
      'Покупка RuStore восстановлена. Премиум активирован.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Активная покупка RuStore не найдена.';

  @override
  String get premiumRestoreRustoreFailed =>
      'Не удалось восстановить покупку RuStore';

  @override
  String get premiumPaymentDescription => 'Премиум: отключение рекламы';

  @override
  String get paymentOpeningBank => 'Открываем форму Т‑Банка…';

  @override
  String get paymentOpenFormFailed => 'Не удалось открыть форму оплаты.';

  @override
  String get paymentReturnHint =>
      'После оплаты вернитесь в приложение. Статус обновится сам.';

  @override
  String get paymentWaiting => 'Ожидание оплаты…';

  @override
  String paymentBankStatus(String status) => 'Статус: $status';

  @override
  String get paymentSuccess => 'Оплата прошла успешно';

  @override
  String get paymentNotCompleted => 'Платёж не завершён';

  @override
  String get paymentFailedTitle => 'Оплата не прошла';

  @override
  String get paymentFailedBody =>
      'Попробуйте ещё раз или воспользуйтесь другим способом оплаты в вашем банке.';

  @override
  String get paymentGotIt => 'Понятно';

  @override
  String get paymentPremiumActivatedTitle => 'Премиум активирован';

  @override
  String get paymentSaveOrderHint =>
      'Сохраните номер заказа — он нужен, чтобы восстановить покупку.';

  @override
  String paymentSheetTitle(int rubles) => 'Оплата $rubles ₽';

  @override
  String get paymentOrderCopied => 'Номер заказа скопирован';

  @override
  String get paymentSessionNotFound => 'Сессия оплаты не найдена';

  @override
  String get paymentCopyOrder => 'Скопировать';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}.${start.month}.${start.year} — ${end.day}.${end.month}.${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}

class AppLocalizationsEn extends AppLocalizations {
  @override
  String get languageCode => 'en';

  @override
  String get appName => 'My Women\'s Calendar';

  @override
  String get appSubtitle => 'Cycle calendar';

  @override
  String get navToday => 'Today';

  @override
  String get navCalendar => 'Calendar';

  @override
  String get navStats => 'Cycles';

  @override
  String get navSettings => 'More';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get cycleLengthLabel => 'Typical cycle length';

  @override
  String get periodDurationLabel => 'Period duration';

  @override
  String get daysUnit => 'days';

  @override
  String get reminderTitle => 'Reminder';

  @override
  String get reminderSubtitle => 'One day before predicted period';

  @override
  String get languageTitle => 'Language';

  @override
  String get aboutTitle => 'About';

  @override
  String get aboutSubtitle => 'Cycle phases and legal documents';

  @override
  String get resetData => 'Reset all data';

  @override
  String get resetDialogTitle => 'Reset data?';

  @override
  String get resetDialogBody =>
      'Calendar, notes and settings will be deleted. Onboarding will start again.';

  @override
  String get cancel => 'Cancel';

  @override
  String get resetConfirm => 'Reset';

  @override
  String get loadCalendarError => 'Could not load calendar';

  @override
  String get persistError => 'Could not save data';

  @override
  String get pdfExportError => 'Could not prepare PDF';

  @override
  String get retry => 'Retry';

  @override
  String get dayN => 'Day';

  @override
  String dayNumber(int n) => 'Day $n';

  @override
  String get periodActive => 'Period in progress';

  @override
  String delayDays(int n) => 'Late by $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => '$n ${pluralDays(n)} until period';

  @override
  String pluralDays(int count) => count == 1 ? 'day' : 'days';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Period',
      CyclePhase.follicular => 'Follicular phase',
      CyclePhase.fertile => 'Fertile window',
      CyclePhase.ovulation => 'Ovulation',
      CyclePhase.luteal => 'Luteal phase',
      CyclePhase.late => 'Late cycle',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Rest if you need to.',
      CyclePhase.follicular => 'Energy often increases.',
      CyclePhase.fertile => 'Higher chance of conception.',
      CyclePhase.ovulation => 'Estimated ovulation day.',
      CyclePhase.luteal => 'Slow down and listen to your body.',
      CyclePhase.late =>
        'Cycle is longer than usual — log when period starts.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Great',
      Mood.good => 'Good',
      Mood.okay => 'Okay',
      Mood.low => 'Low',
      Mood.irritable => 'Irritable',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Headache',
      Symptom.tenderBreasts => 'Breast tenderness',
      Symptom.backache => 'Back pain',
      Symptom.acne => 'Skin issues',
      Symptom.abdominalPain => 'Abdominal pain',
      Symptom.bloating => 'Bloating',
      Symptom.cramps => 'Cramps',
      Symptom.fatigue => 'Fatigue',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Light',
      FlowIntensity.medium => 'Medium',
      FlowIntensity.heavy => 'Heavy',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Not enough data yet',
      CycleRegularity.stable => 'Stable cycle',
      CycleRegularity.mild => 'Minor variations',
      CycleRegularity.irregular => 'Irregular so far',
    };
  }

  @override
  String get period => 'Period';

  @override
  String get flow => 'Flow';

  @override
  String get mood => 'Mood';

  @override
  String get wellbeing => 'Wellbeing';

  @override
  String get noteHint => 'Note';

  @override
  String get noteHintShort => 'Short note if needed';

  @override
  String get save => 'Save';

  @override
  String get calendarTitle => 'Calendar';

  @override
  String get legendPeriod => 'Period';

  @override
  String get legendForecast => 'Forecast';

  @override
  String get legendFertile => 'Fertile';

  @override
  String get legendOvulation => 'Ovulation';

  @override
  String get statsTitle => 'Cycles';

  @override
  String get statsCycleLength => 'Cycle length';

  @override
  String get statsPeriodDuration => 'Period';

  @override
  String get statsRecentCycles => 'Recent cycles';

  @override
  String get statsEmptyHistory =>
      'Log your period — history will appear here.';

  @override
  String get statsCurrentCycle => 'current cycle';

  @override
  String get exportDoctorPdf => 'Export for doctor';

  @override
  String get exportDoctorPdfLoading => 'Preparing PDF…';

  @override
  String get exportDoctorPdfHint =>
      'You can send the file to your doctor. Until you share the PDF, data stays on this device.';

  @override
  String get legalDocumentLoadError => 'Could not load document.';

  @override
  String get onboardingWelcomeTitle => 'A quiet calendar for you';

  @override
  String get onboardingWelcomeBody =>
      'Log your period in one tap. Forecast, ovulation and wellbeing stay on this device only.';

  @override
  String get onboardingDateTitle => 'When did your last period start?';

  @override
  String get pickDate => 'Pick date';

  @override
  String get datePickerHelp => 'Last period start';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingBack => 'Back';

  @override
  String get onboardingStart => 'Get started';

  @override
  String get aboutPhasesTitle => 'How phases are calculated';

  @override
  String get aboutPhasesBody1 =>
      'Your cycle is built from logged days: consecutive period days form one cycle. Average cycle length and period duration use the last 6 cycles; if history is short, settings values are used.';

  @override
  String get aboutPhasesBody2 =>
      'Ovulation: cycle length minus 14 days from cycle start. Fertile window: 5 days before ovulation and 1 day after. Next period forecast: last cycle start plus average length.';

  @override
  String get aboutPhasesBody3 =>
      'Phases are guidance, not a medical diagnosis. The app does not replace a doctor or serve as contraception. Data stays on this device only.';

  @override
  String get legalSectionTitle => 'Legal documents';

  @override
  String get legalSectionSubtitle => 'Privacy, terms and public offer';

  @override
  String get privacyPolicyTitle => 'Privacy policy';

  @override
  String get userAgreementTitle => 'User agreement';

  @override
  String get publicOfferTitle => 'Public offer';

  @override
  String get consentPdTitle => 'Personal data consent';

  @override
  String get versionLabel => 'Version';

  @override
  String get reminderNotificationBody =>
      'Your period may start tomorrow according to the forecast.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Export for doctor — $dateKey';

  @override
  String get pdfDisclaimer =>
      'This document is built from user logs on the device. It is not a medical report or diagnosis.';

  @override
  String get pdfSectionCycles => 'Cycles';

  @override
  String get pdfSectionDiary => 'Diary';

  @override
  String get pdfSummaryRegularity => 'Regularity';

  @override
  String get pdfCyclesEmpty => 'No cycles logged yet.';

  @override
  String get pdfDiaryEmpty => 'No diary entries for this period.';

  @override
  String get pdfColStart => 'Start';

  @override
  String get pdfColEnd => 'End';

  @override
  String get pdfColPeriodDays => 'Period';

  @override
  String get pdfColCycleLength => 'Cycle length';

  @override
  String get pdfColDate => 'Date';

  @override
  String get pdfColNote => 'Note';

  @override
  String get pdfYes => 'yes';

  @override
  String get pdfNo => 'no';

  @override
  String get pdfCurrentCycleShort => 'current';

  @override
  String get pdfDiaryContinuation => 'Diary (continued)';

  @override
  String pdfPageFooter(int page, int pages) => 'Page $page of $pages';

  @override
  String get pdfShareSubject => 'My Women\'s Calendar: doctor export';

  @override
  String get premiumBuyTitle => 'Buy premium';

  @override
  String get premiumAfterPaymentHint =>
      'After payment, all ads are removed. Save your order number.';

  @override
  String get premiumPaySbp => 'Pay via FPS (SBP)';

  @override
  String get premiumPayRustore => 'Pay in RuStore';

  @override
  String get premiumConsentPrefix => 'I agree to the ';

  @override
  String get premiumConsentOfferLink => 'public offer';

  @override
  String get premiumConsentAnd => ' and ';

  @override
  String get premiumConsentPdLink => 'personal data consent';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Could not open payment';

  @override
  String get premiumRustoreUnavailable =>
      'RuStore payments are unavailable. Install RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'Premium activated. Ads are disabled.';

  @override
  String get premiumPurchaseFailed => 'Purchase failed. Try again later.';

  @override
  String get premiumActiveLabel => 'Premium is active. Ads are disabled.';

  @override
  String get premiumRestoreButton => 'Restore purchase';

  @override
  String get premiumRestoreTitle => 'Restore purchase';

  @override
  String get premiumRestoreBody =>
      'Enter the order number from your receipt or the post-payment screen.';

  @override
  String get premiumOrderIdLabel => 'Order number';

  @override
  String premiumRestoreSupportLine(String email) =>
      'If you lost the number, contact $email';

  @override
  String get premiumRestoreAction => 'Restore';

  @override
  String get premiumRestoreViaRustore => 'Restore via RuStore';

  @override
  String get premiumEnterOrderId => 'Enter order number';

  @override
  String get premiumRestoreSuccess =>
      'Purchase restored. Premium activated.';

  @override
  String get premiumRestoreNotFound =>
      'Payment not found or not successful. Check the order number.';

  @override
  String get premiumRestoreCheckFailed => 'Could not verify payment';

  @override
  String get premiumRestoreRustoreSuccess =>
      'RuStore purchase restored. Premium activated.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'No active RuStore purchase found.';

  @override
  String get premiumRestoreRustoreFailed =>
      'Could not restore RuStore purchase';

  @override
  String get premiumPaymentDescription => 'Premium: ad-free';

  @override
  String get paymentOpeningBank => 'Opening T-Bank payment…';

  @override
  String get paymentOpenFormFailed => 'Could not open payment form.';

  @override
  String get paymentReturnHint =>
      'After paying, return to the app. Status will update automatically.';

  @override
  String get paymentWaiting => 'Waiting for payment…';

  @override
  String paymentBankStatus(String status) => 'Status: $status';

  @override
  String get paymentSuccess => 'Payment successful';

  @override
  String get paymentNotCompleted => 'Payment not completed';

  @override
  String get paymentFailedTitle => 'Payment failed';

  @override
  String get paymentFailedBody =>
      'Try again or use another payment method in your bank app.';

  @override
  String get paymentGotIt => 'OK';

  @override
  String get paymentPremiumActivatedTitle => 'Premium activated';

  @override
  String get paymentSaveOrderHint =>
      'Save the order number — you need it to restore your purchase.';

  @override
  String paymentSheetTitle(int rubles) => 'Payment $rubles ₽';

  @override
  String get paymentOrderCopied => 'Order number copied';

  @override
  String get paymentSessionNotFound => 'Payment session not found';

  @override
  String get paymentCopyOrder => 'Copy';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == 'ru' || locale.languageCode == 'en';
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    if (locale.languageCode == 'en') {
      return AppLocalizationsEn();
    }
    return AppLocalizationsRu();
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
