import 'dart:ui';

import 'package:game_ground/flame/first_game/flame_game.dart';

class Fly {
  final FlyGame game;
  Rect flyRect;
  Paint flyPaint;

  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTRB(x, y, game.tileSize, game.tileSize);
    flyPaint = Paint();
    flyPaint.color = Color(0xff6ab04c);
  }

  render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
  }

  update(double t) {}
}
