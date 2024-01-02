import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';

import 'select_animation_logic.dart';

///
///动效开关
class SelectAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateSelectAnimationPage();
}

class StateSelectAnimationPage extends State<SelectAnimationPage>{

  final logic = Get.find<SelectAnimationLogic>();
  final state = Get.find<SelectAnimationLogic>().state;

  @override
  void dispose() {
    Get.delete<SelectAnimationLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().dxtxsz,msg: true),
      backgroundColor: ColorX.pageBg2(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.h,),
            Container(
              decoration: BoxDecoration(
                color: ColorX.cardBg3(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(Intr().fpdx,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                        SizedBox(width: 10.w,),
                        Text(Intr().cksl,style: TextStyle(fontSize: 13.sp,color: ColorX.text586(),
                        decoration: TextDecoration.underline),),
                        Expanded(child: Container()),
                        Obx(() {
                          return Switch(
                            thumbColor:
                            MaterialStateColor.resolveWith((states) {
                              // 根据状态返回相应的颜色
                              if (states.contains(MaterialState.selected)) {
                                // Switch 处于激活状态时的颜色
                                return Colors.white;
                              }
                              // Switch 处于非激活状态时的颜色
                              return Colors.white; // 你可以根据需要修改颜色
                            }),
                            onChanged: (value) {
                              state.entertainedAnim.value = value == true;
                            },
                            value: state.entertainedAnim.value,
                            inactiveTrackColor: ColorX.text949(),
                            activeTrackColor: ColorX.color_69c25c,
                            activeColor: Colors.white,
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Divider(color: ColorX.color_10_949,height: 1.h,),
                  SizedBox(height: 5.h,),
                  Container(
                    child: Row(
                      children: [
                        Text(Intr().kjjgdx,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                        SizedBox(width: 10.w,),
                        Text(Intr().cksl,style: TextStyle(fontSize: 13.sp,color: ColorX.text586(),
                            decoration: TextDecoration.underline),),
                        Expanded(child: Container()),
                        Obx(() {
                          return Switch(
                            thumbColor:
                            MaterialStateColor.resolveWith((states) {
                              // 根据状态返回相应的颜色
                              if (states.contains(MaterialState.selected)) {
                                // Switch 处于激活状态时的颜色
                                return Colors.white;
                              }
                              // Switch 处于非激活状态时的颜色
                              return Colors.white; // 你可以根据需要修改颜色
                            }),
                            onChanged: (value) {
                              state.lotteryAnim.value = value == true;
                            },
                            value: state.lotteryAnim.value,
                            inactiveTrackColor: ColorX.text949(),
                            activeTrackColor: ColorX.color_69c25c,
                            activeColor: Colors.white,
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Divider(color: ColorX.color_10_949,height: 1.h,),
                  SizedBox(height: 5.h,),
                  Container(
                    child: Row(
                      children: [
                        Text(Intr().djsdx,style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                        SizedBox(width: 10.w,),
                        Text(Intr().cksl,style: TextStyle(fontSize: 13.sp,color: ColorX.text586(),
                            decoration: TextDecoration.underline),),
                        Expanded(child: Container()),
                        Obx(() {
                          return Switch(
                            thumbColor:
                            MaterialStateColor.resolveWith((states) {
                              // 根据状态返回相应的颜色
                              if (states.contains(MaterialState.selected)) {
                                // Switch 处于激活状态时的颜色
                                return Colors.white;
                              }
                              // Switch 处于非激活状态时的颜色
                              return Colors.white; // 你可以根据需要修改颜色
                            }),
                            onChanged: (value) {
                              state.countdownAnim.value = value == true;
                            },
                            value: state.countdownAnim.value,
                            inactiveTrackColor: ColorX.text949(),
                            activeTrackColor: ColorX.color_69c25c,
                            activeColor: Colors.white,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(padding: EdgeInsets.only(top: 10.h,right: 10.w),
              child: InkWell(
                onTap: (){
                  eventBus.fire(ChangeMainPageEvent(3));
                  Get.back();
                },
                child:  Text(Intr().lxkf,
                  style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600,),),
              ),),
            ),
          ],
        ),
      ),
    );
  }

}




