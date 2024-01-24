import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_bet_result_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/betting_left_item.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_state.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/count_down_item_widget.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/game_room_compute_widget.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/open_lottery_item.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_timer_logic.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_timer_page.dart';

import '../../../../main.dart';
import '../../ends_drawer_view.dart';
import 'game_room_logic.dart';
import 'widget/game_room_head_widget.dart';
import 'widget/game_room_hot_widget.dart';

class GameRoomPage extends StatefulWidget {
  const GameRoomPage({Key? key}) : super(key: key);

  @override
  State<GameRoomPage> createState() => _GameRoomPageState();
}

class _GameRoomPageState extends State<GameRoomPage> {
  final logic = Get.find<GameRoomLogic>();
  final state = Get.find<GameRoomLogic>().state;
  TextItemLogic? timeLogic;

  @override
  void initState() {
    state.room.value = Get.arguments;
    TextItemLogic textItemLogic=Get.find<TextItemLogic>();
    textItemLogic.setType( state.room.value.gameType);
    logic.loadData(state.room.value);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<GameRoomLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMineKey,
      appBar: WidgetUtils().buildGameBar(state.title, buildRoomType(),
          collect: false, msg: true, onTap: () {
        DialogUtils()
            .showSelectRoomBtmDialog(context, state.pc28Lotto.value)
            .then(
          (value) {
            if (unEmpty(value?.name)) {
              logic.changeRoomType(value!);
            }
          },
        );
      }, drawEnd: () {
        scaffoldMineKey.currentState?.openEndDrawer();
      }),
      endDrawer: EndsDrawerView(),
      backgroundColor: ColorX.pageBg2(),
      body: Container(
        child: Column(
          children: [
            Obx(() {
              return Container(
                decoration: buildBoxDecorationType(),
                margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                child: Column(
                  children: [
                    // Container(
                    //     alignment: Alignment.center,
                    //     decoration: BoxDecoration(
                    //       color: Colors.black54,
                    //       borderRadius: BorderRadius.circular(100.r),
                    //     ),
                    //     margin: EdgeInsets.symmetric(vertical: 2.r, horizontal: 1.r),
                    //     child: TextTimerPage(
                    //         TextTimerLogic(type: game.gameCode), game, logic.state.pc28Lotto)),
                    GameRoomHeadWidget(),
                    GameRoomComputeWidget(),
                  ],
                ),
              );
            }),
            GetBuilder<GameRoomLogic>(
              id: "gameRoomLogicList",
              builder: (logic) {
                print("=====>6");
                return Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 10.w, left: 10.w, top: 12.w),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageX.icon_room_bg),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      GameRoomHotWidget(),
                      Expanded(
                          child: Stack(
                        children: [
                          Container(
                            child: ListView.builder(
                              shrinkWrap: true,
                              controller: logic.scrollController,
                              itemCount: state.gameRoomItemEntityList.length,
                              itemBuilder: (context, index) {
                                GameRoomItemEntity gameRoomItemEntity =
                                    state.gameRoomItemEntityList[index];
                                return buildItemWidget(
                                    index, logic, gameRoomItemEntity);
                              },
                            ),
                          ),
                          Positioned(left: 0, right: 0, child: buildContiner()),
                          buildFloatingBtn(() {
                            logic.startBet(context);

                          }),
                        ],
                      ))
                    ],
                  ),
                ));
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              alignment: Alignment.center,
              child: buildBottomBtn(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFloatingBtn(VoidCallback onPressed) {
    return Positioned(
      right: 0,
      bottom: 30.h,
      child: InkWell(
        onTap: onPressed,
        child: Image.asset(
          ImageX.icon_barrage,
          width: 60.w,
          height: 35.h,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildRoomType() {
    return Obx(() {
      var color = ColorX.color_fc243b;
      switch (state.roomType.value) {
        case 1:
          color = ColorX.color_fc243b;
          break;
        case 2:
          color = ColorX.color_62_586;
          break;
        case 3:
          color = ColorX.color_574436;
          break;
      }
      return Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(5.r)),
        padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 2.h),
        child: Text(
          state.room.value.name.em(),
          style: TextStyle(color: Colors.white, fontSize: 10.sp),
        ),
      );
    });
  }

  BoxDecoration buildBoxDecorationType() {
    var color = Colors.white;
    switch (state.roomType.value) {
      case 1:
        color = ColorX.cardBg();
        break;
      case 2:
        color = Color(0xff363f57);
        break;
      case 3:
        color = ColorX.color_574436;
        break;
    }
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.r),
    );
  }

  Widget buildBottomBtn() {
    return Obx(() {
      var colors = [Color(0xffff5163), Color(0xfffd273e)];
      switch (state.roomType.value) {
        case 1:
          colors = [Color(0xffff5163), Color(0xfffd273e)];
          break;
        case 2:
          colors = [
            Color(0xff5f6e88),
            Color(0xff363f57),
          ];
          break;
        case 3:
          colors = [
            Color(0xff88705f),
            Color(0xff574436),
          ];
          break;
      }
      var textColor =
          state.roomType.value == 3 ? ColorX.color_ffe0ac : Colors.white;
      return InkWell(
        onTap: () => DialogUtils().showBettingBtmDialog(context, logic),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: 335.w,
          height: 50.h,
          alignment: Alignment.center,
          child: Text(
            Intr().touzhu,
            style: TextStyle(
                fontSize: 16.sp, color: textColor, fontWeight: FontWeight.w600),
          ),
        ),
      );
    });
  }
  Widget buildItemWidget(
      int index, GameRoomLogic logic, GameRoomItemEntity gameRoomItemEntity) {
    print("----------index ${index}  ");
    if (gameRoomItemEntity.type == "bet_result") {
      return BettingLeftItem(index, logic, gameRoomItemEntity);
    } else if (gameRoomItemEntity.type == "lottery") {
      return OpenLotteryItem(index, logic, gameRoomItemEntity);
    }else if (gameRoomItemEntity.type == "countTime"||gameRoomItemEntity.type == "closeOver"||gameRoomItemEntity.type == "openOver") {
      return CountDownItemWidget(index, logic, gameRoomItemEntity);
    }
    return SizedBox();
  }

  buildContiner() {
    return GetBuilder<TextItemLogic>(
        id: "fiveCountDownStatus",
        builder: (logic) {
          return Visibility(
              visible: logic.fiveCountDownTime<=5&&(logic.fiveCountDownTime>0),
              child: SizedBox(
              height: 50,
              child: Image(
                image: AssetImage(buildImage(logic.fiveCountDownTime)),
                width: 172,
                height: 36,
              )));
        });
  }

  String buildImage(int second) {
    String result = ImageX.countDown5;
    switch (second) {
      case 5:
        result = ImageX.countDown5;
        break;
      case 4:
        result = ImageX.countDown4;
        break;
      case 3:
        result = ImageX.countDown3;
        break;
      case 2:
        result = ImageX.countDown2;
        break;
      case 1:
        result = ImageX.countDown1;
        break;
    }
    return result;
  }
}
