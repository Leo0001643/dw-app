import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_state.dart';

class GameRoomHeadWidget extends StatelessWidget {
  const GameRoomHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<GameRoomLogic>(builder: (logic) {
      GameRoomState state = logic.state;
      var textColor = state.roomType.value == 1 ? ColorX.text0917():Colors.white;
      return  Container(
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(2.r),
                  child: GFAvatar(
                    backgroundImage: WidgetUtils().buildImageProvider(
                        DataUtils.findAvatar(AppData.user()?.avatar)),
                    shape: GFAvatarShape.circle,
                    radius: 17.r,
                  ),
                ),
                Center(
                  child: buildAvatarType(logic),
                ),
              ],
            ),
            SizedBox(
              width: 3.w,
            ),
            buildYueHeader(logic),

            SizedBox(
              width: 50.w,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: buildUserTab(
                      0, Intr().haoyuan, ImageX.icon_radio_uncheck, textColor,context,logic)),
                  Expanded(child: buildUserTab(1, Intr().zhudan, ImageX.icon_dan2, textColor,context,logic)),
                  Expanded(child: buildUserTab(2, Intr().mipai, ImageX.icon_pai2, textColor,context,logic)),
                  Expanded(child: buildUserTab(3, Intr().qushi, ImageX.icon_qs_hei, textColor,context,logic)),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildUserTab(
      int i, String tab, String icon, Color color, BuildContext context,GameRoomLogic logic) {
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
        "¥${state.userBal.value.money.em()}",
        style: TextStyle(
            fontSize: 14.sp, color: color, fontWeight: FontWeight.w500),
      );
    });
  }
}
