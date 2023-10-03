import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'login_widget_controller.dart';

class LoginController extends LoginLogic {

  static LoginController get to => Get.find();
  var isLogin = true.obs;
  var current = 1.obs;

 

  @override
  var isAlwaysRemember = false;

  @override
  void onInit() {
    super.onInit();
    isLogin.value = Get.arguments ?? true;
    changeItem(Get.arguments ?? 0);
  }

  void changeItem(int tag) {
    current.value = tag;
    if (tag == 0) {
      isLogin.value = true;
    } else {
      isLogin.value = false;
    }
  }
}
