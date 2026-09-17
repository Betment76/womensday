/// Оценка регулярности по последним циклам.
enum CycleRegularity {
  unknown,
  stable,
  mild,
  irregular;

  String get title {
    switch (this) {
      case CycleRegularity.unknown:
        return 'Пока мало данных';
      case CycleRegularity.stable:
        return 'Цикл стабильный';
      case CycleRegularity.mild:
        return 'Небольшие колебания';
      case CycleRegularity.irregular:
        return 'Цикл пока неровный';
    }
  }
}
