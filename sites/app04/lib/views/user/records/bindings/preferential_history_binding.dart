import 'package:app04/views/user/records/controllers/preferential_history_controller.dart';
import 'package:get/get.dart';

class PreferentialHistoryBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PreferentialHistoryController());
  }
}
