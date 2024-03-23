import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';

import 'add_wallet_logic.dart';

///添加钱包
class AddWalletPage extends StatefulWidget {
  const AddWalletPage({Key? key}) : super(key: key);

  @override
  State<AddWalletPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
  final logic = Get.find<AddWalletLogic>();
  final state = Get.find<AddWalletLogic>().state;


  @override
  void dispose() {
    Get.delete<AddWalletLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().bangdingqitaqianbao,msg: true,
          bgColor: ColorX.appBarBg(),scaffoldKey: state.scaffoldKey),
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
                      Text(Intr().qianbaoleixing,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Obx(() {
                    return Text(state.channel.value.typeName(),style: TextStyle(fontSize: 14.sp,color: ColorX.text5862()),);
                  }),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.linef1f2(),indent: 25.w,endIndent: 25.w,),
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
                          WidgetUtils().buildTextField(260.w, 35.h, 14.sp, ColorX.text5862(), Intr().shuruzhenshiyouxiao,
                              hintColor: ColorX.text5862(),padding: EdgeInsets.zero,
                              defText: state.bankMobile.value,inputType: TextInputType.phone,onChanged: (v)=> state.bankMobile.value = v)
                        ],
                      );
                    } else {
                      return Text(state.channel.value.mobile.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text5862()),);
                    }
                  }),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.linef1f2(),indent: 25.w,endIndent: 25.w,),
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
                  SizedBox(height: 5.h,),
                  WidgetUtils().buildTextField(300.w, 40.h, 14.sp, ColorX.text5862(), Intr().qingshuruqianbaodizhi,backgroundColor: ColorX.cardBg15(),
                      hintColor: ColorX.text5862(),padding: EdgeInsets.zero,
                      defText: state.openAddress.value,onChanged: (v)=> state.openAddress.value = v),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.linef1f2(), indent: 25.w,endIndent: 25.w,),
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
                  SizedBox(height: 5.h,),
                  WidgetUtils().buildTextField(300.w, 40.h, 14.sp, ColorX.text5862(), Intr().qingshuruqukuanmima,backgroundColor: ColorX.cardBg15(),
                      hintColor: ColorX.text5862(),padding: EdgeInsets.zero,
                      defText: state.bankPwd.value,onChanged: (v)=> state.bankPwd.value = v),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.linef1f2(),),
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