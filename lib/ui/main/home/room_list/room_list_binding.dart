import 'package:get/get.dart';

import 'room_list_logic.dart';

class RoomListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomListLogic());
  }
}
