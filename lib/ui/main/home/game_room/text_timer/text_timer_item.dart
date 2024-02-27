import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';

class TextTimerItem extends StatefulWidget {
 
  final String gameCode;
  final Rx<Pc28LottoEntity> timerGroup;

  TextTimerItem( this.gameCode, this.timerGroup,{super.key });

  @override
  TextTimerItemState createState() => TextTimerItemState();
}

class TextTimerItemState extends State<TextTimerItem> {
  late Timer _timer;
  Map<String, dynamic> roomInf = {};
  late final Rx<Pc28LottoEntity> timerGroup;
  TextItemLogic? logic=Get.find<TextItemLogic>();
  String timer="";

  @override
  void initState() {
    super.initState();
    // 初始时调用一次
    timerGroup = widget.timerGroup;
    logic?.loadDataGameCode(widget.gameCode);
    // 设置定时任务，每120秒执行一次
    _timer = Timer.periodic(Duration(seconds: 50), (Timer timer) {
      logic?.loadDataGameCode(widget.gameCode);
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // 销毁时取消定时任务
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 在这里构建你的 UI，使用 roomInf 数据
    return GetBuilder<TextItemLogic>(
        id: "textTimerItem",
        builder: (logic) {
          print("开始刷新logic");
          String result = "";
          if (Intr().fengpanzhong == logic.state.text_timer.value) {
            result = Intr().fengpanzhong;
          } else {
            result = logic.subToTime(logic.state.text_timer.value)??"";
          }
          return Container(
              height: 20,
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.w)),
                  color: Color(0xFFFC243B)),
              child: Text(result,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 12.sp,
                  )));
        });
  }

  // buildText() {
  //   return Row(
  //     children: [
  //       buildTime("02"),
  //       Text(
  //         " : ",
  //         style: TextStyle(fontSize: 12, color: Color(0xFFFC243B)),
  //       ),
  //       buildTime("59"),
  //       Text(
  //         " 后结束 ",
  //         style: TextStyle(fontSize: 12, color: Color(0xFFFC243B)),
  //       ),
  //     ],
  //   );
  // }

  Widget buildTime(String time) {
    return Container(
      width: 20.w,
      height: 20.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
          color: Color(0xFFFC243B)),
      child: Text(
        "${time}",
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 12, color: Colors.white),
      ),
    );
  }

  Widget buildUserTab(int i, String tab, String icon, Color color,
      BuildContext context, GameRoomLogic logic) {
    return InkWell(
      onTap: () => logic.onTabClick(context, i),
      child: Column(
        children: [
          Image.asset(
            icon,
            color: color,
          ),
          Text(
            tab,
            style: TextStyle(fontSize: 12.sp, color: color),
          ),
        ],
      ),
    );
  }
}
