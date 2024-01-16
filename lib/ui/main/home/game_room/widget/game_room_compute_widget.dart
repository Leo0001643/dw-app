import 'package:flutter/cupertino.dart';
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
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_state.dart';

class GameRoomComputeWidget extends StatelessWidget {
  final logic = Get.find<GameRoomLogic>();
  final state = Get.find<GameRoomLogic>().state;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<GameRoomLogic>(builder: (logic) {
      GameRoomState state = logic.state;
      var textColor = state.roomType.value == 1 ? ColorX.text0917():Colors.white;
      return  Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h,),
            Divider(height: 1.h,color: ColorX.color_f1f1f1,),
            SizedBox(height: 10.h,),
            buildCurrentTermType(logic,context),
            SizedBox(height: 10.h,),
            Container(
              decoration: buildRoomBoxType(),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(Intr().dixqi(["1231312"]),style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            buildDrawTime("00"),
                            Text(" : ",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                            buildDrawTime("02"),
                            Text(" : ",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                            buildDrawTime("53"),
                            // SizedBox(width: 10.w,),
                            // Text("End",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.h,),
                  buildNotifyItem("⎡20:00] ：The game is over in 3 minutes !",state.roomType.value == 1 ? ColorX.color_091722:Colors.white),
                  buildNotifyItem("⎡21:00] ：The game begins. 18 people in here!",state.roomType.value == 1 ? ColorX.color_091722:Colors.white),
                  SizedBox(height: 10.h,),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
  BoxDecoration buildRoomBoxType() {
    var image = ImageX.ic_1room_last;
    switch(state.roomType.value){
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
      image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill,),
    );
  }

  Widget buildNotifyItem(String text,Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Image.asset(ImageX.icon_ntf,color: color,),
          SizedBox(width: 5.w,),
          Expanded(
            child: Text(text,style: TextStyle(fontSize: 12.sp,color: color),),
          ),
        ],
      ),
    );
  }
  Widget buildDrawTime(String time) {
    return Container(
      width:26.r,height: 26.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.color_10_fff,
        border: Border.all(color: Colors.white,width: 1.r),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(time,style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w600),),
    );
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

  Widget buildCurrentTermType(GameRoomLogic logic,BuildContext context) {
    GameRoomState state = logic.state;
    var color = state.roomType.value == 1 ? ColorX.text0917():ColorX.color_ffe0ac;
    return InkWell(
      onTap: ()=> DialogUtils().showHistoryLotteryBtmDialog(context,logic),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(Intr().dixqi(["1231312"]),style: TextStyle(fontSize: 12.sp,color: color,fontWeight: FontWeight.w500),),
          SizedBox(width: 5.w,),
          buildDrawNum("5",logic),
          buildDrawMark("+",color),
          buildDrawNum("8",logic),
          buildDrawMark("+",color),
          buildDrawNum("5",logic),
          buildDrawMark("=",color),
          buildDrawResult("22",logic),
          // SizedBox(width: 5.w,),
          Text("(大 小)",style: TextStyle(fontSize: 14.sp,color: color,fontWeight: FontWeight.w600),),
          Image.asset(ImageX.icon_down_black,color: color,),
        ],
      ),
    );
  }

  Widget buildDrawResult(String result ,GameRoomLogic logic) {
  GameRoomState state = logic.state;
    var color = state.roomType.value == 1 ? ColorX.color_10_fc2:ColorX.color_c7956f;
    var textColor = state.roomType.value == 1 ? ColorX.color_fc243b:ColorX.color_091722;
    return Container(
      width: 24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(15.r),),
      child: Text(result, style: TextStyle(fontSize: 14.sp,color: textColor,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildDrawMark(String mark,Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Text(mark,style: TextStyle(fontSize: 18.sp,color: color,fontWeight: FontWeight.w500),),
    );
  }
  Widget buildDrawNum(String num,GameRoomLogic logic) {
    GameRoomState state = logic.state;
    var color = state.roomType.value == 1 ? ColorX.color_f7f8fb:ColorX.color_c7956f;
    return Container(
      width: 24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(15.r),),
      child: Text(num, style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
    );
  }
}
