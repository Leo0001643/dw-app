import 'package:get/get.dart';

import 'number_source_logic.dart';

class NumberSourceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NumberSourceLogic());
  }
}
