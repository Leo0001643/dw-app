import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../user/start_recharge/controller/recharge_controller.dart';

class LoginWidgetController extends LoginLogic {
  static LoginWidgetController get to => Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //默认记住密码
    state.rememberMe =true;
  }

  @override
  void onSuccess() {

    // if ()
    if (Get.isRegistered<RechargeController>()) {
       RechargeController.to.getPayxsproduct();
       RechargeController.to.deposityh();
    }
   
    Get.back();
  }

  void handleForgetPassword() {
    // Get.toNamed(Routes.forgetpasswordView);
  }

  void toggleRemember(bool? value) {
    state.rememberMe = !state.rememberMe;
  }

  void login(){
    state.loginFormKey.currentState!.save();
    var form = state.loginFormKey.currentState!.value;
    var username=form['username'];
    var password=form['password'];
    if (username == null ||
        username.isEmpty ||
        password == null ||
        password.isEmpty) {
      SmartDialog.showToast('请输入账号密码', alignment: Alignment.center);
      return;
    }
    handleSubmit();
  }
}
