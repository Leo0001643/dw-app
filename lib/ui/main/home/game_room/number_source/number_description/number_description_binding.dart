import 'package:get/get.dart';

import 'number_description_logic.dart';

class NumberDescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NumberDescriptionLogic());
  }
}
