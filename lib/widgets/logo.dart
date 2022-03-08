import 'dart:math';

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Color color;
  final double size;

  const Logo({
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:  Image.asset("lib/assets/Kabutoo.png"),
      iconSize: size,
      color: color, onPressed: () {  },
    );
  }
}
