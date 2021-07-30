import 'package:flutter/material.dart';
import 'dart:math';

class CustomIndicator extends CustomPainter {

  final strokeWidth = 15.0;
  double value;

  CustomIndicator({this.value});

  @override
  void paint(Canvas canvas, Size size) {

    Paint circlePaint = Paint()
        ..color = Colors.red
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width/2, size.height/2);

    double radius = 100;

    canvas.drawCircle(center, radius, circlePaint);

    Paint arcPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double angle = 2 * pi * (value / 100);
    double startAngle = pi/2;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, angle, false, arcPaint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }



}