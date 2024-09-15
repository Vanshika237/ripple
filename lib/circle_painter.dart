import 'package:flutter/material.dart';

final Color rippleColor = const Color(0xFF5ea2d1).withOpacity(0.2);

class CirclePainter extends CustomPainter {
  final Animation<double> animation;
  final Offset center;
  final double radius;
  CirclePainter(
      {required this.center, required this.animation, required this.radius})
      : super(repaint: animation);

  void circle(Canvas canvas, double value) {
    final Paint paint = Paint()
      ..color = rippleColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius + (value * 150), paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    circle(canvas, animation.value);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
