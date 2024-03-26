import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';

import 'game_html_logic.dart';

@Deprecated("废弃,请使用GameHtmlPage2")
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
                    ),
                    onProgressChanged: (controller,pg){
                      state.progress.value = pg.toDouble();
                      state.progressVisible.value = pg != 100;
                    },
                  ),

                  InkWell(
                    onTap: () async {
                      if(await state.controller?.canGoBack() == true){
                        state.controller?.goBack();
                      }else {
                        Get.back();
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 15.h,left: 5.w),
                      color: Colors.white,
                      width: 45.w,
                      height: 20.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_outlined,size: 15.r,color: Colors.black,),
                          Text(Intr().fanhui,style: TextStyle(fontSize: 12.sp,color: Colors.black),),
                        ],
                      ),
                    ),
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