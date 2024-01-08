import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';

import 'FloatExpendButton.dart';
import 'float_menu_button.dart';
import 'game_html_logic.dart';

class GameHtmlPage2 extends StatefulWidget {
  @override
  State<GameHtmlPage2> createState() => _GameHtmlPageState();
}

class _GameHtmlPageState extends State<GameHtmlPage2> {
  final logic = Get.find<GameHtmlLogic>();
  final state = Get.find<GameHtmlLogic>().state;

  @override
  void dispose() {
    Get.delete<GameHtmlLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(() => Visibility(
              visible: state.progressVisible.value,
              child: LinearProgressIndicator(
                value: state.progress.value/100,//取值为0-1
                minHeight: 3,
                valueColor: const AlwaysStoppedAnimation(Colors.amberAccent),
                backgroundColor: Colors.white,
              ),
            ),
            ),
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    onWebViewCreated: (controller)=> logic.loadPage(controller),
                    initialOptions: InAppWebViewGroupOptions(
                      android: AndroidInAppWebViewOptions(
                        loadWithOverviewMode: false,
                        overScrollMode: AndroidOverScrollMode.OVER_SCROLL_NEVER,
                        displayZoomControls: false,
                        builtInZoomControls: false,
                        useWideViewPort: false,
                      ),
                      ios: IOSInAppWebViewOptions(
                        disallowOverScroll: true,
                        enableViewportScale: true,
                        ignoresViewportScaleLimits: true,
                      ),
                    ),
                    onProgressChanged: (controller,pg){
                      state.progress.value = pg.toDouble();
                      state.progressVisible.value = pg != 100;
                    },
                  ),
                  FloatExpendButton(
                    //菜单图标组
                    [
                      Icon(
                        Icons.add,
                        size: 10,
                      ),
                      Icon(Icons.share, size: 15)
                    ],
                    //点击事件回调
                    callback: (int index) {
                      print("点击");
                      print(index);
                    },
                    tabcolor: Colors.yellow,
                    MainTabBeginColor: Colors.black,
                    MainTabAfterColor: Colors.blue,
                    fabHeight: 30,
                    tabspace: 5,
                    type: ButtonType.Top,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



}