import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';

import 'select_animation_logic.dart';

///
///动效开关
///author: Soushin
///2023/10/11 08:39
///
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
      backgroundColor: ColorX.color_f7f8fb,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.h,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(Intr().fpdx,style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d),),
                        SizedBox(width: 10.w,),
                        Text(Intr().cksl,style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d,
                        decoration: TextDecoration.underline),),
                        Expanded(child: Container()),
                        GFToggle(
                          onChanged: (value){},
                          value: state.entertainedAnim.value,
                          type: GFToggleType.ios,
                          disabledTrackColor: ColorX.color_949eb9,
                          enabledTrackColor: ColorX.color_69c25c,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Divider(color: ColorX.color_10_949,height: 1.h,),
                  SizedBox(height: 5.h,),
                  Container(
                    child: Row(
                      children: [
                        Text(Intr().kjjgdx,style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d),),
                        SizedBox(width: 10.w,),
                        Text(Intr().cksl,style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d,
                            decoration: TextDecoration.underline),),
                        Expanded(child: Container()),
                        GFToggle(
                          onChanged: (value){},
                          value: state.lotteryAnim.value,
                          type: GFToggleType.ios,
                          disabledTrackColor: ColorX.color_949eb9,
                          enabledTrackColor: ColorX.color_69c25c,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Divider(color: ColorX.color_10_949,height: 1.h,),
                  SizedBox(height: 5.h,),
                  Container(
                    child: Row(
                      children: [
                        Text(Intr().djsdx,style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d),),
                        SizedBox(width: 10.w,),
                        Text(Intr().cksl,style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d,
                            decoration: TextDecoration.underline),),
                        Expanded(child: Container()),
                        GFToggle(
                          onChanged: (value){},
                          value: state.countdownAnim.value,
                          type: GFToggleType.ios,
                          disabledTrackColor: ColorX.color_949eb9,
                          enabledTrackColor: ColorX.color_69c25c,
                        ),
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
                  style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600,),),
              ),),
            ),
          ],
        ),
      ),
    );
  }

}




