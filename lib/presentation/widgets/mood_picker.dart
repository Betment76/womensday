import 'package:flutter/material.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/l10n/app_localizations.dart';
import 'package:womensday/presentation/widgets/mood_face.dart';

/// Ряд лиц для выбора настроения.
class MoodPicker extends StatelessWidget {
  const MoodPicker({
    super.key,
    required this.selected,
    required this.onSelected,
    this.faceSize = 48,
  });

  final Mood? selected;
  final ValueChanged<Mood?> onSelected;
  final double faceSize;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Row(
      children: Mood.values.map((Mood mood) {
        final bool isSelected = selected == mood;
        return Expanded(
          child: Tooltip(
            message: l10n.moodTitle(mood),
            child: InkWell(
              onTap: () => onSelected(isSelected ? null : mood),
              customBorder: const CircleBorder(),
              child: AnimatedContainer(
                duration: AppConstants.animationDuration,
                curve: AppConstants.animationCurve,
                height: faceSize + 12,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? SakuraColors.petal : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: MoodFace(
                  mood: mood,
                  size: faceSize,
                  isSelected: isSelected,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
