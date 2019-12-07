import 'package:flutter/material.dart';
import 'package:game_ground/disks/disc_data.dart';

class OneDisc extends StatefulWidget {
  @override
  _OneDiscState createState() => _OneDiscState();
}

class _OneDiscState extends State<OneDisc> {
  @override
  Widget build(BuildContext context) {
    final dd = DiscData();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black87,
        child: GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Stack(children: [
            Positioned.fill(
              child: AnimatedAlign(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOut,
                alignment: dd.alignment,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  decoration: BoxDecoration(
                    color: dd.color,
                    shape: BoxShape.circle,
                  ),
                  height: dd.size,
                  width: dd.size,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
