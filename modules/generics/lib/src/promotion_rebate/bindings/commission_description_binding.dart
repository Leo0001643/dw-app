import 'package:get/instance_manager.dart';

import '../controllers/commission_description_controller.dart';

class AoneCommissionDescriptionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AoneCommissionDescriptionController());
  }
}
