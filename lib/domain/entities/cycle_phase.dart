/// Фаза цикла.
enum CyclePhase {
  menstruation,
  follicular,
  fertile,
  ovulation,
  luteal,
  late;

  String get title {
    switch (this) {
      case CyclePhase.menstruation:
        return 'Месячные';
      case CyclePhase.follicular:
        return 'Фолликулярная фаза';
      case CyclePhase.fertile:
        return 'Фертильное окно';
      case CyclePhase.ovulation:
        return 'Овуляция';
      case CyclePhase.luteal:
        return 'Лютеиновая фаза';
      case CyclePhase.late:
        return 'Задержка';
    }
  }
}
