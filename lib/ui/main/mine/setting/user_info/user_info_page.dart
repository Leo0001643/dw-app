import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
      appBar: WidgetUtils().buildAppBar("完善资料",msg: true),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text("用户名",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.color_62_586, "用户名",backgroundColor: ColorX.color_f7f8fb),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text("昵称",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.color_091722, "输入昵称",backgroundColor: ColorX.color_f7f8fb),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text("手机号码",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.color_091722, "输入真实有效的手机号码",
                  backgroundColor: ColorX.color_f7f8fb,inputType: TextInputType.number),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text("QQ号码",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.color_091722, "输入QQ号码",
                  backgroundColor: ColorX.color_f7f8fb,inputType: TextInputType.number),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text("微信",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.color_091722, "输入微信号",backgroundColor: ColorX.color_f7f8fb),
            ),
            SizedBox(height: 100.h,),
            Center(
              child: WidgetUtils().buildElevatedButton("确定", 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){

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