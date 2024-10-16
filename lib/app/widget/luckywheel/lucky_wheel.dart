import 'package:flutter/material.dart';

import 'lucky_wheel_controller.dart';

class LuckyWheel extends StatelessWidget {
  const LuckyWheel({
    Key? key,
    required this.controller,
    required this.onResult,
    this.child,
  }) : super(key: key);
  final LuckyWheelController controller;
  final Function(int) onResult;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.rotateAnim,
      builder: (_, child) {
        var angle = controller.calcAngle();
        // WheelDebug.log('value: ${controller.rotateAnim.value}');
        // WheelDebug.log('angle: $angle');
        return Transform.rotate(
          angle: angle,
          child: child,
        );
      },
      child: child ?? const SizedBox(),
    );
  }
}
