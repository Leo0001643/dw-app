import 'package:get/get.dart';

import 'points_record_logic.dart';

class PointsRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PointsRecordLogic());
  }
}
