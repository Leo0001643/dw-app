import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void editChange(bool account,String value){
    if(account){
      state.accountValue = value;
    }else {
      state.pwdValue = value;
    }
    //切换按钮点击状态
    var enable = unEmpty(state.accountValue)&& unEmpty(state.pwdValue);
    if(enable != state.btnEnable.value){
      state.btnEnable.value = enable;
    }
  }

  void clickLogin(){
    if(!state.btnEnable.value){ return; }
    Get.back();
  }




}
