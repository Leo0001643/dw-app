import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'add_bank_logic.dart';

class AddBankPage extends StatefulWidget {
  const AddBankPage({Key? key}) : super(key: key);

  @override
  State<AddBankPage> createState() => _AddBankPageState();
}

class _AddBankPageState extends State<AddBankPage> {
  final logic = Get.find<AddBankLogic>();
  final state = Get.find<AddBankLogic>().state;

  @override
  void dispose() {
    Get.delete<AddBankLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().bangdingyinhangka,msg: true,bgColor: ColorX.appBarBg()),
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
                  Obx(() {
                    return Text(state.detail.value.realname.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),);
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
                    if(isEmpty(state.detail.value.mobile)){
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
                      return Text(state.detail.value.mobile.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),);
                    }
                  }),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.color_f1f1f1,indent: 25.w,endIndent: 25.w,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 25.w),
              child: InkWell(
                onTap: ()=> DialogUtils().showSelectBankBtmDialog(context, state.banks).then((value) {
                  if(unEmpty(value)){
                    state.selectBank.value = value!;
                    state.selectBank.refresh();
                  }
                }),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("*",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                        Text(Intr().chukuanyinhang,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Obx(() {
                      var name = state.selectBank.value.bankName ?? Intr().qingxuanzhe;
                      return Text(name, style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),);
                    }),
                  ],
                ),
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
                      Text(Intr().chukuanzhanghu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  WidgetUtils().buildTextField(300.w, 35.h, 14.sp, ColorX.text586(), Intr().shuruyinhangzhanghao,
                  defText: state.bankAccount.value,onChanged: (v)=> state.bankAccount.value = v),
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
                      Text(Intr().kaihudizhi,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                    ],
                  ),
                  WidgetUtils().buildTextField(300.w, 35.h, 14.sp, ColorX.text586(), Intr().shuruyinhangkakaihudizhi,
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
                      Text(Intr().yanzhengchukuanmima,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                    ],
                  ),
                  WidgetUtils().buildTextField(300.w, 35.h, 14.sp, ColorX.text586(), Intr().liudao12weishuzihuozimu,
                      defText: state.bankPwd.value,onChanged: (v)=> state.bankPwd.value = v),
                ],
              ),
            ),
            Divider(height: 1.h,color: ColorX.color_f1f1f1,),
            SizedBox(height: 20.h,),
            Center(
              child: WidgetUtils().buildElevatedButton(Intr().queren, 341.w, 50.h,bg: ColorX.color_fc243b,
                  onPressed: ()=> logic.bindBank()),
            ),
            SizedBox(height: 20.h,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(Intr().wenxintishi_,style: TextStyle(fontSize: 20.sp,color: ColorX.text586()),),
            ),
            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(Intr().yigezhanghaosanzhangyinhangka,style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
            ),
          ],
        ),
      ),
    );
  }

}