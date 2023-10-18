import 'package:get/get.dart';

import 'betting_record_logic.dart';

class BettingRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BettingRecordLogic());
  }
}
