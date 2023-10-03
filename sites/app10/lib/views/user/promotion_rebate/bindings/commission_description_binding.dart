import 'package:get/instance_manager.dart';

import '../controllers/commission_description_controller.dart';

class CommissionDescriptionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommissionDescriptionController());
  }
}
