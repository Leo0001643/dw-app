import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class JoinUsController extends RegisterLogic {
  JoinUsController({required RegisterType registerType})
      : super(registerType: registerType);
  static JoinUsController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onSuccess() {
    Get.back();
  }

  var selAgreementState = true;

  ///倒计时
  var time = 0.obs;
  var phone = "".obs;
  Timer? timer;

  ///倒计时开始
  void runTimer({int times = 60}) async {
    if (!phone.value.isPhoneNumber) {
      SmartDialog.showToast("请输入正确的手机号码");
      return;
    }
    bool success = await sendSMSCode(phone.value);
    if (success == true) {
      timer?.cancel();
      time.value = times;
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) {
          time.value--;
          if (time.value <= 0) {
            time.value = 0;
            timer.cancel();
          }
          update();
        },
      );
    } else {}
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void clickAgreement() {
    print('点击了注册协议');
    selAgreementState = !selAgreementState;
    update();
    print(selAgreementState);
  }
}
