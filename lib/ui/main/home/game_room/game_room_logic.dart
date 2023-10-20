import 'package:get/get.dart';
import 'package:leisure_games/app/routes.dart';

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


  void onTabClick(int index){
    switch(index){
      case 0:
        Get.toNamed(Routes.number_source);
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }


}
