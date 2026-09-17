import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';

/// Запись самочувствия за один день.
class DayLog {
  const DayLog({
    required this.date,
    this.isPeriod = false,
    this.flow,
    this.symptoms = const <Symptom>[],
    this.mood,
    this.note = '',
  });

  final DateTime date;
  final bool isPeriod;
  final FlowIntensity? flow;
  final List<Symptom> symptoms;
  final Mood? mood;
  final String note;
  bool get hasContent {
    return isPeriod ||
        flow != null ||
        symptoms.isNotEmpty ||
        mood != null ||
        note.trim().isNotEmpty;
  }

  DayLog copyWith({
    DateTime? date,
    bool? isPeriod,
    FlowIntensity? flow,
    List<Symptom>? symptoms,
    Mood? mood,
    String? note,
    bool clearFlow = false,
    bool clearMood = false,
  }) {
    return DayLog(
      date: date ?? this.date,
      isPeriod: isPeriod ?? this.isPeriod,
      flow: clearFlow ? null : (flow ?? this.flow),
      symptoms: symptoms ?? this.symptoms,
      mood: clearMood ? null : (mood ?? this.mood),
      note: note ?? this.note,
    );
  }

  /// Whether period, flow, mood, symptoms and note match [other].
  bool isSameAs(DayLog other) {
    if (isPeriod != other.isPeriod ||
        flow != other.flow ||
        mood != other.mood ||
        note != other.note) {
      return false;
    }
    if (symptoms.length != other.symptoms.length) {
      return false;
    }
    return symptoms.toSet().containsAll(other.symptoms);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date.storageKey,
      'isPeriod': isPeriod,
      'flow': flow?.name,
      'symptoms': symptoms.map((Symptom item) => item.name).toList(),
      'mood': mood?.name,
      'note': note,
    };
  }

  factory DayLog.fromJson(Map<String, dynamic> json) {
    final List<dynamic> rawSymptoms =
        json['symptoms'] as List<dynamic>? ?? <dynamic>[];
    return DayLog(
      date: DateTime.parse(json['date'] as String).dateOnly,
      isPeriod: json['isPeriod'] as bool? ?? false,
      flow: FlowIntensityExtension.fromName(json['flow'] as String?),
      symptoms: rawSymptoms
          .map((dynamic item) => SymptomExtension.fromName(item as String))
          .whereType<Symptom>()
          .toList(),
      mood: MoodExtension.fromName(json['mood'] as String?),
      note: json['note'] as String? ?? '',
    );
  }
}
