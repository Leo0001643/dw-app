import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'add_usdt_logic.dart';

class AddUsdtPage extends StatefulWidget {
  const AddUsdtPage({Key? key}) : super(key: key);

  @override
  State<AddUsdtPage> createState() => _AddUsdtPageState();
}

class _AddUsdtPageState extends State<AddUsdtPage> {
  final logic = Get.find<AddUsdtLogic>();
  final state = Get.find<AddUsdtLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().bangdingusdt,msg: true,bgColor: ColorX.appBarBg()),
      backgroundColor: ColorX.pageBg(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("*",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                      Text(Intr().zsxm,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Text("121321",style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.color_f1f1f1,indent: 25.w,endIndent: 25.w,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("*",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                      Text(Intr().shoujihaoma,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Text("121321",style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.color_f1f1f1,indent: 25.w,endIndent: 25.w,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("*",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                      Text(Intr().qianbaodizhi,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                    ],
                  ),
                  WidgetUtils().buildTextField(300.w, 35.h, 14.sp, ColorX.text586(), Intr().qingshuruqianbaodizhi),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.color_f1f1f1,indent: 25.w,endIndent: 25.w,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("*",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                      Text(Intr().yanzhengzijinmima,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                    ],
                  ),
                  WidgetUtils().buildTextField(300.w, 35.h, 14.sp, ColorX.text586(), Intr().qingshuruqukuanmima),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.color_f1f1f1,),
            SizedBox(height: 20.h,),
            Center(
              child: WidgetUtils().buildElevatedButton(Intr().queren, 341.w, 50.h,bg: ColorX.color_fc243b,
                  onPressed: (){}),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<AddUsdtLogic>();
    super.dispose();
  }
}