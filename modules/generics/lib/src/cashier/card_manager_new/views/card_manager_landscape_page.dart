import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/src/cashier/card_manager_new/widget/add_bank_form_new.dart';
import 'package:generics/src/cashier/card_manager_new/widget/add_bank_landscape_form.dart';
import 'package:get/get.dart';

import '../controllers/card_manager_landscape_controller.dart';
import '../widget/card_form.dart';
import '../widget/card_list.dart';

class CardManagementLandscapePage extends StatelessWidget {
  const CardManagementLandscapePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CardManagerLandScapeController());
    final ctrl = CardManagerLandScapeController.to;
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(29, 29, 31, 1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: PageView.builder(
        controller: ctrl.pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (_, index) {
          return index == 0 ? const CardList() : const BankCardPage();
        },
      ),
    );
  }
}
