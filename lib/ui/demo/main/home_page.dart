import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/global.dart';
import '/app/intl/intr.dart';
import '/app/logger.dart';
import '/app/res/dimens.dart';
import '/app/routes.dart';
import '/ui/bean/event_task_bean.dart';

import '../../main/main_logic.dart';
import '../../main/main_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final logic = Get.find<MainLogic>();
  final MainState state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Intr().home),
      ),
      body: Column(
        children: [
          Wrap(
            spacing: Dimens.d_8,
            runSpacing: Dimens.d_4,
            alignment: WrapAlignment.start,
            children: [
              TextButton(
                child: Text(Intr().language),
                onPressed: () => logic.changeLanguage(),
              ),
              TextButton(
                child: Text(Intr().count),
                onPressed: () => {
                  Get.toNamed(Routes.count,
                      arguments: {"title": Intr().count}),
                },
              ),
              TextButton(
                child: Text(Intr().storage),
                onPressed: () => {
                  Get.toNamed(Routes.storage),
                },
              ),
              TextButton(
                child: Text(Intr().theme),
                onPressed: () => {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
                },
              ),
              TextButton(
                child: Text(Intr().connect),
                onPressed: () => {
                  Get.toNamed(Routes.connect),
                },
              ),
              TextButton(
                  onPressed: () => {
                        if (GetPlatform.isAndroid || GetPlatform.isIOS)
                          {logic.checkPermission(context)}
                      },
                  child: Text(Intr().permission)),
              TextButton(
                  onPressed: () => {
                        if (GetPlatform.isAndroid || GetPlatform.isIOS)
                          {Get.toNamed(Routes.webview)}
                      },
                  child: Text(Intr().webview)),
              TextButton(
                onPressed: () => {
                  // AssetPicker.pickAssets(context)
                  //     .then((value) => {logger('文件选择的结果${value?.length}')})
                },
                child: Text(Intr().pictureSelector),
              ),
              TextButton(
                onPressed: () => {
                  Get.toNamed(Routes.rx_dart),
                },
                child: Text(Intr().rx_dart),
              ),
              TextButton(
                child: Text(Intr().multiple),
                onPressed: () => {
                  behaviorBus
                      .fire(EventTaskBean(0, Intr().userEventBus)),
                  Get.toNamed(Routes.multiplex),
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
