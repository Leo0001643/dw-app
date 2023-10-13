import 'package:get/get.dart';

import 'message_center_logic.dart';

class MessageCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageCenterLogic());
  }
}
