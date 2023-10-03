import 'package:app04/views/activities/controllers/tack_center_controller.dart';
import 'package:get/instance_manager.dart';

class TackCenterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TackCenterController());
  }
}
