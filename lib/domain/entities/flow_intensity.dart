/// Интенсивность выделений.
enum FlowIntensity {
  light,
  medium,
  heavy;

  String get title {
    switch (this) {
      case FlowIntensity.light:
        return 'Слабые';
      case FlowIntensity.medium:
        return 'Обычные';
      case FlowIntensity.heavy:
        return 'Обильные';
    }
  }

  int get dropCount {
    return switch (this) {
      FlowIntensity.light => 3,
      FlowIntensity.medium => 4,
      FlowIntensity.heavy => 5,
    };
  }
}

extension FlowIntensityExtension on FlowIntensity {
  static FlowIntensity? fromName(String? name) {
    if (name == null) {
      return null;
    }
    for (final FlowIntensity flow in FlowIntensity.values) {
      if (flow.name == name) {
        return flow;
      }
    }
    return null;
  }
}
