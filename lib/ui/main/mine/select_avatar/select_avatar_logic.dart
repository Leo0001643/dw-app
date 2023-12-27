import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/controller/avatar_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/data_utils.dart';

import 'select_avatar_state.dart';

class SelectAvatarLogic extends GetxController {
  final SelectAvatarState state = SelectAvatarState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initAvater();
  }

  void setAvatar() {
    if (state.selectIndex.value >= 0) {
      var user = AppData.user()!;
      var avatar = "";
      switch (state.tabIndex.value) {
        case 0:
          avatar = state.defaultList[state.selectIndex.value];
          break;
        case 1:
          avatar = state.qqList[state.selectIndex.value];
          break;
        case 2:
          avatar = state.selectionList[state.selectIndex.value];
          break;
      }
      user.avatar = DataUtils.getAvatarName(avatar);

      HttpService.updateUserAvatar(
          {"oid": user.oid, "username": user.username, "avatar": user.avatar})
          .then((value) {
        state.currentAvatar.value = user.avatar.em();
        AppData.setUser(user);

        ///切换头像
        Get.find<AvatarController>().refresh();
      });
    }
  }

  void initAvater() {
    List<String> list= findAvater();
    String current = DataUtils.findAvatar(state.currentAvatar.value);
    for (int i = 0; i<list.length;i++) {
     if(current==list[i]) {
       state.selectIndex.value =i;
       break;
     }
    }
    update();
  }

  List<String> findAvater() {
    switch (state.tabIndex.value) {
      case 0:
        return state.defaultList;
      case 1:
        return state.qqList;
      case 2:
        return state.selectionList;
    }
    return [];
  }
}
