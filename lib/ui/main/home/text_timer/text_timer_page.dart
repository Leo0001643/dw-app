import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_timer_logic.dart';

import '../../../../app/intl/intr.dart';
import '../../../bean/game_kind_entity.dart';
import '../../../bean/pc28_lotto_entity.dart';

class TextTimerPage extends StatefulWidget {
  final GameKindGameKindList gamekindGroup;
  final Rx<Pc28LottoEntity> timerGroup;

  TextTimerPage(this.gamekindGroup, this.timerGroup);

  @override
  _TextTimerPageState createState() => _TextTimerPageState();
}

class _TextTimerPageState extends State<TextTimerPage> {
  late Timer _timer;
  Map<String, dynamic> roomInf = {};
  late final Rx<Pc28LottoEntity> timerGroup;
  late TextTimerLogic logic;

  @override
  void initState() {
    super.initState();
    // 初始时调用一次
    timerGroup = widget.timerGroup;
    logic = TextTimerLogic(type: widget.gamekindGroup.gameCode);
    logic.loadData(widget.gamekindGroup);
    // 设置定时任务，每120秒执行一次
    _timer = Timer.periodic(Duration(seconds: 120), (Timer timer) {
      logic.loadData(widget.gamekindGroup);
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
    return Obx(() {
      // loggerArray(["回调到这里来希纳是了",widget.logic.text_timer.value]);
      return Visibility(
        visible: unEmpty(logic.text_timer.value),
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(100.r),
            ),
            margin: EdgeInsets.symmetric(vertical: 2.r, horizontal: 1.r),
            child: LayoutBuilder(
              builder: (context,cts){
                if (!logic.text_timer.value.contains(Intr().fengpanzhong)) {
                  if (logic.text_timer.value.startsWith(Intr().dengdaikaipan)) {
                    return Text(logic.text_timer.value,
                        style: TextStyle(color: Colors.greenAccent,fontSize: 12.sp));
                  }
                  return Text(logic.text_timer.value,
                      style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 12.sp));
                } else {
                  return Text(
                    logic.text_timer.value,
                    style: TextStyle(color: Colors.red,fontSize: 12.sp),
                  );
                }
              },
            )
        ),
      );
    });
  }
}
