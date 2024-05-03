import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/widget/draggable_widget.dart';

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
  Rx<Offset> position = Offset(20, 100).obs;
  var open = false.obs;

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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
                    onWebViewCreated: (controller) => logic.loadPage(controller),
                    initialSettings: InAppWebViewSettings(
                      loadWithOverviewMode: false,
                      overScrollMode: OverScrollMode.IF_CONTENT_SCROLLS,
                      displayZoomControls: false,
                      builtInZoomControls: false,
                      useWideViewPort: false,
                      disallowOverScroll: false,
                      enableViewportScale: true,
                      ignoresViewportScaleLimits: true,
                      useShouldOverrideUrlLoading: true,
                    ),
                    shouldOverrideUrlLoading: (controller,action) async {
                      var url = action.request.url.toString();
                      loggerArray(["路由切换，看看是打开哪个页面了",url,action.request.headers]);
                      if(url.contains(Constants.frontDomain())){
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
            DraggableWidget(
                InkWell(
                  onTap: (){
                    open.value = !open.value;
                  },
                  child: Obx(() {
                    return Visibility(
                      visible: !open.value,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ColorX.color_fe2427,
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.menu_open_rounded,size: 30,color: Colors.white,),
                      ),
                    );
                  }),
                ), (value){
                position.value = value;
                position.refresh();
              }
            ),
            Obx(() {
              return Positioned(
                left: position.value.dx,
                top: position.value.dy,
                child: Visibility(
                  visible: open.value,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          open.value = !open.value;
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: ColorX.color_fe2427,
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.close_outlined,size: 30,color: Colors.white,),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          isLandscape = !isLandscape;
                          ///重新创建这个组件
                          SystemChrome.setPreferredOrientations(isLandscape ? orientations : orientations2);
                          //旋转屏幕
                          loggerArray(["现在是什么状态",isLandscape]);
                        },
                        child: buildSvgImageItem(ImageX.icHtmXZT()),
                      ),
                      InkWell(
                        onTap: (){
                          if(isLandscape){
                            SystemChrome.setPreferredOrientations(orientations2);
                            isLandscape = !isLandscape;
                          }
                          Future.delayed(const Duration(milliseconds: 200),()=> Get.back());
                        },
                        child: buildSvgImageItem(ImageX.icHtmlBackT()),
                      ),

                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget buildSvgImageItem(String icon) {
    return SvgPicture.asset(
      icon,
      width: 48,
      height: 48,
      fit: BoxFit.fill,
    );
  }
}
