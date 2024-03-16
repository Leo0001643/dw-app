import 'package:get/get.dart';

import 'loss_percent_logic.dart';

class LossPercentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LossPercentLogic());
  }
}
