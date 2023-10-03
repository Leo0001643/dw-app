import 'package:aone_common/controllers/welfare_center/welfare_center_logic.dart';
import 'package:get/instance_manager.dart';

import '../controllers/preferential_controller.dart';


class PreferentialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreferentialController());
  }
}
