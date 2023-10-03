import 'package:aone_common/common.dart';
import 'package:app10/env.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_task/red_task.dart';

import '../../../app_service.dart';
import '../../../widget/dialog/notice/notice_dialog_style1.dart';
import '../../../widget/dialog/notice/notice_dialog_style2.dart';
import '../../../widget/dialog/notice/notice_dialog_style3.dart';
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

  //启动页部分打开客服链接尽量不要跟其他地方共用
  void toCustomerService() async {
    String customerUrl = SpStorage.getCustomeUrl;
    if (customerUrl.contains('www.baidu.com')) {
      //如果没有就这个地址
      customerUrl =
          'https://e98e3eded6bee.meiqiacloud.com/dist/standalone.html?eid=2ceec0cfe6c9a9d2708e311513cf9fa3';
    }
    AppService.to.openUrl(customerUrl);
  }

  // void toCustomerService() async {
  //   String url =
  //       'https://e98e3eded6bee.meiqiacloud.com/dist/standalone.html?eid=2ceec0cfe6c9a9d2708e311513cf9fa3';
  //   AppService.to.openUrl(url);
  // }

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
        redType: 1,
        onOpenCS: AppService.to.toCustomerService,
        toDeposit: () => Get.toNamed(Routes.recharge),
        toRedTaskPage: () => Get.toNamed(Routes.grabRed),
        // Get.dialog(const LandscapeRedTaskPage(), name: 'red'),
      ),
    );
  }

  @override
  void onFailed() {}

  @override
  void onInitialized() {
    Get.offAndToNamed(Routes.main);
  }
}
