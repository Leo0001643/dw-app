import 'package:get/get.dart';
import 'bet_records_detail_controller.dart';

class BetRecordsDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BetRecordsDetailController());
  }
}
