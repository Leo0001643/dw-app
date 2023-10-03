import 'package:aone_common/common.dart';
import 'package:app10/tab/controllers/main_tabbar_controller.dart';
import 'package:app10/widget/dialog/invalid_activity_popup.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

void registerEvent() {
  EventBus.on(EventType.onTohome, (arg) {
    print('arg == ${arg}');
    print('xxx == ${Get.currentRoute}');
    print(Routes.main);
    if (Get.currentRoute != Routes.main) {
      if (arg > 1) {
        Get.close(arg);
        MainTabbarController.to.selectIndex = 0;
        MainTabbarController.to.pageController.jumpTo(0);
      } else {
        Get.back();
      }
    } else {
      Get.back();
    }
  });

  EventBus.on(EventType.onLogout, (arg) {
    if (Get.currentRoute == Routes.splash) return;
    if (Get.currentRoute != Routes.main) {
      ///创建 mainPage,mainPage 替换掉当前的 page
      // Get.offAndToNamed(Routes.main, arguments: 0);
      ///干掉所有page，直到 mainPage 为止
      Get.until((route) => Get.currentRoute == Routes.main);
    } else {
      MainTabbarController.to.jumpToPage(0);
    }
  });
  EventBus.on(EventType.onLogin, (arg) {
    SmartDialog.showToast('登录成功');
  });
  EventBus.on(EventType.onHandleHref, (arg) {
    // todo: register nav handler here
  });

  EventBus.on(EventType.onActivityInvalid, (arg) {
    Get.dialog(const InvalidActivityPopup());
  });

  EventBus.on(EventType.onSiteMaintain, (arg) {
    // todo: to maintain page
  });

  EventBus.on(EventType.onAuthRequire, (arg) {
    Get.toNamed(Routes.login);
    SmartDialog.showToast('请登陆以继续');
  });
}
