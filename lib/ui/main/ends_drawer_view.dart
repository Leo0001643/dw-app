

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

class EndsDrawerView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => StateEndsDrawerView();

}


class StateEndsDrawerView extends State<EndsDrawerView>{

  Widget noLoginHeader() {
    return Column(
      children: [
        SizedBox(height: 50.h,),
        Text("欢迎来到xxx",style: TextStyle(fontSize: 20.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
        Text("全球最领先的xxxx",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
        SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WidgetUtils().buildElevatedButton("注册", 131.w, 45.h,
                bg: ColorX.color_f7f8fb,textColor: ColorX.color_091722,onPressed: (){
                  Navigator.of(context).pop();
                }),

            WidgetUtils().buildElevatedButton("登录", 131.w, 45.h,bg: ColorX.color_fc243b,onPressed: (){

            }),
          ],
        ),
        SizedBox(height: 20.h,),
      ],
    );
  }

  Widget userHeader() {
    return Column(
      children: [
        SizedBox(height: 50.h,),
        Row(
          children: [
            SizedBox(width: 17.w,),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white,width: 2.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22.r),
                child: Image.network(test_image,width: 42.r,height: 42.r,fit: BoxFit.cover,),
              ),
            ),
            SizedBox(width: 8.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hala",style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722),),
                Image.asset(ImageX.icon_vip),
              ],
            ),
            Expanded(child: Container()),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Text("个人中心",style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
                  Image.asset(ImageX.ic_into_right),
                ],
              ),
            ),
            SizedBox(width: 20.w,),
          ],
        ),
        SizedBox(height: 20.h,),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(ImageX.icon_rmb_grey),
                  Text("人民币钱包",style: TextStyle(fontSize: 11.sp,color: ColorX.color_091722),),
                  SizedBox(width: 5.w,),
                  Expanded(child: Container()),
                  Text("USDT: ",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
                  Text("\$6,666",style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d,fontWeight: FontWeight.w600),),
                  SizedBox(width: 5.w,),
                  Image.asset(ImageX.icon_right_left,width: 10.w,),
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Text("余额：",style: TextStyle(fontSize: 11.sp,color: ColorX.color_091722),),
                  Text("¥8,888",style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorX.color_091722,
                      fontWeight: FontWeight.w600,
                  ),),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h,),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(ImageX.icon_edzh),
                  SizedBox(height: 5.h,),
                  Text("额度转换",style: TextStyle(fontSize: 11.sp,color: ColorX.color_091722),),
                ],
              ),
              Column(
                children: [
                  Image.asset(ImageX.icon_pc),
                  SizedBox(height: 5.h,),
                  Text("PC详情",style: TextStyle(fontSize: 11.sp,color: ColorX.color_091722),),
                ],
              ),
              Column(
                children: [
                  Image.asset(ImageX.icon_tzjl),
                  SizedBox(height: 5.h,),
                  Text("投注记录",style: TextStyle(fontSize: 11.sp,color: ColorX.color_091722),),
                ],
              ),
              Column(
                children: [
                  Image.asset(ImageX.icon_jymm),
                  SizedBox(height: 5.h,),
                  Text("简易密码",style: TextStyle(fontSize: 11.sp,color: ColorX.color_091722),),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h,),
      ],
    );
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      width: 316.w,
      height: 1.sh,
      color: ColorX.color_dce0e7,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // noLoginHeader(),
            userHeader(),
            InkWell(
              onTap: ()=> Get.toNamed(Routes.select_language),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Image.asset(ImageX.icon_language),
                    SizedBox(width: 5.w,),
                    Text("多语言",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                    Expanded(child: Container()),
                    Text("中文",style: TextStyle(fontSize: 14.sp,color: ColorX.color_949eb9),),
                    Image.asset(ImageX.ic_into_right),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset(ImageX.icon_bgyy),
                        SizedBox(width: 5.w,),
                        Text("背景音乐",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                        Expanded(child: Container()),
                        GFToggle(
                          onChanged: (value){},
                          value: musicToggle.value,
                          type: GFToggleType.ios,
                          disabledTrackColor: ColorX.color_949eb9,
                          enabledTrackColor: ColorX.color_69c25c,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Divider(color: ColorX.color_f7f8fb,height: 1.h,),
                  SizedBox(height: 15.h,),
                  Container(
                    child: Row(
                      children: [
                        Image.asset(ImageX.icon_tsy),
                        SizedBox(width: 5.w,),
                        Text("提示音",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                        Expanded(child: Container()),
                        GFToggle(
                          onChanged: (value){},
                          value: notifyToggle.value,
                          type: GFToggleType.ios,
                          disabledTrackColor: ColorX.color_949eb9,
                          enabledTrackColor: ColorX.color_69c25c,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    child: Row(
                      children: [
                        Image.asset(ImageX.icon_wg),
                        SizedBox(width: 5.w,),
                        Text("外观/颜色",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                        Expanded(child: Container()),
                        Text("浅色",style: TextStyle(fontSize: 14.sp,color: ColorX.color_949eb9),),
                        Image.asset(ImageX.ic_into_right),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Divider(color: ColorX.color_f7f8fb,height: 1.h,),
                  SizedBox(height: 15.h,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    child: Row(
                      children: [
                        Image.asset(ImageX.icon_dx),
                        SizedBox(width: 5.w,),
                        Text("动效",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                        Expanded(child: Container()),
                        Text("全开",style: TextStyle(fontSize: 14.sp,color: ColorX.color_949eb9),),
                        Image.asset(ImageX.ic_into_right),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    child: Row(
                      children: [
                        Image.asset(ImageX.icon_share),
                        SizedBox(width: 5.w,),
                        Text("分享给好友",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                        Expanded(child: Container()),
                        Text("一次分享,无限佣金",style: TextStyle(fontSize: 14.sp,color: ColorX.color_949eb9),),
                        Image.asset(ImageX.ic_into_right),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Divider(color: ColorX.color_f7f8fb,height: 1.h,),
                  SizedBox(height: 15.h,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    child: Row(
                      children: [
                        Image.asset(ImageX.icon_download),
                        SizedBox(width: 5.w,),
                        Text("下载APP",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                        Expanded(child: Container()),
                        Text("立享888金币红包",style: TextStyle(fontSize: 14.sp,color: ColorX.color_949eb9),),
                        Image.asset(ImageX.ic_into_right),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Image.asset(ImageX.icon_exist),
                  SizedBox(width: 5.w,),
                  Text("退出",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                  Expanded(child: Container()),
                  Image.asset(ImageX.ic_into_right),
                ],
              ),
            ),
            SizedBox(height: 30.h,),
          ],
        ),
      ),
    );
  }

  var musicToggle = false.obs;
  var notifyToggle = false.obs;
  var test_image = "http://ddm.dingdangmao6.cn/renren-fast/upload/2022112812_20221128211908.jpg";



}



