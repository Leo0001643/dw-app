import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fortune_wheel/src/logic/controller.dart';
import 'package:fortune_wheel/src/logic/provider.dart';
import 'package:get/get.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class FortuneWheelService extends GetxService {
  static FortuneWheelService get to => Get.find();
  ActivityProvider activityProvider = ActivityProvider();
  final FortuneWheelProvider provider = FortuneWheelProvider();

  ActivityInfo? actInfo;

  final VoidCallback toFortuneWheelPage;
  final VoidCallback openCS;

  FortuneWheelService({
    required this.toFortuneWheelPage,
    required this.openCS,
  }) {
    EventBus.on(EventType.onLogout, (arg) {
      actInfo = null;
    });
  }

  Future<bool> onBeforeEntry() async {
    SmartDialog.showLoading();
    try {
      bool hasOpen = Get.isRegistered<FortuneWheelLogic>();
      if (hasOpen) {
        return false;
      }

      if (!UserService.to.state.isRegularUser) {
        EventBus.emit(EventType.onAuthRequire);
        return false;
      }
      var res = await activityProvider.getActivities(
        UserInListDto(
          isOptimize: 1,
          currentPage: 1,
          currentPageTotal: 1,
          activityType: 13,
        ),
      );
      if (res.items!.isNotEmpty) {
        actInfo = res.items!.first;
        var response = await provider.wheelInfo(res.items!.first.id!);
        if (response.rewards != null) {
          toFortuneWheelPage();
          return true;
        }
        SmartDialog.showToast(response.message!.replaceAll("</br>", "\n"));
        return false;
      }
      EventBus.emit(EventType.onActivityInvalid);
      return false;
    } catch (err) {
      rethrow;
    } finally {
      SmartDialog.dismiss(status: SmartStatus.loading);
    }
  }
}
