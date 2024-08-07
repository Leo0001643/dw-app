import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';
import 'package:leisure_games/ui/bean/register_currency_event.dart';
import 'package:leisure_games/ui/main/main_logic.dart';

import 'register_state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();

  @override
  void onReady() {
    getVarcode();
    getWebConfig();
    DataUtils.readPhoneData().then((value) {
      state.phoneData = value;
    });
    super.onReady();
  }

  @override
  void onClose() {
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
    ///手机号必填
    if(state.mobileMust.value && (state.mobile.length < 9 || state.mobile.length > 15)) {
      showToast(Intr().agent_phone_tip);
      return;
    }
    ///介绍人必填
    if(state.agentMust.value && isEmpty(state.tgcode)) {
      showToast(Intr().jiesaorenbunengkong);
      return;
    }
    ///qq必填
    if(state.qqMust.value && isEmpty(state.qq)) {
      showToast(Intr().qqbunengkong);
      return;
    }
    ///email必填
    if(state.emailMust.value && isEmpty(state.email)) {
      showToast(Intr().emailbunengkong);
      return;
    }
    ///wechat必填
    if(state.weixinMust.value && isEmpty(state.wechat)) {
      showToast(Intr().wechatbunengkong);
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
      "token": -1,
  };
    ///介绍人
    if(unEmpty(state.tgcode)){
      params["sp"] = state.tgcode.replaceAll("sp", "").replaceAll("SP", "").replaceAll("Sp", "").replaceAll("sP", "");
    }
    ///手机号
    if(unEmpty(state.mobile)){
      params["mobile"] = "${state.areaNo.value}${state.mobile}";
    }
    ///邮箱
    if(unEmpty(state.email)){
      params["email"] = state.email;
    }
    ///qq
    if(unEmpty(state.qq)){
      params["qq"] = state.qq;
    }
    ///wechat
    if(unEmpty(state.wechat)){
      params["wechat"] = state.wechat;
    }
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
      ///登录成功刷新各页面
      eventBus.fire(LoginRefreshEvent());
      AppData.setUser(value);
      Get.until(ModalRoute.withName(Routes.main));
      ///通知显示币种选择弹窗
      eventBus.fire(RegisterCurrencyEvent());
    },onError: (error){
      getVarcode();///出错需要刷新验证码
    });
  }

  void getWebConfig() {
    HttpService.getWebConfig().then((value) {
      var config = value.registerOption!.first;
      state.emailVisible.value = config.emailRegisterOption != "1";
      state.emailMust.value = config.emailRegisterOption == "3";
      state.agentVisible.value = config.agentRegisterOption != "1";
      state.agentMust.value = config.agentRegisterOption == "3";
      state.weixinVisible.value = config.weixinRegisterOption != "1";
      state.weixinMust.value = config.weixinRegisterOption == "3";
      state.mobileVisible.value = config.mobileRegisterOption != "1";
      state.mobileMust.value = config.mobileRegisterOption == "3";
      state.qqVisible.value = config.qqRegisterOption != "1";
      state.qqMust.value = config.qqRegisterOption == "3";
    });
  }

//注册接口参数
// siteType: 1
// siteId: 9000
// version: 1.0.0
// terminal: MP
// machineModel: wap_Safari_16.6
// username: dms003
// password: 12345678
// confirmPwd: 12345678
// email: sdsfd@qq.com
// mobile: +8615615100090
// qq: 52323424234
// realName: dms
// scene: nc_login_h5
// sp: 100969202
// token: -1
// varCode: 6508
// varCodeId: gptknecgkvnoxyxgicrnezarx
// wechat: ydfd
// agree: 1



}
