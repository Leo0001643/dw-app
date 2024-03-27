import 'package:get/get.dart';

import 'betting_detail2_logic.dart';

class BettingDetail2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BettingDetail2Logic());
  }
}
