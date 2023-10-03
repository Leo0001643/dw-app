import 'package:app04/views/activities/controllers/activity_center_controller.dart';
import 'package:get/instance_manager.dart';

class ActivityCenterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityCenterController());
  }
}
