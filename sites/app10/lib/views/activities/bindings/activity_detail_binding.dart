import 'package:get/get.dart';

import '../controllers/activity_detail_controller.dart';

class ActivityDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityDetailController());
  }
}
