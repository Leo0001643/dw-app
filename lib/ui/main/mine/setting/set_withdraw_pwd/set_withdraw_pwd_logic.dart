import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';

import 'set_withdraw_pwd_state.dart';

class SetWithdrawPwdLogic extends GetxController {
  final SetWithdrawPwdState state = SetWithdrawPwdState();

  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void changePassword() {
    if(isEmpty(state.pwdValue)){
      showToast(Intr().shuruyuantixianmima);
      return;
    }
    if(isEmpty(state.pwdNewValue)){
      showToast(Intr().shuruxintixianmima);
      return;
    }
    if(state.pwdNewValue != state.pwdNew1Value){
      showToast(Intr().mimashurubuyizhi);
      return;
    }
    var user = AppData.user();
    var params = {"oid":user?.oid,"username":user?.username,
      "getPassword":state.pwdNewValue,"oldGetPassword":state.pwdValue};

    HttpService.changeGetpassword(params).then((value) {
      showToast(Intr().caozuochenggong);
      Get.back();
    });
  }





}
