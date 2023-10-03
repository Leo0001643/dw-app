import 'package:aone_common/common.dart';
import 'package:get/get.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'widegts/apply_failed_dialog.dart';

class GenTaskCenterController extends TaskCenterLogic {
  static GenTaskCenterController get to => Get.find();
  EasyRefreshController easyRefreshController = EasyRefreshController();

  bool isLoading = false;
  @override
  Future<void> onInit() {
    // 列表更新后 执行一次更新过滤列表
    ever(state.progressList, (_) => onTabClick('1'));
    return super.onInit();
  }

  @override
  void onApplyFailed(TaskCenterApplyEntities item) {
    Get.dialog(ApplyFailedDialog(item: item));
  }

  Future<void> refresh() async {
    if (isPageLoading == true) {
      //防止多拉
      return;
    }
    // await getTaskList();
    easyRefreshController.finishRefresh(success: true);
  }
}
