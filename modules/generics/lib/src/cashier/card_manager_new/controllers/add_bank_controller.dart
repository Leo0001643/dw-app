import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';

import 'card_manager_logic.dart';

class AddBankController extends CardManagerLogic{
  var addBankState = CardManagerChildLogic.to.state;
  @override
  Future<void> onInit() async {
    startLoading();
    super.onInit();
    addBankState.selIndex = 0;
    addBankState.headerSelIndex = 0;
     CardManagerChildLogic.to.state.cny_type.text = '';
     CardManagerChildLogic.to.state.bankType = 0;
    // addBankState.true_name =
    // TextEditingController(text: addBankState.userInfo.truename.toString());
    startData();
    stopLoading();
  }

  startData() async {
    addBankState.bank_card = TextEditingController(text: '');
    addBankState.bank_name = TextEditingController(text: '');
    addBankState.bank_kaihu = TextEditingController(text: '');
    addBankState.usdt_address = TextEditingController(text: '');
    addBankState.usdt_type = TextEditingController(text: '');
    addBankState.digtal_address = TextEditingController(text: '');
    addBankState.digtal_type = TextEditingController(text: '');
    addBankState.true_name = TextEditingController(text:  UserService.to.state.trueName);
  }
}
