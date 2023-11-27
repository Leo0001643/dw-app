import 'package:get/get.dart';

import 'add_usdt_logic.dart';

class AddUsdtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddUsdtLogic());
  }
}
