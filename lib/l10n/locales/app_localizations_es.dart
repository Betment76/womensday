/// Испанская локализация (es, Испания).
library;

import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Строки интерфейса на испанском языке (Испания).
class AppLocalizationsEs extends AppLocalizations {
  @override
  String get languageCode => 'es';

  @override
  String get appName => 'Calendario Menstrual';

  @override
  String get appSubtitle => 'Calendario del ciclo';

  @override
  String get navToday => 'Hoy';

  @override
  String get navCalendar => 'Calendario';

  @override
  String get navStats => 'Ciclos';

  @override
  String get navSettings => 'Más';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get cycleLengthLabel => 'Duración habitual del ciclo';

  @override
  String get periodDurationLabel => 'Duración de la regla';

  @override
  String get daysUnit => 'días';

  @override
  String get reminderTitle => 'Recordatorio';

  @override
  String get reminderSubtitle => 'Un día antes de la regla prevista';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get aboutSubtitle => 'Fases del ciclo y documentos legales';

  @override
  String get resetData => 'Borrar todos los datos';

  @override
  String get resetDialogTitle => '¿Borrar los datos?';

  @override
  String get resetDialogBody =>
      'Se eliminarán el calendario, las notas y los ajustes. El onboarding empezará de nuevo.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get writeToDeveloper => 'Escribir al desarrollador';

  @override
  String get addressCopied => 'Dirección copiada';

  @override
  String get emailFieldLabel => 'Email';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Borrar';

  @override
  String get loadCalendarError => 'No se pudo cargar el calendario';

  @override
  String get persistError => 'No se pudieron guardar los datos';

  @override
  String get pdfExportError => 'No se pudo preparar el PDF';

  @override
  String get retry => 'Reintentar';

  @override
  String get dayN => 'Día';

  @override
  String dayNumber(int n) => 'Día $n';

  @override
  String get periodActive => 'Regla en curso';

  @override
  String delayDays(int n) => 'Retraso de $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => '$n ${pluralDays(n)} hasta la regla';

