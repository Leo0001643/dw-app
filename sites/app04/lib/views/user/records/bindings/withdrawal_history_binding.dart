import 'package:app04/views/user/records/controllers/withdrawal_history_controller.dart';
import 'package:get/get.dart';

class WithdrawalHistoryBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => WithdrawalHistoryController());
  }
}
