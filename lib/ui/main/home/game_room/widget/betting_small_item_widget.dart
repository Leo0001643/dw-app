import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/audio_utils.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/odds_content.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';

class BettingSmallItemWidget extends StatefulWidget {
  int index=0;
  RxList<OddsContent> selectBetting;
  RxString inputAmt;
  OddsContent content;
  bool? useNoColor=false;
  String betName;
  bool? tema;
  BettingSmallItemWidget(this.index,this.content,this.selectBetting,this.inputAmt,this.betName,this.tema,{super.key,this.useNoColor});

  @override
  State<StatefulWidget> createState() => StateBettingSmallItemWidget();

}

class StateBettingSmallItemWidget extends State<BettingSmallItemWidget>{

  // Map<String,String> keyMap={};

  @override
  Widget build(BuildContext context) {
    String result = "";
    if(widget.betName == Intr().tema){
      result = int.parse(widget.content.type.em()) < 10 ? "0${widget.content.type}" : widget.content.type.em();
    } else {
      result = "${widget.index}";
    }
    print("=====>${jsonEncode(widget.content.toJson())}");
    return InkWell(
      onTap: (){
        ///提示音
        if(AppData.promptTone()){ AudioUtils().playBetSelect(); }
        updateBettingDialogItemWidget(widget.content);
      },
      child: Container(
        width: 52.w,
        height: 59.h,
        // padding: EdgeInsets.only(top: 9.w,bottom:7.w ),
        decoration:
        widget.content.check==true? BoxDecoration(
          boxShadow:[ BoxShadow(
              color: Colors.black.withOpacity(0.18),
              offset: Offset(0,3),
              blurRadius: 2,
              spreadRadius: 0
          )],
          border: Border.all(
              width: 0.5,
              color:ColorX.cardBg15(),
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
          border: Border.all(width: 1.w, color:ColorX.cardBg15(),),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          gradient: LinearGradient(
              begin : Alignment.topCenter,
              end : Alignment.bottomCenter,
              colors: ColorX.cardColors(),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 28.r,
              height: 28.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorX.cardBg(),
                border: Border.all(
                    width: 1.w,
                    color:ColorX.cardBg16()
                ),
                borderRadius: BorderRadius.all(Radius.circular(14.r)),
              ),
              child: Text(result,style: TextStyle(
                  fontSize:13.sp,
                  color: widget.tema == true ? getTagColor(widget.index):ColorX.text0917(),
                  fontWeight: FontWeight.w700,
              ),),
            ),
            Text("${widget.content.play}",style: TextStyle(
                fontSize:12.sp,
                color: widget.content.check==true? ColorX.textff516() : ColorX.textd53(),
                fontWeight: FontWeight.w500
            ),),
          ],
        ),
      ),
    );
  }

  Color getTagColor(int index) {
    switch(index){
      case 3:
      case 4:
      case 9:
      case 10:
      case 14:
      case 15:
      case 20:
      case 25:
      case 26:
        return ColorX.color_5583e7;
      case 0:
      case 5:
      case 6:
      case 11:
      case 16:
      case 17:
      case 21:
      case 22:
      case 27:
        return ColorX.color_23a81d;
      default:
        return ColorX.color_fc243b;
    }
  }


  // saveColorType(OddsContent con) {
  //   if (con.type?.contains(GameRuleUtil.GameType_Second)==true) {
  //     setTag(GameRuleUtil.Key_Type, GameRuleUtil.GameType_Second);
  //     setTag(GameRuleUtil.Key_Name, GameRuleUtil.GameType_Second_Cao_Bet);
  //     setTag(GameRuleUtil.Key_Num, con.type?.replaceAll("${GameRuleUtil.GameType_Second}_", "")??"");
  //   } else if (con.type?.contains(GameRuleUtil.GameType_First)==true) {
  //     setTag(GameRuleUtil.Key_Type, GameRuleUtil.GameType_First);
  //     setTag(GameRuleUtil.Key_Name, GameRuleUtil.GameType_Frist_Cao_Bet);
  //     setTag(GameRuleUtil.Key_Num, con.type?.replaceAll("${GameRuleUtil.GameType_First}_", ""));
  //   } else if (con.type?.contains(GameRuleUtil.GameType_Three)==true) {
  //     setTag(GameRuleUtil.Key_Type, GameRuleUtil.GameType_Three);
  //     setTag(GameRuleUtil.Key_Name, GameRuleUtil.GameType_Thire_Cao_Bet);
  //     setTag(GameRuleUtil.Key_Num, con.type?.replaceAll("${GameRuleUtil.GameType_Three}_", ""));
  //   } else {
  //     setTag(GameRuleUtil.Key_Type, con.type);
  //     setTag(GameRuleUtil.Key_Name, con.name);
  //   }
  //   String ssb="";
  //   if (keyMap[GameRuleUtil.Key_Num]!=null) {
  //     ssb=getTag(GameRuleUtil.Key_Num);
  //   } else {
  //     setTag(GameRuleUtil.Key_Odds, con.play);
  //     if (con.type == GameRuleUtil.GameType_Big) {
  //       String betTypeName = GameRuleUtil.getBallNameMaxMin(GameRuleUtil.GameType_Big);
  //       ssb = betTypeName;
  //     } else if (con.type == GameRuleUtil.GameType_Small) {
  //       String betTypeName = GameRuleUtil.getBallNameMaxMin(GameRuleUtil.GameType_Small);
  //       ssb =betTypeName;
  //     } else if (con.type == GameRuleUtil.GameType_Odd) {
  //       String betTypeName = GameRuleUtil.getBallNameMaxMin(GameRuleUtil.GameType_Odd);
  //       ssb = betTypeName;
  //     } else if (con.type == GameRuleUtil.GameType_Even) {
  //       String betTypeName = GameRuleUtil.getBallNameMaxMin(GameRuleUtil.GameType_Even);
  //       ssb = betTypeName;
  //     } else {
  //       ssb =con.name??"";
  //     }
  //   }
  //   setTag(GameRuleUtil.Key_Odds, con.play);
  //   return ssb;
  // }

  // setTag(String key,String? value) {
  //   keyMap[key]=value??"";
  // }
  // String getTag(String key) {
  //   return keyMap[key]??"";
  // }

  void updateBettingDialogItemWidget(OddsContent content) {
    content.check=!(content.check??false);
    // print("=======> inputAmt.value   ${inputAmt.value}");
    if(content.check == true) {
      // if(int.tryParse(content.type.em()) != null){
      //   content.name = "${widget.betName}-${content.level}";
      // }else if(content.type?.contains("cao") == true){
      //   content.name = "${widget.betName}-${content.level}";
      // }
      content.money = DataUtils.formatDouble(widget.inputAmt.value);
      widget.selectBetting.add(content);
    } else {
      widget.selectBetting.remove(content);
      content.money=0;
    }
    widget.selectBetting.refresh();
    setState(() {

    });
  }




}

