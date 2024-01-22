import 'package:get/get.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';

import 'game_room_logic.dart';

class GameRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameRoomLogic());
    Get.lazyPut(() => TextItemLogic());
  }
}
