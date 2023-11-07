
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
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
      backgroundColor: ColorX.pageBg2(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 236.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageX.rechargeBgT()),fit: BoxFit.fill),
              ),
            ),
            Column(
              children: [
                WidgetUtils().buildAppBar(Intr().chongzhizhongxin,bgColor: Colors.transparent, msg: true,drawer: true,back: false),
                Container(
                  height: 100.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GFAvatar(
                        backgroundImage: NetworkImage(Constants.test_image,),
                        radius: 28.r,
                      ),
                      SizedBox(height: 7.h,),
                      Text(Intr().chongzhizhanghu_(["2946781"]),style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.w,vertical: 7.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Intr().dangqianmoren([Intr().wallet_cny]),style: TextStyle(fontSize: 14.sp,color: ColorX.text5862()),),
                      Text("${Intr().yue_}¥666",style: TextStyle(fontSize: 14.sp,color: ColorX.text5862()),),
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
                      Text(Intr().wallet_usdt,style: TextStyle(fontSize: 14.sp,color: ColorX.text5862()),),
                      Text("${Intr().yue_}\$666",style: TextStyle(fontSize: 14.sp,color: ColorX.text5862()),),
                    ],
                  ),
                ),
                buildCategoryItem("USDT币",ImageX.icon_dollar_grey,6),
                SizedBox(height: 30.h,),
              ],
            ),
          ],
        )
      ),
    );
  }

  Widget buildCategoryItem(String title, String icon, int i) {
    return InkWell(
      onTap: ()=> Get.toNamed(Routes.recharge_category,arguments: i % 2 == 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ColorX.cardBg(),
        ),
        margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h),
        padding: EdgeInsets.all(15.r),
        child: Row(
          children: [
            Image.asset(icon,width: 18.r,),
            SizedBox(width: 5.w,),
            Text(title,style: TextStyle(fontSize: 14.sp,color: ColorX.text5862()),),
            Expanded(child: Container()),
            Image.asset(ImageX.icon_right_grey,color: ColorX.text586(),),
          ],
        ),
      ),
    );
  }



}