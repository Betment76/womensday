import 'package:flutter/material.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/theme/sakura_colors.dart';

/// Тумблер в стиле HyperOS: капсула и белый кружок с тенью.
class CapsuleSwitch extends StatelessWidget {
  const CapsuleSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = SakuraColors.sakura,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  static const double _width = 46;
  static const double _height = 26;
  static const double _thumb = 22;
  static const double _inset = 2;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      toggled: value,
      button: true,
      child: GestureDetector(
        onTap: () => onChanged(!value),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: AppConstants.animationDuration,
          curve: AppConstants.animationCurve,
          width: _width,
          height: _height,
          padding: const EdgeInsets.all(_inset),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          decoration: BoxDecoration(
            color: value ? activeColor : const Color(0xFFD4D4D4),
            borderRadius: BorderRadius.circular(_height / 2),
          ),
          child: Container(
            width: _thumb,
            height: _thumb,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color(0x3D000000),
                  blurRadius: 3,
                  offset: Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
