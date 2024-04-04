import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';

import 'simple_login_state.dart';

class SimpleLoginLogic extends GetxController {
  final SimpleLoginState state = SimpleLoginState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void login(String value){
    loggerArray(["是否验证过啦",value]);
    var user = AppData.getUserByGesture(value);
    if(unEmpty(user)){
      Get.offAndToNamed(Routes.simple_login_var,arguments: user);
    } else {
      // pwdController.text = "";
      showToast(Intr().mimacuowu);
    }
  }





}
