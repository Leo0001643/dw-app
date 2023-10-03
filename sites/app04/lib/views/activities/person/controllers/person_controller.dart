import 'package:aone_common/common.dart';
import 'package:app04/views/activities/views/activity_detail.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class PersonController extends ActivityLogic {
  static PersonController get to => Get.find();

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
