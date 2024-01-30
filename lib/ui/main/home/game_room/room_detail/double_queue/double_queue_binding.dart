import 'package:get/get.dart';

import 'double_queue_logic.dart';

class DoubleQueueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoubleQueueLogic());
  }
}
