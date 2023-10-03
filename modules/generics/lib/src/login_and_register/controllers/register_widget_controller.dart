import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class RegisterWidgetController extends RegisterLogic {
  RegisterWidgetController({required RegisterType registerType})
      : super(registerType: registerType);

  var password = "".obs;
  var account = "".obs;
  static RegisterWidgetController get to => Get.find();

  //注册密码小眼睛状态
  final _registerObscureTextState = true.obs;
  bool get registerObscureTextState => _registerObscureTextState.value;
  set registerObscureTextState(bool val) => {_registerObscureTextState.value = val};
  

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onSuccess() {
    Get.back();
  }

  String iconUser(String key) {
    String iconName = '';
    print('键值 == ${key}');
    switch (key) {
      case 'tuijian_name':
      case 'user_name':
      case 'truename':
        iconName = 'icon_username.png';
        break;
      case 'password':
      case 'repassword':
      iconName = 'icon_password.png';
        break;
      case 'qkpass':
        iconName = 'icon_qkpassword.png';
        break;
      case 'reg_qq':
        iconName = 'icon_qq.png';
        break;
      case 'reg_weixin':
        iconName = 'icon_weixin.png';
        break;
      case 'reg_skype':
        iconName = 'icon_skype.png';
        break;
      case 'reg_email':
        iconName = 'icon_email.png';
        break;
      case 'bankname':
        iconName = 'icon_bank.png';
        break;
      case 'bankcard':
      case 'bankkaihu':
        iconName = 'icon_bank_card.png';
        break;
      case 'reg_wen':
        iconName = 'icon_question.png';
        break;
      case 'reg_wen_d':
        iconName = 'icon_answer.png';
        break;
      case 'reg_wen_t':
        iconName = 'icon_tip.png';
        break;
      case 'reg_phone':
        iconName = 'icon_phone.png';
        break;
      case 'reg_mobilecode':
        iconName = 'icon_code.png';
        break;
      default:
        iconName = 'icon_security.png';
    } 
    return "assets/images/login_and_register/$iconName";
  }

  Timer? timer;

  ///倒计时
  var time = 0.obs;
  var phone = "".obs;

  var agreeSelect = true.obs;
  var showPassword = false.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    PopupService.to.triggerPopup(routeName: Routes.userReg);
  }

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
        },
      );
    } else {}
  }

  // void runTimer({int times = 60}) async {
  //   if (!phone.value.isPhoneNumber) {
  //     SmartDialog.showToast("请输入正确的手机号码");
  //     return;
  //   }
  //   sendSMSCode(phone.value);
  //   time.value = times;
  //   timer?.cancel();
  //   timer = Timer.periodic(
  //     const Duration(seconds: 1),
  //     (Timer timer) {
  //       time.value--;
  //       if (time.value <= 0) {
  //         time.value = 0;
  //         timer.cancel();
  //       }
  //     },
  //   );
  // }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
