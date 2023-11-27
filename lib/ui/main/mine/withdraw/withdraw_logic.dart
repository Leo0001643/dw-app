import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/network/http_service.dart';

import 'withdraw_state.dart';

class WithdrawLogic extends GetxController {
  final WithdrawState state = WithdrawState();

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
    HttpService.getUserDrawDetail({"oid":user?.oid,"username":user?.username}).then((value) {
      state.userDraw.value = value;
      state.userDraw.refresh();
    });
  }







}
