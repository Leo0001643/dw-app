
import 'dart:io';
import 'package:aone_common/common.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'app_undate_dialog.dart';

class AppUndateController extends BaseController{

  SiteConfigProvider versionProvider = SiteConfigProvider();
  final RxBool _haveNewVersion = false.obs;

  bool get haveNewVersion => _haveNewVersion.value;

  set haveNewVersion(bool val) => _haveNewVersion.value = val;
  String downloadLink = '';
  String newVersion = '';
  
 final RxString _appVersion = '1.0.0'.obs;
 String get appVersion => _appVersion.value;
 set appVersion(value) => _appVersion.value = value;

@override
  Future<void> onInit() async {
    super.onInit();
    Get.put(AppBaseService());
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
        devices: Platform.isAndroid ? 'android' : 'ios',
      );
      var res = await versionProvider.checkUpdate(dto);
      if (res.items != null) {
        
        haveNewVersion = true;
        downloadLink = res.items!;
        newVersion = 'V${res.version!}';
        Get.dialog( AppUndateDialog(updateEntity: res,));
        
      } else {
        SmartDialog.showToast('当前版本已为最新版');
      }
    } catch (err) {

    }
  }
}
