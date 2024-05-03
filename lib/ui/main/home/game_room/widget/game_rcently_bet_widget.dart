import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/socket/ws_lottery_entity.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_state.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';

class GameRecentlyBetWidget extends StatelessWidget {
  final logic = Get.find<GameRoomLogic>();
  final state = Get.find<GameRoomLogic>().state;
  WSLotteryEntityData headWSLotteryEntityData;

  GameRecentlyBetWidget(this.headWSLotteryEntityData, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameRoomLogic>(
        id: GameRoomLogic.gameRoomCompute,
        builder: (logic) {
          return Container(
            height: 50.w,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.w),
                color: ColorX.cardBg(),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            // alignment: Alignment.center,
            child: buildCurrentTermType(logic, context),
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
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill,),
    );
  }

  Widget buildNotifyItem(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Image.asset(ImageX.icon_ntf, color: color,),
          SizedBox(width: 5.w,),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: 12.sp, color: color),),
          ),
        ],
      ),
    );
  }

  Widget buildDrawTime(String time) {
    return
      Container(
        width: 26.r,
        height: 26.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorX.color_10_fff,
          border: Border.all(color: Colors.white, width: 1.r),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Text(time, style: TextStyle(fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600),),
      );
  }

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
    // GameRoomState state = logic.state;
    String termData = GameRuleUtil.getSimpleSSB(headWSLotteryEntityData.term.em(), year: ""); // 4
    List<int> arr2 = GameRuleUtil.parseLottery(headWSLotteryEntityData.originalNum.em()); //3

    var result = arr2[3] > 9 ? '${arr2[3]}' : (arr2[3] > 0 ? '0${arr2[3]}' : '${arr2[3]}');

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetUtils().buildDixqi2(termData),
          SizedBox(width: 5.w,),
          buildDrawNum("${arr2[0]}", logic, showWaittingImg: false),
          buildDrawMark("+", ColorX.text0917()),
          buildDrawNum("${arr2[1]}", logic, showWaittingImg: false),
          buildDrawMark("+", ColorX.text0917()),
          buildDrawNum("${arr2[2]}", logic, showWaittingImg: false),
          buildDrawMark("=", ColorX.text0917()),
          buildDrawResult(result, logic, color: GameRuleUtil.getBallNewColor(arr2[3]), showWaittingImg: false),
          // SizedBox(width: 5.w,),
          GameRuleUtil.getDXDS(arr2[3]),
        ],
      ),
    );
  }

  Widget buildDrawResult(String result, GameRoomLogic logic,
      {Color? color, showWaittingImg = false}) {
    GameRoomState state = logic.state;
    var color1 = state.roomType.value == 1 ? ColorX.color_10_fc2 : ColorX
        .color_c7956f;
    return Container(
      decoration: BoxDecoration(
        color: ColorX.cardBg3(),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Container(
        width: 24.r,
        height: 24.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: color ?? color1, width: 2)
          , borderRadius: BorderRadius.circular(15.r),),
        child: Text(result == "-1" ? "?":result, style: TextStyle(fontSize: 14.sp,
            color: ColorX.text0917(),
            fontWeight: FontWeight.w600),),
      ),
    );
  }

  Widget buildDrawMark(String mark, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Text(mark, style: TextStyle(
          fontSize: 18.sp, color: color, fontWeight: FontWeight.w500),),
    );
  }

  Widget buildDrawNum(String num, GameRoomLogic logic,
      {showWaittingImg = false}) {
    // GameRoomState state = logic.state;
    // var color = state.roomType.value == 1 ? ColorX.color_f7f8fb : ColorX
    //     .color_c7956f;
    return Container(
      width: 24.r,
      height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.cardBg3(), borderRadius: BorderRadius.circular(15.r),),
      child: Text(num == "-1" ? "?":num, style: TextStyle(fontSize: 14.sp,
          color: ColorX.text0917(),
          fontWeight: FontWeight.w600),),
    );
  }
}
