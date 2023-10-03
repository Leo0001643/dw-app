import 'package:app04/tab/controllers/main_tabbar_controller.dart';
import 'package:app04/views/user/user_center/controller/user_controller.dart';
import 'package:get/get.dart';

import '../../user/start_recharge/controller/recharge_controller.dart';
import '../controllers/home_page_controller.dart';


class MainTabbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainTabbarController>(
      () => MainTabbarController(),
    );
    // Get.lazyPut<HomePageController>(
    //       () => HomePageController(),
    // );
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => RechargeController());
  }
}
