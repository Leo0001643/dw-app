import 'package:get/get.dart';

import 'lottery_trend_logic.dart';

class LotteryTrendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LotteryTrendLogic());
  }
}
