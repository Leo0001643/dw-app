import 'package:get/get.dart';

import 'bonus_packet_logic.dart';

class BonusPacketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BonusPacketLogic());
  }
}
