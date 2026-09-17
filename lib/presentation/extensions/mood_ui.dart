import 'package:womensday/domain/entities/mood.dart';

/// Путь к картинке настроения для UI.
extension MoodUi on Mood {
  String get assetPath {
    switch (this) {
      case Mood.great:
        return 'assets/mood/great.png';
      case Mood.good:
        return 'assets/mood/good.png';
      case Mood.okay:
        return 'assets/mood/okay.png';
      case Mood.low:
        return 'assets/mood/low.png';
      case Mood.irritable:
        return 'assets/mood/irritable.png';
    }
  }
}
