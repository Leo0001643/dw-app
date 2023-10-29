import 'package:get/get.dart';

import 'number_trend_logic.dart';

class NumberTrendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NumberTrendLogic());
  }
}
