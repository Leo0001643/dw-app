import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';

import 'register_state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();

  @override
  void onReady() {
    getVarcode();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void memberRegCheck(){
    if(isEmpty(state.realname)){ return; }
    HttpService.memberRegCheck(state.realname).then((value) {
      //验证通过不处理
    });
  }

  void getVarcode() {
    HttpService.getVarcode("register").then((value) {
      state.varcode.value = value;
      state.varcode.refresh();
    });
  }


  void clickRegister(){
    if(isEmpty(state.accountValue)){
      showToast(Intr().sishiershuzihuozimu);
      return;
    }
    if(isEmpty(state.pwdValue)){
      showToast(Intr().bashiershuzihuozimu);
      return;
    }
    if(isEmpty(state.realname)){
      showToast(Intr().zhenshixingmingbunengkong);
      return;
    }
    if(isEmpty(state.vcode)){
      showToast(Intr().yanzhengmabunengkong);
      return;
    }
    var params = {"username":state.accountValue,"password":state.pwdValue,"confirmPwd":state.confirmPwdValue,
    "realName":state.realname,"scene":"nc_login_h5","varCode":state.vcode,"varCodeId":state.varcode.value.varCodeId,
    "agree":1,};
    HttpService.userRegister(params).then((value) {
      eventBus.fire(LoginRefreshEvent());
      AppData.setUser(value);
      Get.until((ModalRoute.withName(Routes.main)));
    });

  }


}
