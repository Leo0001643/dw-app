import 'package:get/get.dart';

import '../controllers/activity_controller.dart';

class ActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityController());
  }
}
