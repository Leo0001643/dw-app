import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';

import 'set_simple_pwd_state.dart';

class SetSimplePwdLogic extends GetxController {
  final SetSimplePwdState state = SetSimplePwdState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  void setPwd(){

    if(isEmpty(state.newPwd) || isEmpty(state.confirmPwd)){
      return;
    }

    if(state.newPwd == state.confirmPwd){
      AppData.setSimplePwd(state.newPwd);

      showToast(Intr().caozuochenggong);
      Get.back(result: true);
    }

  }


}
