import 'package:aone_common/common.dart';
import 'package:app04/views/activities/controllers/self_expandable_controller.dart';
import 'package:app04/views/activities/views/activity_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class ActivityController extends ActivityLogic {
  static ActivityController get to => Get.find();
  final RxInt _currentIndex = (-1).obs;
  EasyRefreshController easyRefreshController = new EasyRefreshController();
  bool dataIsLoading = false;

  final TextEditingController dateCtrl = TextEditingController();

  // Future<String> showDetail(int id) async {
  //   // activityContent.value = "";
  //   ActivityInfo? info = await getActivityDetail(id);
  //   return  info?.qtAppContent ?? "";
  //   // if (info?.qtAppContent != null && info?.qtAppContent != '') {
  //   //   Get.to(() => const ActivityDetail(), arguments: info);
  //   // }
  // }

  // void selectItem(int index) {
  //   if (currentIndex == index) {
  //     currentIndex = -1;
  //   } else {
  //     currentIndex = index;
  //   }
  // }

  // @override
  // void onInit() async {
  //   super.onInit();
  //   onTypeChange(0);
  //   ever(pageStateObs, (state) {
  //     if (state == PageState.loading) {
  //       SmartDialog.showLoading();
  //     } else {
  //       SmartDialog.dismiss(status: SmartStatus.loading);
  //     }
  //   });
  // }

  // @override
  // void onTypeChange(int? type) async {
  //   super.onTypeChange(type);
  //   dataIsLoading = true;
  //   state.activityInfoList.clear();
  //   await getActivityList(1);
  //   easyRefreshController.finishRefresh(success: true);
  //   dataIsLoading = false;
  // }
}
