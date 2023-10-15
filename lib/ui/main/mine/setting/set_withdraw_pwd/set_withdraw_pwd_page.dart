import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'set_withdraw_pwd_logic.dart';

class SetWithdrawPwdPage extends StatefulWidget {
  const SetWithdrawPwdPage({Key? key}) : super(key: key);

  @override
  State<SetWithdrawPwdPage> createState() => _SetWithdrawPwdPageState();
}

class _SetWithdrawPwdPageState extends State<SetWithdrawPwdPage> {
  final logic = Get.find<SetWithdrawPwdLogic>();
  final state = Get.find<SetWithdrawPwdLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("设置提现密码",msg: true,bgColor: Colors.white),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Row(
              children: [
                Text("* ",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                Text("原密码",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Center(
            child: Container(
              width: 335.w,
              decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r),),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Obx(() {
                    return WidgetUtils().buildTextField(285.w, 46.h, 14.sp,
                        ColorX.color_091722, "输入原提现密码",backgroundColor: Colors.transparent,
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
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Row(
              children: [
                Text("* ",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                Text("新密码",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Center(
            child: Container(
              width: 335.w,
              decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r),),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Obx(() {
                    return WidgetUtils().buildTextField(285.w, 46.h, 14.sp,
                        ColorX.color_091722, "输入6-12位新提现密码",backgroundColor: Colors.transparent,
                        onChanged: (v)=> state.pwdNewValue = v,defText: state.pwdNewValue,
                        obscureText: !state.pwdNewVisible.value,inputType: TextInputType.visiblePassword);
                  }),
                  InkWell(
                    onTap: ()=> state.pwdNewVisible.value = !state.pwdNewVisible.value,
                    child: Obx(() {
                      return state.pwdNewVisible.value ? Image.asset(ImageX.icon_show,width: 30.w,):Image.asset(ImageX.icon_hide,width: 30.w,);
                    }),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Row(
              children: [
                Text("* ",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                Text("再次确认",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Center(
            child: Container(
              width: 335.w,
              decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r),),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Obx(() {
                    return WidgetUtils().buildTextField(285.w, 46.h, 14.sp,
                        ColorX.color_091722, "重复输入新提现密码",backgroundColor: Colors.transparent,
                        onChanged: (v)=> state.pwdNew1Value = v,defText: state.pwdNew1Value,
                        obscureText: !state.pwdNewVisible.value,inputType: TextInputType.visiblePassword);
                  }),
                  InkWell(
                    onTap: ()=> state.pwdNew1Visible.value = !state.pwdNew1Visible.value,
                    child: Obx(() {
                      return state.pwdNew1Visible.value ? Image.asset(ImageX.icon_show,width: 30.w,):Image.asset(ImageX.icon_hide,width: 30.w,);
                    }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 20.h),
              child: WidgetUtils().buildElevatedButton("确定", 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){

              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<SetWithdrawPwdLogic>();
    super.dispose();
  }
}