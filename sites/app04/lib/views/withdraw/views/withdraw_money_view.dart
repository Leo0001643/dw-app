import 'package:app04/theme/color_schema.dart';
import 'package:app04/views/withdraw/views/withdraw_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/theme_scaffold.dart';
import '../controllers/withdraw_money_controller.dart';


class WithdrawMoneyview extends GetView<WithdrawMoneyController>  {
  const WithdrawMoneyview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ThemeScaffold(
      backgroundColor: AppTheme.normalBgColor,
      title: '提现',
      body: WithdrawForm()
    );
  }
}
