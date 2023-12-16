import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';

class SettingState {
  SettingState() {
    ///Initialize variables
  }

  //简易密码
  var jymmToggle = unEmpty(AppData.simplePwd()).obs;

  //背景音乐
  var bjyyToggle = AppData.bgMusic().obs;

  //提示音
  var tsyToggle = AppData.promptTone().obs;


}
