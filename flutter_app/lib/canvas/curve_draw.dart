import 'dart:math';

import 'package:flutter/material.dart';

class CanvasDraw extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = Size(size.width / 2, size.height / 2);
    var paint = Paint()..color = Color(0xFF2080E5);
    paint.strokeWidth = 1.0;
    paint.style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(0, center.height);
    for (double i = 1; i <= size.width; i += 1) {
      path.lineTo(i - 1, center.height - 20.0 * log(i));
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
