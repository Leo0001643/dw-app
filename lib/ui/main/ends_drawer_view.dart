

import 'package:flutter/cupertino.dart';
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

class EndsDrawerView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => StateEndsDrawerView();

}


class StateEndsDrawerView extends State<EndsDrawerView>{

  Widget noLoginHeader() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(ImageX.beforeLogin),fit: BoxFit.fill,),
      ),
      child: Column(
        children: [
          SizedBox(height: 50.h,),
          Text(Intr().hyld,style: TextStyle(fontSize: 20.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
          Text(Intr().qqzlxd,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WidgetUtils().buildElevatedButton(Intr().register, 131.w, 45.h,
                  bg: ColorX.color_f7f8fb,textColor: ColorX.color_091722,onPressed: (){
                    Navigator.of(context).pop();
                    Get.toNamed(Routes.register);
                  }),

              WidgetUtils().buildElevatedButton(Intr().login, 131.w, 45.h,bg: ColorX.color_fc243b,onPressed: (){
                Navigator.of(context).pop();
                Get.toNamed(Routes.login);
              }),
            ],
          ),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  }

  Widget userHeader() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(ImageX.afterLogin),fit: BoxFit.fill,),
      ),
      child: Column(
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
                  child: Image.network(Constants.test_image,width: 42.r,height: 42.r,fit: BoxFit.cover,),
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
                    Text(Intr().grzx,style: TextStyle(fontSize: 14.sp,color: ColorX.color_58698d),),
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
              color: Colors.white60,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
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
                    Text(Intr().yue,style: TextStyle(fontSize: 11.sp,color: ColorX.color_091722),),
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
                    Text(Intr().edzh,style: TextStyle(fontSize: 11.sp,color: ColorX.color_091722),),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(ImageX.icon_pc),
                    SizedBox(height: 5.h,),
                    Text(Intr().pcxq,style: TextStyle(fontSize: 11.sp,color: ColorX.color_091722),),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(ImageX.icon_tzjl),
                    SizedBox(height: 5.h,),
                    Text(Intr().tzjl,style: TextStyle(fontSize: 11.sp,color: ColorX.color_091722),),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(ImageX.icon_jymm),
                    SizedBox(height: 5.h,),
                    Text(Intr().jymm,style: TextStyle(fontSize: 11.sp,color: ColorX.color_091722),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h,),
        ],
      ),
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
              onTap: (){
                Navigator.of(context).pop();
                Get.toNamed(Routes.select_language);
              },
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
                    Text(Intr().dyy,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
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
                        Text(Intr().bjyy,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
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
                  Divider(color: ColorX.color_10_949,height: 1.h,),
                  SizedBox(height: 15.h,),
                  Container(
                    child: Row(
                      children: [
                        Image.asset(ImageX.icon_tsy),
                        SizedBox(width: 5.w,),
                        Text(Intr().tsy,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
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
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          Image.asset(ImageX.icon_wg),
                          SizedBox(width: 5.w,),
                          Text(Intr().wgys,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                          Expanded(child: Container()),
                          Text(Intr().qs,style: TextStyle(fontSize: 14.sp,color: ColorX.color_949eb9),),
                          Image.asset(ImageX.ic_into_right),
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.of(context).pop();
                      Get.toNamed(Routes.select_theme);
                    },
                  ),
                  SizedBox(height: 15.h,),
                  Divider(color: ColorX.color_10_949,height: 1.h,),
                  SizedBox(height: 15.h,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                      Get.toNamed(Routes.select_animation);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          Image.asset(ImageX.icon_dx),
                          SizedBox(width: 5.w,),
                          Text(Intr().dx,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                          Expanded(child: Container()),
                          Text(Intr().qk,style: TextStyle(fontSize: 14.sp,color: ColorX.color_949eb9),),
                          Image.asset(ImageX.ic_into_right),
                        ],
                      ),
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
                        Text(Intr().fxghy,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                        Expanded(child: Container()),
                        Text(Intr().ycfx,style: TextStyle(fontSize: 14.sp,color: ColorX.color_949eb9),),
                        Image.asset(ImageX.ic_into_right),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Divider(color: ColorX.color_10_949,height: 1.h,),
                  SizedBox(height: 15.h,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    child: Row(
                      children: [
                        Image.asset(ImageX.icon_download),
                        SizedBox(width: 5.w,),
                        Text(Intr().xzapp,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                        Expanded(child: Container()),
                        Text(Intr().lxjbhb,style: TextStyle(fontSize: 14.sp,color: ColorX.color_949eb9),),
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
                  Text(Intr().logout,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
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


}



