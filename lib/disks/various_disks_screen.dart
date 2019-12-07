import 'package:flutter/material.dart';

import 'disc_data.dart';

class VariousDiscs extends StatefulWidget {
  final numberOfDiscs;

  VariousDiscs(this.numberOfDiscs);

  @override
  _VariousDiscsState createState() => _VariousDiscsState();
}

class _VariousDiscsState extends State<VariousDiscs> {
  final _discs = <DiscData>[];

  @override
  void initState() {
    super.initState();
    _makeDiscs();
  }

  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SizedBox.expand(
        child: Container(
          color: Color(0xFF15202D),
          child: GestureDetector(
            onTap: () => setState(() {
              _makeDiscs();
            }),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Click a disc!',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
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
      ),
    );
  }
}