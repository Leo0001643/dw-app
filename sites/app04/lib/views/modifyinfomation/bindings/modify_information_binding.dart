import 'package:get/get.dart';

import '../../modifypassword/controllers/password_modify_controller.dart';
import '../controllers/modify_information_controller.dart';




class ModifyInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PasswordModifyController());
  }
}
