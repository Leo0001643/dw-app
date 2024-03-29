import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/nested_inner_scroll_child.dart';
import 'package:leisure_games/ui/bean/chess_event.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/main/home/home_logic.dart';
import 'package:leisure_games/ui/main/main_logic.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bean/pc28_lotto_entity.dart';
import 'text_timer/text_timer_page.dart';

class GameMenuView extends StatefulWidget {
  final HomeLogic logic;
  final NestedInnerScrollCoordinator coordinator;

  const GameMenuView(this.logic, this.coordinator, {super.key});

  @override
  State<StatefulWidget> createState() => StateGameMenuView();
}

class StateGameMenuView extends State<GameMenuView> {
  ScrollController innerController = ScrollController();

  var selectMenu = 0.obs;

  // ScrollController? scrollController;

  var itemHeightMap = <int, double>{};
  final Key _firstInnerKey = const ValueKey("first");
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    initScrollListener();
    super.initState();
  }

  // @override
  // void didUpdateWidget(covariant GameMenuView oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   initScrollListener();
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initScrollListener();
  }

  @override
  void dispose() {
    widget.coordinator.dispose();
    // scrollController = null;
    super.dispose();
  }

  void scroll2Item(int index) {
    var controller = innerController;
    if (index == itemHeightMap.length - 1) {
      controller.jumpTo(controller.position.maxScrollExtent ?? 0);
    } else {
      controller.jumpTo(itemHeightMap[index - 1] ?? 0);
    }
  }

  double measureItem(GameKindEntity element) {
    var cl = element.gameKindList.em();
    var typeHeight = 30.h;
    if (cl > 0) {
      var plus = (cl % 3) == 0 ? 0 : 1;
      typeHeight = (cl ~/ 3 + plus) * 100.h + typeHeight;
    }
    return typeHeight;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {
          // 内部滚动到达底部，滚动到底部
          widget.coordinator.outerController.animateTo(
            widget.coordinator.outerController.position.maxScrollExtent,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        } else if (notification is ScrollStartNotification &&
            notification.metrics.pixels ==
                notification.metrics.minScrollExtent) {
          // 内部滚动到达顶部，通知外部进行处理
          widget.coordinator.outerController.animateTo(
            0,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        }
        return false;
      },
      child: Row(
        children: [
          Container(
            width: 90.w,
            margin: EdgeInsets.only(left: 10.w),
            child: Obx(() {
              var menuGroup = widget.logic.state.menuGroup;
              return Column(
                children: menuGroup.map((e) {
                  return buildLeftMenu(e, menuGroup.indexOf(e),
                      menuGroup.indexOf(e) == selectMenu.value);
                }).toList(),
              );
            }),
          ),
          Expanded(
            child: Obx(() {
              var menuGroup = widget.logic.state.menuGroup;
              var pc28LottoEntity = widget.logic.state.pc28Lotto;
              return ListView(
                key: listKey, // Pass the key to the ListView
                padding: EdgeInsets.zero,
                controller: innerController,
                children: menuGroup
                    .map((element) =>
                        buildCategoryItem(element, pc28LottoEntity))
                    .toList(),
              );
            }),
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
    );
  }

  void scrollToPosition(int index) {
    double itemHeight = 50.0; // 你的每个项目的高度
    double desiredPosition = index * itemHeight;

    // 滚动到期望的位置
    innerController.animateTo(
      desiredPosition,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget buildCategoryItem(
      GameKindEntity element, Rx<Pc28LottoEntity> timerGroup) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: element != widget.logic.state.menuGroup[0],
            child: Container(
              margin: EdgeInsets.only(left: 6.w, right: 22.w),
              height: 1,
              child: const Divider(
                height: 0.5,
                color: Colors.black12,
              ),
            )),
        SizedBox(
          height: 10.h,
        ),
        buildGroupTitle(element),
        SizedBox(
          height: 10.h,
        ),
        Wrap(
          spacing: 15.w,
          runSpacing: 10.h,
          children: element.gameKindList?.map((e) {
                return InkWell(
                  onTap: () => jumpGameRoom(element, e),
                  child: buildGroupItem(element.gameKindList!, e, timerGroup),
                );
              }).toList() ??
              [],
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  buildGroupTitle(GameKindEntity element) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            WidgetUtils()
                .buildImage(findImage(element), 20.r, 20.r, fit: BoxFit.fill),
            SizedBox(
              width: 3.w,
            ),
            Text(
              element.gameKindName.em(),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: ColorX.textBlack()),
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: isEmpty(element.advertImage)
              ? null
              : Center(
                  child: Center(
                    child: WidgetUtils().buildImage(
                        element.advertImage.em(), 0.65.sw, 80.h,
                        fit: BoxFit.fill),
                  ),
                ),
        ),
      ],
    );
  }

  buildGroupItem(List<GameKindGameKindList> list, GameKindGameKindList element,
      Rx<Pc28LottoEntity> timerGroup) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          child: Stack(
            children: [
              WidgetUtils().buildImage(element.image(), 68.r, 68.r, fit: BoxFit.cover),
              // Positioned(
              //   right: 0,
              //   top: 0,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.black38,
              //       borderRadius: BorderRadius.circular(10.r),
              //     ),
              //     margin: EdgeInsets.all(3.r),
              //     child: Image.asset(ImageX.icon_heart,/*color: Colors.white,*/),
              //   ),
              // ),
              countDownText(list, element, timerGroup),
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
          width: 72.r,
          child: Text(
            maxLines: 2,
            element.gameName.em(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: ColorX.textBlack()),
          ),
        ),
      ],
    );
  }

  Widget countDownText(List<GameKindGameKindList> list,
      GameKindGameKindList element, Rx<Pc28LottoEntity> timerGroup) {
    print("-------->timerGroup:  ${jsonEncode(timerGroup.value)}");
    print("-------->timerGroup2:  ${jsonEncode(element)}");
    return Visibility(
      visible: element.gameKind == Constants.PC28,
      child: Positioned(
        right: 0,
        left: 0,
        bottom: 0,
        child: TextTimerPage(element, timerGroup)),
    );
  }

  Widget buildLeftMenu(GameKindEntity e, int index, bool select) {
    return InkWell(
      onTap: () {
        selectMenu.value = index;
        scroll2Item(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: select ? Colors.transparent : ColorX.cardBg3(),
          image: select
              ? DecorationImage(
                  image: WidgetUtils().buildImageProvider(ImageX.isSelectT()),
                  fit: BoxFit.fill)
              : null,
          // border: select ? Border.all(color: ColorX.color_fc243b,width: 1.w): Border.all(color: Colors.transparent,width: 0),
        ),
        alignment: Alignment.center,
        width: 75.w,
        height: 34.h,
        margin: EdgeInsets.only(bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetUtils().buildImage(
              findImage(e),
              20.r,
              20.r,
            ),
            SizedBox(
              width: 3.w,
            ),
           Container(width: 50.w,
             child:  Text(
               e.gameKindName.em(),
               textAlign: TextAlign.center,
               style: TextStyle(
                   fontSize: 12.sp,
                   color: select ? Colors.white : ColorX.text0917()),
             ),
           ),
          ],
        ),
      ),
    );
  }

  String findImage(GameKindEntity e) {
    switch (e.gameKind) {
      case "lottery":
        return ImageX.ic_caipiao;
      case "live":
        return ImageX.ic_zhenren;
      case "chess":
        return ImageX.ic_qipai;
      case "sport":
        return ImageX.ic_tiyu;
      case "game_fishing":
        return ImageX.ic_boyu;
      case "game":
        return ImageX.ic_dianzi;
      default:
        return ImageX.fire;
    }
  }

  void initScrollListener() {
    if (itemHeightMap.isEmpty) {
      widget.logic.state.menuGroup.listen((v) {
        intItemHeight(v);
      });
      intItemHeight(widget.logic.state.menuGroup);
    }
    // if(scrollController == null){
    //   scrollController = ScrollController();
    var controller = innerController;
    controller.addListener(() {
      if (controller.offset < ((itemHeightMap[0] ?? 0))) {
        selectMenu.value = 0;
      } else if (controller.offset == controller.position.maxScrollExtent) {
        selectMenu.value = itemHeightMap.length - 1;
      } else {
        itemHeightMap.forEach((key, value) {
          if (controller.offset > value &&
              controller.offset < (itemHeightMap[key + 1] ?? 0)) {
            // loggerArray(["滚动位置",scrollController.offset,((itemHeightMap[0] ?? 0) + 50.h),scrollController.position.maxScrollExtent]);
            selectMenu.value = key + 1;
          }
        });
      }
      // loggerArray(["滚动位置",selectMenu.value,itemHeightMap.length,scrollController?.offset]);
    });
    // loggerArray(["滚动位置",selectMenu.value,itemHeightMap.length,widget.logic.state.menuGroup.length,]);
    // }
  }

  void intItemHeight(List<GameKindEntity> v) {
    var data = <int, double>{};
    for (var element in v) {
      var height = measureItem(element);
      var index = v.indexOf(element);
      data[index] = height + (data[index - 1] ?? 0);
    }
    itemHeightMap.assignAll(data);
    loggerArray(["数据吞吐量", itemHeightMap]);
  }

  ///游戏跳转
  void jumpGameRoom(GameKindEntity parent, GameKindGameKindList element) {
    switch (element.gameKind) {
      case Constants.PC28:
        Get.toNamed(Routes.room_list, arguments: element);
        break;
      default:
        var webConfig = Get.find<MainLogic>().state.webConfig;
        if (AppData.isLogin()) {
          var protect = Get.find<MainLogic>().state.protect;
          var hint = "";
          protect?.protect?.forEach((key, value) {
            //维护状态【1:启用,2:维护】
            if (element.gameKind == key && value?.status == "2") {
              hint = value?.notice ?? '';
            }
          });
          if (unEmpty(hint)) {
            showToast(hint);
            return;
          }
          loggerArray(["这里的参数打印",element.toJson()]);
          if (element.liveName == "jingdian_lotto") {
            ///经典彩
            if (webConfig?.domainMJingdiancai?.list.em() == 1) {
              var urlPath = webConfig?.domainMJingdiancai?.urlPath.em();
              var url = webConfig?.domainMJingdiancai?.list!.first;
              if (unEmpty(url)) {
                var params = <String, dynamic>{"line":"$url$urlPath","lid":element.gameCode.em()};
                openLotteryPage(element,params);
              }
            } else if (unEmpty(webConfig?.domainMJingdiancai?.list)) {
              var list = webConfig?.domainMJingdiancai?.list;
              var path = webConfig?.domainMJingdiancai?.checkPath;
              var urlPath = webConfig?.domainMJingdiancai?.urlPath.em();
              DialogUtils().showAccessRouteDialog(context, list!, path!)
                  .then((value) {
                if (unEmpty(value)) {
                  var params = <String, dynamic>{"line":"$value$urlPath","lid":element.gameCode.em()};
                  openLotteryPage(element,params);
                }
              });
            } else {
              loggerArray(["无可用线路"]);
            }
          } else if (element.liveName == "fenfen_lotto") {
            ///官方彩
            ///官方彩不需要拼接urlpath
            if (webConfig?.domainMGuanfangcai?.list.em() == 1) {
              // var urlPath = webConfig?.domainMGuanfangcai?.urlPath.em();
              var url = webConfig?.domainMGuanfangcai?.list!.first;
              if (unEmpty(url)) {
                var params = <String, dynamic>{"line":url,"lid":element.gameCode.em()};
                openLotteryPage(element, params);
              }
            } else if (unEmpty(webConfig?.domainMGuanfangcai?.list)) {
              var list = webConfig?.domainMGuanfangcai?.list;
              var path = webConfig?.domainMGuanfangcai?.checkPath;

              ///官方彩不需要拼接urlpath
              // var urlPath = webConfig?.domainMGuanfangcai?.urlPath.em();
              DialogUtils().showAccessRouteDialog(context, list!, path!)
                  .then((value) {
                if (unEmpty(value)) {
                  var params = <String, dynamic>{"line":value,"lid":element.gameCode.em()};
                  openLotteryPage(element, params);
                }
              });
            } else {
              loggerArray(["无可用线路"]);
            }
          } else if (element.gameKind == "live") {
            ///真人
            openGamePage(element,<String, dynamic>{"gameCode":element.gameCode.em()});
          } else if (element.gameKind == "chess") {
            ///棋牌
            Get.toNamed(Routes.chess_game_list,
                arguments: ChessEvent(parent, element));
          } else if (element.gameKind == "sport") {
            ///体育
            openGamePage(element,{});
          } else if (element.gameKind == "game_fishing") {
            ///捕鱼
            openGamePage(element,<String, dynamic>{"gameCode":element.gameCode.em()});
          } else if (element.gameKind == "game") {
            Get.toNamed(Routes.table_game_list,
                arguments: ChessEvent(parent, element));
          }
        } else {
          showToast(Intr().qingxiandenglu);
        }
        break;
    }
  }

  ///打开游戏页面
  void openGamePage(GameKindGameKindList element,Map<String,dynamic> params) {

    var cur = AppData.wallet() ? 1 : 5;

    var user = AppData.user();
    var other = <String, dynamic>{
      "cur": cur,
      "tags": element.tags,
      "platform": element.liveName,
      "oid": user?.oid,
      "username": user?.username,
      "platformURL": Constants.web_gjz,
    };
    params.addAll(other);

    WidgetUtils().loginJump(element.gameName.em(), params);
  }

  ///彩票模块专用接口
  void openLotteryPage(GameKindGameKindList element, Map<String, dynamic> params) {

    DialogUtils().showLoadGameDialog(Get.context!, element.gameName.em(),).then((inapp) {
      if (unEmpty(inapp)) {
        var cur = AppData.wallet() ? 1 : 5;

        var user = AppData.user();
        var other = <String, dynamic>{
          "cur": cur.toString(),
          "tags": element.tags,
          "platform": element.liveName,
          "oid": user?.oid,
          "username": user?.username,
          "platformURL": Constants.web_gjz,
          "machineModel":Constants.model(),
          "siteId":"9000",
          "siteType":"1",
          "terminal":"APP",
          "version":Constants.version(),
        };
        params.addAll(other);

        var scheme = "";
        var path = "";
        if(AppData.baseUrl().startsWith("https:")){
          scheme = "https";
          path = "${AppData.baseUrl().replaceAll("https:","")}ds-api-web/loginLottery";
        } else {
          scheme = "http";
          path = "${AppData.baseUrl().replaceAll("http:","")}ds-api-web/loginLottery";
        }
        var uri = Uri(
          scheme: scheme,
          path: path,
          queryParameters: params,
        );
        if(inapp!){
          Get.toNamed(Routes.game_html,
              arguments: HtmlEvent(data: uri.toString(), isHtmlData: false, pageTitle: element.gameName.em()));
        }else {
          launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      }
    });

  }




}
