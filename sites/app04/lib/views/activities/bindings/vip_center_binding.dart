import 'package:get/instance_manager.dart';

import '../controllers/vip_center_controller.dart';

class VipCenterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VipCenterController());
  }
}
