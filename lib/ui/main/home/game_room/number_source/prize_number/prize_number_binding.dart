import 'package:get/get.dart';

import 'prize_number_logic.dart';

class PrizeNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrizeNumberLogic());
  }
}
