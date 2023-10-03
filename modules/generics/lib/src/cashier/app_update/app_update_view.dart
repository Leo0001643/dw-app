
import 'package:aone_common/common.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/src/cashier/app_update/app_undate_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../utils/dj_image.dart';
import '../utils/theme_scaffold.dart';

class AppUpdateView extends  GetView<AppUndateController>{
  const AppUpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    // return Text('');
    return GetBuilder<AppUndateController>
    (builder: (_){
          
     return ThemeScaffold(
      backgroundColor:  AoneAppTheme.appTheme.appUpdateBgColor!,
      // linearGradient: ,
      body: Container(
        width: Get.width,
        child:  
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 35.r,),

            DjImage.asset(
              'assets/images/user/upgrade_appicon_${AppEnv.config.siteTag}.png',
              width: 72.w,
              height: 72.w,
            ),

            SizedBox(height: 15.w,),
            Obx((){
                 
              return AoneLightText.buildColorFont('版本号 V${controller.appVersion}', stringToColor("ffffff"), 16.sp);

            }),

            SizedBox(height: 35.r,),
            GestureDetector(
              onTap: ()async{
                SmartDialog.showLoading();
                await controller.checkUpDate();
                SmartDialog.dismiss(status: SmartStatus.loading);

              },
              child: Container(
                // color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: AoneLightText.buildColorFont("检查更新", stringToColor("ffffff"), 14.sp),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10.w),
                      child: Image.asset('assets/images/user/next_image.png',
                      fit: BoxFit.fill,
                      width: 16.r,
                      height: 16.r,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.r),
              color: AoneAppTheme.appTheme.appUpdateLineColor!,
              width: Get.width-20.w,
              height: 0.8,
            ),
          ],
        ),
      )
    );
    },); 
  }
}