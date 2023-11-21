import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/payment_channel_entity.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'recharge_offline_logic.dart';

class RechargeOfflinePage extends StatefulWidget {
  const RechargeOfflinePage({Key? key}) : super(key: key);

  @override
  State<RechargeOfflinePage> createState() => _RechargeOfflinePageState();
}

class _RechargeOfflinePageState extends State<RechargeOfflinePage> {
  final logic = Get.find<RechargeOfflineLogic>();
  final state = Get.find<RechargeOfflineLogic>().state;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 15.w,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorX.text586(),width: 3.r,strokeAlign: BorderSide.strokeAlignOutside),
                  shape: BoxShape.circle,
                ),
                width: 8.r,height: 8.r,
              ),
              SizedBox(width: 13.w,),
              Text(Intr().diyibu_chakanshoukuanxinxi,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              SizedBox(width: 18.w,),
              Container(width: 1.w,height: 234.h,color: Colors.black54,),
              SizedBox(width: 13.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return GFCarousel(
                        height: 215.h,
                        viewportFraction: 0.9,
                        enableInfiniteScroll: false,
                        items: state.agreeList.map((element) => buildCollectionInfo(element,state.agreeList.indexOf(element))).toList(),
                      );
                    }),
                    SizedBox(height: 10.h,),
                    Text(Intr().wenxintishi_zhifuyoushijian,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              SizedBox(width: 15.w,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorX.text586(),width: 3.r,strokeAlign: BorderSide.strokeAlignOutside),
                  shape: BoxShape.circle,
                ),
                width: 8.r,height: 8.r,
              ),
              SizedBox(width: 13.w,),
              Text(Intr().dierbu_tianchongdingdan,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              SizedBox(width: 30.w,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorX.cardBg5(),
                ),
                padding: EdgeInsets.all(10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Intr().chongzhizhanghu,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                    SizedBox(height: 10.h,),
                    Container(
                      decoration: BoxDecoration(color: ColorX.appBarBg2(),borderRadius: BorderRadius.circular(5.r)),
                      width: 300.w,height: 45.h,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppData.user()!.username.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                          InkWell(
                            onTap: ()=> WidgetUtils().clickCopy(AppData.user()!.username.em()),
                            child: Image.asset(ImageX.icon_copy,color: ColorX.text586(),),
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      return Visibility(
                        visible: state.paymentInfo.value.bankCode == Constants.code_wangyin,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h,),
                            Text(Intr().yinhangmingcheng,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                            SizedBox(height: 10.h,),
                            InkWell(
                              child: Obx(() {
                                return WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.text0917(), Intr().xuanzhezhifuyinhang,defText: state.selectBank.value.bankName.em(),
                                    backgroundColor: ColorX.appBarBg2(),hintColor: ColorX.text586(),suffixIcon: true);
                              }),
                              onTap: ()=> DialogUtils().showSelectBankBtmDialog(context, state.banks).then((value) {
                                if(unEmpty(value)){
                                  state.selectBank.value = value!;
                                  state.selectBank.refresh();
                                }
                              }),
                            ),
                          ],
                        ),
                      );
                    }),
                    SizedBox(height: 10.h,),
                    Text(Intr().huikuanxingming,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                    SizedBox(height: 10.h,),
                    WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.text0917(), Intr().qingshuruhuikuanren,defText: state.remitName,
                        backgroundColor: ColorX.appBarBg2(),hintColor: ColorX.text586(),onChanged: (v)=> state.remitName=v),
                    SizedBox(height: 10.h,),
                    Text(Intr().huikuanjine,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                    SizedBox(height: 10.h,),
                    WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.text0917(), Intr().qingshuruhuikuanjine,defText: state.remitAmount,
                        backgroundColor: ColorX.appBarBg2(), inputType: TextInputType.number,hintColor: ColorX.text586(),onChanged: (v)=> state.remitAmount=v),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          WidgetUtils().buildElevatedButton(Intr().yiwanchengtijiaorukuan, 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: ()=> submitDialog(context)),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetUtils().buildElevatedButton(Intr().bibiduihuan, 102.w, 38.h,bg: ColorX.cardBg(),textColor: ColorX.text0917(),onPressed: (){
                Get.toNamed(Routes.coin_exchange);
              }),
              SizedBox(width: 16.w,),
              WidgetUtils().buildElevatedButton(Intr().chongzhijilu, 102.w, 38.h,bg: ColorX.cardBg(),textColor: ColorX.text0917(),onPressed: (){
                Get.toNamed(Routes.recharge_record);
              }),
              SizedBox(width: 16.w,),
              WidgetUtils().buildElevatedButton(Intr().eduzhuanhuan, 102.w, 38.h,bg: ColorX.cardBg(),textColor: ColorX.text0917(),onPressed: (){
                Get.toNamed(Routes.quota_conversion);
              }),
            ],
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(Intr().zhifushuoming_rmb,
              style: TextStyle(fontSize: 13.sp,color: ColorX.text586(),height: 1.8),),
          ),
          SizedBox(height: 50.h,),

        ],
      ),
    );
  }



  Widget buildBtnAmount(int i) {
    return Container(
      decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(5.r)),
      alignment: Alignment.center,
      height: 40.h,width: 65.w,
      child: Text("$i",style: TextStyle(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildCollectionInfo(PaymentChannelBankSet item,int index) {
    return InkWell(
      onTap: ()=>state.selectIndex.value = index,
      child: Container(
        decoration: BoxDecoration(color: getCardBgColor(),borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.bankName.em(),style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                Obx(() {
                  return Visibility(
                    visible: state.selectIndex.value == index,
                    child: Image.asset(ImageX.icon_check_black),
                  );
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h,),
                      Text(Intr().kahao,style: TextStyle(fontSize: 12.sp,color: Colors.white70),),
                      Row(
                        children: [
                          Text(item.cardNumber.em(),style:TextStyle(fontSize: 14.sp,color: Colors.white),),
                          InkWell(
                            onTap: ()=> WidgetUtils().clickCopy(item.cardNumber.em()),
                            child: Image.asset(ImageX.icon_copy,),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h,),
                      Text(Intr().cikaren,style: TextStyle(fontSize: 12.sp,color: Colors.white70),),
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(text: item.cardUsername.em(),style:TextStyle(fontSize: 14.sp,color: Colors.white),),
                          WidgetSpan(
                            child: InkWell(
                              onTap: ()=> WidgetUtils().clickCopy(item.cardUsername.em()),
                              child: Image.asset(ImageX.icon_copy,),
                            ),
                          ),
                        ]
                      )),
                    ],
                  ),
                ),
                Visibility(
                  visible: unEmpty(item.qrcodeLogo),
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    width: 88.r,height: 88.r,
                    color: Colors.white,
                    child: WidgetUtils().buildQRCode(item.qrcodeLogo.em(), 80.r, 80.r),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h,),
            Text(Intr().beizhu,style: TextStyle(fontSize: 12.sp,color: Colors.white70),),
            Text(item.bankBranch.em(),style:TextStyle(fontSize: 12.sp,color: Colors.white),),
          ],
        ),
      ),
    );
  }

  Color getCardBgColor() {
    switch(state.paymentInfo.value.bankCode){
      case Constants.code_caifutong:
      case Constants.code_wangyin:
      case Constants.code_ysfzf:
        return ColorX.color_5583e7;
      case Constants.code_qmf:
        return ColorX.color_e75555;
      case Constants.code_weixin:
        return ColorX.color_00ac47;
      case Constants.code_zhifubao:
        return ColorX.color_6655e7;
      default:
        return ColorX.color_5583e7;
    }
  }

  void submitDialog(BuildContext context) {

  }






}