import 'package:generics/src/records/bill_records/bill_records_controller.dart';
import 'package:get/get.dart';

class BillRecordsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillRecordsController());
  }
}
