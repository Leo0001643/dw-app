import 'package:get/get.dart';

import 'ds_dew_logic.dart';

class DsDewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DsDewLogic());
  }
}
