import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';
import 'package:leisure_games/ui/main/home/game_room/widget/game_rcently_bet_widget.dart';

class HistoryLotteryBtmDialog extends StatelessWidget {
  int type = 0;

  HistoryLotteryBtmDialog({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<GameRoomLogic>(
        id: "gameRoomComputeWidget",
        builder: (logic) {

      return Container(
        height: 0.77.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          // color: ColorX.cardBg5(),
            color:Color(0xFFF7F8FB),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        child:   Column(
          children: [
            buildHeadTime(logic),
            Container(
              height: 0.69.sh,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: logic.recentlyWSLotteryEntityData.length,
                itemBuilder: (context, index) {
                  return GameRecentlyBetWidget(logic.recentlyWSLotteryEntityData[index],true);
                },
              ),
            )
          ],
        ),
      );
    }
    );
  }

  String buildRoomHeadType(GameRoomLogic logic) {
    switch (logic.state.roomType.value) {
      case 2:
        return ImageX.ic_2room_last;
      case 3:
        return ImageX.ic_3room_last;
      default:
        return ImageX.ic_1room_last;
    }
  }

  Widget buildDrawTime(String time) {
    return Container(
      width: 26.r,
      height: 26.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.color_10_fff,
        border: Border.all(color: Colors.white, width: 1.r),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Text(
        time,
        style: TextStyle(
            fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildDrawNum(String num) {
    return Container(
      width: 24.r,
      height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.cardBg2(),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Text(
        num,
        style: TextStyle(
            fontSize: 14.sp,
            color: ColorX.text0917(),
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildDrawMark(String mark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Text(
        mark,
        style: TextStyle(
            fontSize: 18.sp,
            color: ColorX.text0917(),
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildDrawResult(String result) {
    return Container(
      width: 24.r,
      height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorX.color_10_fc2,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Text(
        result,
        style: TextStyle(
            fontSize: 14.sp,
            color: ColorX.color_fc243b,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  buildHeadTime(GameRoomLogic logic) {
    String termData = GameRuleUtil.getSSB(logic.term.value, year: "");
    return  Container(
      margin: EdgeInsets.only(left: 14.w,right: 14.w,top: 10.w),
      decoration: buildRoomBoxType(logic),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            termData,
            style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          getTimer(),
        ],
      ),
    );
  }



  Widget getTimer() {
    // 在这里构建你的 UI，使用 roomInf 数据
    return GetBuilder<TextItemLogic>(
        id: "textTimerItem",
        builder: (logic) {
          print("开始刷新logic");
          String result = "";

          String term1 = "";
          String term2 = "";
          if (Intr().fengpanzhong == logic?.state.text_timer.value) {
            result = Intr().fengpanzhong;
            type = 0;
          } else {
            type = 1;
            result =
                logic?.subToTime(logic!.state.text_timer.value) ?? "";
            try {
              term1 = result.split(":")[0];
              term2 = result.split(":")[1];
            } catch (e) {
              print("==========>${e.toString()}");
            }
          }
          return type == 0 ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Colors.white54,
            ),
            padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
            alignment: Alignment.center,
            child: Text(Intr().fengpanzhong,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 16.sp,
                )),
          ) :
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Colors.white54,
            ),
            padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
            child: Row(
              children: [
                Text(term1,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 16.sp,
                    )),
                SizedBox(width: 4.w,),
                Text(":",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 16.sp,
                    )),
                SizedBox(width: 4.w,),
                Text(term2,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 16.sp,
                    )),
                // Text("后结束",
                //     style: TextStyle(
                //       fontWeight: FontWeight.w500,
                //       color: Colors.white,
                //       fontSize: 16,
                //     )),
              ],
            ),
          );
        });
  }


  BoxDecoration buildRoomBoxType(GameRoomLogic logic) {
    var color = ColorX.color_fc243b;
    switch (logic.state.roomType.value) {
      case 1:
        color = ColorX.color_fc243b;
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
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r))
    );
  }


}



