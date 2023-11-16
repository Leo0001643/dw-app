import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

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

  void editChange(bool account,String value){
    if(account){
      state.accountValue = value;
    } else {
      state.pwdValue = value;
    }
    //切换按钮点击状态
    var enable = unEmpty(state.accountValue)&& unEmpty(state.pwdValue);
    if(enable != state.btnEnable.value){
      state.btnEnable.value = enable;
    }
  }

  void clickLogin(){
    if(!state.btnEnable.value){ return; }
    var params = <String,dynamic>{
      "username": state.accountValue,
      "password": state.pwdValue,
      "scene": "nc_login_h5",
      // "token": state.accountValue,
    };
    HttpService.login(params).then((value) {
      eventBus.fire(LoginRefreshEvent());
      AppData.setUser(value);
      Get.until((ModalRoute.withName(Routes.main)));
    });
  }




}
