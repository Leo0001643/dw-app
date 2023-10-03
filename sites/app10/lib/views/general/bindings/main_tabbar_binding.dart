import 'package:app10/tab/controllers/main_tabbar_controller.dart';
import 'package:app10/views/user/user_center/controller/user_controller.dart';
import 'package:get/get.dart';
import '../controllers/home_page_controller.dart';

class MainTabbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainTabbarController>(
      () => MainTabbarController(),
    );
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => UserController());
  }
}
