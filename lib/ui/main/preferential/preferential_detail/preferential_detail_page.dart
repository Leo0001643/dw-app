import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'preferential_detail_logic.dart';

class PreferentialDetailPage extends StatefulWidget {
  const PreferentialDetailPage({Key? key}) : super(key: key);

  @override
  State<PreferentialDetailPage> createState() => _PreferentialDetailPageState();
}

class _PreferentialDetailPageState extends State<PreferentialDetailPage> {
  final logic = Get.find<PreferentialDetailLogic>();
  final state = Get.find<PreferentialDetailLogic>().state;

  @override
  void initState() {
    state.detail = Get.arguments;

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<PreferentialDetailLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().xiangqing),
      backgroundColor: ColorX.cardBg(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network("${state.detail.url.em()}${state.detail.picurl.em()}",fit: BoxFit.fill,
              height: 163.h,width: 335.w,),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(state.detail.title.em(),style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(state.detail.titleSec.em(),style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),),),
          ),
          Expanded(
            child: InAppWebView(
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
              onWebViewCreated: (controller)=> logic.loadPage(controller),
            ),
          ),
        ],
      ),
    );
  }

}