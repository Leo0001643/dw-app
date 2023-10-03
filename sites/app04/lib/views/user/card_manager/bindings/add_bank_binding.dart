import 'package:app04/views/user/card_manager/controllers/add_bank_controller.dart';
import 'package:get/instance_manager.dart';

class AddBankBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBankController());
  }
}
