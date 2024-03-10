import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_state.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_timer_item.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';

class GameRoomHotWidget extends StatefulWidget {

 const GameRoomHotWidget({super.key});

  @override
  State<StatefulWidget> createState() => StateGameRoomHotWidget();

}


class StateGameRoomHotWidget extends State<GameRoomHotWidget>{

  Timer? _timer;

  @override
  void initState() {
    loggerArray(["房型更换这里刷新了吗",_timer]);
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel(); // 销毁时取消定时任务
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameRoomLogic>(
        id: GameRoomLogic.gameRoomCompute,
        builder: (logic) {
          GameRoomState state = logic.state;
          String termData=GameRuleUtil.getSSB(logic.term.value,year:"");
          return Container(
            height: 34.w,
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: const AssetImage(ImageX.icon_room_fire),
                      width: 20.w,
                      height: 22.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      termData,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: ColorX.text0917(),
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Row(
                  children: [buildSealingPlateStatus(),buildStartBettingStatus(),],
                ),
                Obx(() {
                  // 设置定时任务，每120秒执行一次
                  _timer?.cancel();
                  _timer = null;
                  TextItemLogic? logic=Get.find<TextItemLogic>();
                  logic.loadDataGameCode(state.room.value.gameType.em());
                  _timer = Timer.periodic(Duration(seconds: 50), (Timer timer) {
                    logic.loadDataGameCode(state.room.value.gameType.em());
                  });
                  loggerArray(["倒计时刷新了没",_timer]);
                  return TextTimerItem(state.room.value.gameType.em(),state.pc28Lotto);
                }),
              ],
            ),
          );
        });
  }



  Widget buildAvatarType(GameRoomLogic logic) {
    GameRoomState state = logic.state;
    switch (state.roomType.value) {
      case 2:
        return Image.asset(
          ImageX.ic_2avatar,
          fit: BoxFit.fill,
          width: 38.r,
        );
      case 3:
        return Image.asset(
          ImageX.ic_3avatar,
          fit: BoxFit.fill,
          width: 38.r,
        );
      default:
        return Image.asset(
          ImageX.ic_1avatar,
          fit: BoxFit.fill,
          width: 38.r,
        );
    }
  }


  Widget buildBalanceType(GameRoomLogic logic) {
    GameRoomState state = logic.state;
    var color = ColorX.color_fc243b;
    switch (state.roomType.value) {
      case 1:
        color = ColorX.color_fc243b;
        break;
      case 2:
        color = ColorX.color_70b6ff;
        break;
      case 3:
        color = ColorX.color_ffe0ac;
        break;
    }
    return Obx(() {
      return Text(
        "¥${state.userBal.value.money.em()}",
        style: TextStyle(
            fontSize: 14.sp, color: color, fontWeight: FontWeight.w500),
      );
    });
  }

  buildSealingPlateStatus() {
    return GetBuilder<TextItemLogic>(
        id: TextItemLogic.id_showStopBetting,
        builder: (logic) {
          return Visibility(
              visible: logic.showStopBetting.value,
              child: SizedBox(
                  height: 34.h,
                  child: const Image(
                    image: AssetImage(ImageX.close),
                  )));
        });


  }
  buildStartBettingStatus() {
    return GetBuilder<TextItemLogic>(
        id: TextItemLogic.id_showStartBetting,
        builder: (logic) {
          return Visibility(
              visible: logic.showStartBetting,
              child: SizedBox(
                  height: 34.h,
                  child: Image(image: AssetImage(ImageX.startP()),)));
        });
  }



}