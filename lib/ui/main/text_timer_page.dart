import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../bean/pc28_plan_entity.dart';

class TextTimerPage extends StatefulWidget {
  final Rx<Pc28PlanEntity> timerGroup;

  TextTimerPage(this.timerGroup);

  @override
  _TextTimerPageState createState() => _TextTimerPageState();
}

class _TextTimerPageState extends State<TextTimerPage> {
  late StreamController<String> _timerStreamController;

  @override
  void initState() {
    super.initState();
    _timerStreamController = StreamController<String>();
    startTimer();
  }

  @override
  void dispose() {
    _timerStreamController.close();
    super.dispose();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      var remainingTime = calculateRemainingTime();
      if (remainingTime <= 0) {
        // Timer 已经结束，可以执行相关操作
        timer.cancel();
        _timerStreamController.add("封盘中");
      } else {
        // 将剩余时间差发送到 Stream 中
        _timerStreamController.add(formatTime(remainingTime));
      }
    });
  }

  int calculateRemainingTime() {
    var openTime =
        widget.timerGroup.value.all?.fastbtb28!.data![0].openTime ?? 0;
    var endTime =
        widget.timerGroup.value.all?.fastbtb28!.data![0].closeTime ?? 0;
    var nowTime = DateTime.now().millisecondsSinceEpoch;
    var timeDifference = (endTime - nowTime) ~/ 1000;

    // 如果当前时间小于开盘时间，则剩余时间为开盘时间减去当前时间
    if (nowTime < openTime) {
      return openTime - nowTime;
    }

    // 返回剩余时间差
    return timeDifference;
  }

  String formatTime(int seconds) {
    // 将剩余秒数格式化为 HH:mm:ss 格式
    var hours = seconds ~/ 3600;
    var minutes = (seconds % 3600) ~/ 60;
    var remainingSeconds = seconds % 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: _timerStreamController.stream,
      builder: (context, snapshot) {
        return Text(
          snapshot.data ?? "",
          style: TextStyle(fontSize: 11, color: Colors.white),
        );
      },
    );
  }
}
