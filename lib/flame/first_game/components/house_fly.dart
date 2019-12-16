import 'package:flame/sprite.dart';

import '../flame_game.dart';
import 'fly.dart';

class HouseFly extends Fly {
  HouseFly(FlyGame game, double x, double y) : super(game, x, y) {
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');
  }
}