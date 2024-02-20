import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart' as WS;
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';

class BettingSmallItemWidget extends StatelessWidget {
  Map<String,String> keyMap={};
  int index=0;
  OddsContent content;
  bool? useNoColor=false;
  BettingSmallItemWidget(this.index,this.content,{super.key,this.useNoColor});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameRoomLogic>(
        builder: (logic){
      String ssb=saveColorType(content);
      // String play=getTag(key)
      String result="$index";
      if(index<10) {
        result="0$index";
      }
      print("=====>${jsonEncode(content.toJson())}");
      return InkWell(
        onTap: (){
          content.contentMap=keyMap;
          logic.updateBettingDialogItemWidget(content);
        },
        child: Container(
          width: 52.w,
          height: 59.w,
          padding: EdgeInsets.only(top: 9.w,bottom:7.w ),
          decoration:

          content.check==true? BoxDecoration(
            boxShadow:[ BoxShadow(
                color: Colors.black.withOpacity(0.18),
                offset: Offset(0,3),
                blurRadius: 2,
                spreadRadius: 0
            )],
            border: Border.all(
                width: 0.5,
                color:Colors.white
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            gradient: const LinearGradient(
                begin : Alignment.topCenter,
                end : Alignment.bottomCenter,
                colors: [Color(0xFFFFEED4), Color(0xFFFFF5D0)]),
          ):
          BoxDecoration(
            boxShadow:[ BoxShadow(
                color: Colors.black.withOpacity(0.18),
                offset: Offset(0,3),
                blurRadius: 2,
                spreadRadius: 0
            )],
            border: Border.all(
                width: 0.5,
                color:Colors.white
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: const LinearGradient(
                begin : Alignment.topCenter,
                end : Alignment.bottomCenter,
                colors: [Colors.white, Color(0xFFF3F4F9)]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 28.w,
                height: 28.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 1,
                      color:Color(0xFFE7EBF4)
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
                child: Text(result,style: TextStyle(
                    fontSize:13,
                    color:useNoColor==true?Color(0xFF091722):GameRuleUtil.colorMap[index%6]??Color(0xFF06A100),
                    fontWeight: FontWeight.w700
                ),),
              ),
              Text("${content.play}",style: TextStyle(
                  fontSize:13.sp,
                  color: const Color(0xFFD73547),
                  fontWeight: FontWeight.w500
              ),),
            ],
          ),
        ),
      );
    });
  }
  saveColorType(OddsContent con) {
     if (con.type?.contains(GameRuleUtil.GameType_Second)==true) {
       setTag(GameRuleUtil.Key_Type, GameRuleUtil.GameType_Second);
       setTag(GameRuleUtil.Key_Name, GameRuleUtil.GameType_Second_Cao_Bet);
       setTag(GameRuleUtil.Key_Num, con.type?.replaceAll("${GameRuleUtil.GameType_Second}_", "")??"");
     } else if (con.type?.contains(GameRuleUtil.GameType_First)==true) {
       setTag(GameRuleUtil.Key_Type, GameRuleUtil.GameType_First);
       setTag(GameRuleUtil.Key_Name, GameRuleUtil.GameType_Frist_Cao_Bet);
       setTag(GameRuleUtil.Key_Num, con.type?.replaceAll("${GameRuleUtil.GameType_First}_", ""));
     } else if (con.type?.contains(GameRuleUtil.GameType_Three)==true) {
       setTag(GameRuleUtil.Key_Type, GameRuleUtil.GameType_Three);
       setTag(GameRuleUtil.Key_Name, GameRuleUtil.GameType_Thire_Cao_Bet);
       setTag(GameRuleUtil.Key_Num, con.type?.replaceAll("${GameRuleUtil.GameType_Three}_", ""));
     } else {
       setTag(GameRuleUtil.Key_Type, con.type);
       setTag(GameRuleUtil.Key_Name, con.name);
     }
     String ssb="";
     if (keyMap[GameRuleUtil.Key_Num]!=null) {
       ssb=getTag(GameRuleUtil.Key_Num);
     } else {
       setTag(GameRuleUtil.Key_Odds, con.play);
       if (con.type?.contains(GameRuleUtil.GameType_Big)==true) {
         String betTypeName = GameRuleUtil.getBallNameMaxMin(GameRuleUtil.GameType_Big);
         ssb = betTypeName;
       } else if (con.type?.contains(GameRuleUtil.GameType_Small)==true) {
         String betTypeName = GameRuleUtil.getBallNameMaxMin(GameRuleUtil.GameType_Small);
         ssb =betTypeName;
       } else if (con.type?.contains(GameRuleUtil.GameType_Odd)==true) {
         String betTypeName = GameRuleUtil.getBallNameMaxMin(GameRuleUtil.GameType_Odd);
         ssb = betTypeName;
       } else if (con.type?.contains(GameRuleUtil.GameType_Even)==true) {
         String betTypeName = GameRuleUtil.getBallNameMaxMin(GameRuleUtil.GameType_Even);
         ssb = betTypeName;
       } else {
          ssb =con.name??"";
       }
     }
     setTag(GameRuleUtil.Key_Odds, con.play);
     return ssb;
  }

  setTag(String key,String? value) {
    keyMap[key]=value??"";
  }
  String getTag(String key) {
    return keyMap[key]??"";
  }
}
