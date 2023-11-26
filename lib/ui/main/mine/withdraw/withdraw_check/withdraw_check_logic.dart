import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/network/http_service.dart';

import 'withdraw_check_state.dart';

class WithdrawCheckLogic extends GetxController {
  final WithdrawCheckState state = WithdrawCheckState();

  @override
  void onReady() {
    loadData(Get.arguments);
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData(int index) {
    var user = AppData.user();
    // 币种【1:CNY,2:USD,3:KRW,4:INR,5:USDT,6:VND】
    HttpService.withdrawCheck({"cur": index,"oid":user?.oid,"username":user?.username,}).then((value) {
      value.checkType = index;//设置稽核类型 下个页面需要用到
      state.withdrawCheck.value = value;
      state.withdrawCheck.refresh();
    });
    

  }



}
