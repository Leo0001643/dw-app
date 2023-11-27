import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';

import 'add_bank_state.dart';

class AddBankLogic extends GetxController {
  final AddBankState state = AddBankState();

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
    var params = <String,dynamic>{"oid":AppData.user()?.oid.em(),
      "username":AppData.user()?.username.em(), "type":1,};
    HttpService.getBanks(params).then((value) {
      state.banks.assignAll(value);
    });
  }





}
