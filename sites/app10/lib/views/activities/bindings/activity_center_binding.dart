import 'package:get/instance_manager.dart';

import '../controllers/activity_center_controller.dart';

class ActivityCenterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityCenterController());
  }
}
