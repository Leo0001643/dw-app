import 'package:get/get.dart';

import 'help_center_logic.dart';

class HelpCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpCenterLogic());
  }
}
