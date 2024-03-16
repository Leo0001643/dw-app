import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'loss_percent_logic.dart';

class LossPercentPage extends StatefulWidget {
  const LossPercentPage({Key? key}) : super(key: key);

  @override
  State<LossPercentPage> createState() => _LossPercentPageState();
}

class _LossPercentPageState extends State<LossPercentPage> {
  final logic = Get.find<LossPercentLogic>();
  final state = Get.find<LossPercentLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildLossHtmlBar(state.pageTitle,state.subTitle),
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

  @override
  void dispose() {
    Get.delete<LossPercentLogic>();
    super.dispose();
  }
}