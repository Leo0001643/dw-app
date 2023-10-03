import 'package:aone_common/controllers/activity/activity_logic.dart';
import 'package:aone_common/core/base/base_controller.dart';
import 'package:aone_common/data/model/entities/activity/user_in_list.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../views/activity_detail.dart';

class ActivityDetailController extends ActivityLogic {
  static ActivityDetailController get to => Get.find();

  Future<void> showDetail(int id) async {
    ActivityInfo? info = await getActivityDetail(id);
    if (info?.qtAppContent != null && info?.qtAppContent != '') {
      Get.to(() => const ActivityDetail(), arguments: info);
    }
  }

  @override
  void onInit() {
    super.onInit();
    ever(pageStateObs, (state) {
      if (state == PageState.loading) {
        SmartDialog.showLoading();
      } else {
        SmartDialog.dismiss(status: SmartStatus.loading);
      }
    });
  }
}
