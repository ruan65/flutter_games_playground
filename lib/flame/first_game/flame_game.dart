import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/Fly.dart';

class FlameGamePad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlyGame(MediaQuery.of(context).size).widget,
    );
  }
}

class FlyGame extends Game {
  Size screenSize;
  double tileSize;
  List<Fly> flies;

  FlyGame(this.screenSize) {
    tileSize = screenSize.width / 9;
    init();
  }

  init() async {
    print('init()');
    flies = [Fly(this, 100, 100),];
    resize(await Flame.util.initialDimensions());
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    flies.forEach((f) => f.render(canvas));
  }

  @override
  void update(double t) {
  }
}
