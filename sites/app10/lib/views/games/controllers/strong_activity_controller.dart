import 'package:aone_common/common.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/strong_pop_game.dart';

class StrongActivityController extends StrongActivityLogic {
  static StrongActivityController get to => Get.find();

  PageController activityPageController = PageController();
  PageController recommendPageController = PageController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final RxInt _activityTabIndex = 0.obs; // 0本站推荐，1强档活动
  int get activeTabIndex => _activityTabIndex.value;
  set activeTabIndex(int value) => _activityTabIndex.value = value;

  final RxInt _recommendSelectIndex = 0.obs; // 本站推荐子分类
  int get recommendSelectIndex => _recommendSelectIndex.value;
  set recommendSelectIndex(int value) => _recommendSelectIndex.value = value;

  @override
  void onClose() {
    clearMemoryImageCache();
    super.onClose();
  }

  @override
  Future<void> triggerWapPopup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int saveTime = (prefs.getInt('isTodayNoDisplayChcked') ?? 0);
    DateTime saveDate = DateTime.fromMillisecondsSinceEpoch(saveTime);
    var now = DateTime.now();
    if (now.year <= saveDate.year &&
        now.month <= saveDate.month &&
        now.day <= saveDate.day) return;

    if (popItems.isNotEmpty) {
      if (Get.currentRoute == Routes.strongActivity) {
        Get.lazyPut(() => StrongActivityController());
        Get.dialog(StrongPopGameDialog(
          items: popItems,
          onClose: () async {
            if (isTodayNoDisplayChecked == false) return;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setInt(
              'isTodayNoDisplayChcked',
              DateTime.now().millisecondsSinceEpoch,
            ); //setter（setInt）方法会同步更新内存中的键值对，然后将数据保存至磁盘，因此无需再调用更新方法强制刷新缓存
          },
        ));
      }
    }
  }
}
