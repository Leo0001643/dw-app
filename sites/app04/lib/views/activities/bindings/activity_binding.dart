
import 'package:app04/views/activities/controllers/activity_controller.dart';
import 'package:fortune_wheel/fortune_wheel.dart';
import 'package:get/get.dart';

class ActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityController());
  }
}
