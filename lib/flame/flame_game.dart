import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FlameGamePad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlameGame(MediaQuery.of(context).size).widget,
    );
  }
}

class FlameGame extends Game {
  Size screenSize;

  FlameGame(this.screenSize);

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
  }

  @override
  void update(double t) {}
}
