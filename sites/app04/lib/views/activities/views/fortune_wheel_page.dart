import 'package:flutter/material.dart';
import 'package:fortune_wheel/fortune_wheel.dart';
import 'package:get/get.dart';

class FortuneWheelPage extends StatelessWidget {

  const FortuneWheelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FortuneWheelPortraitActivity(
        onClose: () => Get.back(),
      ),
    );
  }
}
