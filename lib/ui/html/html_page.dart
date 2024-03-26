import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
              // initialOptions: InAppWebViewGroupOptions(
              //   android: AndroidInAppWebViewOptions(
              //     loadWithOverviewMode: false,
              //     overScrollMode: AndroidOverScrollMode.OVER_SCROLL_NEVER,
              //     displayZoomControls: false,
              //     builtInZoomControls: false,
              //     useWideViewPort: false,
              //   ),
              //   ios: IOSInAppWebViewOptions(
              //     disallowOverScroll: true,
              //     enableViewportScale: true,
              //     ignoresViewportScaleLimits: true,
              //   ),
              //   crossPlatform: InAppWebViewOptions(
              //     useShouldOverrideUrlLoading: true,///添加这个选项才能调用shouldOverrideUrlLoading
              //   )
              // ),
              initialSettings: InAppWebViewSettings(
                loadWithOverviewMode: false,
                overScrollMode: OverScrollMode.NEVER,
                displayZoomControls: false,
                builtInZoomControls: false,
                useWideViewPort: false,
                disallowOverScroll: true,
                enableViewportScale: true,
                ignoresViewportScaleLimits: true,
                useShouldOverrideUrlLoading: true,
              ),
              shouldOverrideUrlLoading: (controller,action) async {
                var url = action.request.url.toString();
                loggerArray(["路由切换，看看是打开哪个页面了",url,action.request.headers,]);
                ///拉起支付宝支付
                if(url.startsWith("alipays://") || url.startsWith("weixin://")){
                  if(await canLaunchUrlString(url)){
                    launchUrlString(url);
                  }
                  return Future.value(NavigationActionPolicy.CANCEL);
                }
                return Future.value(NavigationActionPolicy.ALLOW);
              },
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