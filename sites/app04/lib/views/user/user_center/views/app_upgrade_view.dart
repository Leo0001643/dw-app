import 'package:aone_common/common.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:app04/views/user/user_center/controller/upgrade_controller.dart';
import 'package:app04/views/user/user_center/controller/user_controller.dart';
import 'package:app04/widget/misc/dj_image.dart';
import 'package:app04/widget/tool/light_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../theme/color_schema.dart';

class AppUpgradeView extends StatelessWidget {
  const AppUpgradeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeScaffold(
        appBar: AppBar(
            title: Text(
              "版本升级",
              style: const TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
            ),
            centerTitle: true,
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
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
              ),
            )),
        body: Obx(() {
            return Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DjImage.asset(
                'assets/images/user/upgrade_appicon.png',
                width: 86.w,
                height: 86.w,
              ),
              SizedBox(
                height: 15.w,
              ),
             LightText.buildColorFont(
                    '版本号 V${UpgradeController.to.versionApp}',
                    stringToColor("333333"),
                    17.sp),
              SizedBox(
                height: 20.w,
              ),
              Container(
                color: stringToColor("F4F4F4"),
                width: Get.width - 20.w,
                height: 1.w,
              ),
              SizedBox(
                height: 10.w,
              ),
              GestureDetector(
                onTap: () async {
                  SmartDialog.showLoading();
                  await UpgradeController.to.checkUpDate();
                  SmartDialog.dismiss(status: SmartStatus.loading);
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: LightText.buildColorFont(
                            "检查更新", stringToColor("333333"), 12.sp),
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
              Container(
                color: stringToColor("F4F4F4"),
                width: Get.width - 20.w,
                height: 1.w,
              ),
            ],
          ));})
        );
  }
}
