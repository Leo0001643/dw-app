import 'package:get/get.dart';

import 'bind_usdt_logic.dart';

class BindUsdtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BindUsdtLogic());
  }
}
