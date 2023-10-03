import 'dart:convert';

import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class ActivityController extends ActivityLogic {
  static ActivityController get to => Get.find();
  final TextEditingController dateCtrl = TextEditingController();

  Future<void> showDetail(int id) async {
    ActivityInfo? info = await getActivityDetail(id);
    if (info?.qtAppContent != null && info?.qtAppContent != '') {
      //Get.to(() => const ActivityDetail(), arguments: info);
      Get.toNamed(Routes.activityDetail, arguments: info);
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   ever(pageStateObs, (state) {
  //     if (state == PageState.loading) {
  //       SmartDialog.showLoading();
  //     } else {
  //       SmartDialog.dismiss(status: SmartStatus.loading);
  //     }
  //   });
  // }
}
