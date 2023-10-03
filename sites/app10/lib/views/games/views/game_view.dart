
import 'dart:convert';

import 'package:aone_common/common.dart';
import 'package:aone_widget/draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/game_view_controller.dart';
import 'package:aone_common/common.dart';
import 'package:aone_widget/draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/types/gf_progress_type.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../config/site_config.dart';
import '../../../theme/color_schema.dart';
import '../controllers/game_view_controller.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  // Get.put(GameViewController());

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  GameViewController gamevc = Get.put(GameViewController());
  bool useSensor = true;
  GameInitEntity param = Get.arguments;

  @override
  void didChangeDependencies() {
    precacheImage(
        const AssetImage(
          'assets/images/home/game_backgroud.png',
        ),
        context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: gamevc.progressNum != 100
              ? 0
              : context.mediaQueryViewPadding.top),
      child: Scaffold(
        body: createContentWidget(),
      ),
    );
  }

  createContentWidget() {
    return Obx(() {
      return Stack(
        children: <Widget>[
          InAppWebView(
            onCloseWindow: (controller) {
              Get.back();
              gamevc.exitTheGame();
            },
            initialUrlRequest: URLRequest.fromMap({"url": param.url}),
            onConsoleMessage: (InAppWebViewController controller,
                ConsoleMessage consoleMessage) {
              print('进来了点击');
              if (consoleMessage.message.contains("is_fltter_bet")) {
                try {
                  Map<String, dynamic> map =
                  json.decode(consoleMessage.message);
                  if (map["is_fltter_bet"] == true) {
                    if (map['message'] == 'can not bet') {
                      UserService.to.onBeforeLogoutNotEmit();
                      Get.offAndToNamed(Routes.login);
                    }
                  }
                } catch (e) {}
              }
            },
            onEnterFullscreen: (controller) {
              print('xxx');
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              if (gamevc.progressNum != 100) {
                gamevc.progressNum = progress;
              }
              print('progressNum == ${gamevc.progressNum}');
            },
          ),

          GestureDetector(
            onTap: () {
              gamevc.showSubView = !gamevc.showSubView;
            },
            child: DraggableFab(
              child:  Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                // decoration: BoxDecoration(
                //   color: stringToColor('EEE3C6'),
                //   borderRadius: BorderRadius.circular(25),
                // ),
                child: Image.asset(
                  'assets/images/game_init/float_${gamevc.showSubView ? 'close':'menu'}.png',
                ),
              ),
              initPosition: const Offset(65, 50),
              // securityBottom: 100.r,
              changed: (offset) {
                gamevc.left = offset.dx + 5;
                gamevc.top = offset.dy;
                Size screenSize = MediaQuery.of(context).size;
                print('高度 == ${gamevc.top}');
                if (gamevc.top > screenSize.height / 2) {
                  gamevc.top = gamevc.top - 80;
                } else {
                  gamevc.top = gamevc.top + 50;
                }
                gamevc.showSubView = false;
              },
            ),
          ),
          if (gamevc.showSubView)
            Positioned(
              left: gamevc.left,
              top: gamevc.top,
              child: Container(
                width: 40,
                child: Column(
                  children: <Widget>[
                    createTapButton('assets/images/game_init/float_home.png',
                        () {
                      gamevc.showSubView = false;
                      Get.back();
                      gamevc.exitTheGame();
                    }),
                    createTapButton('assets/images/game_init/float_wallet.png',
                        () {
                      gamevc.showSubView = false;
                      Get.offAndToNamed(Routes.recharge);
                    })
                  ],
                ),
              ),
            ),
          if (gamevc.progressNum != 100)
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/home/game_backgroud.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: showProgressWidget(),
            ),
        ],
      );
    });
  }

  createTapButton(String imageName, Function() tapClick) {
    return GestureDetector(
      onTap: tapClick,
      child: Image.asset(
        imageName,
      ),
    );
  }

  Widget showProgressWidget() {

    return Container(
      margin: EdgeInsets.only(top: Get.height - 340.r),
      height: 340.r,
      // color: Colors.red,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 215.r,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitFadingCircle(
                color:AppTheme.progressBarColor,
                size: 30.sp,
              ),
            ],
          ),
          SizedBox(
            height: 15.r,
          ),
          progressWidget()
        ],
      ),
    );
  }
  Widget progressWidget() {

    return Container(
      margin: EdgeInsets.only(left: 40.r, right: 40.r),
      child: GFProgressBar(
        padding: const EdgeInsets.only(left: 15, right: 15),
        percentage: 1,
        lineHeight: 7.5,
        alignment: MainAxisAlignment.spaceBetween,
        type: GFProgressType.linear,
        backgroundColor: const Color(0xff444444),
        progressBarColor: AppTheme.progressBarColor,
        animation: true,
        animationDuration: 1000,
      ),
    );
  }
}
