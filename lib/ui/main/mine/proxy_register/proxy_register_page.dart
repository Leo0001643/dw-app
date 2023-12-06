import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
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
  void dispose() {
    Get.delete<ProxyRegisterLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().dailizhuce,msg: true,bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
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
                  Text(Intr().yhm,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.text0917(),
                  Intr().sidao12shuzihuozimu,defText: state.username.value,onChanged: (v)=> state.username.value = v,
                  backgroundColor: ColorX.cardBg3(),hintColor: ColorX.text586()),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Row(
                children: [
                  Text("* ",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                  Text(Intr().mm,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: Container(
                width: 335.w,
                decoration: BoxDecoration(color: ColorX.cardBg3(),borderRadius: BorderRadius.circular(10.r),),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Obx(() {
                      return WidgetUtils().buildTextField(285.w, 46.h, 14.sp,
                          ColorX.text0917(), Intr().wszhzm,backgroundColor: Colors.transparent,
                          onChanged: (v)=> state.pwdValue = v,defText: state.pwdValue,hintColor: ColorX.text586(),
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
                  Text(Intr().querenmima,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: Container(
                width: 335.w,
                decoration: BoxDecoration(color: ColorX.cardBg3(),borderRadius: BorderRadius.circular(10.r),),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Obx(() {
                      return WidgetUtils().buildTextField(285.w, 46.h, 14.sp,
                          ColorX.text0917(), Intr().wszhzm,backgroundColor: Colors.transparent,
                          onChanged: (v)=> state.pwd1Value = v,defText: state.pwd1Value,hintColor: ColorX.text586(),
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
                  Text(Intr().zsxm,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.text0917(),
                  Intr().ytxyhkhmyz,backgroundColor: ColorX.cardBg3(),hintColor: ColorX.text586(),
              defText: state.realname.value,onChanged: (v)=> state.realname.value = v),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(Intr().shoujihaoma,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: Container(
                width: 335.w,
                decoration: BoxDecoration(color: ColorX.cardBg3(),borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  children: [
                    SizedBox(width: 15.w,),
                    InkWell(
                      onTap: ()=> DialogUtils().showSelectAreaBtmDialog(context, state.phoneData ?? {}).then((value) {
                        if(unEmpty(value)){ state.areaNo.value = value!; }
                      }),
                      child: Row(
                        children: [
                          Obx(() {
                            return Text(state.areaNo.value,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),);
                          }),
                          WidgetUtils().buildImage(ImageX.icon_down_black, 15.w, 15.w),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Container(width: 2.w,height: 15.h,color: ColorX.text949(),),
                    WidgetUtils().buildTextField(245.w, 45.h, 14.sp, ColorX.text0917(), Intr().shuruzhenshiyouxiao,
                        backgroundColor: Colors.transparent,inputType: TextInputType.phone,hintColor: ColorX.text586(),
                    defText: state.phone.value,onChanged: (v)=> state.phone.value = v),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(Intr().qqhaoma,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.text0917(), Intr().shuruqqhaoma,
                  backgroundColor: ColorX.cardBg3(),inputType: TextInputType.number,hintColor: ColorX.text586(),
                  defText: state.qq.value,onChanged: (v)=> state.qq.value = v),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(Intr().dianziyouxiang,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: WidgetUtils().buildTextField(335.w, 45.h, 14.sp, ColorX.text0917(), Intr().shurudianziyouxiang,
                  backgroundColor: ColorX.cardBg3(),inputType: TextInputType.emailAddress,hintColor: ColorX.text586(),
                  defText: state.email.value,onChanged: (v)=> state.email.value = v),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Row(
                children: [
                  Text("* ",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                  Text(Intr().yzm,style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Center(
              child: Container(
                width: 335.w,
                decoration: BoxDecoration(color: ColorX.cardBg3(),borderRadius: BorderRadius.circular(10.r),),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetUtils().buildTextField(225.w, 46.h, 14.sp, ColorX.text949(), Intr().qsrzcyzm,
                        backgroundColor: Colors.transparent,hintColor: ColorX.text586(),
                        onChanged: (v)=>state.validCode.value = v,defText: state.validCode.value),
                    Obx(() {
                      return WidgetUtils().buildVarCode(state.varcode.value.varCode.em(),(){
                        logic.getVarcode();
                      });
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Center(
              child: WidgetUtils().buildElevatedButton(Intr().confirm, 335.w, 48.h, bg: ColorX.color_fd273e,
                  textColor: Colors.white,textSize: 16.sp,onPressed: ()=> logic.register()),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Text.rich(TextSpan(
                  children: [
                    TextSpan(text: Intr().wenxintishi_zhuce,
                      style: TextStyle(fontSize: 14.sp,color: ColorX.text586(),height: 1.8),),
                  ]
              ),),
            ),
            SizedBox(height: 20.h,),

          ],
        ),
      ),
    );
  }

}