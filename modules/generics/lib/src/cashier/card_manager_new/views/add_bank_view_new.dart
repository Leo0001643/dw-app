import 'package:aone_common/common.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/src/cashier/card_manager_new/widget/add_bank_form_new.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../../generics.dart';
import '../../utils/theme_scaffold.dart';
import '../../widgets/withdraw_scaffold.dart';
import '../controllers/add_bank_controller.dart';
import '../controllers/card_manager_logic.dart';
import '../widget/add_bank_form.dart';

class AddBankViewNew extends StatelessWidget {
  const AddBankViewNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WithdrawScaffold(
      title: '新增账户',
      backgroundColor: AoneAppTheme.appTheme.withdrawBgColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: const AddBankFormNew(),
      ),
    );
  }
}
