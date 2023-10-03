
import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortune_wheel/src/logic/controller.dart';
import 'package:fortune_wheel/src/widgets/widget.dart';
import 'package:get/get.dart';

import '../base/base.dart';
import '../logic/entities/entities.dart';
import '../utils/utils.dart';

class WheelWidget extends StatelessWidget {
  static const double _size = 425;

  static final TextStyle _sliceText = TextStyle(
    color: ColorSchema.red,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  const WheelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.r,
      height: 350.r,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          _wheelFrame(),
          _wheelBase(),
          _wheelLayout(),
          _title(),
          _redLabel(),
        ],
      ),
    );
  }

  Widget _wheelFrame() {
    return Align(
      alignment: Alignment.center,
      child: Transform.translate(
        offset: Offset(0, 14.r),
        child: Center(
          child: Image.asset(
            'assets/images/landscape/wheel_bg.png',
            package: 'fortune_wheel',
            fit: BoxFit.fitWidth,
            width: (_size - 100).r,
          ),
        ),
      ),
    );
  }

  Widget _wheelBase() {
    return Align(
      alignment: Alignment.center,
      child: Transform.translate(
        offset: Offset(0, 6.r),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(70, 11, 164, 0.8),
            borderRadius: BorderRadius.circular((_size - 130).r),
          ),
          child: SizedBox(
            width: (_size - 206).r,
            height: (_size - 206).r,
          ),
        ),
      ),
    );
  }

  Widget _wheel() {
    final state = FortuneWheelLogic.to.state;
    final logic = FortuneWheelLogic.to;
    return Obx(
      () {
        if (state.rewardList.isEmpty) {
          return const SizedBox.shrink();
        }
        return FortuneWheel(
          onAnimationEnd: () {
            state.isDisable = false;
            Get.dialog(RewardDialog(reward: state.reward));
            state.available--;
            Get.put(FortuneWheelRecord()).getRecord();
          },
          selected: logic.streamController.stream,
          animateFirst: false,
          indicators: [
            FortuneIndicator(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: logic.playWheel,
                child: Image.asset(
                  'assets/images/landscape/wheel_indicator.png',
                  width: 70.r,
                  package: 'fortune_wheel',
                ),
              ),
            ),
          ],
          items: state.rewardList
              .mapIndexed(
                (element, index) => FortuneItem(
                  style: FortuneItemStyle(
                    gradientColors: index.isOdd
                        ? [
                            Colors.white,
                            const Color.fromRGBO(255, 222, 100, 1),
                          ]
                        : null,
                    borderColor: const Color.fromRGBO(255, 218, 157, 1),
                    borderWidth: 1.0,
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.r,
                      ),
                      ..._sliceReward(element),
                    ],
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }

  List<Widget> _sliceReward(Rewards item) {
    if (item.itemType == 1 && item.amount == '0') {
      return [
        Text(
          '谢谢惠顾',
          style: TextStyle(
            fontSize: 8.sp,
            fontWeight: FontWeight.w500,
            color: ColorSchema.red,
          ),
        ),
        SizedBox(
          height: 10.r,
        ),
        Image.asset(
          'assets/images/landscape/heart_break.png',
          width: 16.r,
          package: 'fortune_wheel',
        ),
      ];
    }

    if (item.itemType == 2) {
      return [
        SizedBox(
          height: 10.r,
        ),
        Tooltip(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6)
          ),
          triggerMode: TooltipTriggerMode.tap,
          waitDuration: const Duration(milliseconds: 10),
          richMessage: TextSpan(
            text: item.name,
            style: const TextStyle(
              color: Colors.white,
            )
          ),
          child: Image.asset(
            'assets/images/landscape/giftbox.png',
            width: 16.r,
            package: 'fortune_wheel',
          ),
        ),
      ];
    }

    return [
      Text(
        item.amount!,
        style: _sliceText,
      ),
      SizedBox(
        height: 4.r,
      ),
      Image.asset(
        'assets/images/landscape/coin.png',
        width: 16.r,
        package: 'fortune_wheel',
      ),
    ];
  }

  Widget _wheelLayout() {
    return Align(
      alignment: Alignment.center,
      child: Transform.translate(
        offset: Offset(0, 6.r),
        child: Container(
          width: (_size - 190).r,
          height: (_size - 190).r,
          padding: EdgeInsets.all(((_size - 140) * 0.09).r),
          decoration: BoxDecoration(
              color: Colors.transparent,
              image: StyleUtils.decorationImage('outline_circle.png')),
          child: Transform.translate(
            offset: Offset(-0.5.r, -0.3.r),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: const RadialGradient(
                  colors: [
                    Color.fromRGBO(198, 94, 237, 1.0),
                    Color.fromRGBO(228, 188, 245, 1.0),
                  ],
                  stops: [0.94, 1],
                ),
                borderRadius: BorderRadius.circular((_size - 120).r),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                    blurRadius: 4,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _wheel(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        'assets/images/landscape/fortune_title.png',
        width: (_size - 140).r,
        package: 'fortune_wheel',
      ),
    );
  }

  Widget _redLabel() {
    final state = FortuneWheelLogic.to.state;

    return Positioned(
      bottom: 10.r,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.r),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: StyleUtils.decorationImage('red_label.png'),
        ),
        child: Obx(
          () => Text(
            '抽奖机会剩余${state.available}次',
            textHeightBehavior: StyleUtils.textHeight,
            style: TextStyle(
              height: 2.7,
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
