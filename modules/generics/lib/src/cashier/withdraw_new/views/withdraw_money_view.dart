import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/withdraw_scaffold.dart';
import '../../withdraw_new/widget/withdraw_form_new.dart';
import '../../withdraw_new/controller/withdraw_money_controller.dart';

class WithdrawMoneyview extends GetView<WithdrawMoneyController> {
  const WithdrawMoneyview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WithdrawScaffold(
        backgroundColor: AoneAppTheme.appTheme.withdrawBgColor,
        title: "提现",
        body:const WithdrawFormNew());
  }
}
