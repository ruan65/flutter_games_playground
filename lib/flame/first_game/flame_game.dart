import 'dart:math';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game_ground/flame/first_game/components/backyard.dart';
import 'package:game_ground/flame/first_game/components/fly.dart';
import 'package:game_ground/flame/first_game/components/house_fly.dart';

class FlameGamePad extends StatefulWidget {
  final Size size;

  const FlameGamePad(this.size);

  @override
  _FlameGamePadState createState() => _FlameGamePadState();
}

class _FlameGamePadState extends State<FlameGamePad> {
  FlyGame game;
  Util flameUtil = Util();

  @override
  void initState() {
    super.initState();
    game = FlyGame(widget.size.width, widget.size.height);
    TapGestureRecognizer tapper = TapGestureRecognizer();
    tapper.onTapDown = game.onTapDown;
    flameUtil.addGestureRecognizer(tapper);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: game.widget,
    );
  }
}

class FlyGame extends Game {
  double screenW;
  double screenH;
  double tileSize;
  Backyard bg;
  List<Fly> flies = [];
  final rnd = Random();

  FlyGame(this.screenW, this.screenH) {
    print('screen size: $screenW $screenH');

    tileSize = screenW / 9;
    init();
    bg = Backyard(this);
    spawnFly();
  }

  spawnFly() {
    flies.add(HouseFly(this, _rndX(), _rndY()));
  }

  init() async {
    resize(await Flame.util.initialDimensions());
  }

  @override
  void render(Canvas canvas) {
    bg.render(canvas);
    flies.forEach((f) => f.render(canvas));
  }

  @override
  void update(double t) {
    flies.forEach((f) => f.update(t));
    flies.removeWhere((f) => f.isOffScreen);
  }

  onTapDown(TapDownDetails d) {
    bool spawn = false;
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
        spawn = true;
      }
    });
    if (spawn) spawnFly();
  }

  double _rndX() => rnd.nextDouble() * (screenW - tileSize);

  double _rndY() => rnd.nextDouble() * (screenH - tileSize);
}
