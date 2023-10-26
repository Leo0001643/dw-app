import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';

import 'game_room_state.dart';

class GameRoomLogic extends GetxController {
  final GameRoomState state = GameRoomState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  void onTabClick(BuildContext context,int index){
    switch(index){
      case 0:
        Get.toNamed(Routes.number_source);
        break;
      case 1:
        Get.toNamed(Routes.betting_details);
        break;
      case 2:
        // DialogUtils().showSqueezeBtmDialog(context,this);
        break;
      case 3:
        Get.toNamed(Routes.room_tendency);
        break;
    }
  }


}
