import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'proxy_register_logic.dart';

class ProxyRegisterPage extends StatefulWidget {
  const ProxyRegisterPage({Key? key}) : super(key: key);

  @override
  State<ProxyRegisterPage> createState() => _ProxyRegisterPageState();
}

class _ProxyRegisterPageState extends State<ProxyRegisterPage> {
  final logic = Get.find<ProxyRegisterLogic>();
  final state = Get.find<ProxyRegisterLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("代理注册",msg: true,bgColor: Colors.white),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Row(
                children: [
                  Text("* ",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                  Text("用户名",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.color_62_586, "请输入用户名",backgroundColor: ColorX.color_f7f8fb),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Row(
                children: [
                  Text("* ",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                  Text("密码",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
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
                          ColorX.color_091722, "8-12位数字或字母",backgroundColor: Colors.transparent,
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
                  Text("确认密码",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
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
                          ColorX.color_091722, "8-12位数字或字母",backgroundColor: Colors.transparent,
                          onChanged: (v)=> state.pwd1Value = v,defText: state.pwd1Value,
                          obscureText: !state.pwd1Visible.value,inputType: TextInputType.visiblePassword);
                    }),
                    InkWell(
                      onTap: ()=> state.pwd1Visible.value = !state.pwd1Visible.value,
                      child: Obx(() {
                        return state.pwd1Visible.value ? Image.asset(ImageX.icon_show,width: 30.w,):Image.asset(ImageX.icon_hide,width: 30.w,);
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
                  Text("真实姓名",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.color_62_586, "与提现银行卡户名一致",backgroundColor: ColorX.color_f7f8fb),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text("手机号码",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: Container(
                width: 335.w,
                decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  children: [
                    SizedBox(width: 15.w,),
                    Text("+86",style: TextStyle(color: ColorX.color_091722,fontSize: 14.sp),),
                    SizedBox(width: 5.w,),
                    Container(width: 2.w,height: 15.h,color: ColorX.color_949eb9,),
                    WidgetUtils().buildTextField(285.w, 45.h, 14.sp, ColorX.color_091722, "请输入真实有效的手机号码",
                        backgroundColor: ColorX.color_f7f8fb,inputType: TextInputType.phone),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text("QQ号码",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.color_091722, "请输入QQ号码",
                  backgroundColor: ColorX.color_f7f8fb,inputType: TextInputType.number),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text("电子邮箱",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.color_091722, "请输入电子邮箱",
                  backgroundColor: ColorX.color_f7f8fb,inputType: TextInputType.number),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Row(
                children: [
                  Text("* ",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                  Text(Intr().yzm,style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
                ],
              ),
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
              child: WidgetUtils().buildElevatedButton("确定", 335.w, 48.h, bg: ColorX.color_fd273e,
                  textColor: Colors.white,textSize: 16.sp,onPressed: (){}),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "温馨提示:\n1.标有*号代表必须填写项目\n2.注册即代表您已同意各项“开户协议”",
                      style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d,height: 1.8),),
                  ]
              ),),
            ),
            SizedBox(height: 20.h,),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ProxyRegisterLogic>();
    super.dispose();
  }
}