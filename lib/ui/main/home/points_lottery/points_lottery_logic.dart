import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/bean/html_event.dart';

import 'points_lottery_state.dart';

class PointsLotteryLogic extends GetxController {
  final PointsLotteryState state = PointsLotteryState();
  Timer? timer;
  // Timer? circleTimer;


  @override
  void onReady() {
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      state.wheelState.value = !state.wheelState.value;
    });
    state.wheelController.calcAngle();
    getShakeInfo();
    super.onReady();
  }

  @override
  void onClose() {
    timer?.cancel();
    // circleTimer?.cancel();
    state.wheelController.reset();
    super.onClose();
  }

  void start(int count){
    if(state.wheelController.isAnimating){
      return;
    }
    if(count * 5 > (state.pointLottery.value.point ?? 0)){
      showToast(Intr().jifenbuzu);
      return;
    }
    state.wheelController.reset();
    state.wheelController.start();
    ///次数
    state.continuousCount = count;

    var user = AppData.user();
    var params = {"oid":user?.oid,"username":user?.username,"betCount":count};

    HttpService.betShake(params).then((value) {
      ///设置抽奖结果
      state.result = value;
      if(unEmpty(value)){
        var last = value.last;
        var index = state.lotterys.indexOf(last.bonus.em());
        state.wheelController.stop(atIndex: index);
        ///刷新剩余积分
        state.pointLottery.value.point = last.point;
        state.pointLottery.refresh();
      }
    });

    // circleTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
    //   state.wheelController.stop();
    //   circleTimer?.cancel();
    //   circleTimer = null;
    // });

  }

  ///中奖结果展示
  void onResult(BuildContext context,int v){
    if(unEmpty(state.result)){
      DialogUtils().showLuckyDrawDialog(context,state.result!);
    }
    // var value = state.lotterys[v];
    // ShakeInfoShakes? result;
    // state.pointLottery.value.shakes?.forEach((element) {
    //   if(element.money == value){
    //     result = element;
    //   }
    // });
    // ///最终转盘结果回调
    // if(unEmpty(result?.money)){
    //   showToast("${result?.money}");
    //   // loggerArray(["旋转结果回调",v,state.lotterys[v]]);
    //
    //   DialogUtils().showLuckyDrawDialog(context);
    // }
  }

  void getShakeInfo() {
    var user = AppData.user();
    var params = {"oid":user?.oid,"username":user?.username};

    HttpService.getShakeInfo(params).then((value) {
      state.pointLottery.value = value;
      state.pointLottery.refresh();
    });
  }

  void lotteryRole(){
    HttpService.getNewsRate("yjgz").then((value) {
      if(unEmpty(value.content)){
        Get.toNamed(Routes.html,arguments: HtmlEvent(isHtmlData: true,data: value.content.em(),
            pageTitle: value.name.em()));
      }
    });
  }





}
