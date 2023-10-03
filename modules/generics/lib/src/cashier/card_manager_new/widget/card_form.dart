import 'dart:math';

import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/mine/card_management_new/card_management_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/src/cashier/card_manager_new/widget/theme_dropdown.dart';
import 'package:generics/src/cashier/card_manager_new/widget/theme_text_input.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../controllers/card_manager_logic.dart';
import '../widget/theme_button.dart';
import '../controllers/card_manager_landscape_controller.dart';


class BankCardPage extends StatelessWidget {
  const BankCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CardManagerLandScapeController());
    Get.put(CardManagerChildLogic());
    return Padding(
      padding: EdgeInsets.only(bottom: context.mediaQuery.viewInsets.bottom),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            top: 5.r, bottom: max(25.r, context.mediaQuery.viewInsets.bottom)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildForm(),
            // _buildRemind(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildRemind() {
    final state = CardManagerLandScapeController.to.state;
    return Obx(
      () {
        return Container(
          margin: EdgeInsets.only(bottom: 10.r),
          width: (state.currentType == 2 ? 180 : 350).r,
          child: state.currentType == 2
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'have.question'.tr,
                        children: [
                          const TextSpan(text: ' '),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // AppService.to.toCustomerService();
                              },
                            text: 'login.onlineservice'.tr,
                            style: const TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Text(
                  'card.type.1.remind'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
        );
      },
    );
  }

  Widget _buildButtons() {
    final ctrl = CardManagerLandScapeController.to;
    return SizedBox(
      width: 300.r,
      child: Obx((){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ThemeButton(
              onPressed: (){
                if(ctrl.isDialog){
                  Get.back();
                }else{
                  ctrl.pageController.jumpToPage(0);
                }

              },
              btnText:ctrl.isDialog?"user.center.report.cancle".tr: 'recharge.back'.tr,
            ),
            if (ctrl.state.formType == CardFormType.add)
              ThemeButton(
                onPressed: () => ctrl.postBindingBankData(),
                btnText: 'confirm.binding'.tr,
              ),
            if (ctrl.state.formType == CardFormType.edit)
              ThemeButton(
                onPressed: () => ctrl.postBindingBankData(
                    bandListId: ctrl.currentItem?.id.toString()),
                btnText: 'confirm.change'.tr,
              ),
          ],
        );
      })
    );
  }

  Widget _buildForm() {
    final ctrl = CardManagerLandScapeController.to;
    return SizedBox(
      width: 400.r,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ctrl.state.formType == CardFormType.add?
            _buildGridView():SizedBox(height: 10,),
            FormBuilder(
              key: ctrl.state.bankFormKey,
              initialValue: ctrl.currentItem?.toJson() ?? {},
              enabled: ctrl.state.formType != CardFormType.readOnly,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ctrl.state.formFields
                    .map(
                      (e) {
                        if (e.name == 'truename') {
                          return ThemeTextInput(
                            label: e.label.tr,
                            name: e.name,
                            isReadOnly: true,
                            initialValue: UserService.to.state.trueName,
                          );
                        }
                        if (e.fieldType == FieldType.select) {
                          return ThemeDropDown<String>(
                            name: e.name,
                            label: e.label.tr,
                            hintText: e.hintText!.tr,
                            dropdownList: ctrl.currentBanks
                                .map(
                                  (element) => DropdownMenuItem<String>(
                                    value: element.name,
                                    child: Text(element.name),
                                  ),
                                )
                                .toList(),
                            onChange: (val) => ctrl.onSelectClose(val),
                          );
                        }
                        return ThemeTextInput(
                          label: e.label.tr,
                          hintText: e.hintText?.tr,
                          name: e.name,
                        );
                      },
                    )
                    .toList()
                    .cast<Widget>(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _buildGridView() {
    final ctrl = CardManagerLandScapeController.to;
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 5.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  const Text(
                    "账户类型:",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 260.w,
                    child: Builder(builder: (context) {
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: ctrl.dialogHeaderList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 3.0,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 5,
                        ),
                        itemBuilder: (_, int index) {
                          Tuple2 tuple2 = ctrl.dialogHeaderList[index];
                          return _addButton(tuple2, index);
                        },
                      );
                    }),
                  )
                ],
              ),
            )
          ],
        ));
  }
  Widget _addButton(Tuple2 tuple2, int i) {
    final ctrl = CardManagerLandScapeController.to;
    return Center(
      child: ThemeButton(
        onPressed: () {
          ctrl.state.bankFormKey.currentState!.reset();
          ctrl.headerSelIndex = i;
          if(ctrl.headerSelIndex == 0){
            ctrl.currentBanks = ctrl.bankItems;
            ctrl.state.currentType = 1;
          }else  if(ctrl.headerSelIndex ==1){
            ctrl.currentBanks = ctrl.bankItems3;
            ctrl.state.currentType = 4;
          }else  if(ctrl.headerSelIndex == 2){
            ctrl.currentBanks = ctrl.bankItems2;
            ctrl.state.currentType = 2;
          }
        },
        btnText: tuple2.item1,
        color:ctrl.headerSelIndex == i ?const LinearGradient(
          colors: [
            Color.fromRGBO(247, 229, 181, 1),
            Color.fromRGBO(181, 149, 105, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.715],
        ): const LinearGradient(
          colors: [
            Color.fromRGBO(227, 222, 204, 1),
            Color.fromRGBO(144, 132, 115, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
