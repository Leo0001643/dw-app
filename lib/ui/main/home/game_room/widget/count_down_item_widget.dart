import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/count_down_lottery_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_bet_result_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_lottery_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';

import '../utils/game_rule_util.dart';

class CountDownItemWidget extends StatefulWidget {
  final int index;
  final GameRoomLogic logic;
  final GameRoomItemEntity<dynamic> gameRoomItemEntity;

  const CountDownItemWidget(this.index, this.logic, this.gameRoomItemEntity,
      {super.key});


  @override
  State<StatefulWidget> createState() => StateCountDownItemWidget();
}

class StateCountDownItemWidget extends State<CountDownItemWidget> {
  @override
  Widget build(BuildContext context) {
    CountDownLotteryEntity? wsBetResultEntity =
        widget.gameRoomItemEntity.data as CountDownLotteryEntity;
    print("======>  ${jsonEncode(   widget.gameRoomItemEntity.data )}");
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 50.w,right: 20.w,bottom: 8.w,top: 8.w),
      decoration: BoxDecoration(
          color: Color(0xFFF7F8FB),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${wsBetResultEntity.title}",
            style: TextStyle(fontSize: 14, fontWeight:FontWeight.w700,color: Color(wsBetResultEntity.titleColor??0xFF58698D)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "【",
                    style: TextStyle(fontSize: 14, color: Color(0xFF596A8D)),
                  ),
                  Text(
                    "${wsBetResultEntity?.term}",
                    style: TextStyle(fontSize: 14, fontWeight:FontWeight.w700, color: Color(0xFFE62912)),
                  ),
                  const Text(
                    "】",
                    style: TextStyle(fontSize: 14,  fontWeight:FontWeight.w700,color: Color(0xFF596A8D)),
                  ),
                ],
              ),
              SizedBox(width: 8,),
              Row(
                children: [
                  Text(
                    wsBetResultEntity.subTitile??"距离封盘还有${wsBetResultEntity?.time}秒",
                    style: TextStyle(fontSize: 14, color: Color(0xFF596A8D)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}