  @override
  String pluralDays(int count) => count == 1 ? 'día' : 'días';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Regla',
      CyclePhase.follicular => 'Fase folicular',
      CyclePhase.fertile => 'Ventana fértil',
      CyclePhase.ovulation => 'Ovulación',
      CyclePhase.luteal => 'Fase lútea',
      CyclePhase.late => 'Ciclo retrasado',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Descansa si lo necesitas.',
      CyclePhase.follicular => 'La energía suele aumentar.',
      CyclePhase.fertile => 'Mayor probabilidad de concepción.',
      CyclePhase.ovulation => 'Día estimado de ovulación.',
      CyclePhase.luteal => 'Reduce el ritmo y escucha tu cuerpo.',
      CyclePhase.late =>
        'El ciclo es más largo de lo habitual — registra el inicio cuando llegue la regla.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Genial',
      Mood.good => 'Bien',
      Mood.okay => 'Normal',
      Mood.low => 'Triste',
      Mood.irritable => 'Irritable',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Dolor de cabeza',
      Symptom.tenderBreasts => 'Sensibilidad en el pecho',
      Symptom.backache => 'Dolor de espalda',
      Symptom.acne => 'Problemas de piel',
      Symptom.abdominalPain => 'Dolor abdominal',
      Symptom.bloating => 'Hinchazón',
      Symptom.cramps => 'Calambres',
      Symptom.fatigue => 'Cansancio',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Ligero',
      FlowIntensity.medium => 'Normal',
      FlowIntensity.heavy => 'Abundante',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Aún hay pocos datos',
      CycleRegularity.stable => 'Ciclo estable',
      CycleRegularity.mild => 'Variaciones leves',
      CycleRegularity.irregular => 'Ciclo irregular por ahora',
    };
  }

  @override
  String get period => 'Regla';

  @override
  String get flow => 'Flujo';

  @override
  String get mood => 'Ánimo';

  @override
  String get wellbeing => 'Bienestar';

  @override
  String get noteHint => 'Nota';

  @override
  String get noteHintShort => 'Breve, si lo necesitas';

  @override
  String get save => 'Guardar';

  @override
  String get calendarTitle => 'Calendario';

  @override
  String get legendPeriod => 'Regla';

  @override
  String get legendForecast => 'Previsión';

  @override
  String get legendFertile => 'Fértil';

  @override
  String get legendOvulation => 'Ovulación';

  @override
  String get statsTitle => 'Ciclos';

  @override
  String get statsCycleLength => 'Duración del ciclo';

  @override
  String get statsPeriodDuration => 'Regla';

  @override
  String get statsRecentCycles => 'Ciclos recientes';

  @override
  String get statsEmptyHistory =>
      'Registra tu regla: aquí aparecerá el historial.';

  @override
  String get statsCurrentCycle => 'ciclo actual';

  @override
  String get exportDoctorPdf => 'Exportar para el médico';

  @override
  String get exportDoctorPdfLoading => 'Preparando el PDF…';

  @override
  String get exportDoctorPdfHint =>
      'Puedes enviar el archivo a tu médico. Hasta que compartas el PDF, los datos permanecen en este dispositivo.';

  @override
  String get legalDocumentLoadError => 'No se pudo cargar el documento.';

  @override
  String get onboardingWelcomeTitle => 'Un calendario tranquilo para ti';

  @override
  String get onboardingWelcomeBody =>
      'Registra tu regla con un toque. La previsión, la ovulación y tu bienestar se quedan solo en este dispositivo.';

  @override
  String get onboardingDateTitle => '¿Cuándo empezó tu última regla?';

  @override
  String get pickDate => 'Elegir fecha';

  @override
  String get datePickerHelp => 'Inicio de la última regla';

  @override
  String get onboardingNext => 'Siguiente';

  @override
  String get onboardingBack => 'Atrás';

  @override
  String get onboardingStart => 'Empezar';

  @override
  String get aboutPhasesTitle => 'Cómo se calculan las fases';

  @override
  String get aboutPhasesBody1 =>
      'Tu ciclo se construye con los días registrados: los días consecutivos de regla forman un ciclo. La duración media del ciclo y de la regla se calcula con los últimos 6 ciclos; si el historial es corto, se usan los valores de los ajustes.';

  @override
  String get aboutPhasesBody2 =>
      'Ovulación: duración del ciclo menos 14 días desde el inicio del ciclo. Ventana fértil: 5 días antes de la ovulación y 1 día después. Previsión de la próxima regla: inicio del último ciclo más la duración media.';

  @override
  String get aboutPhasesBody3 =>
      'Las fases son una orientación, no un diagnóstico médico. La aplicación no sustituye a un médico ni es un anticonceptivo. Los datos se quedan solo en este dispositivo.';

  @override
  String get legalSectionTitle => 'Documentos legales';

  @override
  String get allMoiSoftApps => 'Todas las apps de MoiSoft';

  @override
  String get privacyPolicyTitle => 'Política de privacidad';

  @override
  String get userAgreementTitle => 'Acuerdo de usuario';

  @override
  String get publicOfferTitle => 'Oferta pública';

  @override
  String get consentPdTitle => 'Consentimiento de datos personales';

  @override
  String get versionLabel => 'Versión';

  @override
  String get reminderNotificationBody =>
      'Según la previsión, la regla puede empezar mañana.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Exportación para el médico — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Documento elaborado a partir de los registros del usuario en el dispositivo. No es un informe médico ni un diagnóstico.';

  @override
  String get pdfSectionCycles => 'Ciclos';

  @override
  String get pdfSectionDiary => 'Diario';

  @override
  String get pdfSummaryRegularity => 'Regularidad';

  @override
  String get pdfCyclesEmpty => 'Aún no hay ciclos registrados.';

  @override
  String get pdfDiaryEmpty => 'No hay entradas del diario en este periodo.';

  @override
  String get pdfColStart => 'Inicio';

  @override
  String get pdfColEnd => 'Fin';

  @override
  String get pdfColPeriodDays => 'Regla';

  @override
  String get pdfColCycleLength => 'Duración del ciclo';

  @override
  String get pdfColDate => 'Fecha';

  @override
  String get pdfColNote => 'Nota';

  @override
  String get pdfYes => 'sí';

  @override
  String get pdfNo => 'no';

  @override
  String get pdfCurrentCycleShort => 'actual';

  @override
  String get pdfDiaryContinuation => 'Diario (continuación)';

  @override
  String pdfPageFooter(int page, int pages) => 'Pág. $page de $pages';

  @override
  String get pdfShareSubject =>
      'Calendario Menstrual: exportación para el médico';

  @override
  String get premiumBuyTitle => 'Comprar premium';

  @override
  String get premiumAfterPaymentHint =>
      'Tras el pago se desactiva toda la publicidad. Guarda el número de pedido.';

  @override
  String get premiumPaySbp => 'Pagar con SBP';

  @override
  String get premiumPayRustore => 'Pagar en RuStore';

  @override
  String get premiumConsentPrefix => 'Acepto la ';

  @override
  String get premiumConsentOfferLink => 'oferta pública';

  @override
  String get premiumConsentAnd => ' y el ';

  @override
  String get premiumConsentPdLink => 'consentimiento de datos personales';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'No se pudo abrir el pago';

  @override
  String get premiumRustoreUnavailable =>
      'Los pagos de RuStore no están disponibles. Instala RuStore.';

  @override
  String get premiumActivatedAdsOff =>
      'Premium activado. Publicidad desactivada.';

  @override
  String get premiumPurchaseFailed =>
      'La compra no se ha realizado. Inténtalo más tarde.';

  @override
  String get premiumActiveLabel => 'Premium activo. Publicidad desactivada.';

  @override
  String get premiumRestoreButton => 'Restaurar compra';

  @override
  String get premiumRestoreTitle => 'Restaurar compra';

  @override
  String get premiumRestoreBody =>
      'Introduce el número de pedido del recibo o de la pantalla tras el pago.';

  @override
  String get premiumOrderIdLabel => 'Número de pedido';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Si has perdido el número, escribe a $email';

  @override
  String get premiumRestoreAction => 'Restaurar';

  @override
  String get premiumRestoreViaRustore => 'Restaurar mediante RuStore';

  @override
  String get premiumEnterOrderId => 'Introduce el número de pedido';

  @override
  String get premiumRestoreSuccess => 'Compra restaurada. Premium activado.';

  @override
  String get premiumRestoreNotFound =>
      'Pago no encontrado o no completado. Comprueba el número de pedido.';

  @override
  String get premiumRestoreCheckFailed => 'No se pudo verificar el pago';

  @override
  String get premiumRestoreRustoreSuccess =>
      'Compra de RuStore restaurada. Premium activado.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'No hay compras activas en RuStore.';

  @override
  String get premiumRestoreRustoreFailed =>
      'No se pudo restaurar la compra de RuStore';

  @override
  String get premiumPaymentDescription => 'Premium: sin publicidad';

  @override
  String get paymentOpeningBank => 'Abriendo el pago de T-Bank…';

  @override
  String get paymentOpenFormFailed => 'No se pudo abrir el formulario de pago.';

  @override
  String get paymentReturnHint =>
      'Tras pagar, vuelve a la aplicación. El estado se actualizará solo.';

  @override
  String get paymentWaiting => 'Esperando el pago…';

  @override
  String paymentBankStatus(String status) => 'Estado: $status';

  @override
  String get paymentSuccess => 'Pago realizado con éxito';

  @override
  String get paymentNotCompleted => 'Pago no completado';

  @override
  String get paymentFailedTitle => 'El pago no se ha realizado';

  @override
  String get paymentFailedBody =>
      'Inténtalo de nuevo o usa otro método de pago en la aplicación de tu banco.';

  @override
  String get paymentGotIt => 'Entendido';

  @override
  String get paymentPremiumActivatedTitle => 'Premium activado';

  @override
  String get paymentSaveOrderHint =>
      'Guarda el número de pedido: lo necesitarás para restaurar la compra.';

  @override
  String paymentSheetTitle(int rubles) => 'Pago $rubles ₽';

  @override
  String get paymentOrderCopied => 'Número de pedido copiado';

  @override
  String get paymentSessionNotFound => 'Sesión de pago no encontrada';

  @override
  String get paymentCopyOrder => 'Copiar';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
