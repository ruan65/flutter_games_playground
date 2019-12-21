import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:game_ground/disks/one_disc.dart';
import 'package:game_ground/paint/painter_one.dart';

import 'disks/various_disks_screen.dart';

void main() async {

  Flame.images.loadAll(<String>[
    'bg/backyard.png',
    'flies/agile-fly-1.png',
    'flies/agile-fly-2.png',
    'flies/agile-fly-dead.png',
    'flies/drooler-fly-1.png',
    'flies/drooler-fly-2.png',
    'flies/drooler-fly-dead.png',
    'flies/house-fly-1.png',
    'flies/house-fly-2.png',
    'flies/house-fly-dead.png',
    'flies/hungry-fly-1.png',
    'flies/hungry-fly-2.png',
    'flies/hungry-fly-dead.png',
    'flies/macho-fly-1.png',
    'flies/macho-fly-2.png',
    'flies/macho-fly-dead.png',
  ]);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    ),
  );
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Discs'),
              onPressed: () => navigateTo(context, VariousDiscs()),
            ),
            FlatButton(
              child: Text('One disc'),
              onPressed: () => navigateTo(context, OneDisc()),
            ),
            FlatButton(
              child: Text('Painter one'),
              onPressed: () => navigateTo(context, PainterOne()),
            ),
          ],
        ));
  }
}

navigateTo(BuildContext context, Widget route) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => route));
}
