import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAnimationState {
  SelectAnimationState() {
    ///Initialize variables
  }

  //封盘
  var entertainedAnim = false.obs;
  //开奖结果
  var lotteryAnim = false.obs;
  //倒计时
  var countdownAnim = false.obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();


}
