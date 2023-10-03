import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:app10/views/withdraw/widget/amount_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/types/gf_animation_type.dart';

import '../../../app_service.dart';
import '../../../theme/color_schema.dart';
import '../../../widget/form/card_cell_input.dart';
import '../../../widget/misc/theme_button.dart';
import '../../../widget/misc/theme_card.dart';
import '../controllers/withdraw_money_controller.dart';

class WithdrawForm extends StatelessWidget {
  const WithdrawForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WithdrawMoneyController controller = WithdrawMoneyController.to;
    return FormBuilder(
      key: WithdrawMoneyController.to.state.formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: context.mediaQueryViewPadding.bottom),
        child: Obx(() {
          return Column(
            children: [
              SizedBox(
                height: 15.r,
              ),
              _balance(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.r,
                  horizontal: 12.r,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _withdrawInfo(),
                    _bankSelect(context),
                    _amount(),
                    SizedBox(
                      height: 8.r,
                    ),
                    _withdrawPass(),
                    SizedBox(
                      height: 20.r,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.r, bottom: 20.r),
                      child: ThemeButton(
                          onTap: () {
                            WithdrawMoneyController.to
                                .tixian(password: controller.withDrawPassword);
                          },
                          text: '立即取款',
                          // fullWidth: true,
                          block: false,
                          fullWidth: true),
                    ),
                    _buildFootView(),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _amount() {
    return FormBuilderField(
      builder: (formFieldState) {
        return AmountInput(
          title: '金额',
          textMargin: EdgeInsets.zero,
          onTextChange: WithdrawMoneyController.to.setWithdrawAmount,
          // showMoney: WithdrawMoneyController.to.state.numbers,
          showMoney: const [], //暂时不显示金额卡片
        );
      },
      name: 'money',
    );
  }

  Widget _withdrawPass() {
    WithdrawMoneyController controller = WithdrawMoneyController.to;
    return Obx(() {
      return TextField(
        obscureText: controller.firstInputVisible,
        controller: controller.firstInputController,
        onChanged: (text) {
          controller.firstIconVisible = text.isNotEmpty;
          controller.withDrawPassword = text;
        },
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 12.w, left: 10.w, bottom: 12.w, right: 10.w),
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6), //边角为30
            ),
            borderSide: BorderSide(
              color: Color(0xFFEBEBEB),
              width: 1, //边线宽度为2
            ),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFFEBEBEB),
            width: 1, //宽度为5
          )),
          // errorText: "errorText",
          hintText: "请输入提款密码",
          hintStyle: TextStyle(
              color: const Color(0xFFC2C2C2),
              fontWeight: FontWeight.w400,
              fontSize: 14.w),
          suffixIcon: _passwordIcon(),
        ),
      );
    });
    // return const CardCellInput(
    //   name: 'password',
    //   label: '提款密码',
    //   hintText: '请输入提款密码',
    //   isRequired: true,
    //   textMargin: EdgeInsets.zero,
    //   obscureText: true,
    // );
  }

  Widget openEyesIcon() {
    return Image.asset(
      "assets/images/login/ice_on_ICON.png",
      width: 20.w,
      height: 20.w,
    );
  }

  Widget closeEyesIcon() {
    return Image.asset(
      "assets/images/login/ice_ICON.png",
      width: 20.w,
      height: 20.w,
    );
  }

  Widget? _passwordIcon() {
    WithdrawMoneyController controller = WithdrawMoneyController.to;
    if (controller.firstIconVisible) {
      return IconButton(
        icon: controller.firstInputVisible ? closeEyesIcon() : openEyesIcon(),
        onPressed: () {
          controller.firstInputVisible = !controller.firstInputVisible;
        },
      );
    }
    return null;
  }

  Widget _bankSelect(BuildContext context) {
    return ThemeCard(
      title: '收款账户',
      textStyle: TextStyle(fontSize: 14.sp, color: AppTheme.blackTextColor),
      child: InkWell(
        onTap: () {
          List m = [];
          WithdrawMoneyController.to.state.bankList.forEach((element) {
            m.add(WithdrawMoneyController.to.selectedNewBankFormatter(element));
          });
          if (m.isEmpty) {
            SmartDialog.showToast('暂无数据');
            return;
          }
          Pickers.showSinglePicker(
            context,
            pickerStyle: RaisedPickerStyle(color: AppTheme.primary),
            title: "请选择收款账户",
            data: m,
            onConfirm: (value, index) {
              WithdrawMoneyController.to.onSelectClose(
                WithdrawMoneyController.to.state.bankList[index].id.toString(),
              );
            },
          );
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            height: 44.r,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffEBEBEB))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    WithdrawMoneyController.to.state.withdrawBankCard ??
                        '请选择收款账户',
                    style: TextStyle(
                      color:
                          WithdrawMoneyController.to.state.withdrawBankCard ==
                                  null
                              ? AppTheme.neutral2
                              : AppTheme.blackColor,
                      fontSize: 14.sp,
                    )),
                Image.asset(
                  'assets/images/common/arrow_gray_down.png',
                  width: 12.r,
                  height: 12.r,
                )
              ],
            )),
      ),
    );
  }

  Widget _balance() {
    final currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol;
    int? xml = WithdrawMoneyController.to.state.userInfo.xml;
    String xmlStr = xml == null ? '--' : xml.toString();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 15.r),
      height: 68.r,
      decoration: const BoxDecoration(
          color: AppTheme.backgroundColor,
          border: Border(
            top: BorderSide(width: 1, color: AppTheme.borderColor),
            bottom: BorderSide(width: 1, color: AppTheme.borderColor),
          )),
      // boxShadow: [
      //   BoxShadow(
      //     color: AppTheme.shadowColor,
      //     blurRadius: 5,
      //   ),
      // ],
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '洗码量: ',
                  style: AppTheme.header2,
                  children: [
                    TextSpan(
                      text: xmlStr,
                      style: AppTheme.header3.copyWith(),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '余额: ',
                  style: AppTheme.header2,
                  children: [
                    TextSpan(
                      text:
                          '$currencySymbol${decimalString(WithdrawMoneyController.to.state.userInfo.money)}',
                      style: AppTheme.header3.copyWith(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
              onTap: () => WithdrawMoneyController.to.reloadMoney(),
              child: Container(
                height: 34.r,
                width: 91.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.buttonBg,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GFAnimation(
                      turnsAnimation: WithdrawMoneyController.to.animation,
                      controller:
                          WithdrawMoneyController.to.animationController,
                      type: GFAnimationType.rotateTransition,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/user/new_refresh.png",
                        width: 12.w,
                        height: 12.w,
                      ),
                    ),
                    SizedBox(
                      width: 8.r,
                    ),
                    Text(
                      '刷新',
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _withdrawInfo() {
    final state = WithdrawMoneyController.to.state;
    final userInfo = state.userInfo;
    final _userState = UserService.to.state;
    return Container(
      margin: EdgeInsets.only(bottom: 15.r),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: AppTheme.borderColor)),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 12.r),
              decoration: BoxDecoration(
                color: AppTheme.tipsCardBg,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                '若需提现金额，请仔细核实以下银行信息是否准确，如出现疑问，请咨询在线客服',
                style: TextStyle(
                  color: const Color(0xFFC38A30),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10.r,
            ),
            _withdrawInfoCell('开户姓名:', userInfo.truename ?? ''),
            _withdrawInfoCell(state.withdrawCardType, state.withdrawBankCard),
            _withdrawInfoCell(
              '今日免费提现次数:',
              _userState.userBank.txSCount.toString(),
            ),
            _withdrawInfoCell('提现状态:', '', child: _withdrawalStatus()),
          ],
        ),
      ),
    );
  }

  Widget _withdrawalStatus() {
    final userService = UserService.to;
    if (userService.state.userBank.txIstrue ?? false) {
      if (userService.state.xml > 0) {
        return RichText(
          text: TextSpan(
            text: '洗码量还差',
            style: AppTheme.header3,
            children: [
              TextSpan(
                text: userService.state.xml.toString(),
                style: const TextStyle(color: AppTheme.danger),
              ),
              TextSpan(
                text: '可提现',
                style: AppTheme.header3,
              ),
            ],
          ),
        );
      } else if ((userService.state.userBank.txSCount! > 0) &&
          userService.state.xml == 0) {
        return const Text(
          '可免费提现',
          style: TextStyle(
            color: AppTheme.success,
          ),
        );
      } else {
        return SizedBox(
          width: ScreenUtil().screenWidth - 120,
          child: const Text(
            '超过免费提现次数,洗码量不足时,都将收取提现手续费。',
            style: TextStyle(color: AppTheme.warning, fontSize: 12),
          ),
        );
      }
    } else {
      return const Text(
        '暂时不能提现请联系客服',
        style: TextStyle(color: AppTheme.danger),
      );
    }
  }

  Widget _withdrawInfoCell(
    String label,
    String? value, {
    Color? valueColor,
    Widget? child,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.r),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppTheme.blackTextColor,
            ),
          ),
          SizedBox(
            width: 8.r,
          ),
          child ??
              Text(
                value ?? '',
                style: AppTheme.header3.copyWith(color: valueColor),
              ),
        ],
      ),
    );
  }

  Widget _buildFootView() {
    final payMin = UserService.to.state.userBank.minTotal;
    final currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '注意事项：\n',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppTheme.blackTextColor,
            ),
          ),
          TextSpan(
            text: '最低提现金额为$currencySymbol$payMin\n如果忘记取款密码，请联系',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppTheme.neutral3,
            ),
          ),
          // TextSpan(
          //   text:
          //       '*超出免费提现次数/洗码量不足时，都将收取提现手续费\n*最低提现金额为$currencySymbol$payMin\n*如果忘记取款密码，请联系',
          //   style: TextStyle(
          //     fontSize: 12.sp,
          //     color: AppTheme.neutral3,
          //   ),
          // ),
          TextSpan(
            text: '客服',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppTheme.danger,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppService.to.toCustomerService();
              },
          ),
        ],
      ),
    );
  }
}
