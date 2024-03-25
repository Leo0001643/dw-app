import 'package:get/get.dart';

import 'betting_detail_other_logic.dart';

class BettingDetailOtherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BettingDetailOtherLogic());
  }
}
