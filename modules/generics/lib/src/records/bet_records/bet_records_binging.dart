import 'package:generics/src/records/bet_records/bet_records_controller.dart';
import 'package:get/get.dart';

class BetRecordsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BetRecordsController());
  }
}
