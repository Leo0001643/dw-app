import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/audio_utils.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/odds_content.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';

class BettingDialogItemWidget extends StatefulWidget {
  int index=0;
  OddsContent content;
  RxList<OddsContent> selectBetting;
  RxString inputAmt;
  String betName;

  BettingDialogItemWidget(this.index,this.content,this.selectBetting,this.inputAmt,this.betName,{super.key});


  @override
  State<StatefulWidget> createState() => StateBettingDialogItemWidget();

}

class StateBettingDialogItemWidget extends State<BettingDialogItemWidget>{
  Map<String,String> keyMap={};

  @override
  Widget build(BuildContext context) {
    String ssb=saveColorType(widget.content);
    // String play=getTag(key)
    print("==big0dd===>$ssb, ${jsonEncode(widget.content.toJson())}");

    return InkWell(
      onTap: (){
        // widget.content.contentMap=keyMap;
        ///提示音
        if(AppData.promptTone()){ AudioUtils().playBetSelect(); }
        updateBettingDialogItemWidget(widget.content);
      },
      child: Container(
        width: 64.w,
        height: 63.2.w,
        padding: EdgeInsets.only(top: 9.w,bottom:7.w ),
        decoration:
        widget.content.check==true? BoxDecoration(
          boxShadow:[ BoxShadow(
              color: Colors.black.withOpacity(0.18),
              offset: Offset(0,3),
              blurRadius: 2,
              spreadRadius: 0
          )],
          border: Border.all(
              width: 1.w,
              color:ColorX.cardBg15()
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          gradient: LinearGradient(
              begin : Alignment.topCenter,
              end : Alignment.bottomCenter,
              colors: ColorX.cardSelColors()),
        ):
        BoxDecoration(
          boxShadow:[ BoxShadow(
              color: Colors.black.withOpacity(0.18),
              offset: Offset(0,3),
              blurRadius: 2,
              spreadRadius: 0
          )],
          border: Border.all(
              width: 1.w,
              color:ColorX.cardBg5(),
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          gradient: LinearGradient(
              begin : Alignment.topCenter,
              end : Alignment.bottomCenter,
              colors: ColorX.cardColors()),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(ssb,style: TextStyle(
                fontSize:13.sp,
                color: ColorX.text0917(),
                fontWeight: FontWeight.w700
            ),),
            Text("${widget.content.play}",style: TextStyle(
                fontSize:13.sp,
                color: widget.content.check==true? ColorX.textff516() : ColorX.textd53(),
                fontWeight: FontWeight.w500
            ),),
          ],
        ),
      ),
    );
  }

  saveColorType(OddsContent con){
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
      if (con.type?.endsWith(GameRuleUtil.GameType_Big) == true) {
        String betTypeName = GameRuleUtil.getBallNameMaxMin(GameRuleUtil.GameType_Big);
        ssb = betTypeName;
      } else if (con.type?.endsWith(GameRuleUtil.GameType_Small) == true) {
        String betTypeName = GameRuleUtil.getBallNameMaxMin(GameRuleUtil.GameType_Small);
        ssb =betTypeName;
      } else if (con.type?.endsWith(GameRuleUtil.GameType_Odd) == true) {
        String betTypeName = GameRuleUtil.getBallNameMaxMin(GameRuleUtil.GameType_Odd);
        ssb = betTypeName;
      } else if (con.type?.endsWith(GameRuleUtil.GameType_Even) == true) {
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

  void updateBettingDialogItemWidget(OddsContent content) {
    content.check=!(content.check??false);
    // print("=======> inputAmt.value   ${inputAmt.value}");
    if(content.check==true) {
      content.money = DataUtils.formatDouble(widget.inputAmt.value);
      widget.selectBetting.add(content);
    }else{
      widget.selectBetting.remove(content);
      content.money=0;
    }
    widget.selectBetting.refresh();
    setState(() {

    });
  }

}




