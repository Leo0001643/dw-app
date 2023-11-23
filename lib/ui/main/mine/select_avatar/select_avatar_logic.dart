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


  void setAvatar(){
    if(state.selectIndex.value >= 0){
      var user = AppData.user()!;
      var avatar = "";
      switch(state.tabIndex.value){
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

      HttpService.updateUserAvatar({"oid":user.oid,"username":user.username,"avatar":user.avatar}).then((value) {
        state.currentAvatar.value = user.avatar.em();
        AppData.setUser(user);
        ///切换头像
        Get.find<AvatarController>().refresh();
      });

    }
  }



}
