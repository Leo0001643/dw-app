
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/count_down_lottery_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';

class CountDownItemWidget extends StatelessWidget {
  final GameRoomLogic logic;
  final GameRoomItemEntity gameRoomItemEntity;

  const CountDownItemWidget(this.logic, this.gameRoomItemEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    CountDownLotteryEntity? wsBetResultEntity = gameRoomItemEntity.data as CountDownLotteryEntity;
    // print("======>  ${jsonEncode(   widget.gameRoomItemEntity.data )}");
    return Container(
      margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 8.w,top: 8.w),
      decoration: BoxDecoration(
          color: ColorX.cardBg3(),
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
      child: isEmpty(wsBetResultEntity.term) ?
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Text(wsBetResultEntity.subTitile.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
      ) :
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            wsBetResultEntity.title.em(),
            style: TextStyle(fontSize: 14.sp, fontWeight:FontWeight.w700,color: Color(wsBetResultEntity.titleColor.em())),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "【",
                style: TextStyle(fontSize: 14.sp, color: ColorX.text586()),
              ),
              Text(
                wsBetResultEntity.term.em(),
                style: TextStyle(fontSize: 14.sp, fontWeight:FontWeight.w700, color: ColorX.color_fd273e),
              ),
              Text(
                "】",
                style: TextStyle(fontSize: 14.sp,  fontWeight:FontWeight.w700,color: ColorX.text586()),
              ),
              SizedBox(width: 8.w,),
              Expanded(
                child: Text(
                  wsBetResultEntity.subTitile.em(),//?? Intr().julifengpanshijian([wsBetResultEntity.time.toString()])
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

// class StateCountDownItemWidget extends State<CountDownItemWidget> {
//
// }
