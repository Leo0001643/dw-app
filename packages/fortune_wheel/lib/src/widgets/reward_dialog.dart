import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortune_wheel/fortune_wheel.dart';
import 'package:get/get.dart';

import '../logic/entities/entities.dart';

class RewardDialog extends StatelessWidget {
  final WheelPlay reward;

  const RewardDialog({
    Key? key,
    required this.reward,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Get.back,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: _winContent(),
        ),
      ),
    );
  }

  List<Widget> _winContent() {
    TextStyle _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );

    if (reward.itemType == 1 && reward.amount == '0') {
      return [
        Image.asset(
          'assets/images/landscape/reward_lose.png',
          fit: BoxFit.fill,
          package: 'fortune_wheel',
          width: 400.r,
        ),
      ];
    }

    return [
      Image.asset(
        'assets/images/landscape/reward_win.png',
        fit: BoxFit.fitWidth,
        package: 'fortune_wheel',
        width: 400.r,
      ),
      Transform.translate(
        offset: Offset(-3.r, 90.r),
        child: ShaderMask(
          shaderCallback: (bound) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(244, 203, 78, 1),
                Color.fromRGBO(246, 194, 110, 1),
                Color.fromRGBO(255, 246, 153, 1),
              ],
            ).createShader(
              Offset.zero & bound.size,
            );
          },
          child: reward.itemType == 1
              ? Text(
                  "${reward.amount}" + '￥'.tr,
                  textAlign: TextAlign.center,
                  style: _textStyle,
                )
              : RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: _textStyle,
                    text: "${reward.name}\n" + '详情请联系'.tr,
                    children: [
                      TextSpan(
                        text: '在线客服'.tr,
                        recognizer: TapGestureRecognizer()
                          ..onTap = FortuneWheelService.to.openCS,
                      )
                    ],
                  ),
                ),
        ),
      ),
    ];
  }
}
