import 'package:get/get.dart';

import '../controllers/password_modify_controller.dart';



class ModifyPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PasswordModifyController());
  }
}
