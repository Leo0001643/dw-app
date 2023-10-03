import 'package:app10/views/user/records/controllers/back_history_controller.dart';
import 'package:get/get.dart';

class BackHistoryBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BackHistoryController());
  }
}
