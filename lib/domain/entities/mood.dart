/// Настроение дня.
enum Mood {
  great,
  good,
  okay,
  low,
  irritable;

  String get title {
    switch (this) {
      case Mood.great:
        return 'Отлично';
      case Mood.good:
        return 'Хорошо';
      case Mood.okay:
        return 'Нормально';
      case Mood.low:
        return 'Грустно';
      case Mood.irritable:
        return 'Раздражение';
    }
  }
}

extension MoodExtension on Mood {
  static Mood? fromName(String? name) {
    if (name == null) {
      return null;
    }
    for (final Mood mood in Mood.values) {
      if (mood.name == name) {
        return mood;
      }
    }
    return null;
  }
}
