import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
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
  void dispose() {
    Get.delete<AddUsdtLogic>();
    super.dispose();
  }

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
                      Text(Intr().qianbaoxieyi,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Obx(() {
                    return Text(state.channel.value.typeName(),style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),);
                  }),
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
                  Obx(() {
                    if(isEmpty(state.channel.value.mobile)){
                      return Row(
                        children: [
                          InkWell(
                            onTap: ()=> DialogUtils().showSelectAreaBtmDialog(context, state.phoneData ?? {}).then((value) {
                              if(unEmpty(value)){ state.areaNo.value = value!; }
                            }),
                            child: Row(
                              children: [
                                Text(state.areaNo.value,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                                WidgetUtils().buildImage(ImageX.icon_down_black, 15.w, 15.w),
                              ],
                            ),
                          ),
                          WidgetUtils().buildTextField(260.w, 35.h, 14.sp, ColorX.text586(), Intr().shuruzhenshiyouxiao,
                              defText: state.bankMobile.value,inputType: TextInputType.phone,onChanged: (v)=> state.bankMobile.value = v)
                        ],
                      );
                    } else {
                      return Text(state.channel.value.mobile.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),);
                    }
                  }),
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
                  WidgetUtils().buildTextField(300.w, 35.h, 14.sp, ColorX.text586(), Intr().qingshuruqianbaodizhi,
                      defText: state.openAddress.value,onChanged: (v)=> state.openAddress.value = v),
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
                  WidgetUtils().buildTextField(300.w, 35.h, 14.sp, ColorX.text586(), Intr().qingshuruqukuanmima,
                      defText: state.bankPwd.value,onChanged: (v)=> state.bankPwd.value = v),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.color_f1f1f1,),
            SizedBox(height: 20.h,),
            Center(
              child: WidgetUtils().buildElevatedButton(Intr().queren, 341.w, 50.h,bg: ColorX.color_fc243b,
                  onPressed: ()=> logic.bindUsdt()),
            ),
          ],
        ),
      ),
    );
  }


}