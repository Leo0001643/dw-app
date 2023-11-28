import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/digiccy_deposit_data_entity.dart';

import 'withdraw_result_state.dart';

class WithdrawResultLogic extends GetxController {
  final WithdrawResultState state = WithdrawResultState();

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

  void loadData(DigiccyDepositDataEntity item) {
    state.result.value = item;
    state.result.refresh();
    var user = AppData.user();

    HttpService.getBalance({ "cur":5, "platform":"main","oid":user?.oid,"username":user?.username }).then((value) {
      state.balance.value = "${value.money.em()}";
    });

  }



}
