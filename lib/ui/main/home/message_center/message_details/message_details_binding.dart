import 'package:get/get.dart';

import 'message_details_logic.dart';

class MessageDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageDetailsLogic());
  }
}
