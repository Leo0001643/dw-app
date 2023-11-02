import 'package:get/get.dart';

import 'points_lottery_logic.dart';

class PointsLotteryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PointsLotteryLogic());
  }
}
