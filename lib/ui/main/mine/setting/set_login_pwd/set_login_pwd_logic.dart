import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';

import 'set_login_pwd_state.dart';

class SetLoginPwdLogic extends GetxController {
  final SetLoginPwdState state = SetLoginPwdState();

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


  void changePassword(){
    if(isEmpty(state.pwdValue)){
      showToast(Intr().shuruyuandenglumima);
      return;
    }
    if(isEmpty(state.pwdNewValue) || isEmpty(state.pwdNew1Value)){
      showToast(Intr().shuruxindenglumima);
      return;
    }
    if(state.pwdNewValue != state.pwdNew1Value){
      showToast(Intr().mimashurubuyizhi);
      return;
    }

    var user = AppData.user();
    var params = {"oid":user?.oid,"username":user?.username,};
    params["userPass"] = state.pwdNewValue;
    params["oldUserPass"] = state.pwdValue;
    HttpService.changePassword(params).then((value) {
      showToast(Intr().caozuochenggong);
      Get.back();
    });
  }



}
