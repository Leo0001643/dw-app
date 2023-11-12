import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'html_logic.dart';

class HtmlPage extends StatefulWidget {
  const HtmlPage({Key? key}) : super(key: key);

  @override
  State<HtmlPage> createState() => _HtmlPageState();
}

class _HtmlPageState extends State<HtmlPage> {
  final logic = Get.find<HtmlLogic>();
  final state = Get.find<HtmlLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildHtmlBar(state.pageTitle),
      body: Column(
        children: [
          Obx(() => Visibility(
            child: LinearProgressIndicator(
              value: state.progress.value/100,//取值为0-1
              minHeight: 3,
              valueColor: AlwaysStoppedAnimation(Colors.amberAccent),
              backgroundColor: Colors.white,
            ),
            visible: state.progressVisible.value,
          ),
          ),
          Expanded(
            child: InAppWebView(
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
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<HtmlLogic>();
    super.dispose();
  }
}