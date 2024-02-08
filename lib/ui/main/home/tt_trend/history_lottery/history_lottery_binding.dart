import 'package:get/get.dart';

import 'history_lottery_logic.dart';

class HistoryLotteryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryLotteryLogic());
  }
}
