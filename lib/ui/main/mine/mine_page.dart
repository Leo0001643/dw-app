import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'mine_logic.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateMinePage();

}

class StateMinePage extends State<MinePage>{
  final logic = Get.find<MineLogic>();
  final state = Get.find<MineLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.color_f7f8fb,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            Row(
              children: [
                SizedBox(width: 17.w,),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white,width: 2.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22.r),
                        child: Image.network(Constants.test_image,width: 42.r,height: 42.r,fit: BoxFit.cover,),
                      ),
                    ),
                    Positioned(
                      bottom: 0,right: 0,
                      child: Image.asset(ImageX.icon_edit_avatar),
                    )
                  ],
                ),
                SizedBox(width: 8.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Hala",style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722),),
                        SizedBox(width: 5.w,),
                        Image.asset(ImageX.icon_vip),
                      ],
                    ),
                    Text("昵称:晴子",style: TextStyle(fontSize: 10.sp,color: ColorX.color_58698d),),
                  ],
                ),
                Expanded(child: Container()),
                Column(
                  children: [
                    Row(
                      children: [
                        Text("¥88.88\n奖金",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),textAlign: TextAlign.center,),
                        SizedBox(width: 10.w,),
                        Text("1000\n积分",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 20.w,),
              ],
            ),
            SizedBox(height: 16.h,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Get.toNamed(Routes.select_currency);
                    },
                    child: Row(
                      children: [
                        Image.asset(ImageX.icon_rmb_grey),
                        Text(Intr().rmbqb,style: TextStyle(fontSize: 11.sp,color: ColorX.color_091722),),
                        SizedBox(width: 5.w,),
                        Expanded(child: Container()),
                        Text("USDT: ",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                        Text("\$6,666",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d,fontWeight: FontWeight.w600),),
                        SizedBox(width: 5.w,),
                        Image.asset(ImageX.icon_right_left,width: 10.w,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Text("余额：",style: TextStyle(fontSize: 15.sp,color: ColorX.color_091722,fontWeight: FontWeight.w500),),
                      Text("¥8,888",style: TextStyle(fontSize: 18.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600,),),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WidgetUtils().buildElevatedButton("提现", 131.w, 45.h,
                          bg: ColorX.color_f7f8fb,textColor: ColorX.color_091722,onPressed: (){

                          }),

                      WidgetUtils().buildElevatedButton("充值", 131.w, 45.h,bg: ColorX.color_fc243b,onPressed: (){

                      }),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.r,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("我的钱包",style: TextStyle(fontSize: 15.sp,color: ColorX.color_091722),),
                  SizedBox(height: 10.h,),
                  Wrap(
                    runSpacing: 15.h,
                    children: [
                      buildCategoryItem("币币交换",ImageX.icon_bb,0),
                      buildCategoryItem("额度转换",ImageX.icon_edzh,1),
                      buildCategoryItem("资金明细",ImageX.icon_zjmx,2),
                      buildCategoryItem("提现密码",ImageX.icon_jymm,3),
                      buildCategoryItem("绑定银行卡",ImageX.icon_bdyhk,4),
                      buildCategoryItem("绑定USDT",ImageX.icon_bddt,5),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.r,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("我的投注",style: TextStyle(fontSize: 15.sp,color: ColorX.color_091722),),
                  SizedBox(height: 10.h,),
                  Wrap(
                    runSpacing: 15.h,
                    children: [
                      buildCategoryItem("投注记录",ImageX.icon_tzjl,6),
                      buildCategoryItem("积分记录",ImageX.icon_jfjl,7),
                      buildCategoryItem("会员反水",ImageX.icon_fan,8),
                      buildCategoryItem("红包和奖金",ImageX.icon_hbjj,9),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.r,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("我的盈利",style: TextStyle(fontSize: 15.sp,color: ColorX.color_091722),),
                  SizedBox(height: 10.h,),
                  Wrap(
                    runSpacing: 15.h,
                    children: [
                      buildCategoryItem("推广赚钱",ImageX.icon_tuiguang,10),
                      buildCategoryItem("代理注册",ImageX.icon_dai,11),
                      Container(width: 80.w,),
                      Container(width: 80.w,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.r,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("其他",style: TextStyle(fontSize: 15.sp,color: ColorX.color_091722),),
                  SizedBox(height: 10.h,),
                  Wrap(
                    runSpacing: 15.h,
                    children: [
                      buildCategoryItem("通用设置",ImageX.icon_setting,10),
                      buildCategoryItem("帮助中心",ImageX.icon_bzzx,11),
                      buildCategoryItem("关于我们",ImageX.icon_gywm,11),
                      Container(width: 80.w,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.r,),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryItem(String title, String icon,int index) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: 80.w,
        child: Column(
          children: [
            Image.asset(icon),
            Text(title,style: TextStyle(fontSize: 11.sp,color: ColorX.color_58698d),),
          ],
        ),
      ),
    );
  }



}




