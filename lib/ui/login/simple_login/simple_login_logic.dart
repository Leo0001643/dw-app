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
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  void login(String value,TextEditingController pwdController){
    loggerArray(["是否验证过啦",value]);
    if(value.length == 4){
      if(value == AppData.simplePwd()){
        var params = <String,dynamic>{
          "username": AppData.loginUser(),
          "password": AppData.loginPwd(),
          "scene": "nc_login_h5",
          "token": -1,
        };
        HttpService.login(params).then((value) {
          eventBus.fire(LoginRefreshEvent());
          AppData.setUser(value);
          Get.until((ModalRoute.withName(Routes.main)));
        });
      } else {
        pwdController.text = "";
        showToast(Intr().mimacuowu);
      }
    }
  }





}
