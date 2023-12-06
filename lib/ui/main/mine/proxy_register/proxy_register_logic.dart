import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/data_utils.dart';

import 'proxy_register_state.dart';

class ProxyRegisterLogic extends GetxController {
  final ProxyRegisterState state = ProxyRegisterState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void loadData(){
    DataUtils.readPhoneData().then((value) {
      state.phoneData = value;
      // loggerArray(["读取文件数据结果",state.phoneData]);
    });
    getVarcode();
  }

  void getVarcode() {
    // 渠道【登录:login,会员注册:register,代理注册:agentReg】
    HttpService.getVarcode("agentReg").then((value) {
      state.varcode.value = value;
      state.varcode.refresh();
    });
  }


  void register(){
    if(isEmpty(state.username)){
      showToast(Intr().qsryhm);
      return;
    }
    if(isEmpty(state.pwdValue) || isEmpty(state.pwd1Value)){
      showToast(Intr().bashiershuzihuozimu);
      return;
    }
    if(state.pwdValue != state.pwd1Value){
      showToast(Intr().mimashurubuyizhi);
      return;
    }

    if(isEmpty(state.username)){
      showToast(Intr().zhenshixingmingbunengkong);
      return;
    }

    if(isEmpty(state.validCode)){
      showToast(Intr().yanzhengmabunengkong);
      return;
    }

    var user = AppData.user();
    var params = <String,dynamic>{"oid":user?.oid,"username":state.username.value,"agree":1,
      "confirmPwd":state.pwd1Value,"password":state.pwdValue,"realName":state.realname.value,
      "tokan":"-1","varCode":state.validCode.value,"varCodeId":state.varcode.value.varCodeId,
      "scene": "nc_login_h5",};

    if(unEmpty(state.email.value)){
      params["email"] = state.email.value;
    }
    if(unEmpty(state.phone.value)){
      params["mobile"] = "${state.areaNo.value}${state.phone.value}";
    }
    if(unEmpty(state.qq.value)){
      params["qq"] = state.qq.value;
    }

    HttpService.agentRegister(params).then((value) {
      //{code: 100000, message: {zh: 成功}, data: 1000431}
      showToast(Intr().caozuochenggong);
      Get.back();
    });

  }




}
