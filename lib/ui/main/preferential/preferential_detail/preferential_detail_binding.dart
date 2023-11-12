import 'package:get/get.dart';

import 'preferential_detail_logic.dart';

class PreferentialDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreferentialDetailLogic());
  }
}
