import 'package:get/get.dart';

import 'betting_detail_logic.dart';

class BettingDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BettingDetailLogic());
  }
}
