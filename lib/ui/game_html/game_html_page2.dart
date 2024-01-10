import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';

import '../../app/global.dart';
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
  bool isLandscape = false;
  List<DeviceOrientation> orientations = [
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];
  List<DeviceOrientation> orientations2 = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ];

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
            Obx(
              () => Visibility(
                visible: state.progressVisible.value,
                child: LinearProgressIndicator(
                  value: state.progress.value / 100, //取值为0-1
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
                    onWebViewCreated: (controller) =>
                        logic.loadPage(controller),
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
                    onProgressChanged: (controller, pg) {
                      state.progress.value = pg.toDouble();
                      state.progressVisible.value = pg != 100;
                    },
                  ),
                  Positioned(
                    bottom: 130,
                    right: 20,
                    child: FloatExpendButton(
                      //菜单图标组
                       [
                         buildSvgImageItem( ImageX.icHtmXZT()),
                         buildSvgImageItem( ImageX.icHtmlBackT())
                      ],
                      //点击事件回调
                      callback: (int index) {
                        if (index == 0) {
                          setState(() {
                            isLandscape = !isLandscape;
                            showToast(isLandscape ? '横屏' : '竖屏');
                          });
                          //旋转屏幕
                          SystemChrome.setPreferredOrientations(
                              isLandscape ? orientations : orientations2);
                        } else if (index == 1) {
                          Get.back();
                          //关闭
                        }
                      },
                      fabHeight: 42,
                      tabspace: 20,
                      type: ButtonType.Top,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildSvgImageItem(String icon) {
      return SvgPicture.asset(
        icon,
        width: 48.w,
        height: 48.w,
        fit: BoxFit.contain,
      );

  }
}
