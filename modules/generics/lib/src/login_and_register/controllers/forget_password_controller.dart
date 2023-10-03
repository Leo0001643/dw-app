import 'package:aone_common/common.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends PasswordRecoveryLogic {
  @override
  void onSuccess() {
    SmartDialog.showToast('密码重设成功');
    Get.back();
    Get.offAndToNamed(Routes.login);
  }

  @override
  void checkUserNameSuccess(ForgetPasswordEntity forgetPasswordEntity) {
    // TODO: implement checkUserNameSuccess
  }
}
