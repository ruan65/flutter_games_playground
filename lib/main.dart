import 'package:flutter/material.dart';
import 'package:game_ground/disks/one_disc.dart';
import 'package:game_ground/paint/painter_one.dart';

import 'disks/various_disks_screen.dart';

void main() async {
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
