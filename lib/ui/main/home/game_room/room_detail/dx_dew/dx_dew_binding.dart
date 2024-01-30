import 'package:get/get.dart';

import 'dx_dew_logic.dart';

class DxDewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DxDewLogic());
  }
}
