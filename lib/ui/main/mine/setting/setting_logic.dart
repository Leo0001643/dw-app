import 'package:flutter_oss_aliyun/flutter_oss_aliyun.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/utils/auth_utils.dart';
import 'package:leisure_games/app/utils/version_utils.dart';

import 'setting_state.dart';

class SettingLogic extends GetxController {
  final SettingState state = SettingState();

  @override
  void onReady() {
    initData();
    checkNewVersion();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkNewVersion() {
    state.curVersion.value = "V${AppData.deviceInfo().version.em()}";
    VersionUtils().checkNewVersion().then((value) {
      state.newVersion.value = value;
    });
  }

  void initData() {
    AuthUtils().authEnable().then((value){
      loggerArray(["设置人脸检测",value]);
      state.localAuth.value = value;
    });
  }




}
