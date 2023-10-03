
import 'package:aone_common/common.dart';
import 'package:aone_common/core/app_env.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/generated/assets.dart';
import 'package:generics/src/cashier/utils/dj_image.dart';
import 'package:get/get.dart';

class AppUndateDialog extends StatelessWidget {
  final CheckUpdateEntity updateEntity; 
  const AppUndateDialog({Key? key, required this.updateEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
             
              Container(
              width: 292.w,
              height: 345.w,
              padding: EdgeInsets.only(top: 50.r,left: 24.r, bottom: 25.r, right: 24.r),
              decoration: BoxDecoration(

                image:DecorationImage(
                   image: AssetImage('assets/images/app_update/app_update_${AppEnv.config.siteTag}bg.png',package: 'generics',)
                  ,
                  fit: BoxFit.fill
                ),
              ),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(left: 5.r),
                    child:   AoneLightText.buildColorFontBold(
                      "发现新版本", stringToColor("333333"), 24.sp),
                  ),
                
                  AoneLightText.buildColorFontBold(
                      'V${updateEntity.version!}', stringToColor("333333"), 15.sp),
                  SizedBox(
                    height: 60.w,
                  ),
                  AoneLightText.buildColorFont(
                      "1、全新版面升级，App优化体验", stringToColor("464646"), 14.sp),
                  AoneLightText.buildColorFont(
                      "2、修复已知bug。", stringToColor("464646"), 14.sp),
                  SizedBox(
                    height: 75.r,
                  ),
                  
                 
                 
                  GestureDetector(
                        onTap: () {
                          AppBaseService.to.openUrl(updateEntity.items!);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              
                              width:  234,
                              height: 44,
                              // margin:EdgeInsets.only(left: 150.r, right: 50.r),
                              alignment: Alignment.center,
                              // mainAxisAlignment:MainAxisAlignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(22)),
                                gradient: AoneAppTheme.appTheme.appUpdateBtnGradient!
                              ),
                              // margin: EdgeInsets.only(right: 30.w),
                              child: AoneLightText.buildColorFont(
                                  "立即更新", stringToColor("ffffff"), 16.sp),
                            ),
                          ],
                        ),
                      )
                ],
              ),
            ),
        Positioned(
          top: 10.r,
          right:0.r,
          child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            'assets/images/app_update/app_update_del.png',
            package: 'generics',
            width: 18.r,
            height: 18.r,
          ),
        ))
      ],)
     
    );
  }
}