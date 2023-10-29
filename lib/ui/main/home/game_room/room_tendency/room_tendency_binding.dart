import 'package:get/get.dart';

import 'room_tendency_logic.dart';

class RoomTendencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomTendencyLogic());
  }
}
