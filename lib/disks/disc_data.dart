import 'dart:math';

import 'package:flutter/material.dart';

class DiscData {
  static final _rng = Random();

  double size;
  Color color;
  Alignment alignment;
  int index = -1;

  DiscData() {
    color = Color.fromARGB(
      _rng.nextInt(200),
      _rng.nextInt(255),
      _rng.nextInt(255),
      _rng.nextInt(255),
    );
    size = _rng.nextDouble() * 40 + 10;
    alignment = Alignment(
      _rng.nextDouble() * 2 - 1,
      _rng.nextDouble() * 2 - 1,
    );
  }
}
