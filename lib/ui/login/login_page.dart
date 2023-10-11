import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';

import 'login_logic.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final logic = Get.find<LoginLogic>();
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intr().login,style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600,),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 0,
        actions: [
          InkWell(
            onTap: ()=>Get.back(),
            child: Image.asset(ImageX.icon_close),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.only(left: 35.w),
            child: Text(Intr().yhm,style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
          ),
          SizedBox(height: 10.h,),
          Center(
            child: Container(
              width: 335.w,
              decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r),),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: WidgetUtils().buildTextField(325.w, 46.h, 14.sp, ColorX.color_949eb9, Intr().qsryhm,
                  backgroundColor: Colors.transparent,onChanged: (v)=>logic.editChange(true, v)),
            ),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.only(left: 35.w),
            child: Text(Intr().mm,style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
          ),
          SizedBox(height: 10.h,),
          Center(
            child: Container(
              width: 335.w,
              decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r),),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Obx(() {
                    return WidgetUtils().buildTextField(285.w, 46.h, 14.sp,
                        ColorX.color_949eb9, Intr().qsrmm,backgroundColor: Colors.transparent,
                        onChanged: (v)=> logic.editChange(false, v),defText: state.pwdValue,
                        obscureText: !state.pwdVisible.value,inputType: TextInputType.visiblePassword);
                  }),
                  InkWell(
                    onTap: ()=> state.pwdVisible.value = !state.pwdVisible.value,
                    child: Obx(() {
                      return state.pwdVisible.value ? Image.asset(ImageX.icon_show,width: 30.w,):Image.asset(ImageX.icon_hide,width: 30.w,);
                    }),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Align(
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: InkWell(
                onTap: (){},
                child: Text(Intr().wjmm,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
              ),
            ),
            alignment: Alignment.centerRight,
          ),
          SizedBox(height: 20.h,),
          Center(
            child: Obx(() {
              return WidgetUtils().buildElevatedButton(Intr().login, 335.w, 48.h, bg: state.btnEnable.value ? ColorX.color_fd273e:ColorX.color_ff5163,
                  textColor: Colors.white,textSize: 16.sp,onPressed: ()=>logic.clickLogin());
            }),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()=> Get.toNamed(Routes.register),
                  child: Row(
                    children: [
                      Text(Intr().cjygzxh,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
                      Image.asset(ImageX.icon_right_black),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    eventBus.fire(ChangeMainPageEvent(3));
                    Get.back();
                  },
                  child: Text(Intr().lxkf,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<LoginLogic>();
    super.dispose();
  }
}