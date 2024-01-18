
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
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_bet_result_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';

import 'utils/game_rule_util.dart';

class SystemMessgeItem extends StatefulWidget{

  final int index;
  final GameRoomLogic logic;
  final GameRoomItemEntity<dynamic> gameRoomItemEntity;
  const SystemMessgeItem(this.index,this.logic,this.gameRoomItemEntity, {super.key});

  @override
  State<StatefulWidget> createState() =>StateSystemMessgeItem();

}

class StateSystemMessgeItem extends State<SystemMessgeItem>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey
      ),
      child: SizedBox(),
    );
  }



}




