import 'package:get/get.dart';

import 'history_trend_logic.dart';

class HistoryTrendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryTrendLogic());
  }
}
