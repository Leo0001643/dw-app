import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:app10/views/user/user_center/controller/upgrade_controller.dart';
import 'package:app10/widget/misc/dj_image.dart';
import 'package:app10/widget/tool/light_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class AppUpgradeView extends StatelessWidget {
  const AppUpgradeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeScaffold(
      title: '版本升级',
       
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Image(
          width: 25,
          height: 25,
          image: AssetImage(
            'assets/images/home/person_back.png',
          ),
        ),
      ),
      body: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 35.r,),
              DjImage.asset(
                'assets/images/user/upgrade_appicon.png',
                width: 86.w,
                height: 86.w,
              ),
              SizedBox(
                height: 15.w,
              ),
              LightText.build('版本号 V${UpgradeController.to.appVersion}'),
              SizedBox(
                height: 20.w,
              ),
              // Container(
              //   color: stringToColor("F4F4F4"),
              //   width: Get.width - 20.w,
              //   height: 1.w,
              // ),
              SizedBox(
                height: 10.w,
              ),
              GestureDetector(
                onTap: () async {
                  SmartDialog.showLoading(widget: Text("正在更新"));
                  await UpgradeController.to.checkUpDate();
                  SmartDialog.dismiss(status: SmartStatus.loading);
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: LightText.buildColorFont(
                            "检查更新", Colors.white, 12.sp),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.w),
                        child: Image.asset('assets/images/user/next_image.png'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              // Container(
              //   color: stringToColor("F4F4F4"),
              //   width: Get.width - 20.w,
              //   height: 1.w,
              // ),
            ],
          ),
        ));
  }
}
