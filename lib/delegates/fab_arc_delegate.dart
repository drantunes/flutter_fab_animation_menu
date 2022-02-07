import 'dart:math';

import 'package:flutter/material.dart';

class FabArcDelegate extends FlowDelegate {
  AnimationController animation;

  FabArcDelegate({required this.animation}) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    const buttonSize = 65.0;
    const buttonRadius = buttonSize / 2;
    const buttonMargin = 5;

    final positionX = (context.size.width - buttonRadius) / 2 + buttonMargin;
    final positionY = context.size.height - buttonSize;

    final count = context.childCount;
    final lastIndex = count - 1;
    double distance = 105;

    if (count <= 4) {
      distance = 90;
    } else if (count > 5) {
      distance = 120;
    }

    for (int i = lastIndex; i >= 0; i--) {
      final radius = distance * animation.value;
      final angle = (i - 1) * pi / (count - 2);

      final x = i == 0 ? positionX : positionX - (radius * cos(angle));
      final y = i == 0 ? positionY : positionY - (radius * sin(angle));
      final size = (i != 0) ? animation.value : 1.0;

      context.paintChild(
        i,
        transform: Matrix4.identity()
          ..translate(x, y, 0)
          ..translate(buttonRadius, buttonRadius)
          ..scale(size)
          ..translate(-buttonRadius, -buttonRadius),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
