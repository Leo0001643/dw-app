import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';

class SettingState {
  SettingState() {
    ///Initialize variables
  }

  //简易密码
  // var jymmToggle = unEmpty(AppData.simplePwd()).obs;

  //简易密码
  var jymmToggle = AppData.bgJymm().obs;

  var bjyyToggle = AppData.bgMusic().obs;

  //提示音
  var tsyToggle = AppData.promptTone().obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();


}
