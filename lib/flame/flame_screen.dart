import 'package:flutter/material.dart';

import 'first_game/flame_game.dart';

class FlameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(),
      body: FlameGamePad(MediaQuery.of(context).size),
    );
  }
}
