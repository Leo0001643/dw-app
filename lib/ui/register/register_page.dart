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
import 'package:leisure_games/ui/login/login_logic.dart';

import 'register_logic.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final logic = Get.find<RegisterLogic>();
  final state = Get.find<RegisterLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().cjzh,bgColor: Colors.white),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                    backgroundColor: Colors.transparent,onChanged: (v)=>state.accountValue = v),
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
                          ColorX.color_949eb9, Intr().wszhzm,backgroundColor: Colors.transparent,
                          onChanged: (v)=> state.pwdValue = v,defText: state.pwdValue,
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
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Text(Intr().zsxm,style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
            ),
            SizedBox(height: 10.h,),
            Center(
              child: Container(
                width: 335.w,
                decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r),),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: WidgetUtils().buildTextField(325.w, 46.h, 14.sp, ColorX.color_949eb9, Intr().ytxyhkhmyz,
                    backgroundColor: Colors.transparent,onChanged: (v)=>state.accountValue = v),
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Text(Intr().yzm,style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
            ),
            SizedBox(height: 10.h,),
            Center(
              child: Container(
                width: 335.w,
                decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r),),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetUtils().buildTextField(225.w, 46.h, 14.sp, ColorX.color_949eb9, Intr().qsrzcyzm,
                        backgroundColor: Colors.transparent,onChanged: (v)=>state.accountValue = v),
                    Container(width: 73.w,height: 30.h,color: Colors.black54,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Center(
              child: Text.rich(TextSpan(
                children: [
                  WidgetSpan(
                    child: InkWell(
                      onTap: ()=> state.agreeCheck.value = !state.agreeCheck.value,
                      child: Obx(() {
                        return Image.asset(state.agreeCheck.value ? ImageX.icon_select : ImageX.icon_unselect);
                      }),
                    ),
                  ),
                  WidgetSpan(child: SizedBox(width: 5.w,),),
                  TextSpan(text: Intr().wywdbty,style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722)),
                  WidgetSpan(
                    child: InkWell(
                      onTap: (){},
                      child: Text(Intr().yhtk,style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                    ),
                  ),
                  TextSpan(text: Intr().and,style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722)),
                  WidgetSpan(
                    child: InkWell(
                      onTap: (){},
                      child: Text(Intr().ysxy,style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ]
              )),
            ),
            SizedBox(height: 20.h,),
            Center(
              child: WidgetUtils().buildElevatedButton(Intr().register, 335.w, 48.h, bg: ColorX.color_fd273e,
                  textColor: Colors.white,textSize: 16.sp,onPressed: ()=>logic.clickRegister()),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Get.until((ModalRoute.withName(Routes.main)));
                      Get.toNamed(Routes.login);
                    },
                    child: Row(
                      children: [
                        Text(Intr().yyzh,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
                        Text(Intr().login,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,decoration: TextDecoration.underline),),
                        Image.asset(ImageX.icon_right_black),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      eventBus.fire(ChangeMainPageEvent(3));
                      Get.until((ModalRoute.withName(Routes.main)));
                    },
                    child: Text(Intr().lxkf,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<RegisterLogic>();
    super.dispose();
  }
}