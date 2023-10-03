import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';

import 'card_manager_logic.dart';

class EditBankController extends BaseController {
  var state = CardManagerChildLogic.to.state;
  final UserService _userService = UserService.to;
  @override
  Future<void> onInit() async {
    startLoading();
    super.onInit();
    state.true_name =
        TextEditingController(text:  _userService.state.trueName);
    // state.isEditable = _userService.state.userBank.bankUp!;
    editData();
    stopLoading();
  }

  editData() async {
    var data = state.banks[state.selIndex];
    state.bank_card = TextEditingController(text: data.bankcard);
    state.bank_name = TextEditingController(text: data.bankname);
    state.bank_kaihu = TextEditingController(text: data.bankkaihu);
    state.usdt_address = TextEditingController(text: data.bankcard);
    state.usdt_type = TextEditingController(text: data.bankkaihu);
    state.digtal_type = TextEditingController(text: data.bankkaihu);
    state.digtal_address = TextEditingController(text: data.bankcard);
  }
}
