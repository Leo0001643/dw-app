

import 'package:flutter/cupertino.dart';
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
import 'package:leisure_games/ui/bean/login_refresh_event.dart';

class EndsDrawerView extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => StateEndsDrawerView();

}


class StateEndsDrawerView extends State<EndsDrawerView>{


  var musicToggle = AppData.bgMusic().obs;
  var notifyToggle = AppData.promptTone().obs;



  String language(){
    switch(AppData.localeIndex()){
      case 1:
        return Intr().yingyu;
      case 2:
        return Intr().yuenanyu;
      default:
        return Intr().zhongwenjianti;
    }
  }


  String theme(){
    return AppData.theme() ? Intr().qzb:Intr().kxh;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 316.w,
      height: 1.sh,
      color: ColorX.cardBg7(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppData.isLogin() ? userHeader(): noLoginHeader(),
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
                Get.toNamed(Routes.select_language);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorX.cardBg5(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Image.asset(ImageX.icon_language,color: ColorX.icon586(),),
                    SizedBox(width: 5.w,),
                    Text(Intr().dyy,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                    Expanded(child: Container()),
                    Text(language(),style: TextStyle(fontSize: 14.sp,color: ColorX.text949()),),
                    Image.asset(ImageX.ic_into_right,color: ColorX.icon586(),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h,),
            Container(
              decoration: BoxDecoration(
                color: ColorX.cardBg5(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset(ImageX.icon_bgyy,color: ColorX.icon586(),),
                        SizedBox(width: 5.w,),
                        Text(Intr().bjyy,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                        Expanded(child: Container()),
                        GFToggle(
                          onChanged: (value){
                            AppData.setBgMusic(value == true);
                            musicToggle.value = value == true;
                          },
                          value: musicToggle.value,
                          type: GFToggleType.ios,
                          disabledTrackColor: ColorX.text949(),
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
                        Image.asset(ImageX.icon_tsy,color: ColorX.icon586(),),
                        SizedBox(width: 5.w,),
                        Text(Intr().tsy,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                        Expanded(child: Container()),
                        GFToggle(
                          onChanged: (value){
                            AppData.setPromptTone(value == true);
                            notifyToggle.value = value == true;
                          },
                          value: notifyToggle.value,
                          type: GFToggleType.ios,
                          disabledTrackColor: ColorX.text949(),
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
                color: ColorX.cardBg5(),
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
                          Image.asset(ImageX.icon_wg,color: ColorX.icon586()),
                          SizedBox(width: 5.w,),
                          Text(Intr().wgys,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                          Expanded(child: Container()),
                          Text(theme(),style: TextStyle(fontSize: 14.sp,color: ColorX.text949()),),
                          Image.asset(ImageX.ic_into_right,color: ColorX.icon586()),
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
                          Image.asset(ImageX.icon_dx,color: ColorX.icon586()),
                          SizedBox(width: 5.w,),
                          Text(Intr().dx,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                          Expanded(child: Container()),
                          // Text(Intr().qk,style: TextStyle(fontSize: 14.sp,color: ColorX.text949()),),
                          Image.asset(ImageX.ic_into_right,color: ColorX.icon586()),
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
                color: ColorX.cardBg5(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 13.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  InkWell(
                    onTap: ()=> jumpToPage(Routes.promotion_profit),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          Image.asset(ImageX.icon_share,color: ColorX.icon586()),
                          SizedBox(width: 5.w,),
                          Text(Intr().fxghy,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                          Expanded(child: Container()),
                          Text(Intr().ycfx,style: TextStyle(fontSize: 14.sp,color: ColorX.text949()),),
                          Image.asset(ImageX.ic_into_right,color: ColorX.icon586()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Divider(color: ColorX.color_10_949,height: 1.h,),
                  SizedBox(height: 15.h,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    child: Row(
                      children: [
                        Image.asset(ImageX.icon_download,color: ColorX.icon586()),
                        SizedBox(width: 5.w,),
                        Text(Intr().xzapp,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                        Expanded(child: Container()),
                        Text(Intr().lxjbhb,style: TextStyle(fontSize: 14.sp,color: ColorX.text949()),),
                        Image.asset(ImageX.ic_into_right,color: ColorX.icon586()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h,),
            Visibility(
              visible: AppData.isLogin(),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorX.cardBg5(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: InkWell(
                  child: Row(
                    children: [
                      Image.asset(ImageX.icon_exist,color: ColorX.icon586()),
                      SizedBox(width: 5.w,),
                      Text(Intr().logout,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
                      Expanded(child: Container()),
                      Image.asset(ImageX.ic_into_right,color: ColorX.icon586()),
                    ],
                  ),
                  onTap: ()=> DialogUtils().showLogoutDialog(context).then((value) {
                    if(value  == true){
                      AppData.clear();
                      eventBus.fire(LoginRefreshEvent());
                      Get.back();
                    }
                  }),
                ),
              ),
            ),
            SizedBox(height: 30.h,),

          ],
        ),
      ),
    );
  }


  Widget noLoginHeader() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(ImageX.beforeLoginT()),fit: BoxFit.fill,),
      ),
      child: Column(
        children: [
          SizedBox(height: 50.h,),
          Text(Intr().hyld,style: TextStyle(fontSize: 20.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
          Text(Intr().qqzlxd,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WidgetUtils().buildElevatedButton(Intr().register, 131.w, 45.h,
                  bg: ColorX.cardBg3(),textColor: ColorX.text0917(),onPressed: (){
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
        image: DecorationImage(image: AssetImage(ImageX.afterLoginT()),fit: BoxFit.fill,),
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
                  Text("Hala",style: TextStyle(fontSize: 16.sp,color: ColorX.text0917()),),
                  Image.asset(ImageX.icon_vip),
                ],
              ),
              Expanded(child: Container()),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Text(Intr().grzx,style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
                    Image.asset(ImageX.ic_into_right,color: ColorX.icon586(),),
                  ],
                ),
              ),
              SizedBox(width: 20.w,),
            ],
          ),
          SizedBox(height: 20.h,),
          Container(
            decoration: BoxDecoration(
              color: ColorX.cardBg8(),
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
                      Text(Intr().rmbqb,style: TextStyle(fontSize: 11.sp,color: ColorX.text0917()),),
                      SizedBox(width: 5.w,),
                      Expanded(child: Container()),
                      Text("USDT: ",style: TextStyle(fontSize: 12.sp,color: ColorX.text586()),),
                      Text("\$6,666",style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),fontWeight: FontWeight.w600),),
                      SizedBox(width: 5.w,),
                      Image.asset(ImageX.icon_right_left,width: 10.w,),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Text(Intr().yue_,style: TextStyle(fontSize: 11.sp,color: ColorX.text0917()),),
                    Text("¥8,888",style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorX.text0917(),
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
              color: ColorX.cardBg5(),
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 13.w),
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: ()=> Get.toNamed(Routes.quota_conversion),
                  child: Column(
                    children: [
                      Image.asset(ImageX.icon_edzh),
                      SizedBox(height: 5.h,),
                      Text(Intr().edzh,style: TextStyle(fontSize: 11.sp,color: ColorX.text0917()),),
                    ],
                  ),
                ),
                InkWell(
                  onTap: ()=> Get.toNamed(Routes.betting_details),
                  child: Column(
                    children: [
                      Image.asset(ImageX.icon_pc),
                      SizedBox(height: 5.h,),
                      Text(Intr().pcxq,style: TextStyle(fontSize: 11.sp,color: ColorX.text0917()),),
                    ],
                  ),
                ),
                InkWell(
                  onTap: ()=> Get.toNamed(Routes.betting_record),
                  child: Column(
                    children: [
                      Image.asset(ImageX.icon_tzjl),
                      SizedBox(height: 5.h,),
                      Text(Intr().tzjl,style: TextStyle(fontSize: 11.sp,color: ColorX.text0917()),),
                    ],
                  ),
                ),
                InkWell(
                  onTap: ()=> Get.toNamed(Routes.set_simple_pwd),
                  child: Column(
                    children: [
                      Image.asset(ImageX.icon_jymm),
                      SizedBox(height: 5.h,),
                      Text(Intr().jymm,style: TextStyle(fontSize: 11.sp,color: ColorX.text0917()),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h,),
        ],
      ),
    );
  }

  void jumpToPage(String page) {
    if(AppData.isLogin()){
      Get.toNamed(page);
    }else {
      Get.toNamed(Routes.login);
    }
  }




}



