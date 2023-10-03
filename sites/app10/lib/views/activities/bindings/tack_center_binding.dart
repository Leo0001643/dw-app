import 'package:get/instance_manager.dart';

import '../controllers/tack_center_controller.dart';

class TackCenterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TackCenterController());
  }
}
