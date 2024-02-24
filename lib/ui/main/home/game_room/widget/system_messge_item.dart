
import 'package:flutter/material.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';

class SystemMessgeItem extends StatefulWidget{

  final int index;
  final GameRoomLogic logic;
  final GameRoomItemEntity gameRoomItemEntity;
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




