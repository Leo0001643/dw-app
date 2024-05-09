import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/utils/version_utils.dart';

import 'setting_state.dart';

class SettingLogic extends GetxController {
  final SettingState state = SettingState();

  @override
  void onReady() {
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




}
