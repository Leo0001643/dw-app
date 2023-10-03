import 'package:aone_common/common.dart';
import 'package:app04/env.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_task/red_task.dart';
import '../../../app_service.dart';
import '../../../widget/dialog/notice/notice_dialog_style1.dart';
import '../../../widget/dialog/notice/notice_dialog_style2.dart';
import '../../../widget/dialog/notice/notice_dialog_style3.dart';
import '../../../config/site_config.dart';
import '../../../widget/dialog/notice/notice_dialog_style5.dart';

class SplashController extends BootstrapController {
  static SplashController get to => Get.find();

  @override
  Future<void> initAppServices() async {
    await super.initAppServices();
    Get.put(AppService());

    // await Get.putAsync(
    //   () async => await UserService().init(),
    // );
  }

  @override
  Future<void> initNetWorkLayer() async {
    Env env = Env();
    print('appDomain == ${Env().envConfig.appDomain}');
    await Fetch.init(Env().envConfig.appDomain, 'APP');
  }

  @override
  Future<void> initBusinessServices() async {
    AppService.to.initEventBus();
    await Get.putAsync(
      () async => PopupService(
        style1: (notices) => Get.dialog(NoticeDialogStyle1(notices: notices)),
        style2: (list) => Get.dialog(NoticeDialogStyle2(notices: list)),
        style3: (list) => Get.dialog(NoticeDialogStyle3(notices: list)),
        style5: (notices) => Get.dialog(NoticeDialogStyle5(notices: notices)),
      ).init(),
    );
    await super.initBusinessServices();

    await Get.putAsync(
      () async => await RedTaskService().init(
        orientation: Orientation.portrait,
        redType: showRedType(),
        onOpenCS: AppService.to.toCustomerService,
        toDeposit: () => Get.toNamed(Routes.recharge),
        toRedTaskPage: () => Get.toNamed(Routes.grabRed),
        // Get.dialog(const LandscapeRedTaskPage(), name: 'red'),
      ),
    );
  }

  toCustomerService() async {
    // var url =
    //     'https://vscaue.5qou83yd.com/chatwindow.aspx?siteId=60000906&planId=665344a2-7182-44ed-9562-cb9b6107e727';
   var url = AppRuntimeConfig.envConfig.customUrl ?? 'https://www.baidu.com';
    AppService.to.openUrl(url);
  }

  @override
  void onFailed() {}

  @override
  void onInitialized() {
    Get.offAndToNamed(Routes.main);
  }
}
