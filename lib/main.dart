import 'package:flutter/material.dart';

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
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => VariousDiscs(50))),
        )
      ],
    ));
  }
}
