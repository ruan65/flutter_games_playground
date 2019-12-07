import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class PainterOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomPaint(
        painter: FirstPainter(points),
        foregroundPainter: FirstPainter(points2),
        child: Container(
          color: Color(0x90FF0000),
        ),
      ),
    );
  }
}

class FirstPainter extends CustomPainter {
  final List<Offset> points;

  FirstPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final pointMode = ui.PointMode.points;

    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 40
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode, points, paint);
    paint.strokeWidth = 10;
    canvas.drawLine(points[0], points[1], paint);
    canvas.drawLine(points[1], points[2], paint);
    canvas.drawLine(points[2], points[3], paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

final points = [
  Offset(50, 100),
  Offset(150, 75),
  Offset(250, 250),
  Offset(350, 100),
];

final points2 = [
  Offset(50, 200),
  Offset(150, 175),
  Offset(250, 350),
  Offset(350, 200),
];
