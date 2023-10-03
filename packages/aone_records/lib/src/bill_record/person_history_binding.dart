import 'package:get/get.dart';
import 'person_record_controller.dart';

class PersonHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonRecordController());
  }
}
