
import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortune_wheel/src/logic/controller.dart';
import 'package:fortune_wheel/src/widgets/widget.dart';
import 'package:get/get.dart';

import '../base/base.dart';
import '../logic/entities/entities.dart';
import '../utils/utils.dart';
import 'reward_dialog_z01.dart';

class WheelWidgetZ01 extends StatelessWidget {
  static const double _size = 425;

  static final TextStyle _sliceText = TextStyle(
    color: ColorSchema.red,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  const WheelWidgetZ01({Key? key}) : super(key: key);

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
            'assets/images/portrait/z01/wheel_bg1.png',
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
            Get.dialog(RewardDialogZ01(reward: state.reward));
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
                  Get.locale?.languageCode == 'zh'?
                  'assets/images/portrait/z01/wheel_indicator.png':'assets/images/portrait/z01/wheel_indicator_en.png',
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
                  const Color(0xffc8c9dc),
                ]
                    : null,
                borderColor:  const Color(0xffc8c9dc),
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
        Image.asset(
          'assets/images/portrait/z01/heart_break.png',
          width: 16.r,
          package: 'fortune_wheel',
        ),
        SizedBox(
          height: 10.r,
        ),
        Text(
          '谢谢惠顾'.tr,
          style: TextStyle(
            fontSize: 8.sp,
            fontWeight: FontWeight.w500,
            color: ColorSchema.red,
          ),
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
            'assets/images/portrait/z01/giftbox.png',
            width: 16.r,
            package: 'fortune_wheel',
          ),
        ),
      ];
    }

    return [
      Image.asset(
        'assets/images/portrait/z01/coin.png',
        width: 16.r,
        package: 'fortune_wheel',
      ),
      SizedBox(
        height: 4.r,
      ),
      Text(
        item.amount!,
        style: _sliceText,
      ),
    ];
  }

  Widget _wheelLayout() {
    return Align(
      alignment: Alignment.center,
      child: Transform.translate(
        offset: Offset(0, 6.r),
        child: Container(
          width: (_size - 150).r,
          height: (_size - 150).r,
          padding: EdgeInsets.all(((_size - 210) * 0.09).r),
          decoration: BoxDecoration(
              color: Colors.transparent,
              image: StyleUtils.decorationImagePortraitZ01('outline_circle.png')
          ),
          child: _wheel(),
        ),
      ),
    );
  }

  Widget _title() {
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        Get.locale?.languageCode == 'zh'?
        'assets/images/portrait/z01/fortune_title.png':'assets/images/portrait/z01/fortune_title_en.png',
        width: (_size - 160).r,
        package: 'fortune_wheel',
      ),
    );
  }

  Widget _redLabel() {
    final state = FortuneWheelLogic.to.state;

    return Positioned(
      bottom: 2.r,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.r,vertical: 5.r),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: StyleUtils.decorationImagePortraitZ01('red_label.png'),
        ),
        child: Obx(
              () => Text(
            '抽奖机会剩余'.tr + ':${state.available}',
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
