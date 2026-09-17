import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:womensday/domain/entities/symptom.dart';

/// Контурная пиктограмма недомогания из Material Symbols.
class SymptomGlyph extends StatelessWidget {
  const SymptomGlyph({
    super.key,
    required this.symptom,
    this.size = 22,
    this.color,
  });

  final Symptom symptom;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(executeIcon(), size: size, color: color);
  }

  IconData executeIcon() {
    switch (symptom) {
      case Symptom.headache:
        return Symbols.face;
      case Symptom.tenderBreasts:
        return Symbols.breastfeeding;
      case Symptom.backache:
        return Symbols.orthopedics;
      case Symptom.acne:
        return Symbols.dermatology;
      case Symptom.abdominalPain:
        return Symbols.gastroenterology;
      case Symptom.bloating:
        return Symbols.bubble;
      case Symptom.cramps:
        return Symbols.bolt;
      case Symptom.fatigue:
        return Symbols.bedtime;
    }
  }
}
