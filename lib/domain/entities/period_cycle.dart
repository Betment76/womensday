/// Один фактический цикл по подряд идущим дням месячных.
class PeriodCycle {
  const PeriodCycle({
    required this.start,
    required this.end,
    this.lengthToNext,
  });

  final DateTime start;
  final DateTime end;
  final int? lengthToNext;

  int get duration => end.difference(start).inDays + 1;

  PeriodCycle copyWith({int? lengthToNext}) {
    return PeriodCycle(
      start: start,
      end: end,
      lengthToNext: lengthToNext ?? this.lengthToNext,
    );
  }
}
