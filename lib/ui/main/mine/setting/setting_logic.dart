import 'package:get/get.dart';
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
    VersionUtils().checkNewVersion().then((value) {
      state.newVersion.value = value;
    });
  }




}
