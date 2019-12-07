import 'dart:math';

import 'package:flutter/material.dart';

import 'disc_data.dart';

class VariousDiscs extends StatefulWidget {
  @override
  _VariousDiscsState createState() => _VariousDiscsState();
}

class _VariousDiscsState extends State<VariousDiscs> {
  final _discs = <DiscData>[];
  int _count = 3;

  @override
  void initState() {
    super.initState();
    _makeDiscs();
  }

  void _makeDiscs() {
    _discs.clear();
    _count = nextInt();
    for (int i = 0; i < _count; i++) {
      _discs.add(DiscData());
    }
  }

  int nextInt() => Random().nextInt(100) + 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Container(
        color: Colors.black87,
        child: GestureDetector(
          onTap: () => setState(() {
            print('clicked: $_count');
            _makeDiscs();
          }),
          child: Stack(
            children: [
              for (final disc in _discs)
                Positioned.fill(
                  child: AnimatedAlign(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.easeInOut,
                    alignment: disc.alignment,
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
            ],
          ),
        ),
      ),
    );
  }
}
