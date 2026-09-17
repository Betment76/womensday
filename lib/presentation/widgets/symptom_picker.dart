import 'package:flutter/material.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/presentation/widgets/symptom_glyph.dart';

/// Равномерная сетка недомоганий.
class SymptomPicker extends StatelessWidget {
  const SymptomPicker({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final List<Symptom> selected;
  final ValueChanged<List<Symptom>> onChanged;

  static const int _columns = 4;

  @override
  Widget build(BuildContext context) {
    final List<Widget> rows = <Widget>[];
    for (int offset = 0; offset < Symptom.values.length; offset += _columns) {
      final List<Symptom> chunk = Symptom.values
          .skip(offset)
          .take(_columns)
          .toList();
      if (rows.isNotEmpty) {
        rows.add(const SizedBox(height: 4));
      }
      rows.add(
        Row(
          children: chunk.map((Symptom symptom) {
            return Expanded(child: executeTile(symptom));
          }).toList(),
        ),
      );
    }
    return Column(children: rows);
  }

  Widget executeTile(Symptom symptom) {
    final bool isSelected = selected.contains(symptom);
    return InkWell(
      onTap: () => executeToggle(symptom, isSelected),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: AppConstants.animationDuration,
        curve: AppConstants.animationCurve,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        decoration: BoxDecoration(
          color: isSelected ? SakuraColors.petal : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SymptomGlyph(
              symptom: symptom,
              size: 22,
              color: isSelected
                  ? SakuraColors.deepBlossom
                  : SakuraColors.branch,
            ),
            const SizedBox(height: 2),
            Text(
              symptom.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10,
                height: 1.15,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: SakuraColors.branch,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void executeToggle(Symptom symptom, bool isSelected) {
    final List<Symptom> next = List<Symptom>.from(selected);
    if (isSelected) {
      next.remove(symptom);
    } else {
      next.add(symptom);
    }
    onChanged(next);
  }
}
