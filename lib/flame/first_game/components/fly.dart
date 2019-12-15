import 'dart:ui';

import 'package:game_ground/flame/first_game/flame_game.dart';

class Fly {
  final FlyGame game;
  Rect flyRect;
  Paint flyPaint;
  bool isDead = false;
  bool isOffScreen = false;

  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyPaint = Paint()..color = Color(0xff6ab04c);
  }

  render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
  }

  update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
    }
    if (flyRect.top > game.screenH) {
      isOffScreen = true;
    }
  }

  onTapDown() {
    flyPaint.color = Color(0xffff4757);
    isDead = true;
  }
}
