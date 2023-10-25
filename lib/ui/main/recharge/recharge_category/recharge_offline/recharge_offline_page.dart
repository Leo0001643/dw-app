import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
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
                  border: Border.all(color: ColorX.color_091722,width: 3.r,strokeAlign: BorderSide.strokeAlignOutside),
                  shape: BoxShape.circle,
                ),
                width: 8.r,height: 8.r,
              ),
              SizedBox(width: 13.w,),
              Text("第一步,查看下方收款信息,去转帐充值:",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
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
                    Text("温馨提示: 支付有时间限制,请在规定的时间内完成转帐操作",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
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
                  border: Border.all(color: ColorX.color_5b6d7b,width: 3.r,strokeAlign: BorderSide.strokeAlignOutside),
                  shape: BoxShape.circle,
                ),
                width: 8.r,height: 8.r,
              ),
              SizedBox(width: 13.w,),
              Text("第二步,填充订单(充值时的汇款资料)",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              SizedBox(width: 30.w,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("充值账户",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                    SizedBox(height: 10.h,),
                    Container(
                      decoration: BoxDecoration(color: ColorX.color_f7f8fb,borderRadius: BorderRadius.circular(5.r)),
                      width: 300.w,height: 45.h,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("username",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                          InkWell(
                            onTap: ()=> WidgetUtils().clickCopy("username"),
                            child: Image.asset(ImageX.icon_copy,color: ColorX.color_58698d,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text("汇款姓名",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                    SizedBox(height: 10.h,),
                    WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.color_091722, "请输入汇款人姓名",backgroundColor: ColorX.color_f7f8fb),
                    SizedBox(height: 10.h,),
                    Text("汇款金额",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                    SizedBox(height: 10.h,),
                    WidgetUtils().buildTextField(300.w, 45.h, 14.sp, ColorX.color_091722, "请输入汇款金额",backgroundColor: ColorX.color_f7f8fb,
                    inputType: TextInputType.number),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          WidgetUtils().buildElevatedButton("提交", 335.w, 50.h,bg: ColorX.color_fc243b,onPressed: (){
            Get.offAndToNamed(Routes.recharge_result);
          }),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetUtils().buildElevatedButton("币币兑换", 102.w, 38.h,bg: Colors.white,textColor: ColorX.color_091722,onPressed: (){
                Get.toNamed(Routes.coin_exchange);
              }),
              SizedBox(width: 16.w,),
              WidgetUtils().buildElevatedButton("充值记录", 102.w, 38.h,bg: Colors.white,textColor: ColorX.color_091722,onPressed: (){
                Get.toNamed(Routes.recharge_record);
              }),
              SizedBox(width: 16.w,),
              WidgetUtils().buildElevatedButton("额度转换", 102.w, 38.h,bg: Colors.white,textColor: ColorX.color_091722,onPressed: (){
                Get.toNamed(Routes.quota_conversion);
              }),
            ],
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text("支付说明:\n1.公司帐户资金如何领取到个人帐户 人民币银行结算账户管理方法规定\n2.公司帐户资金如何领取到个人帐户 人民币银行结算账户管理方法规定",
              style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d,height: 1.8),),
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
                    Text("卡号",style: TextStyle(fontSize: 12.sp,color: Colors.white70),),
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
                    Text("持卡人",style: TextStyle(fontSize: 12.sp,color: Colors.white70),),
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
            Text("备注",style: TextStyle(fontSize: 12.sp,color: Colors.white70),),
            Text("备注备注备注备注备备注备注备注备注",style:TextStyle(fontSize: 12.sp,color: Colors.white),),
          ],
        ),
      ),
    );
  }



}