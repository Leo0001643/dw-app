import 'package:generics/src/youhui_center/gen_youhui_center.dart';
import 'package:get/instance_manager.dart';

class GenYouhuiCenterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GenYouhuiCenterController());
  }
}
