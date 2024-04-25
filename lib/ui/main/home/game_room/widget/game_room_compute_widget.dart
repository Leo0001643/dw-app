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
import 'package:leisure_games/app/socket/ws_lottery_entity.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_state.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';

class GameRoomComputeWidget extends StatelessWidget {
  final logic = Get.find<GameRoomLogic>();
  final state = Get.find<GameRoomLogic>().state;

  GameRoomComputeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameRoomLogic>(
        id: GameRoomLogic.gameRoomCompute,
        builder: (logic) {
          // int a;
          // GameRoomState state = logic.state;
          // var textColor = state.roomType.value == 1 ? ColorX.text0917():Colors.white;
          // WSLotteryEntityData? headWSLotteryEntityData=logic.headWSLotteryEntityData;
          // String termData=GameRuleUtil.getSSB(headWSLotteryEntityData?.term??""); // 4
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Divider(
                height: 1.h,
                color: ColorX.color_f1f1f1,
              ),
              SizedBox(
                height: 10.h,
              ),
              buildCurrentTermType(logic, context),
            ],
          );
        });
  }

  BoxDecoration buildRoomBoxType() {
    var image = ImageX.ic_1room_last;
    switch (state.roomType.value) {
      case 1:
        image = ImageX.ic_1room_last;
        break;
      case 2:
        image = ImageX.ic_2room_last;
        break;
      case 3:
        image = ImageX.ic_3room_last;
        break;
    }
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buildNotifyItem(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Image.asset(
            ImageX.icon_ntf,
            color: color,
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 12.sp, color: color),
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildDrawTime(String time) {
  //   return time == "-1"
  //       ? WidgetUtils().buildImage(ImageX.iconRoomMaskT(), 24.r, 24.r,fit: BoxFit.fill)
  //       : Container(
  //           width: 26.r,
  //           height: 26.r,
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //             color: ColorX.color_10_fff,
  //             border: Border.all(color: Colors.white, width: 1.r),
  //             borderRadius: BorderRadius.circular(5.r),
  //           ),
  //           child: Text(
  //             time,
  //             style: TextStyle(
  //                 fontSize: 16.sp,
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.w600),
  //           ),
  //         );
  // }

  Widget buildUserTab(int i, String tab, String icon, Color color,
      BuildContext context, GameRoomLogic logic) {
    return InkWell(
      onTap: () => logic.onTabClick(context, i),
      child: Column(
        children: [
          Image.asset(
            icon,
            color: color,
          ),
          Text(
            tab,
            style: TextStyle(fontSize: 12.sp, color: color),
          ),
        ],
      ),
    );
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

  Widget buildYueHeader(GameRoomLogic logic) {
    GameRoomState state = logic.state;
    var textColor =
        state.roomType.value == 1 ? ColorX.text0917() : Colors.white;
    if (AppData.isLogin()) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppData.user()!.username?.em() ?? "",
            style: TextStyle(fontSize: 12.sp, color: textColor),
          ),
          SizedBox(
            height: 3.h,
          ),
          buildBalanceType(logic),
        ],
      );
    } else {
      return InkWell(
        onTap: () {
          Get.until((ModalRoute.withName(Routes.main)));
          WidgetUtils().goLogin();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  Intr().login,
                  style: TextStyle(fontSize: 12.sp, color: textColor),
                ),
                Image.asset(
                  ImageX.icon_right_grey,
                  color: ColorX.icon586(),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              Intr().denglugengjingcai,
              style: TextStyle(fontSize: 12.sp, color: textColor),
            ),
          ],
        ),
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
        "¥${logic.getBalance().value.money.em()}",
        style: TextStyle(
            fontSize: 14.sp, color: color, fontWeight: FontWeight.w500),
      );
    });
  }

  Widget buildCurrentTermType(GameRoomLogic logic, BuildContext context) {
    return GetBuilder<GameRoomLogic>(
        id: GameRoomLogic.gameRoomCompute,
        builder: (controller) {
          GameRoomState state = logic.state;
          WSLotteryEntityData? headWSLotteryEntityData =
              logic.headWSLotteryEntityData;
          List<int> arr2 = GameRuleUtil.parseLottery(
              headWSLotteryEntityData?.originalNum ?? ""); //3
          var color = state.roomType.value == 1 ? ColorX.text0917() : ColorX.color_ffe0ac;

          loggerArray(["=========>更新期数",headWSLotteryEntityData?.toJson()]);

          var result = arr2[3] > 9 ? '${arr2[3]}' : (arr2[3] > 0 ? '0${arr2[3]}' : '${arr2[3]}');

          return InkWell(
            onTap: () => DialogUtils().showHistoryLotteryBtmDialog(context, logic),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WidgetUtils().buildDixqi3(headWSLotteryEntityData?.term ?? "",
                      state.roomType.value),
                  // Text(termData,style: TextStyle(fontSize: 12.sp,color: color,fontWeight: FontWeight.w500),),
                  SizedBox(width: 5.w,),
                  buildDrawNum("${arr2[0]}", logic, showWaittingImg: !logic.updateLottery),
                  buildDrawMark("+", color),
                  buildDrawNum("${arr2[1]}", logic, showWaittingImg: !logic.updateLottery),
                  buildDrawMark("+", color),
                  buildDrawNum("${arr2[2]}", logic, showWaittingImg: !logic.updateLottery),
                  buildDrawMark("=", color),
                  buildDrawResult(result, logic, color: GameRuleUtil.getBallNewColor(arr2[3]), showWaittingImg: !logic.updateLottery),
                  // SizedBox(width: 5.w,),
                  Visibility(
                    visible: logic.updateLottery,
                    child: GameRuleUtil.getDXDSByType(arr2[3],state.roomType.value),
                  ),
                  Image.asset(ImageX.icon_down_black, color: color,),
                ],
              ),
            ),
          );
        });
  }

  Widget buildDrawResult(String result, GameRoomLogic logic,
      {Color? color, showWaittingImg = false}) {
    GameRoomState state = logic.state;
    var color1 = state.roomType.value == 1 ? ColorX.color_10_fc2 : ColorX.color_c7956f;
    var textColor1 = state.roomType.value == 1 ? ColorX.text0917() : ColorX.color_091722;
    var color3 = state.roomType.value == 1 ? ColorX.cardBg3() : ColorX.color_ffe0ac;
    return showWaittingImg == true
        ? WidgetUtils().buildImage(ImageX.iconRoomMask2T(), 46.r, 18.r,fit: BoxFit.fill)
        : Container(
      decoration: BoxDecoration(
        color: color3,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Container(
        width: 28.r,
        height: 28.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: color ?? color1, width: 2.w),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Text(
          result == "-1" ? "?":result,
          style: TextStyle(
              fontSize: 13.sp,
              color: textColor1,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget buildDrawMark(String mark, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Text(
        mark,
        style: TextStyle(
            fontSize: 18.sp, color: color, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildDrawNum(String num, GameRoomLogic logic,
      {showWaittingImg = false}) {
    GameRoomState state = logic.state;
    var color =
        state.roomType.value == 1 ? ColorX.cardBg3() : ColorX.color_ffe0ac;
    var textColor1 = state.roomType.value == 1 ? ColorX.text0917() : ColorX.color_091722;

    return showWaittingImg == true
        ? WidgetUtils().buildImage(ImageX.iconRoomMaskT(), 24.r, 24.r,fit: BoxFit.fill)
        : Container(
            width: 24.r,
            height: 24.r,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Text(num == "-1" ? "?":num,
              style: TextStyle(
                  fontSize: 14.sp, color: textColor1, fontWeight: FontWeight.w600),
            ),
          );
  }
}
