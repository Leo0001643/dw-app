import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/error_response_handler.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';

import 'simple_login_var_state.dart';

class SimpleLoginVarLogic extends GetxController {
  final SimpleLoginVarState state = SimpleLoginVarState();

  @override
  void onReady() {
    state.user = Get.arguments;
    getVarcode();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getVarcode() {
    HttpService.getVarcode("register").then((value) {
      state.varcode.value = value;
      state.varcode.refresh();
      if(value.type == 0){
        ///不需要校验验证码,直接登录
        clickLogin();
      }
    });
  }



  void clickLogin({dynamic data}){
    if(isEmpty(state.user)) return;
    var pwd = AppData.loginPwd(state.user.em());
    var params = <String,dynamic>{
      "username": state.user.em(),
      "password": pwd,
      "scene": "nc_login_h5",
      "token": -1,
    };
    if(unEmpty(state.vcode)) {
      params["varCode"]=state.vcode;
    }
    if(unEmpty(state.varcode.value.varCodeId)) {
      params["varCodeId"] = state.varcode.value.varCodeId;
    }
    if (data != null && state.varcode.value.status == 1 && state.varcode.value.type == 2) {
      //阿里的滑动

      //@ApiModelProperty(value = "阿里云签名串")
      //     private String sign;
      //
      //     @ApiModelProperty(value = "阿里云会话ID")
      //     private String sessionId;
      //
      //     @ApiModelProperty(value = "阿里云唯一标识")
      //     private String token;
      //
      //     @ApiModelProperty(value = "阿里云场景标识")
      //     private String scene;
      params["sign"] = data["sig"];
      params["sessionId"] = data["sessionId"];
      params["sign"] = data["sig"];
      params["token"] = data["token"];
    }
    //腾讯的滑动验证
    //
    if (data != null && state.varcode.value.status == 1 && state.varcode.value.type == 3) {
      params["ticket"] = data["ticket"];
      params["randstr"] = data["randstr"];
      params["token"] = -1;
    }
    HttpService.login(params).then((value) {
      eventBus.fire(LoginRefreshEvent());
      AppData.setUser(value);
      AppData.setLoginUser(state.user.em());
      AppData.setLoginPwd(state.user.em(),pwd);
      Get.until((ModalRoute.withName(Routes.main)));
    },onError: (error){
      getVarcode();///出错需要刷新验证码
    });
  }




}
