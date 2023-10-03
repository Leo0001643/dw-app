import 'package:aone_common/common.dart';
import 'package:app10/views/activities/widgets/apply_failed_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class VipCenterController extends TaskCenterLogic {
  static VipCenterController get to => Get.find();
  EasyRefreshController easyRefreshController = new EasyRefreshController();

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
