import 'package:get/get.dart';

import 'tool_check_logic.dart';

class ToolCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ToolCheckLogic());
  }
}
