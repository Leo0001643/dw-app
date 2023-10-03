import 'package:get/get.dart';

import '../controllers/person_controller.dart';


class PersonBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PersonController());
  }
}
