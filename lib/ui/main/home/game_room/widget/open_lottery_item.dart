import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/socket/ws_lottery_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';

class OpenLotteryItem extends StatefulWidget {
  final int index;
  final GameRoomLogic logic;
  final GameRoomItemEntity gameRoomItemEntity;

  const OpenLotteryItem(this.index, this.logic, this.gameRoomItemEntity,
      {super.key});


  @override
  State<StatefulWidget> createState() => StateOpenLotteryItem();
}

class StateOpenLotteryItem extends State<OpenLotteryItem> {
  @override
  Widget build(BuildContext context) {
    WSLotteryEntity? wsBetResultEntity =
        widget.gameRoomItemEntity.data as WSLotteryEntity;
    WSLotteryEntityData? wSLotteryEntityData=wsBetResultEntity.data?[0];
    int a = 0;
    int b = 0;
    int c = 0;
    if((wSLotteryEntityData?.originalNum?.length??0)>=3){
       a=int.tryParse(wSLotteryEntityData?.originalNum?[0]??"0")??0;
       b=int.tryParse(wSLotteryEntityData?.originalNum?[1]??"0")??0;
       c=int.tryParse(wSLotteryEntityData?.originalNum?[2]??"0")??0;
    }


    return Container(
      margin: EdgeInsets.only(left: 50.w,right: 20.w,bottom: 8.w,top: 8.w),
      decoration: const BoxDecoration(
          color: Color(0xFFF7F8FB),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Intr().kaijiangjieguo,
            style: TextStyle(fontSize: 14.sp, color: Color(0xFF4795FF)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "【",
                    style: TextStyle(fontSize: 14.sp, color: Color(0xFF596A8D)),
                  ),
                  Text(
                    "${(wsBetResultEntity.data?.length ?? 0) > 0 ? wSLotteryEntityData?.term :"" }",
                    style: TextStyle(fontSize: 14.sp, color: Color(0xFFE62912)),
                  ),
                  Text(
                    "】",
                    style: TextStyle(fontSize: 14.sp, color: Color(0xFF596A8D)),
                  ),
                ],
              ),
              SizedBox(width: 8.w,),
              Expanded(
                child: Text(
                  "${Intr().kaijianghaoma}:$a+$b+$c=${(a+b+c)}",
                  style: TextStyle(fontSize: 14.sp, color: Color(0xFF596A8D)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
