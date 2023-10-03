import 'dart:core';

import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:red_task/red_task.dart';
import 'package:red_task/src/utils/utils.dart';

import '../../controllers/controllers.dart';
import '../../entities/entities.dart';

part 'widget/red_package.dart';

class LandscapeRedTaskPage extends GetView<RedPageController> {
  const LandscapeRedTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RedPageController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          width: 600.r,
          height: 0.9.sh,
          child: Column(
            children: [
              const _LandscapeRedHeader(),
              Obx(
                () {
                  if (controller.redData.item == null ||
                      controller.pageState == PageState.loading) {
                    return Flexible(
                      child: Center(
                        child: Lottie.asset(
                          'assets/lottie/loading.json',
                          package: 'red_task',
                          width: 225.r,
                        ),
                      ),
                    );
                  }
                  return Flexible(
                    child: Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.redData.item!.length,
                        itemBuilder: (_, int index) => Row(children: [
                          RedPackageCard(
                            item: controller.redData.item![index],
                          ),
                          SizedBox(width: 10.r),
                        ]),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LandscapeRedHeader extends GetView<RedPageController> {
  const _LandscapeRedHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        SizedBox(
          height: 30.r,
          child: _periodButton(),
        ),
        _title(),
        SizedBox(
          width: 70.r,
          child: _closeBtn(),
        ),
      ],
    );
  }

  Widget _closeBtn() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: Get.back,
        icon: Icon(
          Icons.cancel_outlined,
          color: Colors.white,
          size: 24.sp,
        ),
      ),
    );
  }

  Widget _periodButton() {
    return Obx(
      () => controller.currentCid != 1 && controller.redData.style == 2
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: ['本次', '上次'].mapIndexed((el, fakeIndex) {
                var index = fakeIndex + 1;
                return GestureDetector(
                  onTap: () => controller.onChangePeriod(index),
                  child: Container(
                    margin: EdgeInsets.only(
                      left: index == 2 ? 6.r : 0,
                      right: index == 1 ? 6.r : 0,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: controller.currentPeriod != index
                              ? [
                                  const Color.fromRGBO(250, 238, 235, 1),
                                  const Color.fromRGBO(253, 208, 168, 1),
                                ]
                              : [
                                  const Color.fromRGBO(212, 24, 57, 1),
                                  const Color.fromRGBO(212, 24, 57, 1)
                                ]
                          // : [
                          //     const Color.fromRGBO(253, 208, 168, 1),
                          //     const Color.fromRGBO(250, 238, 235, 1),
                          //   ],
                          ),
                    ),
                    child: Text(
                      el,
                      style: TextStyle(
                        color: controller.currentPeriod != index
                            ? const Color.fromRGBO(212, 24, 57, 1)
                            : const Color.fromRGBO(253, 208, 168, 1),
                      ),
                    ),
                  ),
                );
              }).toList(),
            )
          : SizedBox(
              width: 105.r,
            ),
    );
  }

  Widget _title() {
    return Expanded(
      child: Obx(
        () => Column(
          children: [
            Text(
              controller.redData.title ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              controller.cycleTime,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
            Text(
              controller.settleTime,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
