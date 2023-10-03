import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/mine/card_management/card_management_state.dart';
import 'package:aone_common/controllers/withdrawal/withdrawal_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/src/cashier/card_manager_new/controllers/card_manager_landscape_controller.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../card_manager_new/widget/theme_button.dart';
import '../../card_manager_new/widget/theme_text_input.dart';

// import '../../../../widget/dialog/selector_dialog.dart';
// import '../../../../widget/form/theme_radio_group.dart';
// import '../../../../widget/form/theme_text_input.dart';
// import '../../mine/card_management/card_manager_controller.dart';
// import 'package:app02/theme/color_schema.dart';
// import 'package:app02/widget/misc/theme_button.dart';

class BankCardWithdrawPage extends StatelessWidget {
  const BankCardWithdrawPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // static WithdrawalLogic get to => Get.find();
    Get.put(CardManagerLandScapeController());
    var state = WithdrawalLogic.to.state;
    // qktrue	string	是否设置取款密码
    // reg_phone	string	注册手机号
    // reg_mobilecode	string	验证码检查
    // bank_card	string	银行卡号
    print('qktrue == ${state.needEntity.qktrue}');
    print('regPhone == ${state.needEntity.regPhone}');
    print('bankCard == ${state.needEntity.bankCard}');
    return Obx(() {
      if (state.needEntity.qktrue == true &&
          state.needEntity.regPhone == true &&
          state.needEntity.bankCard == false) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildForm(),
              _buildRemind(),
              _buildButtons(),
            ],
          ),
        );
      } else if (state.needEntity.qktrue == false &&
          state.needEntity.regPhone == false &&
          state.needEntity.bankCard == true) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildPassWordForm(),
              _buildMobileForm(),
              _buildRemind(),
              _buildButtons(),
            ],
          ),
        );
      } else if (state.needEntity.qktrue == false &&
          state.needEntity.regPhone == true &&
          state.needEntity.bankCard == true) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildPassWordForm(),
              _buildRemind(),
              _buildButtons(),
            ],
          ),
        );
      } else if (state.needEntity.qktrue == true &&
          state.needEntity.regPhone == false &&
          state.needEntity.bankCard == false) {
        print("2222222222222");
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildForm(),
              _buildMobileForm(),
              _buildRemind(),
              _buildButtons(),
            ],
          ),
        );
      } else if (
          state.needEntity.regPhone == false &&
          state.needEntity.bankCard == true) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildMobileForm(),
              _buildRemind(),
              _buildButtons(),
            ],
          ),
        );
      } else if (state.needEntity.qktrue == true &&
          state.needEntity.regPhone == true &&
          state.needEntity.bankCard == false) {
        print("4444444444444");
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildPassWordForm(),
              _buildRemind(),
              _buildButtons(),
            ],
          ),
        );
      } else if (state.needEntity.qktrue == false &&
          state.needEntity.regPhone == false &&
          state.needEntity.bankCard == false) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildForm(),
              _buildMobileForm(),
              _buildPassWordForm(),
              _buildRemind(),
              _buildButtons(),
            ],
          ),
        );
      } else if (state.needEntity.qktrue == false &&
          state.needEntity.regPhone == true &&
          state.needEntity.bankCard == false) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildForm(),
              _buildPassWordForm(),
              _buildRemind(),
              _buildButtons(),
            ],
          ),
        );
      }
      return SingleChildScrollView(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      );
    });
  }

  Widget _buildRemind() {
    final state = CardManagerLandScapeController.to.state;
    return Obx(
      () {
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          width: 300.r,
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
                            text: 'login.onlineservice'.tr,
                            style: const TextStyle(
                              color: Color.fromRGBO(246, 204, 150, 1),
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
    // WithdrawalLogic drawalLogic = WithdrawalLogic.to;

    var state = WithdrawalLogic.to.state;
    return SizedBox(
      width: 200.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ThemeButton(
            onPressed: () => ctrl.factorTixian(state.needEntity),
            btnText: 'confirm.binding'.tr,
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    final ctrl = CardManagerLandScapeController.to;
    return SizedBox(
      width: 300.r,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80.r,
              child: const Text(
                '卡包类型:',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            // ThemeRadioGroup<int>(
            //   onChange: (value) {
            //     ctrl.state.bankFormKey.currentState!.reset();
            //     ctrl.state.currentType = value;
            //   },
            //   name: 'type',
            //   disabled: ctrl.state.formType == CardFormType.readOnly
            //       ? ctrl.state.cardTypes.keys
            //           .where((e) => e != ctrl.currentItem?.type)
            //           .toList()
            //       : null,
            //   initialValue: ctrl.state.currentType,
            //   wrapAlignment: WrapAlignment.center,
            //   options: ctrl.state.cardTypes.entries
            //       .where((element) => element.key != 3)
            //       .map(
            //         (value) => FormBuilderFieldOption(
            //           value: value.key,
            //           child: Text(
            //             value.value.tr,
            //             style: const TextStyle(color: Colors.white),
            //           ),
            //         ),
            //       )
            //       .toList(),
            // ),
            FormBuilder(
              key: ctrl.state.bankFormKey,
              initialValue: ctrl.currentItem?.toJson() ?? {},
              enabled: ctrl.state.formType != CardFormType.readOnly,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ctrl.state.formFields.map(
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
                      return ThemeTextInput(
                        label: e.label.tr,
                        name: e.name,
                        isReadOnly: true,
                        hintText: e.hintText?.tr,
                        suffixIcon: GestureDetector(
                          // onTap: () => Get.dialog(
                          //   SelectorDialog(
                          //     title: '请选择收款银行',
                          //     onClose: (val) => ctrl.onSelectClose(val),
                          //     options: ctrl.state.bankList,
                          //     initialValue: ctrl.bankNameValue,
                          //   ),
                          // ),
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: Color.fromRGBO(246, 204, 150, 1),
                          ),
                        ),
                      );
                    }
                    return ThemeTextInput(
                      label: e.label.tr,
                      name: e.name,
                      hintText: e.hintText?.tr,
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileForm() {
    final ctrl = CardManagerLandScapeController.to;
    return SizedBox(
      width: 300.r,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormBuilder(
              key: ctrl.state.regphoneFormKey,
              initialValue: ctrl.currentItem?.toJson() ?? {},
              enabled: ctrl.state.formType != CardFormType.readOnly,
              child: ThemeTextInput(
                label: 'withdraw.moblile'.tr,
                name: 'regphone',
                hintText: '请输入手机号',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPassWordForm() {
    final ctrl = CardManagerLandScapeController.to;
    return SizedBox(
      width: 300.r,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormBuilder(
              key: ctrl.state.qkpassFormKey,
              initialValue: ctrl.currentItem?.toJson() ?? {},
              enabled: ctrl.state.formType != CardFormType.readOnly,
              child: ThemeTextInput(
                label: 'withdraw.password'.tr,
                name: 'qkpass',
                hintText: 'reg.hint.password.withdraw'.tr,
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
                  Text(
                    "账户类型:",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                  ),
                  SizedBox(height: 10),
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
          ctrl.state.currentType = i+1;
          if(ctrl.state.currentType ==1){
            ctrl.currentBanks = ctrl.bankItems;
          }else  if(ctrl.state.currentType ==2){
            ctrl.currentBanks = ctrl.bankItems3;
          }else  if(ctrl.state.currentType ==3){
            ctrl.currentBanks = ctrl.bankItems2;
          }
        },
        btnText: tuple2.item1,
        color:ctrl.state.currentType-1 == i ?const LinearGradient(
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
