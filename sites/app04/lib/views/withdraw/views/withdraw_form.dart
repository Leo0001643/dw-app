import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
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
import '../../../widget/misc/theme_card_cell.dart';
import '../../user/recharge_online/widget/amount_input.dart';
import '../controllers/withdraw_money_controller.dart';

class WithdrawForm extends StatelessWidget {
  const WithdrawForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: WithdrawMoneyController.to.state.formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: context.mediaQueryViewPadding.bottom),
        child: Obx(() {
          return Column(
            children: [
              _balance(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.r,
                  horizontal: 12.r,
                ),
                child: Column(
                  children: [
                    _withdrawInfo(),
                    _bankSelect(context),
                    // _amount(),
                    _withdrawMoney(),
                    SizedBox(height: 15.r,),
                    _withdrawPass(),
                    Padding(
                      padding: EdgeInsets.only(top: 35.r, bottom: 20.r),
                      child: ThemeButton(
                        onTap: () => WithdrawMoneyController.to.tixian(),
                        text: '提交',
                        block: true,
                      ),
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
          onTextChange: WithdrawMoneyController.to.setWithdrawAmount,
          showMoney: WithdrawMoneyController.to.state.numbers,
        );
      },
      name: 'money',
    );
  }
Widget _withdrawMoney() {
    return const CardCellInput(
      name: 'money',
      label: '金额',
      hintText: '请输入提现金额',
      isRequired: true,
    );
  }
  Widget _withdrawPass() {
    return const CardCellInput(
      name: 'password',
      label: '提现密码',
      hintText: '请输入提现密码',
      isRequired: true,
    );
  }

  Widget _bankSelect(BuildContext context) {
    return ThemeCard(
      title: '收款账户',
      child: InkWell(
        onTap: () {
          List m = [];
          WithdrawMoneyController.to.state.bankList.forEach((element) {
            m.add(WithdrawMoneyController.to.selectedNewBankFormatter(element));
          });
          if (m.length == 0) {
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
            padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffEBEBEB))),
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              WithdrawMoneyController.to.state.withdrawBankCard ?? '请选择收款账户',
              style: AppTheme.header2.copyWith(color: AppTheme.neutral),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18.sp,
              color: AppTheme.neutral,
            ),
          ],
        )),
      ),
    );
  }

  Widget _balance() {
    final currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 15.r),
      height: 68.r,
      decoration: const BoxDecoration(
        color: AppTheme.cardBg,
        boxShadow: [
          BoxShadow(
            color: AppTheme.shadowColor,
            blurRadius: 5,
          ),
        ],
      ),
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
                      text: UserService.to.state.xml.toString() //(WithdrawMoneyController.to.state.userInfo.xml > 0) ? '' : '' '${WithdrawMoneyController.to.state.userInfo.xml ?? 0}' 
                          ,
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
            child:Container(
              height: 30,
              width: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppTheme.btnRefreshColor,
                borderRadius:BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GFAnimation(
                    turnsAnimation: WithdrawMoneyController.to.animation,
                    controller: WithdrawMoneyController.to.animationController,
                    type: GFAnimationType.rotateTransition,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/user/new_refresh.png",width: 20.w,height: 20.w,),
                  ),
                  SizedBox(
                    width: 2.r,
                  ),
                  Text(
                    '刷新',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget _withdrawInfo() {
    final state = WithdrawMoneyController.to.state;
    final userInfo = state.userInfo;
    final _userState = UserService.to.state;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffEBEBEB))),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 12.r),
              decoration: BoxDecoration(
                color: stringToColor('fcf8e3'),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child:  Text(
                '若需提现金额，请仔细核实以下银行信息是否准确，如出现疑问，请咨询在线客服',
                style: TextStyle(
                  color: stringToColor('8a6d3b'),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ), 
           
            _withdrawInfoCell('开户姓名:',  UserService.to.state.trueName),
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
        return  Text(
          '提现',
          style: TextStyle(
            fontSize: 11.sp,
            color: const Color.fromRGBO(11, 33, 59, 0.7),
            fontWeight: FontWeight.bold
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
              fontSize: 13.sp,
              color: const Color(0xff666666),
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
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 12.5.r),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '注意事项:\n',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
            TextSpan(
              //*超出免费提现次数/洗码量不足时，都将收取提现手续费
              text:
                  '最低提现金额为$currencySymbol$payMin¥\n如果忘记提现密码，请联系',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppTheme.neutral3,
              ),
            ),
            TextSpan(
              text: '客服',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppTheme.primary,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {
                AppService.to.toCustomerService();
              },
            ),
          ],
        ),
      ),
    );
  }
}
