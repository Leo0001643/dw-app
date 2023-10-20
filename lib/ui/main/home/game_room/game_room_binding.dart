import 'package:get/get.dart';

import 'game_room_logic.dart';

class GameRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameRoomLogic());
  }
}
