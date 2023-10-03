import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class LoginController extends LoginLogic {
  static LoginController get to => Get.find();
  var isLogin = true.obs;
  var current = 0;

  @override
  var isAlwaysRemember = false;

  @override
  void onInit() {
    super.onInit();
    isLogin.value = Get.arguments ?? true;
  }

  void changeItem(int tag) {
    if (current == tag) {
      return;
    }
    current = tag;
    if (tag == 0) {
      isLogin.value = true;
    } else {
      isLogin.value = false;
    }
  }
}
