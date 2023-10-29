import 'package:get/get.dart';

import 'lottery_result_logic.dart';

class LotteryResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LotteryResultLogic());
  }
}
