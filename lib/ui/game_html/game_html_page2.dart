import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'game_html_logic.dart';

class GameHtmlPage2 extends StatefulWidget {
  @override
  State<GameHtmlPage2> createState() => _GameHtmlPageState();
}

class _GameHtmlPageState extends State<GameHtmlPage2>{
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
  Rx<Offset> position = Offset(20, 50).obs;


  @override
  void initState() {

    super.initState();
  }


  @override
  void dispose() {
    if(isLandscape){
      SystemChrome.setPreferredOrientations(orientations2);
    }
    Get.delete<GameHtmlLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return FloatingDraggableWidget(
        mainScreenWidget: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 0,
            backgroundColor: Colors.white,
            // systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Obx(() => Visibility(
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
                  child: InAppWebView(
                    onWebViewCreated: (controller) =>
                        logic.loadPage(controller),
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
                      loggerArray(["路由切换，看看是打开哪个页面了",url,action.request.headers]);
                      if(url.contains(Constants.web_gjz)){
                        Get.back();
                        Future.value(NavigationActionPolicy.CANCEL);
                      }
                      return Future.value(NavigationActionPolicy.ALLOW);
                    },
                    onProgressChanged: (controller, pg) {
                      state.progress.value = pg.toDouble();
                      state.progressVisible.value = pg != 100;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingWidget: Column(
          children: [
            FloatingActionButton(
                heroTag: "orientations",
                foregroundColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                onPressed: (){
                  isLandscape = !isLandscape;
                  ///重新创建这个组件
                  SystemChrome.setPreferredOrientations(isLandscape ? orientations : orientations2);
                  //旋转屏幕
                  ///切换横竖屏需要切换悬浮球的位置
                  position.value = isLandscape ? const Offset(100, 30) : const Offset(20, 50);
                  position.refresh();
                  loggerArray(["现在是什么状态",isLandscape]);
                },
                child: buildSvgImageItem(ImageX.icHtmXZT())),
            FloatingActionButton(
                heroTag: "close",
                foregroundColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                onPressed: (){
                  if(isLandscape){
                    SystemChrome.setPreferredOrientations(orientations2);
                    isLandscape = !isLandscape;
                  }
                  Future.delayed(const Duration(milliseconds: 200),()=> Get.back());
                },
                child: buildSvgImageItem(ImageX.icHtmlBackT())),
          ],
        ),
        dx: position.value.dx,
        dy: position.value.dy,
        floatingWidgetWidth: 50,
        floatingWidgetHeight: 150,
      );
    });
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
