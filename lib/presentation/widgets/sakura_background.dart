import 'dart:math';

import 'package:flutter/material.dart';
import 'package:womensday/core/theme/sakura_colors.dart';

/// Фон с мягкими лепестками сакуры.
class SakuraBackground extends StatelessWidget {
  const SakuraBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  SakuraColors.cream,
                  SakuraColors.mist,
                  Color(0xFFFFE8EE),
                ],
              ),
            ),
          ),
        ),
        const Positioned.fill(
          child: CustomPaint(painter: _SakuraPetalsPainter()),
        ),
        child,
      ],
    );
  }
}

class _SakuraPetalsPainter extends CustomPainter {
  const _SakuraPetalsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final List<_PetalSpec> petals = <_PetalSpec>[
      _PetalSpec(0.12, 0.10, 18, 0.4, 0.18),
      _PetalSpec(0.82, 0.08, 22, -0.6, 0.16),
      _PetalSpec(0.90, 0.28, 14, 0.8, 0.14),
      _PetalSpec(0.08, 0.42, 16, -0.3, 0.12),
      _PetalSpec(0.78, 0.62, 20, 0.5, 0.12),
      _PetalSpec(0.18, 0.78, 15, -0.7, 0.14),
      _PetalSpec(0.62, 0.88, 18, 0.2, 0.10),
      _PetalSpec(0.42, 0.06, 12, 0.9, 0.10),
    ];
    for (final _PetalSpec petal in petals) {
      executeDrawPetal(canvas, size, petal);
    }
  }

  void executeDrawPetal(Canvas canvas, Size size, _PetalSpec petal) {
    final Paint paint = Paint()
      ..color = SakuraColors.blossom.withValues(alpha: petal.opacity);
    canvas.save();
    canvas.translate(size.width * petal.x, size.height * petal.y);
    canvas.rotate(petal.angle);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset.zero,
        width: petal.size,
        height: petal.size * 1.6,
      ),
      paint,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PetalSpec {
  const _PetalSpec(this.x, this.y, this.size, this.angle, this.opacity);

  final double x;
  final double y;
  final double size;
  final double angle;
  final double opacity;
}

/// Небольшой декоративный цветок для заголовков.
class SakuraMark extends StatelessWidget {
  const SakuraMark({super.key, this.size = 28});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _SakuraFlowerPainter()),
    );
  }
}

class _SakuraFlowerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 5;
    final Paint petalPaint = Paint()..color = SakuraColors.sakura;
    for (int i = 0; i < 5; i++) {
      final double angle = -pi / 2 + i * 2 * pi / 5;
      final Offset offset = Offset(cos(angle), sin(angle)) * radius;
      canvas.drawCircle(center + offset, radius * 0.85, petalPaint);
    }
    canvas.drawCircle(
      center,
      radius * 0.45,
      Paint()..color = const Color(0xFFFFF1C9),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
