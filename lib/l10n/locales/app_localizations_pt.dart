/// Португальская локализация (pt, Бразилия).
library;

import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';

/// Строки интерфейса на бразильском португальском языке.
class AppLocalizationsPtBr extends AppLocalizations {
  @override
  String get languageCode => 'pt';

  @override
  String get appName => 'Calendário Menstrual';

  @override
  String get appSubtitle => 'Calendário do ciclo';

  @override
  String get navToday => 'Hoje';

  @override
  String get navCalendar => 'Calendário';

  @override
  String get navStats => 'Ciclos';

  @override
  String get navSettings => 'Mais';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get cycleLengthLabel => 'Duração habitual do ciclo';

  @override
  String get periodDurationLabel => 'Duração da menstruação';

  @override
  String get daysUnit => 'dias';

  @override
  String get reminderTitle => 'Lembrete';

  @override
  String get reminderSubtitle => 'Um dia antes da menstruação prevista';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get aboutTitle => 'Sobre';

  @override
  String get aboutSubtitle => 'Fases do ciclo e documentos jurídicos';

  @override
  String get resetData => 'Apagar todos os dados';

  @override
  String get resetDialogTitle => 'Apagar os dados?';

  @override
  String get resetDialogBody =>
      'O calendário, as notas e as configurações serão excluídos. O onboarding começará de novo.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get writeToDeveloper => 'Falar com o desenvolvedor';

  @override
  String get addressCopied => 'Endereço copiado';

  @override
  String get emailFieldLabel => 'E-mail';

  @override
  String get emailFieldHint => 'name@mail.ru';

  @override
  String get resetConfirm => 'Apagar';

  @override
  String get loadCalendarError => 'Não foi possível carregar o calendário';

  @override
  String get persistError => 'Não foi possível salvar os dados';

  @override
  String get pdfExportError => 'Não foi possível gerar o PDF';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get dayN => 'Dia';

  @override
  String dayNumber(int n) => 'Dia $n';

  @override
  String get periodActive => 'Menstruação em andamento';

  @override
  String delayDays(int n) => 'Atraso de $n ${pluralDays(n)}';

  @override
  String daysUntilPeriod(int n) => '$n ${pluralDays(n)} até a menstruação';

  @override
  String pluralDays(int count) => count == 1 ? 'dia' : 'dias';

