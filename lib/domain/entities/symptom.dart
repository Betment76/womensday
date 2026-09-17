/// Симптом дня.
enum Symptom {
  headache,
  tenderBreasts,
  backache,
  acne,
  abdominalPain,
  bloating,
  cramps,
  fatigue;

  String get title {
    switch (this) {
      case Symptom.headache:
        return 'Болит голова';
      case Symptom.tenderBreasts:
        return 'Болит грудь';
      case Symptom.backache:
        return 'Болит спина';
      case Symptom.acne:
        return 'Болит кожа';
      case Symptom.abdominalPain:
        return 'Болит живот';
      case Symptom.bloating:
        return 'Вздутие';
      case Symptom.cramps:
        return 'Спазмы';
      case Symptom.fatigue:
        return 'Усталость';
    }
  }
}

extension SymptomExtension on Symptom {
  static Symptom? fromName(String name) {
    for (final Symptom symptom in Symptom.values) {
      if (symptom.name == name) {
        return symptom;
      }
    }
    return null;
  }
}
