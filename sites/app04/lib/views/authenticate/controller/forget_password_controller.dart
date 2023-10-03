import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../config/site_config.dart';
import '../view/forget_contact_widget.dart';
import '../view/forget_vip_widget.dart';

class ForgetPasswordController extends PasswordRecoveryLogic {
  @override
  void onSuccess() {
    SmartDialog.showToast('密码重设成功');
    // Get.back();
    Get.offAllNamed(Routes.login);
  }

  @override
  void checkUserNameSuccess(ForgetPasswordEntity forgetPasswordEntity) {
    // TODO: implement checkUserNameSuccess
  }
  Widget getForgetView() {
    return isSiteTagH09 ? ForgetContactWidget(this) : ForgetVipWidget(this);
  }
}
