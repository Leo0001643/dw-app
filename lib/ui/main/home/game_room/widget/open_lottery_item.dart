import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
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
    WSLotteryEntity wsBetResultEntity = widget.gameRoomItemEntity.data as WSLotteryEntity;
    WSLotteryEntityData? wSLotteryEntityData=wsBetResultEntity.data?.first;
    int a = 0;
    int b = 0;
    int c = 0;
    if((wSLotteryEntityData?.originalNum?.length??0)>=3){
       a=int.tryParse(wSLotteryEntityData?.originalNum?[0]??"0") ?? 0;
       b=int.tryParse(wSLotteryEntityData?.originalNum?[1]??"0") ?? 0;
       c=int.tryParse(wSLotteryEntityData?.originalNum?[2]??"0") ?? 0;
    } else {
      loggerArray(["出现000啦",wSLotteryEntityData?.originalNum]);
      ///开奖号码为空，那说明在开奖中进入房间了，所以不显示
      return Container();
    }

    return Container(
      margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 8.w,top: 8.w),
      decoration: BoxDecoration(
          color: ColorX.cardBg3(),
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Intr().kaijiangjieguo,
            style: TextStyle(fontSize: 14.sp, color: ColorX.color_529aff),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "【",
                    style: TextStyle(fontSize: 14.sp,fontWeight:FontWeight.w700, color: ColorX.text586()),
                  ),
                  Text(
                    Intr().dixqi([wSLotteryEntityData?.term ?? '']),
                    style: TextStyle(fontSize: 14.sp,fontWeight:FontWeight.w700, color: ColorX.color_fc243b),
                  ),
                  Text(
                    "】",
                    style: TextStyle(fontSize: 14.sp,fontWeight:FontWeight.w700, color: ColorX.text586()),
                  ),
                ],
              ),
              SizedBox(width: 8.w,),
              Expanded(
                child: Text(
                  "${Intr().kaijianghaoma}:$a+$b+$c=${(a+b+c)}",
                  style: TextStyle(fontSize: 14.sp, color: ColorX.text586()),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
