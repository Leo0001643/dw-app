import 'package:get/get.dart';

import '../controllers/person_record_controller.dart';


class PersonHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonRecordController());
  }
}
