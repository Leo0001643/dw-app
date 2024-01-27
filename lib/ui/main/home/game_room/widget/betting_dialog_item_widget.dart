import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart' as WS;

class BettingDialogItemWidget extends StatelessWidget {
  int index=0;
  BettingDialogItemWidget(this.index,{super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameRoomLogic>(builder: (logic){
      WS.Content content= logic.dataBettingList.value[index];
      print("=====>${jsonEncode(content.toJson())}");
      return Container(
        width: 64.w,
        height: 63.2.w,
        padding: EdgeInsets.only(top: 9.w,bottom:7.w ),
        decoration: BoxDecoration(
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
          gradient: LinearGradient(
              begin : Alignment.topCenter,
              end : Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFFF3F4F9)]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("大",style: TextStyle(
                fontSize:13,
                color: Color(0xFF091722),
                fontWeight: FontWeight.w700
            ),),
            Text("2",style: TextStyle(
                fontSize:13,
                color: Color(0xFFD73547),
                fontWeight: FontWeight.w500
            ),),
          ],
        ),
      );
    });
  }
}
