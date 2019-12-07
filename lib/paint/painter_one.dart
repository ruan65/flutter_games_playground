import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PainterOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomPaint(
        painter: FirstPainter(points),
        foregroundPainter: FirstPainter(points2),
        size: Size(300, 300),
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
    canvas.drawPoints(pointMode, points,
    paint
    );
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
