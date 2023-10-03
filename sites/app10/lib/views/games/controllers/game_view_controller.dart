import 'dart:io';

import 'package:aone_common/common.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import '../home_page/music_controller.dart';

class GameViewController extends GetxController {
  final RxDouble _left = 0.0.obs;

  double get left => _left.value;

  set left(val) => _left.value = val;

  final RxDouble _top = 0.0.obs;

  double get top => _top.value;

  set top(val) => _top.value = val;

  final RxBool _showSubView = false.obs;

  bool get showSubView => _showSubView.value;

  set showSubView(value) => _showSubView.value = value;


  /*网页加载进度 */
  final RxInt _progressNum = 0.obs;
  int get progressNum => _progressNum.value;
  set progressNum(val) => _progressNum.value = val;

  @override
  void onInit() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.onInit();
  }

  @override
  void onClose() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    super.onClose();
  }
  
  /*刷新余额通知后台下分 */
  exitTheGame(){
    if(UserService.to.state.isRegularUser)
    {
      UserService.to.getUserMoney();
    }
  }
}
