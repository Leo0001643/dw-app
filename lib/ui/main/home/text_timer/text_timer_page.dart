import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_timer_logic.dart';

import '../../../bean/game_kind_entity.dart';
import '../../../bean/pc28_lotto_entity.dart';

class TextTimerPage extends StatefulWidget {
  final Rx<Pc28LottoEntity> timerGroup;
  final GameKindGameKindList gamekindGroup;

  TextTimerPage(this.gamekindGroup, this.timerGroup);

  @override
  _TextTimerPageState createState() => _TextTimerPageState();
}

class _TextTimerPageState extends State<TextTimerPage> {
  late Timer _timer;
  Map<String, dynamic> roomInf = {};
  late final Rx<Pc28LottoEntity> timerGroup;
  final logic = Get.find<TextTimerLogic>();
  final state = Get.find<TextTimerLogic>().state;
  @override
  void initState() {
    super.initState();
    // 初始时调用一次
    Get.put(TextTimerLogic());
    timerGroup = widget.timerGroup;
    logic.loadData(widget.gamekindGroup,timerGroup.value);
    // 设置定时任务，每120秒执行一次
    _timer = Timer.periodic(Duration(seconds: 120), (Timer timer) {
      logic.loadData(widget.gamekindGroup,timerGroup.value);
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
      return Text(state.text_timer.value);
    });
  }
}

