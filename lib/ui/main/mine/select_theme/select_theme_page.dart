import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'select_theme_logic.dart';

///
/// 深浅色开关
class SelectThemePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateSelectThemePage();

}

class StateSelectThemePage extends State<StatefulWidget>{

  final logic = Get.find<SelectThemeLogic>();
  final state = Get.find<SelectThemeLogic>().state;

  @override
  void dispose() {
    Get.delete<SelectThemeLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().wgsz,msg: true),
      backgroundColor: ColorX.color_f7f8fb,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: Image.asset(ImageX.theme,width: 350.w,fit: BoxFit.fill,),
            ),
            SizedBox(height: 15.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){ state.selectTheme.value = true; },
                    child: Row(
                      children: [
                        Obx(() {
                          return state.selectTheme.value ? Image.asset(ImageX.icon_select) : Image.asset(ImageX.icon_unselect);
                        }),
                        SizedBox(width: 9.w,),
                        Text(Intr().qzb, style: TextStyle(fontSize: 16.sp, color: ColorX.color_091722,fontWeight: FontWeight.w600,),),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){ state.selectTheme.value = false; },
                    child: Row(
                      children: [
                        Obx(() {
                          return state.selectTheme.value ? Image.asset(ImageX.icon_unselect) : Image.asset(ImageX.icon_select);
                        }),
                        SizedBox(width: 9.w,),
                        Text(Intr().kxh, style: TextStyle(fontSize: 16.sp, color: ColorX.color_091722,fontWeight: FontWeight.w600,),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



}



