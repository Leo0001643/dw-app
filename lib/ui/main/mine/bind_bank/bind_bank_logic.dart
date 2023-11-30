import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/network/http_service.dart';

import 'bind_bank_state.dart';

class BindBankLogic extends GetxController {
  final BindBankState state = BindBankState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData() {
    var user = AppData.user();

    HttpService.getUserDrawDetail({"oid":user?.oid,"username":user?.username,}).then((value) {
      state.userDraw.value = value;
      state.userDraw.refresh();
    });

  }
}
