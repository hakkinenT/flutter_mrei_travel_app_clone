import 'package:flutter/material.dart';
import 'dart:math' as math;

class ArrowLeftButton extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double arrowSize;

  const ArrowLeftButton(
      {super.key,
      required this.color,
      required this.strokeWidth,
      required this.arrowSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 60,
      child: CustomPaint(
        foregroundPainter: ArrowLeftPainter(
            color: color, strokeWidth: strokeWidth, arrowSize: arrowSize),
      ),
    );
  }
}

class ArrowRightButton extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double arrowSize;

  const ArrowRightButton(
      {super.key,
      required this.color,
      required this.strokeWidth,
      required this.arrowSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 115,
      child: CustomPaint(
        foregroundPainter: ArrowRightPainter(
            color: color, strokeWidth: strokeWidth, arrowSize: arrowSize),
      ),
    );
  }
}

class ArrowLeftPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double arrowSize;

  ArrowLeftPainter({
    this.color = Colors.black,
    this.strokeWidth = 2,
    this.arrowSize = 15,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final p1 = Offset(20, size.height / 2);
    final p2 = Offset(size.width, size.height / 2);

    canvas.drawLine(p1, p2, paint);

    final dx = p2.dx - p1.dx;
    final dy = p2.dy - p1.dy;
    final angle = math.atan2(dy, dx);

    const arrowAngle = 40 * math.pi / 180;

    final path = Path();

    path.moveTo(p1.dx + arrowSize * math.cos(angle - arrowAngle),
        p1.dy - arrowSize * math.sin(angle - arrowAngle));
    path.lineTo(p1.dx, p1.dy);
    path.lineTo(p1.dx + arrowSize * math.cos(angle + arrowAngle),
        p1.dy - arrowSize * math.sin(angle + arrowAngle));

    // para que o triangulo nao seja fechado, deve-se excluir o path.close()

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ArrowRightPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double arrowSize;

  ArrowRightPainter({
    this.color = Colors.black,
    this.strokeWidth = 2,
    this.arrowSize = 15,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final p1 = Offset(20, size.height / 2);
    final p2 = Offset(size.width, size.height / 2);

    canvas.drawLine(p1, p2, paint);

    final dx = p2.dx - p1.dx;
    final dy = p2.dy - p1.dy;
    final angle = math.atan2(dy, dx);

    const arrowAngle = 40 * math.pi / 180;

    final path = Path();

    path.moveTo(p2.dx - arrowSize * math.cos(angle - arrowAngle),
        p2.dy - arrowSize * math.sin(angle - arrowAngle));
    path.lineTo(p2.dx, p2.dy);
    path.lineTo(p2.dx - arrowSize * math.cos(angle + arrowAngle),
        p2.dy - arrowSize * math.sin(angle + arrowAngle));

    // para que o triangulo nao seja fechado, deve-se excluir o path.close()

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
