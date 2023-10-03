import 'package:aone_common/common.dart';
import 'package:get/get.dart';

class LoginWidgetController extends LoginLogic {
  static LoginWidgetController get to => Get.find();

   //登录页密码小眼睛状态
  final _loginObscureTextState = true.obs;
  bool get loginObscureTextState => _loginObscureTextState.value;
  set loginObscureTextState(bool val) => {_loginObscureTextState.value = val};
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onSuccess() {
    Get.back();
    if(!state.rememberMe) {
      SpStorage.setRememberMe({});
    }
  }

  void handleForgetPassword() {
    // Get.toNamed(Routes.forgetpasswordView);
  }

  void toggleRemember(bool? value) {
    state.rememberMe = !state.rememberMe;
  }
}
