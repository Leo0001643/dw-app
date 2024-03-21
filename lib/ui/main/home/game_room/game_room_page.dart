
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barrage/flutter_barrage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/betting_left_item.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/count_down_item_widget.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/game_room_compute_widget.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/open_lottery_item.dart';

import '../../../bean/room_copy_writing_entity.dart';
import 'game_room_logic.dart';
import 'widget/game_room_head_widget.dart';
import 'widget/game_room_hot_widget.dart';

class GameRoomPage extends StatefulWidget {
  const GameRoomPage({super.key});

  @override
  State<GameRoomPage> createState() => _GameRoomPageState();
}

class _GameRoomPageState extends State<GameRoomPage> {
  final logic = Get.find<GameRoomLogic>();
  final state = Get.find<GameRoomLogic>().state;

  // TextItemLogic? timeLogic;

  @override
  void initState() {
    ///加载房间提示信息
    state.roomWriting.assignAll(AppData.roomWritingEntity() ?? []);
    state.room.value = Get.arguments;
    logic.loadData(state.room.value, true);
    super.initState();
  }

  @override
  void dispose() {
    state.barrageWallController.dispose();
    Get.delete<GameRoomLogic>();
    Get.delete<TextItemLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildGameBar(state.title, buildRoomType(),
          collect: false, msg: true, scaffoldKey: state.scaffoldKey, onTap: () {
        DialogUtils().showSelectRoomBtmDialog(context, state.pc28Lotto.value,defRoom: state.room.value).then(
          (value) {
            if (unEmpty(value?.name)) {
              logic.loadData(value!, false);
            }
          },
        );
      }),
      backgroundColor: ColorX.pageBg2(),
      body: Column(
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
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h,left: 10.w,right: 10.w),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: WidgetUtils().buildImageProvider(ImageX.roomBg(state.roomType.value)),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        const GameRoomHotWidget(),
                        Expanded(
                          child: Stack(
                            children: [
                              GetBuilder<GameRoomLogic>(
                                id: GameRoomLogic.gameRoomList,
                                builder: (logic) {
                                  return ListView.builder(
                                    controller: logic.scrollController,
                                    itemCount:
                                    state.gameRoomItemEntityList.length,
                                    itemBuilder: (context, index) {
                                      GameRoomItemEntity gameRoomItemEntity =
                                      state.gameRoomItemEntityList[index];
                                      return buildItemWidget(index, logic, gameRoomItemEntity);
                                    },
                                  );
                                },
                              ),
                              Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 20.h,
                                  child: buildCountDown()),
                              BarrageWall(
                                maxBulletHeight: 5,
                                controller: state.barrageWallController,
                                speedCorrectionInMilliseconds: 3000,
                                height: 0.2.sh,
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                buildFloatingBtn(() {
                  if (AppData.isLogin()) {
                    logic.startBet(context);
                  } else {
                    Get.until((ModalRoute.withName(Routes.main)));
                    WidgetUtils().goLogin();
                  }
                }),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            alignment: Alignment.center,
            child: buildBottomBtn(),
          ),
        ],
      ),
    );
  }

  Widget buildFloatingBtn(VoidCallback onPressed) {
    return Positioned(
      right: 0,
      bottom: 30.h,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 30.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: ColorX.cardBg13(),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),
            bottomLeft: Radius.circular(15.r),),
            boxShadow: [
              AppData.theme() ? BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2.r,
                blurRadius: 3.r,
                offset: Offset(0, 1), // 阴影位置偏移量
              ):BoxShadow(),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit_note,size: 20.r,color: ColorX.text0917(),),
              Text(Intr().danmu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
            ],
          ),
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
      var colors = [ColorX.color_ff5163, ColorX.color_fd273e];
      switch (state.roomType.value) {
        case 1:
          colors = [ColorX.color_ff5163, ColorX.color_fd273e];
          break;
        case 2:
          colors = [
            ColorX.color_70b6ff,
            ColorX.color_5583e7,
          ];
          break;
        case 3:
          colors = [
            ColorX.color_88705f,
            ColorX.color_574436,
          ];
          break;
      }
      var textColor =
          state.roomType.value == 3 ? ColorX.color_ffe0ac : Colors.white;
      return InkWell(
        onTap: () {
          if (AppData.isLogin()) {
            TextItemLogic textItemLogic = Get.find<TextItemLogic>();
            if (unEmpty(textItemLogic.canBet())) {
              showToast(textItemLogic.canBet());
              return;
            }

            DialogUtils().showBettingBtmDialog(context, logic);
          } else {
            Get.until((ModalRoute.withName(Routes.main)));
            WidgetUtils().goLogin();
          }
        },
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
    if (gameRoomItemEntity.type == "bet_result") {
      return BettingLeftItem(index, logic, gameRoomItemEntity);
    } else if (gameRoomItemEntity.type == "lottery") {
      return OpenLotteryItem(index, logic, gameRoomItemEntity);
    } else if (gameRoomItemEntity.type == "countTime" ||
        gameRoomItemEntity.type == "closeOver" || gameRoomItemEntity.type == "openOver") {
      return CountDownItemWidget(logic, gameRoomItemEntity);
    }
    return Container();
  }

  buildCountDown() {
    return GetBuilder<TextItemLogic>(
        id: TextItemLogic.id_fiveCountDownStatus,
        builder: (logic) {
          return Visibility(
              visible:
                  logic.fiveCountDownTime <= 5 && (logic.fiveCountDownTime > 0),
              child: WidgetUtils().buildImage(
                  buildImage(logic.fiveCountDownTime), 100.w, 40.h));
        });
  }

  String buildImage(int second) {
    String result = ImageX.countDown5Z();
    switch (second) {
      case 5:
        result = ImageX.countDown5Z();
        break;
      case 4:
        result = ImageX.countDown4Z();
        break;
      case 3:
        result = ImageX.countDown3Z();
        break;
      case 2:
        result = ImageX.countDown2Z();
        break;
      case 1:
        result = ImageX.countDown1Z();
        break;
    }
    return result;
  }
}
