import 'dart:io';
import 'package:aone_common/common.dart';
import 'package:app10/widget/misc/dj_image.dart';
import 'package:app10/widget/tool/light_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UpgradeController extends BaseController
    with GetTickerProviderStateMixin {
  final _upgradeController = UserService.to;

  static UpgradeController get to => Get.find();
  final RxString _appVersion = '1.0.0'.obs;
  String get appVersion => _appVersion.value;

  set appVersion(value) => _appVersion.value = value;

  late final String platformName;
  SiteConfigProvider versionProvider = SiteConfigProvider();
  final RxBool _haveNewVersion = false.obs;

  bool get haveNewVersion => _haveNewVersion.value;

  set haveNewVersion(bool val) => _haveNewVersion.value = val;
  String downloadLink = '';
  String newVersion = '';

  @override
  Future<void> onInit() async {
    super.onInit();
    platformName = Platform.isAndroid ? 'android' : 'ios';

    _getVersion();
  }

  _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    print('$appName == $packageName == $version == $buildNumber');
    appVersion = version;
  }

  Future<void> checkUpDate() async {
    try {
      CheckUpdateDto dto = CheckUpdateDto(
        currentVersion: appVersion,
        devices: platformName,
      );
      var res = await versionProvider.checkUpdate(dto);
      if (res.items != null) {
        haveNewVersion = true;
        downloadLink = res.items!;
        newVersion = 'V${res.version!}';
        printInfo(info: "jett--->检查更新2 $newVersion");
        Get.dialog(Center(
          child: Container(
            width: 245.w,
            height: 263.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:const  BorderRadius.all(Radius.circular(7.0)),
              border: Border.all(width: 1, color: Colors.white),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 25.w,
                ),
                DjImage.asset(
                  'assets/images/user/upgrade_header.png',
                  width: 112.w,
                  height: 104.w,
                ),
                SizedBox(
                  height: 10.w,
                ),
                LightText.buildColorFont(
                    "版本更新", stringToColor("333333"), 17.sp),
                SizedBox(
                  height: 20.w,
                ),
                LightText.buildColorFont(
                    "第一时间享受最新功能", stringToColor("999999"), 12.sp),
                SizedBox(
                  height: 10.w,
                ),
                Container(
                  color: stringToColor("F4F4F4"),
                  width: 250.w,
                  height: 1.w,
                ),
                SizedBox(
                  height: 6.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 30.w),
                        child: LightText.buildColorFont(
                            "稍后再说", stringToColor("666666"), 12.sp),
                      ),
                    ),
                    Container(
                      color: stringToColor("F4F4F4"),
                      width: 1.w,
                      height: 35.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        try {
                          launchUrlString(downloadLink,
                              mode: LaunchMode.externalApplication);
                        } catch (err) {
                          debugPrint(err.toString());
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 30.w),
                        child: LightText.buildColorFont(
                            "立即更新", stringToColor("168EF5"), 12.sp),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
      } else {
        SmartDialog.showToast('当前版本已为最新版');
      }
    } catch (err) {
      printInfo(info: "jett--->异常  $err");
    }
  }
}
