import 'dart:math';

import 'package:flutter/material.dart';

class FabCircularDelegate extends FlowDelegate {
  AnimationController animation;

  FabCircularDelegate({required this.animation}) : super(repaint: animation);

  rad(count) {
    if (count <= 3) {
      return 75;
    } else if (count == 4) {
      return 105;
    } else if (count == 5) {
      return 135;
    } else {
      return 180;
    }
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    const buttonSize = 56;
    const buttonRadius = buttonSize / 2;

    final positionX = context.size.width - buttonSize;
    final positionY = context.size.height - buttonSize;

    final count = context.childCount;
    final lastIndex = count - 1;

    for (int i = lastIndex; i >= 0; i--) {
      final radius = rad(count) * animation.value;
      final angle = (i - 1) * pi * 0.5 / (count - 2);

      final x = i == 0 ? positionX : positionX - (radius * cos(angle));
      final y = i == 0 ? positionY : positionY - (radius * sin(angle));
      final size = (i != 0) ? animation.value : 1.0;

      context.paintChild(
        i,
        transform: Matrix4.identity()
          ..translate(x, y, 0.0)
          ..translate(buttonRadius, buttonRadius)
          ..scale(size)
          ..translate(-buttonRadius, -buttonRadius),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
