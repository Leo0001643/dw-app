import 'package:app10/views/modifypassword/controllers/account_datamodify_controller.dart';
import 'package:get/instance_manager.dart';

class AccountDataModifyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountDataModifyController());
  }
}
