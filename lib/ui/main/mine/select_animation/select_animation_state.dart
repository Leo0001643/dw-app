import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';

class SelectAnimationState {
  SelectAnimationState() {
    ///Initialize variables
  }

  //封盘
  var entertainedAnim = AppData.fengpanAnim().obs;
  //开奖结果
  var lotteryAnim = AppData.kaijiangAnim().obs;
  //倒计时
  var countdownAnim = AppData.daojishiAnim().obs;
  //中奖
  var winningAnim = AppData.zhongjiangAnim().obs;



  var scaffoldKey = GlobalKey<ScaffoldState>();


}
