import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_timer_logic.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_timer_state.dart';

import '../../../../app/intl/intr.dart';
import '../../../bean/game_kind_entity.dart';
import '../../../bean/pc28_lotto_entity.dart';

class TextSelectTimerPage extends StatefulWidget {
  TextTimerLogic logic;
  String gameCode;
  TextSelectTimerPage(this.logic,this.gameCode);

  @override
  _TextTimerPageState createState() => _TextTimerPageState();
}

class _TextTimerPageState extends State<TextSelectTimerPage> {
  late Timer _timer;
  Map<String, dynamic> roomInf = {};
  late final Rx<Pc28LottoEntity> timerGroup;

  @override
  void initState() {
    super.initState();
    // 初始时调用一次
    widget.logic.loadDataGameCode(widget.gameCode);
    // 设置定时任务，每120秒执行一次
    _timer = Timer.periodic(Duration(seconds: 120), (Timer timer) {
      widget.logic.loadDataGameCode(widget.gameCode);
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
      print("========> text_timer ${widget.gameCode}  ${widget.logic.state.text_timer.value}");

      if (!widget.logic.state.text_timer.value.contains(Intr().fengpanzhong)) {
        if (widget.logic.state.text_timer.value.startsWith (Intr().dengdaikaipan)) {
          return Text(widget.logic.state.text_timer.value,
              style: TextStyle(color: Colors.greenAccent));
        }
        return Text(widget.logic.state.text_timer.value,
            style: const TextStyle(fontWeight: FontWeight.w700,color: ColorX.color_333333));
      } else {
        return Text(
          widget.logic.state.text_timer.value,
          style: TextStyle(color: Colors.red,fontWeight: FontWeight.w700,),
        );
      }

    });
  }
}