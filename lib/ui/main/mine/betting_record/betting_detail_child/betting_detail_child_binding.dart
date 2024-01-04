import 'package:get/get.dart';

import 'betting_detail_child_logic.dart';

class BettingDetailChildBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BettingDetailChildLogic());
  }
}
