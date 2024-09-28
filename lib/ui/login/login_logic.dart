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
    getVarcode();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void getVarcode() {
    HttpService.getVarcode("login").then((value) {
      state.varcode.value = value;
      state.varcode.refresh();
    });
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

  void clickLogin({dynamic data,String? varCode,String? varCodeId}){
    if(!state.btnEnable.value){ return; }
    var params = <String,dynamic>{
      "username": state.accountValue,
      "password": state.pwdValue,
      "scene": "nc_login_h5",
      "token": -1,
    };
    if(varCode?.isNotEmpty==true) {
      params["varCode"]=varCode;
    }
    if(varCodeId?.isNotEmpty==true) {
      params["varCodeId"]=varCodeId;
    }
    if (data != null &&
        state.varcode.value.status == 1 &&
        state.varcode.value.type == 2) {
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
    if (data != null &&
        state.varcode.value.status == 1 &&
        state.varcode.value.type == 3) {
      params["ticket"] = data["ticket"];
      params["randstr"] = data["randstr"];
      params["token"] = -1;
    }
    HttpService.login(params).then((value) {
      AppData.setUser(value);
      AppData.setLoginUser(state.accountValue);
      AppData.setLoginPwd(state.accountValue,state.pwdValue);
      eventBus.fire(LoginRefreshEvent());
      Get.until((ModalRoute.withName(Routes.main)));
    },onError: (error){
      getVarcode();///出错需要刷新验证码
    });
  }




}
