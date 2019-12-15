import 'dart:math';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/Fly.dart';

class FlameGamePad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: FlyGame(size.width, size.height).widget,
    );
  }
}

class FlyGame extends Game {
  double screenW;
  double screenH;
  double tileSize;
  List<Fly> flies = [];
  final rnd = Random();

  FlyGame(this.screenW, this.screenH) {
    print('screen size: $screenW $screenH');

    tileSize = screenW / 9;
    init();
    spawnFly();
  }

  spawnFly() {
    flies.add(Fly(this, _rndX(), _rndY()));
  }

  init() async {
    resize(await Flame.util.initialDimensions());
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenW, screenH);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    flies.forEach((f) => f.render(canvas));
  }

  @override
  void update(double t) {
    flies.forEach((f) => f.update(t));
  }

  double _rndX() => rnd.nextDouble() * (screenW - tileSize);

  double _rndY() => rnd.nextDouble() * (screenH - tileSize) + kToolbarHeight;
}
