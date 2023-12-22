import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'game_html_logic.dart';

class GameHtmlPage extends StatefulWidget {
  @override
  State<GameHtmlPage> createState() => _GameHtmlPageState();
}

class _GameHtmlPageState extends State<GameHtmlPage> {
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
      body: Column(
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



}