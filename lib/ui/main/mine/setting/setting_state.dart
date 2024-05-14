import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';

class SettingState {
  SettingState() {
    ///Initialize variables
  }

  //简易密码
  var jymmToggle = unEmpty(AppData.getGestureValue()).obs;

  ///背景音乐
  var bjyyToggle = AppData.bgMusic().obs;

  ///提示音
  var tsyToggle = AppData.promptTone().obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  ///是否有新版本
  var newVersion = false.obs;
  ///当前版本
  var curVersion = "".obs;


  ///生物识别支持
  var localAuth = false.obs;
  ///生物识别是否打开
  var localAuthToggle = AppData.localAuth().obs;


}
