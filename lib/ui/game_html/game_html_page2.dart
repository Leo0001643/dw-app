import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'FloatExpendButton.dart';
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
  Offset position = Offset(0.1.sw, 0.5.sh);

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        // systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark),
      ),
      body: Column(
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
                Positioned(
                  top: position.dy,
                  left: position.dx,
                  child: Draggable(
                    feedback: Container(),
                    onDragUpdate: (details){
                      setState(() {
                        position=details.localPosition;
                      });
                    },
                    onDraggableCanceled: (velocity,offset){
                      setState(() {
                        position = offset;
                      });
                    },
                    child:FloatExpendButton(
                      //菜单图标组
                      [
                        buildSvgImageItem(ImageX.icHtmXZT()),
                        buildSvgImageItem(ImageX.icHtmlBackT())
                      ],
                      //点击事件回调
                      callback: (int index) {
                        if (index == 0) {
                          isLandscape = !isLandscape;
                          //旋转屏幕
                          SystemChrome.setPreferredOrientations(
                              isLandscape ? orientations : orientations2);
                          ///切换横竖屏需要切换悬浮球的位置
                          setState(() {
                            position = isLandscape ? Offset(0.1.sw, 0.1.sh):Offset(0.1.sw, 0.5.sh);
                          });
                          loggerArray(["现在是什么状态",isLandscape]);
                        } else if (index == 1) {
                          Get.back();
                          //关闭
                        }
                      },
                      fabHeight: 42,
                      tabspace: 20,
                      type: ButtonType.Top,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
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
