import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart' as WS;

import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';

class BettingChildPage extends StatefulWidget{
  String ballName;
  int index;
  BettingChildPage(this.index,this.ballName,{super.key});
  @override
  State<StatefulWidget> createState() {
    return BettingChildPageState();
  }
  
  
  
}
class BettingChildPageState extends State<BettingChildPage> {
  var selectPhrases = (-1).obs;

  ///实际显示使用的列表
  var showList = RxList.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initItem();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameRoomLogic>(builder: (logic) {
      Map<int, WS.Content> arrayMap = {};

      GameRuleUtil.dealData(logic.odds.value, widget.ballName);
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 6.w,
            spacing: 6.h,
            children: [
              buildSizeCard(""),
              buildSizeCard(""),
              buildSizeCard(""),
              buildSizeCard(""),
              buildSizeCard(""),
              buildSizeCard(""),
              buildSizeCard(""),
              buildSizeCard(""),
              buildSizeCard(""),
              buildSizeCard(""),
              buildWaveCard(""),
              buildWaveCard(""),
              buildWaveCard(""),
              buildWaveCard(""),
              buildWaveCard(""),
              buildWaveCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
              buildNumCard(""),
            ],
          ),
        ),
      );
    });
  }

  Widget buildSizeCard(String item) {
    return SizedBox(
      width: 64.w,
      child: GFCard(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 1.r,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: LinearGradient(
              colors: ColorX.cardColors(),
              // colors: [Color(0xffffeed4),Color(0xfffff5d0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: 64.w,
          height: 63.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 6.h,),
              Text("大",
                style: TextStyle(fontSize: 13.sp, color: ColorX.text0917()),),
              SizedBox(height: 15.h,),
              Text("4.2",
                style: TextStyle(fontSize: 13.sp, color: ColorX.textd53()),),
              SizedBox(height: 6.h,),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildWaveCard(String item) {
    return SizedBox(
      width: 52.w,
      child: GFCard(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 1.r,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: LinearGradient(
              colors: ColorX.cardColors(),
              // colors: [Color(0xffffeed4),Color(0xfffff5d0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: 52.w,
          height: 59.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.h,),
              Text("大",
                style: TextStyle(fontSize: 13.sp, color: ColorX.text0917()),),
              SizedBox(height: 15.h,),
              Text("4.2",
                style: TextStyle(fontSize: 13.sp, color: ColorX.textd53()),),
              SizedBox(height: 3.h,),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNumCard(String item) {
    return SizedBox(
      width: 52.w,
      child: GFCard(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 1.r,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: LinearGradient(
              colors: ColorX.cardColors(),
              // colors: [Color(0xffffeed4),Color(0xfffff5d0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: 52.w,
          height: 59.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.h,),
              Container(
                alignment: Alignment.center,
                width: 28.r,
                height: 28.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: ColorX.color_e7ebf4, width: 1.r),
                ),
                child: Text("04", style: TextStyle(
                    fontSize: 14.sp, color: ColorX.color_5583e7),),
              ),
              SizedBox(height: 3.h,),
              Text("4.2",
                style: TextStyle(fontSize: 13.sp, color: ColorX.textd53()),),
              SizedBox(height: 3.h,),
            ],
          ),
        ),
      ),
    );
  }



  void initItem() {}

}