  @override
  String phaseTitle(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Menstruação',
      CyclePhase.follicular => 'Fase folicular',
      CyclePhase.fertile => 'Janela fértil',
      CyclePhase.ovulation => 'Ovulação',
      CyclePhase.luteal => 'Fase lútea',
      CyclePhase.late => 'Ciclo atrasado',
    };
  }

  @override
  String phaseHint(CyclePhase phase) {
    return switch (phase) {
      CyclePhase.menstruation => 'Descanse se precisar.',
      CyclePhase.follicular => 'A energia costuma aumentar.',
      CyclePhase.fertile => 'Maior chance de concepção.',
      CyclePhase.ovulation => 'Dia estimado da ovulação.',
      CyclePhase.luteal => 'Desacelere e escute o seu corpo.',
      CyclePhase.late =>
        'O ciclo está mais longo que o habitual — registre o início quando a menstruação começar.',
    };
  }

  @override
  String moodTitle(Mood mood) {
    return switch (mood) {
      Mood.great => 'Ótimo',
      Mood.good => 'Bem',
      Mood.okay => 'Normal',
      Mood.low => 'Triste',
      Mood.irritable => 'Irritada',
    };
  }

  @override
  String symptomTitle(Symptom symptom) {
    return switch (symptom) {
      Symptom.headache => 'Dor de cabeça',
      Symptom.tenderBreasts => 'Seios sensíveis',
      Symptom.backache => 'Dor nas costas',
      Symptom.acne => 'Problemas de pele',
      Symptom.abdominalPain => 'Dor abdominal',
      Symptom.bloating => 'Inchaço',
      Symptom.cramps => 'Cólicas',
      Symptom.fatigue => 'Cansaço',
    };
  }

  @override
  String flowTitle(FlowIntensity flow) {
    return switch (flow) {
      FlowIntensity.light => 'Leve',
      FlowIntensity.medium => 'Normal',
      FlowIntensity.heavy => 'Intenso',
    };
  }

  @override
  String regularityTitle(CycleRegularity regularity) {
    return switch (regularity) {
      CycleRegularity.unknown => 'Ainda há poucos dados',
      CycleRegularity.stable => 'Ciclo estável',
      CycleRegularity.mild => 'Variações leves',
      CycleRegularity.irregular => 'Ciclo ainda irregular',
    };
  }

  @override
  String get period => 'Menstruação';

  @override
  String get flow => 'Fluxo';

  @override
  String get mood => 'Humor';

  @override
  String get wellbeing => 'Bem-estar';

  @override
  String get noteHint => 'Nota';

  @override
  String get noteHintShort => 'Curta, se precisar';

  @override
  String get save => 'Salvar';

  @override
  String get calendarTitle => 'Calendário';

  @override
  String get legendPeriod => 'Menstruação';

  @override
  String get legendForecast => 'Previsão';

  @override
  String get legendFertile => 'Fértil';

  @override
  String get legendOvulation => 'Ovulação';

  @override
  String get statsTitle => 'Ciclos';

  @override
  String get statsCycleLength => 'Duração do ciclo';

  @override
  String get statsPeriodDuration => 'Menstruação';

  @override
  String get statsRecentCycles => 'Ciclos recentes';

  @override
  String get statsEmptyHistory =>
      'Registre a menstruação: o histórico aparecerá aqui.';

  @override
  String get statsCurrentCycle => 'ciclo atual';

  @override
  String get exportDoctorPdf => 'Exportar para o médico';

  @override
  String get exportDoctorPdfLoading => 'Gerando o PDF…';

  @override
  String get exportDoctorPdfHint =>
      'Você pode enviar o arquivo ao seu médico. Até você compartilhar o PDF, os dados ficam neste dispositivo.';

  @override
  String get legalDocumentLoadError => 'Não foi possível carregar o documento.';

  @override
  String get onboardingWelcomeTitle => 'Um calendário tranquilo para você';

  @override
  String get onboardingWelcomeBody =>
      'Registre a menstruação com um toque. Previsão, ovulação e bem-estar ficam apenas neste dispositivo.';

  @override
  String get onboardingDateTitle => 'Quando começou a sua última menstruação?';

  @override
  String get pickDate => 'Escolher data';

  @override
  String get datePickerHelp => 'Início da última menstruação';

  @override
  String get onboardingNext => 'Avançar';

  @override
  String get onboardingBack => 'Voltar';

  @override
  String get onboardingStart => 'Começar';

  @override
  String get aboutPhasesTitle => 'Como as fases são calculadas';

  @override
  String get aboutPhasesBody1 =>
      'O ciclo é construído a partir dos dias registrados: dias seguidos de menstruação formam um ciclo. A duração média do ciclo e da menstruação usa os últimos 6 ciclos; se o histórico for curto, são usados os valores das configurações.';

  @override
  String get aboutPhasesBody2 =>
      'Ovulação: duração do ciclo menos 14 dias a partir do início do ciclo. Janela fértil: 5 dias antes da ovulação e 1 dia depois. Previsão da próxima menstruação: início do último ciclo mais a duração média.';

  @override
  String get aboutPhasesBody3 =>
      'As fases são uma orientação, não um diagnóstico médico. O aplicativo não substitui um médico e não é um contraceptivo. Os dados ficam apenas neste dispositivo.';

  @override
  String get legalSectionTitle => 'Documentos jurídicos';

  @override
  String get allMoiSoftApps => 'Todos os apps do MoiSoft';

  @override
  String get privacyPolicyTitle => 'Política de privacidade';

  @override
  String get userAgreementTitle => 'Acordo de usuário';

  @override
  String get publicOfferTitle => 'Oferta pública';

  @override
  String get consentPdTitle => 'Consentimento de dados pessoais';

  @override
  String get versionLabel => 'Versão';

  @override
  String get reminderNotificationBody =>
      'Segundo a previsão, a menstruação pode começar amanhã.';

  @override
  String pdfDoctorExportSubtitle(String dateKey) =>
      'Exportação para o médico — $dateKey';

  @override
  String get pdfDisclaimer =>
      'Documento elaborado a partir dos registros do usuário no dispositivo. Não é um laudo médico nem um diagnóstico.';

  @override
  String get pdfSectionCycles => 'Ciclos';

  @override
  String get pdfSectionDiary => 'Diário';

  @override
  String get pdfSummaryRegularity => 'Regularidade';

  @override
  String get pdfCyclesEmpty => 'Ainda não há ciclos registrados.';

  @override
  String get pdfDiaryEmpty => 'Não há registros no diário para este período.';

  @override
  String get pdfColStart => 'Início';

  @override
  String get pdfColEnd => 'Fim';

  @override
  String get pdfColPeriodDays => 'Menstruação';

  @override
  String get pdfColCycleLength => 'Duração do ciclo';

  @override
  String get pdfColDate => 'Data';

  @override
  String get pdfColNote => 'Nota';

  @override
  String get pdfYes => 'sim';

  @override
  String get pdfNo => 'não';

  @override
  String get pdfCurrentCycleShort => 'atual';

  @override
  String get pdfDiaryContinuation => 'Diário (continuação)';

  @override
  String pdfPageFooter(int page, int pages) => 'Pág. $page de $pages';

  @override
  String get pdfShareSubject =>
      'Calendário Menstrual: exportação para o médico';

  @override
  String get premiumBuyTitle => 'Comprar premium';

  @override
  String get premiumAfterPaymentHint =>
      'Após o pagamento, todos os anúncios são desativados. Guarde o número do pedido.';

  @override
  String get premiumPaySbp => 'Pagar com SBP';

  @override
  String get premiumPayRustore => 'Pagar no RuStore';

  @override
  String get premiumConsentPrefix => 'Concordo com a ';

  @override
  String get premiumConsentOfferLink => 'oferta pública';

  @override
  String get premiumConsentAnd => ' e com o ';

  @override
  String get premiumConsentPdLink => 'consentimento de dados pessoais';

  @override
  String get premiumConsentSuffix => '.';

  @override
  String get premiumOpenPaymentFailed => 'Não foi possível abrir o pagamento';

  @override
  String get premiumRustoreUnavailable =>
      'Os pagamentos do RuStore estão indisponíveis. Instale o RuStore.';

  @override
  String get premiumActivatedAdsOff => 'Premium ativado. Anúncios desativados.';

  @override
  String get premiumPurchaseFailed =>
      'A compra não foi concluída. Tente novamente mais tarde.';

  @override
  String get premiumActiveLabel => 'Premium ativo. Anúncios desativados.';

  @override
  String get premiumRestoreButton => 'Restaurar compra';

  @override
  String get premiumRestoreTitle => 'Restaurar compra';

  @override
  String get premiumRestoreBody =>
      'Digite o número do pedido do recibo ou da tela exibida após o pagamento.';

  @override
  String get premiumOrderIdLabel => 'Número do pedido';

  @override
  String premiumRestoreSupportLine(String email) =>
      'Se perdeu o número, escreva para $email';

  @override
  String get premiumRestoreAction => 'Restaurar';

  @override
  String get premiumRestoreViaRustore => 'Restaurar pelo RuStore';

  @override
  String get premiumEnterOrderId => 'Digite o número do pedido';

  @override
  String get premiumRestoreSuccess => 'Compra restaurada. Premium ativado.';

  @override
  String get premiumRestoreNotFound =>
      'Pagamento não encontrado ou não concluído. Verifique o número do pedido.';

  @override
  String get premiumRestoreCheckFailed =>
      'Não foi possível verificar o pagamento';

  @override
  String get premiumRestoreRustoreSuccess =>
      'Compra do RuStore restaurada. Premium ativado.';

  @override
  String get premiumRestoreRustoreNotFound =>
      'Nenhuma compra ativa do RuStore encontrada.';

  @override
  String get premiumRestoreRustoreFailed =>
      'Não foi possível restaurar a compra do RuStore';

  @override
  String get premiumPaymentDescription => 'Premium: sem anúncios';

  @override
  String get paymentOpeningBank => 'Abrindo o pagamento do T-Bank…';

  @override
  String get paymentOpenFormFailed =>
      'Não foi possível abrir o formulário de pagamento.';

  @override
  String get paymentReturnHint =>
      'Após pagar, volte ao aplicativo. O status será atualizado automaticamente.';

  @override
  String get paymentWaiting => 'Aguardando o pagamento…';

  @override
  String paymentBankStatus(String status) => 'Status: $status';

  @override
  String get paymentSuccess => 'Pagamento realizado com sucesso';

  @override
  String get paymentNotCompleted => 'Pagamento não concluído';

  @override
  String get paymentFailedTitle => 'O pagamento não foi concluído';

  @override
  String get paymentFailedBody =>
      'Tente novamente ou use outro método de pagamento no aplicativo do seu banco.';

  @override
  String get paymentGotIt => 'Entendi';

  @override
  String get paymentPremiumActivatedTitle => 'Premium ativado';

  @override
  String get paymentSaveOrderHint =>
      'Guarde o número do pedido: você precisará dele para restaurar a compra.';

  @override
  String paymentSheetTitle(int rubles) => 'Pagamento $rubles ₽';

  @override
  String get paymentOrderCopied => 'Número do pedido copiado';

  @override
  String get paymentSessionNotFound => 'Sessão de pagamento não encontrada';

  @override
  String get paymentCopyOrder => 'Copiar';

  @override
  String cycleRange(DateTime start, DateTime end, int lengthDays) {
    return '${start.day}/${start.month}/${start.year} — ${end.day}/${end.month}/${end.year} · $lengthDays ${pluralDays(lengthDays)}';
  }
}
