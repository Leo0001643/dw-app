import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'recharge_logic.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({Key? key}) : super(key: key);

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  final logic = Get.find<RechargeLogic>();
  final state = Get.find<RechargeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("充值中心",msg: true,drawer: true,back: false),
      backgroundColor: ColorX.color_f7f8fb,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h,),
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(22.r),
                    child: Image.network(Constants.test_image,width: 42.r,height: 42.r,fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 7.h,),
                  Text("充值帐户: 2946781",style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w,vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("人民币钱包(当前默认)",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
                  Text("余额: ¥666",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
                ],
              ),
            ),
            buildCategoryItem("财付通",ImageX.icon_cft,0),
            buildCategoryItem("全民付",ImageX.icon_cft,1),
            buildCategoryItem("银行卡转帐",ImageX.icon_cft,2),
            buildCategoryItem("微信支付",ImageX.icon_cft,3),
            buildCategoryItem("云闪付支付",ImageX.icon_cft,4),
            buildCategoryItem("支付宝",ImageX.icon_cft,5),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.only(left: 27.w,right: 27.w,top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("数字钱包",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
                  Text("余额: \$666",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
                ],
              ),
            ),
            buildCategoryItem("USDT币",ImageX.icon_dollar_grey,6),
            SizedBox(height: 30.h,),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryItem(String title, String icon, int i) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),
      padding: EdgeInsets.all(15.r),
      child: Row(
        children: [
          Image.asset(icon,width: 18.r,),
          SizedBox(width: 5.w,),
          Text(title,style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
          Expanded(child: Container()),
          Image.asset(ImageX.icon_right_grey),
        ],
      ),
    );
  }



}