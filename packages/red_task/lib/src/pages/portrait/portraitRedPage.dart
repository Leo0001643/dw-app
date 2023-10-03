import 'dart:core';
import 'dart:io';

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

part 'widget/porteait_red_package.dart';
part 'widget/porteait_red_package2.dart';


class PortraitRedTaskPage extends GetView<RedPageController> {
  const PortraitRedTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RedPageController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image:getRedListBackGround()
                  
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                buildBarView(),
                const _PorteaitRedHeader(),
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
                    if(controller.redData.item!.isNotEmpty){
                      return Flexible(
                        child: Center(

                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.redData.item!.length,
                            itemBuilder: (_, int index) => Row(children: [
                             RedTaskService.to.showType == 2 ? PortraitRedPackageCard2(item: controller.redData.item![index],) : PortraitRedPackageCard(
                                item: controller.redData.item![index],
                              ),
                              // SizedBox(width: 10.r),
                            ]),
                          ),
                        ),
                      );
                    }else{
                      return const SizedBox(width: 0,);
                    }

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //背景版本
  ImageProvider getRedListBackGround(){
      
      print('版本类型 == ${RedTaskService.to.showType}');
      return RedImage.redWarStandardProvider('portrait/red_list_bg${RedTaskService.to.showType}.png');
  }

  buildBarView() {
    return Container(
      margin: EdgeInsets.only(top: 10.r, left: 17),
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/redwar/standard/portrait/svg/red_back.svg',
              package: 'red_task',
              fit: BoxFit.fill,
              width: 10,
              height: 18,
            ),
            SizedBox(
              width: 120.r,
            ),
            Text(
              '红包任务'.tr,
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class _PorteaitRedHeader extends GetView<RedPageController> {
  const _PorteaitRedHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(top: 20.r),
        child: Column(
          children: <Widget>[
            Text(
              controller.cycleTime,
              style: TextStyle(
                color:RedTaskService.to.showType == 2 ? AppRedTheme.headerTimeColor : Colors.white,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 3.5.r,),
            Text(
              controller.settleTime,
              style: TextStyle(
                color: RedTaskService.to.showType == 2 ? AppRedTheme.headerTimeColor : Colors.white,
                fontSize: 12.sp,
              ),
            ),
            buildRedWinPrize(),
            
            SizedBox(
              child: _periodButton(),
            ),
          ],
        ),
      );
    });
  }

  //抢红包赢大奖
  Widget buildRedWinPrize(){
    print('开始时间 = ${controller.cycleTime.length}');
    print('结束时间 = ${controller.settleTime.length}'); 
      if (RedTaskService.to.showType == 2)
      {
        return Container(
              margin: EdgeInsets.only(top: 20.r, bottom: Platform.isIOS == true  ? 160.r : 180.r),
              width: 270.r,
              child: Image.asset('assets/images/redwar/standard/portrait/red_win_prize${isCN() ? '' : 'e'}2.png',package: 'red_task',)
            );

      }else
      {
         return Container(
              margin: EdgeInsets.only(top: 12.5.r, bottom: 140.r),
              width: 260,
              child: SvgPicture.asset(
                'assets/images/redwar/standard/portrait/svg/red_win_prize.svg',
                package: 'red_task',
                fit: BoxFit.fill,
                width: 200,
                height: 50,
                color: const Color.fromRGBO(249, 19, 45, 0.5),
              ),
            );
      }
  }

  Widget _periodButton() {
    return Obx(
      () => controller.currentCid != 1 && controller.redData.style == 2
          // () => controller.currentCid != 100
          ? Container(
            margin: EdgeInsets.only(left: 10.r,bottom: 20.r, right: 10.r),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: ['red.present'.tr, 'red.previous'.tr].mapIndexed((el, fakeIndex) {
                  var index = fakeIndex + 1;
                  return GestureDetector(
                    onTap: () => controller.onChangePeriod(index),
                    child: Container(
                      alignment: Alignment.center,
                      width: 170.r,
                      height: 44.r,
                      margin: EdgeInsets.only(
                        left: index == 2 ? 6.r : 0,
                        right: index == 1 ? 6.r : 0,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.w),
                      decoration:RedTaskService.to.showType == 2 ? BoxDecoration(
                        borderRadius: BorderRadius.circular(17.5.r),
                        image: DecorationImage(
                          image:controller.currentPeriod != index ? RedImage.redWarStandardProvider('portrait/red_present_nor${RedTaskService.to.showType}.png') : RedImage.redWarStandardProvider('portrait/red_present_sel${RedTaskService.to.showType}.png')
                        
                       
                      ) ): BoxDecoration(
                        borderRadius: BorderRadius.circular(17.5.r),
                        gradient: controller.currentPeriod != index ? AppRedTheme.norGradient : AppRedTheme.selGradient
                       
                      ),

                      child: Text(
                        el,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color:RedTaskService.to.showType == 2? Colors.white : (controller.currentPeriod != index
                              ? const Color.fromRGBO(212, 24, 57, 1)
                              : const Color.fromRGBO(253, 208, 168, 1)),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
          )
          : SizedBox(
              width: 105.r,
            ),
    );
  }
}
