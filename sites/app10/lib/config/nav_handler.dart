import 'package:aone_common/common.dart';
import 'package:app10/tab/controllers/main_tabbar_controller.dart';
import 'package:app10/views/activities/views/fortune_wheel_page.dart';
import 'package:fortune_wheel/fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:red_task/red_task.dart';

import '../app_service.dart';

/// 处理导航链接
/// 商户除了会在导航中配置游戏以外还会配置外部链接和活动快捷
class NavHandler extends INavHandler {
  @override
  void handleFortuneWheel() async {
    Get.put(
      FortuneWheelService(
        // 回调为自行实现的widget
        toFortuneWheelPage: () => Get.dialog(const FortuneWheelPage()),
        openCS: () {},
      ),
    );

    FortuneWheelService.to.onBeforeEntry();
  }

  @override
  void handleRedTask() {
    RedTaskService.to.onEntryRedTask();
  }

  @override
  void handleLink(String href) {
    ///改成外链
    AppService.to.openUrl(href);
  }

  @override
  void handleActivity() {
    MainTabbarController.to.jumpToPage(1);
  }

  @override
  void handlePromoCenter() {
    authGuard(() => Get.toNamed(Routes.welfareCenter));
  }
}
