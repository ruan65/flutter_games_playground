import 'dart:math';

import 'package:flutter/material.dart';

import 'disc_data.dart';

class VariousDiscs extends StatefulWidget {
  @override
  _VariousDiscsState createState() => _VariousDiscsState();
}

class _VariousDiscsState extends State<VariousDiscs> {
  final _discs = <DiscData>[];
  int _count = 30;

  @override
  void initState() {
    super.initState();
    _makeDiscs();
  }

  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < _count; i++) {
      _discs.add(DiscData()..index=i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Container(
        color: Colors.black87,
        child: Stack(
          children: [
//            for (final disc in _discs)
            ..._discs.map((disc) => Positioned.fill(
                  child: AnimatedAlign(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.easeInOut,
                    alignment: disc.alignment,
                    child: GestureDetector(
                      onTap: () => setState(() {
                        print('clicked: ${disc.index}');
                        _makeDiscs();
                      }),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          color: disc.color,
                          shape: BoxShape.circle,
                        ),
                        height: disc.size,
                        width: disc.size,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
