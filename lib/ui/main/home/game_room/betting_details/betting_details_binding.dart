import 'package:get/get.dart';

import 'betting_details_logic.dart';

class BettingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BettingDetailsLogic());
  }
}
