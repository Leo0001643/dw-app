import 'package:generics/src/task_center/gen_task_center_controller.dart';
import 'package:get/instance_manager.dart';

class GenTaskCenterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GenTaskCenterController());
  }
}
