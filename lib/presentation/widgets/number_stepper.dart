import 'package:flutter/material.dart';
import 'package:womensday/core/theme/sakura_colors.dart';

/// Плюс/минус для длины цикла и месячных.
class NumberStepper extends StatelessWidget {
  const NumberStepper({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.unit = 'дней',
  });
  final String label;
  final int value;
  final int min;
  final int max;
  final String unit;
  final ValueChanged<int> onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            _RoundButton(
              icon: Icons.remove,
              onPressed: value > min ? () => onChanged(value - 1) : null,
            ),
            Expanded(
              child: Text(
                '$value $unit',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: SakuraColors.deepBlossom,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            _RoundButton(
              icon: Icons.add,
              onPressed: value < max ? () => onChanged(value + 1) : null,
            ),
          ],
        ),
      ],
    );
  }
}

class _RoundButton extends StatelessWidget {
  const _RoundButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: SakuraColors.petal,
        foregroundColor: SakuraColors.deepBlossom,
        disabledBackgroundColor: SakuraColors.mist,
      ),
      icon: Icon(icon),
    );
  }
}
