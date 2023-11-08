import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'user_info_logic.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final logic = Get.find<UserInfoLogic>();
  final state = Get.find<UserInfoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().wanshanziliao,msg: true),
      backgroundColor: ColorX.pageBg(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(Intr().yhm,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.color_62_586,
                  Intr().yhm,backgroundColor: ColorX.cardBg3(),hintColor: ColorX.text586()),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(Intr().nicheng,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.text0917(),
                  Intr().shurunicheng,backgroundColor: ColorX.cardBg3(),hintColor: ColorX.text586()),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(Intr().shoujihaoma,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.text0917(), Intr().shuruzhenshiyouxiao,
                  backgroundColor: ColorX.cardBg3(),inputType: TextInputType.number,hintColor: ColorX.text586()),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(Intr().qqhaoma,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.color_091722, Intr().shuruqqhaoma,
                  backgroundColor: ColorX.cardBg3(),inputType: TextInputType.number,hintColor: ColorX.text586()),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(Intr().weixin,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.text0917(),
                  Intr().shuruweixinhao,backgroundColor: ColorX.cardBg3(),hintColor: ColorX.text586()),
            ),
            SizedBox(height: 100.h,),
            Center(
              child: WidgetUtils().buildElevatedButton(Intr().confirm, 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){

              }),
            ),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<UserInfoLogic>();
    super.dispose();
  }
}