import 'package:get/get.dart';

import '../controllers/web_controller.dart';

class WebBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WebController());
  }
}
