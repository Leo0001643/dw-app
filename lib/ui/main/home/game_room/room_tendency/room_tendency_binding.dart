import 'package:get/get.dart';
import 'package:leisure_games/app/controller/room_tendency_controller.dart';

import 'room_tendency_logic.dart';

class RoomTendencyBinding extends Bindings {



  @override
  void dependencies() {
    Get.lazyPut(() => RoomTendencyController());
    Get.lazyPut(() => RoomTendencyLogic());
  }



}
