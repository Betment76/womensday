import 'package:flutter/material.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/presentation/extensions/mood_ui.dart';

/// Лицо девочки для выбора настроения.
class MoodFace extends StatelessWidget {
  const MoodFace({
    super.key,
    required this.mood,
    this.size = 48,
    this.isSelected = false,
  });

  final Mood mood;
  final double size;
  final bool isSelected;

  static const ColorFilter _grayscale = ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);

  @override
  Widget build(BuildContext context) {
    final int cacheSize = (size * MediaQuery.devicePixelRatioOf(context))
        .round()
        .clamp(48, 192);
    final Widget image = Image.asset(
      mood.assetPath,
      width: size,
      height: size,
      cacheWidth: cacheSize,
      cacheHeight: cacheSize,
      filterQuality: FilterQuality.low,
    );
    if (isSelected) {
      return image;
    }
    return ColorFiltered(colorFilter: _grayscale, child: image);
  }
}
