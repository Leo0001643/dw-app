import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_timer_logic.dart';

import '../../../../app/intl/intr.dart';
import '../../../bean/game_kind_entity.dart';
import '../../../bean/pc28_lotto_entity.dart';

class TextTimerPage extends StatefulWidget {
  TextTimerLogic logic;
  final GameKindGameKindList gamekindGroup;
  final Rx<Pc28LottoEntity> timerGroup;

  TextTimerPage(this.logic, this.gamekindGroup, this.timerGroup);

  @override
  _TextTimerPageState createState() => _TextTimerPageState();
}

class _TextTimerPageState extends State<TextTimerPage> {
  late Timer _timer;
  Map<String, dynamic> roomInf = {};
  late final Rx<Pc28LottoEntity> timerGroup;

  @override
  void initState() {
    super.initState();
    // 初始时调用一次
    timerGroup = widget.timerGroup;
    widget.logic.loadData(widget.gamekindGroup);
    // 设置定时任务，每120秒执行一次
    _timer = Timer.periodic(Duration(seconds: 120), (Timer timer) {
      widget.logic.loadData(widget.gamekindGroup);
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
      if (!widget.logic.state.text_timer.value.contains(Intr().fengpanzhong)) {
        if (widget.logic.state.text_timer.value.startsWith(Intr().dengdaikaipan)) {
          return Text(widget.logic.state.text_timer.value,
              style: TextStyle(color: Colors.greenAccent));
        }
        return Text(widget.logic.state.text_timer.value,
            style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white));
      } else {
        return Text(
          widget.logic.state.text_timer.value,
          style: TextStyle(color: Colors.red),
        );
      }
    });
  }
}
