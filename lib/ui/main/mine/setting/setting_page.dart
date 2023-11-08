import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'setting_logic.dart';

///通用设置
class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final logic = Get.find<SettingLogic>();
  final state = Get.find<SettingLogic>().state;


  @override
  void dispose() {
    Get.delete<SettingLogic>();
    super.dispose();
  }

  String theme(){
    return AppData.theme() ? Intr().qzb:Intr().kxh;
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().shezhi,msg: true),
      backgroundColor: ColorX.pageBg2(),
      body: Container(
        child: SingleChildScrollView(
          child:Column(
            children: [
              InkWell(
                onTap: ()=> Get.toNamed(Routes.user_info),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: ColorX.cardBg()
                  ),
                  margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
                  padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Intr().gerenziliao,style: TextStyle(fontSize: 12.sp,color: ColorX.text0d1()),),
                      Image.asset(ImageX.icon_right_grey,color: ColorX.icon586(),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.r), color: ColorX.cardBg()
                ),
                margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: ()=> Get.toNamed(Routes.set_login_pwd),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Intr().shezhidenglumima,style: TextStyle(fontSize: 12.sp,color: ColorX.text0d1()),),
                            Image.asset(ImageX.icon_right_grey,color: ColorX.icon586(),)
                          ],
                        ),
                      ),
                    ),
                    Divider(color: ColorX.color_10_949,height: 1.h,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(Intr().shezhijianyimima,style: TextStyle(fontSize: 12.sp,color: ColorX.text0d1()),),
                              SizedBox(width: 3.w,),
                              Image.asset(ImageX.icon_wenhao,color: ColorX.text586(),)
                            ],
                          ),
                          GFToggle(
                            onChanged: (value){
                              Get.toNamed(Routes.set_simple_pwd);
                            },
                            value: state.jymmToggle.value,
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
              InkWell(
                onTap: ()=> Get.toNamed(Routes.select_language),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: ColorX.cardBg()
                  ),
                  margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
                  padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 12.w),
                  child: Row(
                    children: [
                      Text(Intr().dyy,style: TextStyle(fontSize: 12.sp,color: ColorX.text0d1()),),
                      Expanded(child: Container()),
                      Text(language(),style: TextStyle(fontSize: 12.sp,color: ColorX.text949()),),
                      Image.asset(ImageX.icon_right_grey,color: ColorX.text586(),)
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorX.cardBg()
                ),
                margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Intr().bjyy,style: TextStyle(fontSize: 12.sp,color: ColorX.text0d1()),),
                          GFToggle(
                            onChanged: (value){},
                            value: state.bjyyToggle.value,
                            type: GFToggleType.ios,
                            disabledTrackColor: ColorX.text949(),
                            enabledTrackColor: ColorX.color_69c25c,
                          ),
                        ],
                      ),
                    ),
                    Divider(color: ColorX.color_10_949,height: 1.h,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Intr().tsy,style: TextStyle(fontSize: 12.sp,color: ColorX.text0d1()),),
                          GFToggle(
                            onChanged: (value){},
                            value: state.tsyToggle.value,
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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorX.cardBg()
                ),
                margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: ()=> Get.toNamed(Routes.select_theme),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Intr().wgys,style: TextStyle(fontSize: 12.sp,color: ColorX.text0d1()),),
                            Expanded(child: Container()),
                            Text(theme(),style: TextStyle(fontSize: 12.sp,color: ColorX.text949()),),
                            Image.asset(ImageX.icon_right_grey,color: ColorX.text586())
                          ],
                        ),
                      ),
                    ),
                    Divider(color: ColorX.color_10_949,height: 1.h,),
                    InkWell(
                      onTap: ()=> Get.toNamed(Routes.select_animation),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Intr().dx,style: TextStyle(fontSize: 12.sp,color: ColorX.text0d1()),),
                            Expanded(child: Container()),
                            Text(Intr().quankai,style: TextStyle(fontSize: 12.sp,color: ColorX.text949()),),
                            Image.asset(ImageX.icon_right_grey,color: ColorX.text586())
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),

              WidgetUtils().buildElevatedButton(Intr().tuichudenglu, 335.w,
                  45.h,textColor:ColorX.color_fc243b,bg:ColorX.cardBg(),onPressed: (){
                DialogUtils().showLogoutDialog(context).then((value) {
                  if(value  == true){
                    Get.back();
                  }
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

}