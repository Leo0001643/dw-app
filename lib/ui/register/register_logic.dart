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

  void memberRegCheck() {
    if (isEmpty(state.realname)) {
      return;
    }
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

  void clickRegister({dynamic data}) {
    if (isEmpty(state.accountValue)) {
      showToast(Intr().sishiershuzihuozimu);
      return;
    }
    if (isEmpty(state.pwdValue)) {
      showToast(Intr().bashiershuzihuozimu);
      return;
    }
    if(state.pwdValue.length < 8 || state.pwdValue.length > 12){
      showToast(Intr().agent_password_tip);
      return;
    }
    if (isEmpty(state.realname)) {
      showToast(Intr().zhenshixingmingbunengkong);
      return;
    }
    if(state.mobile.length < 9 || state.mobile.length > 15) {
      showToast(Intr().agent_phone_tip);
      return;
    }
    if (isEmpty(state.vcode) && state.varcode.value.status == 1&& state.varcode.value.type == 1) {
      showToast(Intr().yanzhengmabunengkong);
      return;
    }
    var params = {
      "username": state.accountValue,
      "password": state.pwdValue,
      "confirmPwd": state.confirmPwdValue,
      "realName": state.realname,
      "scene": "nc_login_h5",
      "varCode": state.vcode,
      "varCodeId": state.varcode.value.varCodeId,
      "agree": 1,
      "mobile":state.mobile,
    };
    //阿里的滑动验证
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
    HttpService.userRegister(params).then((value) {
      eventBus.fire(LoginRefreshEvent());
      AppData.setUser(value);
      Get.until((ModalRoute.withName(Routes.main)));
    },onError: (error){
      getVarcode();///出错需要刷新验证码
    });
  }
}
