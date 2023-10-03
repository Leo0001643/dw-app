import 'package:get/get.dart';

import '../controllers/customer_service_controller.dart';

class WebServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WebServiceController());
  }
}
