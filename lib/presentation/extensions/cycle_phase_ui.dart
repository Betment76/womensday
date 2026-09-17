import 'package:womensday/domain/entities/cycle_phase.dart';

/// Подсказки фаз для экранов.
extension CyclePhaseUi on CyclePhase {
  String get hint {
    switch (this) {
      case CyclePhase.menstruation:
        return 'Берегите себя и отдыхайте, если нужно.';
      case CyclePhase.follicular:
        return 'Энергии обычно становится больше.';
      case CyclePhase.fertile:
        return 'Повышенная вероятность зачатия.';
      case CyclePhase.ovulation:
        return 'Предполагаемый день овуляции.';
      case CyclePhase.luteal:
        return 'Можно замедлиться и прислушаться к себе.';
      case CyclePhase.late:
        return 'Цикл длиннее обычного — отметьте начало, когда начнётся.';
    }
  }
}
