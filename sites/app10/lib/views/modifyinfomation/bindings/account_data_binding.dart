import 'package:app10/views/modifyinfomation/controllers/account_data_controller.dart';
import 'package:get/instance_manager.dart';

class AccountDataBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountDataController());
  }
}
