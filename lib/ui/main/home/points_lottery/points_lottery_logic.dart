import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';

import 'points_lottery_state.dart';

class PointsLotteryLogic extends GetxController {
  final PointsLotteryState state = PointsLotteryState();
  Timer? timer;
  Timer? circleTimer;


  @override
  void onReady() {
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      state.wheelState.value = !state.wheelState.value;
    });
    super.onReady();
  }

  @override
  void onClose() {
    timer?.cancel();
    circleTimer?.cancel();
    state.wheelController.reset();
    super.onClose();
  }

  void start(){
    if(state.wheelController.isAnimating){
      return;
    }
    state.wheelController.reset();
    state.wheelController.start();

    circleTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      state.wheelController.stop();
      circleTimer?.cancel();
      circleTimer = null;
    });

  }

  void onResult(BuildContext context,int v){
    ///最终转盘结果回调
    showToast("${state.lotterys[v]}");
    loggerArray(["旋转结果回调",v,state.lotterys[v]]);
    DialogUtils().showLuckyDrawDialog(context);

  }


}
