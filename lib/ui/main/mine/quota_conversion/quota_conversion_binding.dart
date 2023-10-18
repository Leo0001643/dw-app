import 'package:get/get.dart';

import 'quota_conversion_logic.dart';

class QuotaConversionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuotaConversionLogic());
  }
}
