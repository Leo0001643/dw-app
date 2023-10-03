import 'package:get/instance_manager.dart';

import 'message_center_logic.dart';

class MessageCenterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageCenterLogic());
  }
}
