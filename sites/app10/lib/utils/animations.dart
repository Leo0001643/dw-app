import 'package:flutter/material.dart';
import 'package:get/get.dart';

void scaleAndFadeDialog({
  required Widget child,
  required String tag,
}) {
  Get.generalDialog(
    barrierDismissible: true,
    barrierLabel: tag,
    transitionDuration: const Duration(milliseconds: 225),
    transitionBuilder:
        (context, Animation<double> animation, secondaryAnimation, widget) {
      return ScaleTransition(
        alignment: Alignment.center,
        scale:
            CurveTween(curve: Curves.fastLinearToSlowEaseIn).animate(animation),
        child: FadeTransition(
          opacity: animation,
          child: widget,
        ),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return child;
    },
  );
}
