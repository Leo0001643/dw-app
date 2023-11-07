import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
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
                    GFCarousel(
                      height: 215.h,
                      viewportFraction: 0.9,
                      enableInfiniteScroll: false,
                      items: [
                        buildCollectionInfo(0),
                        buildCollectionInfo(1),
                        buildCollectionInfo(2),
                      ],
                    ),
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
                          Text("username",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                          InkWell(
                            onTap: ()=> WidgetUtils().clickCopy("username"),
                            child: Image.asset(ImageX.icon_copy,color: ColorX.text586(),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text(Intr().huikuanxingming,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                    SizedBox(height: 10.h,),
                    WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.text0917(), Intr().qingshuruhuikuanren,
                        backgroundColor: ColorX.appBarBg2(),hintColor: ColorX.text586()),
                    SizedBox(height: 10.h,),
                    Text(Intr().huikuanjine,style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                    SizedBox(height: 10.h,),
                    WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.text0917(), Intr().qingshuruhuikuanjine,
                        backgroundColor: ColorX.appBarBg2(), inputType: TextInputType.number,hintColor: ColorX.text586()),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          WidgetUtils().buildElevatedButton(Intr().tijiao, 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
            Get.offAndToNamed(Routes.recharge_result);
          }),
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

  Widget buildCollectionInfo(int index) {
    return InkWell(
      onTap: ()=>state.selectIndex.value = index,
      child: Container(
        decoration: BoxDecoration(color: ColorX.color_5583e7,borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("支付宝支付",style: TextStyle(fontSize: 18.sp,color: Colors.white),),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h,),
                    Text(Intr().kahao,style: TextStyle(fontSize: 12.sp,color: Colors.white70),),
                    Row(
                      children: [
                        Text("77788888888",style:TextStyle(fontSize: 14.sp,color: Colors.white),),
                        InkWell(
                          onTap: ()=> WidgetUtils().clickCopy("77788888888"),
                          child: Image.asset(ImageX.icon_copy,),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h,),
                    Text(Intr().cikaren,style: TextStyle(fontSize: 12.sp,color: Colors.white70),),
                    Row(
                      children: [
                        Text("嘟嘟",style:TextStyle(fontSize: 14.sp,color: Colors.white),),
                        InkWell(
                          onTap: ()=> WidgetUtils().clickCopy("嘟嘟"),
                          child: Image.asset(ImageX.icon_copy,),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r),),
                  child: QrImageView(
                    data: '1234567890',
                    version: QrVersions.auto,
                    padding: EdgeInsets.all(5.r),
                    size: 68.r,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h,),
            Text(Intr().beizhu,style: TextStyle(fontSize: 12.sp,color: Colors.white70),),
            Text("备注备注备注备注备备注备注备注备注",style:TextStyle(fontSize: 12.sp,color: Colors.white),),
          ],
        ),
      ),
    );
  }



}