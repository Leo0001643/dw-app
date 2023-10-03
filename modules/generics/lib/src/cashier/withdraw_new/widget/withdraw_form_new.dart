import 'package:aone_common/common.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:generics/src/cashier/data/withdraw_theme.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../card_manager_new/controllers/card_manager_logic.dart';
import '../../card_manager_new/views/add_bank_dialog.dart';
import '../../widgets/theme_card.dart';
import '../../withdraw_new/controller/withdraw_money_controller.dart';

class WithdrawFormNew extends StatelessWidget {
  const WithdrawFormNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CardManagerChildLogic());
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      behavior: HitTestBehavior.opaque,
      child: FormBuilder(
        key: WithdrawMoneyController.to.state.withdrawFormKey,
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: context.mediaQueryViewPadding.bottom),
          child: Obx(() {
            return Column(
              children: [
                _balance(),
                UserService.to.state.userBank!.txIstrue!
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.r,
                          horizontal: 12.r,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _withdrawType(),
                            _amount(),
                            _bankSelect(context),
                            _withdrawPass(),
                            _buildFootView(),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 35.r, bottom: 20.r),
                                // child: ThemeButton(
                                //   onTap: () => WithdrawMoneyController.to.tixian(),
                                //   text: '立即取款',
                                //   block: true,
                                // ),
                                child: GestureDetector(
                                  onTap: () {
                                    WithdrawMoneyController.to.tixian();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    height: 40,
                                    decoration: AoneAppTheme
                                        .appTheme.withDrawalNormalBntDecoration,
                                    child: Text("确认提现",
                                        style: TextStyle(
                                            color: AoneAppTheme.appTheme
                                                .normalButtonTextColor)),
                                  ),
                                ))
                          ],
                        ),
                      )
                    : Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        child: Text(
                          "当前不能提现，请联系在线客服",
                          style: TextStyle(
                              color: AoneAppTheme
                                  .appTheme.disableWithdrawTipsColor),
                        )),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _amount() {
    var state = WithdrawMoneyController.to.state;
    final userService = UserService.to;
    FocusNode _commentFocus = FocusNode();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("提现金额",
                  style:
                      TextStyle(color: AoneAppTheme.appTheme.inputLabelColor)),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 10.r),
                child: FormBuilderField(
                  builder: (formFieldState) {
                    return TextFormField(
                      style: TextStyle(
                          color: AoneAppTheme.appTheme.inputTextColor,
                          fontSize: 14),
                      onChanged: WithdrawMoneyController.to.setWithdrawAmount,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[0-9]'),
                        )
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "请输入提现金额",
                        hintStyle: TextStyle(
                            color: AoneAppTheme.appTheme.inputHintTextColor!,
                            fontSize: 14),
                        contentPadding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 10),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: BorderSide(
                            color: AoneAppTheme.appTheme.inputBorderColor!,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: BorderSide(
                            color: AoneAppTheme.appTheme.inputBorderColor!,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: BorderSide(
                            color: AoneAppTheme.appTheme.inputBorderColor!,
                          ),
                        ),
                      ),
                    );
                  },
                  name: 'money',
                ),
              )),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 70),
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                  child: Text(
                    "*提现金额不支持小数点",
                    style: TextStyle(
                        color: const Color(0xffb4b3b5), fontSize: 12.sp),
                  )),
            ],
          ),
          WithdrawMoneyController.to.activeTypeIndex == 2
              ? Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 70),
                          Text(
                            '参考汇率: 1 USDT = ${decimalString('${double.parse(userService.state.userBank.huilv.toString())}', 4)} CNY',
                            style: TextStyle(
                                color: const Color(0xffdf3b08), fontSize: 9.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 70),
                          Text(
                            '您将收到 ${decimalString(((double.tryParse(state.currentAmount) ?? 0) / double.parse(userService.state.userBank.huilv!)).toString(), 4)} USDT',
                            style: TextStyle(
                                color: const Color(0xffdf3b08), fontSize: 9.sp),
                          ),
                        ],
                      )
                    ],
                  );
                })
              : SizedBox(
                  width: 5,
                )
        ],
      ),
    );
  }

  Widget _withdrawPass() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("提现密码",
                  style:
                      TextStyle(color: AoneAppTheme.appTheme.inputLabelColor)),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 10.r),
                      child: FormBuilderField(
                        builder: (formFieldState) {
                          return Obx(() => TextField(
                                style: TextStyle(
                                    color:
                                        AoneAppTheme.appTheme.inputTextColor!,
                                    fontSize: 14),
                                obscureText:
                                    WithdrawMoneyController.to.showEye.isFalse,
                                onChanged:
                                    WithdrawMoneyController.to.setPassword,
                                decoration: InputDecoration(
                                  hintText: "请输入提现密码",
                                  hintStyle: TextStyle(
                                      color: AoneAppTheme
                                          .appTheme.inputHintTextColor!,
                                      fontSize: 14),
                                  contentPadding: const EdgeInsets.only(
                                      left: 10, top: 10, bottom: 10, right: 10),
                                  isDense: true,
                                  suffixIcon: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        WithdrawMoneyController
                                                .to.showEye.value =
                                            !WithdrawMoneyController
                                                .to.showEye.value;
                                      },
                                      child: SizedBox(
                                          width: 16,
                                          height: 16,
                                          //Image.asset('assets/images/editor.png',package: 'generics',width: 20,height: 20,)
                                          child: Obx(() {
                                            return Center(
                                              child: Image.asset(
                                                WithdrawMoneyController
                                                            .to.showEye.value ==
                                                        true
                                                    ? Assets.openEye
                                                    : Assets.closeEye,
                                                package: 'generics',
                                                width: 16,
                                              ),
                                            );
                                          }))),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    borderSide: BorderSide(
                                      color: AoneAppTheme
                                          .appTheme.inputBorderColor!,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    borderSide: BorderSide(
                                      color: AoneAppTheme
                                          .appTheme.inputBorderColor!,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    borderSide: BorderSide(
                                      color: AoneAppTheme
                                          .appTheme.inputBorderColor!,
                                    ),
                                  ),
                                ),
                              ));
                        },
                        name: 'password',
                      )))
            ],
          ),
        ],
      ),
    );
  }

  Widget _bankSelect(BuildContext context) {
    var state = WithdrawMoneyController.to.state;
    TextStyle textStyle = TextStyle(
      fontSize: 13,
      color: AoneAppTheme.appTheme.accountInfoTextColor,
    );
    return Obx(() {
      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("提现账户",
                    style: TextStyle(
                        color: AoneAppTheme.appTheme.inputLabelColor)),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      List m = [];
                      List<BankInfos> mList = [];
                      for (var element
                          in WithdrawMoneyController.to.state.bankList) {
                        if (element.type ==
                            WithdrawMoneyController.to.getBankTypeByIndex()) {
                          m.add(WithdrawMoneyController.to
                              .selectedNewBankFormatter(element));
                          mList.add(element);
                        }
                      }
                      if (m.isEmpty) {
                        SmartDialog.showToast('暂无数据');
                        return;
                      }
                      WithdrawMoneyController.to.state.mbankList.value = mList;
                      Pickers.showSinglePicker(
                        context,
                        pickerStyle: DefaultPickerStyle(),
                        title: "请选择收款账户",
                        data: m,
                        onConfirm: (value, index) {
                          WithdrawMoneyController.to.onSelectClose(
                            WithdrawMoneyController.to.state.mbankList[index].id
                                .toString(),
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 0),
                      decoration: BoxDecoration(
                        color: AoneAppTheme.appTheme.inputAccountColor ??
                            const Color(0xffffffff),
                        // color: Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                            width: 1,
                            color: AoneAppTheme.appTheme.inputBorderColor!),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            WithdrawMoneyController.to.state.withdrawBankCard ??
                                '请选择收款账户',
                            style: TextStyle(
                                color:
                                    AoneAppTheme.appTheme.inputHintTextColor!),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 18.sp,
                            color: AoneAppTheme.appTheme.inputHintTextColor!,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            WithdrawMoneyController.to.state.bankInfo.type == 1
                ? Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: WithdrawTheme().accountInfoCardDecoration,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: Row(
                            children: [
                              Text("银行名称:", style: textStyle),
                              Text(
                                  WithdrawMoneyController
                                          .to.state.bankInfo.bankname ??
                                      "",
                                  style: textStyle),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: Row(
                            children: [
                              Text("开户行:", style: textStyle),
                              Text(
                                  WithdrawMoneyController
                                          .to.state.bankInfo.bankkaihu ??
                                      "",
                                  style: textStyle),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: Row(
                            children: [
                              Text("开户姓名:", style: textStyle),
                              Text(UserService.to.state.trueName ?? "",
                                  style: textStyle),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: Row(
                            children: [
                              Text("银行账户:", style: textStyle),
                              Text(
                                  WithdrawMoneyController
                                          .to.state.bankInfo.bankcard ??
                                      "",
                                  style: textStyle),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : WithdrawMoneyController.to.state.bankInfo.type == 2
                    ? Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: WithdrawTheme().accountInfoCardDecoration,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: Row(
                                children: [
                                  Text("地址协议:", style: textStyle),
                                  Text(
                                      WithdrawMoneyController
                                              .to.state.bankInfo.bankkaihu ??
                                          "",
                                      style: textStyle),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: Row(
                                children: [
                                  Text("钱包地址:", style: textStyle),
                                  Text(
                                      WithdrawMoneyController
                                              .to.state.bankInfo.bankcard ??
                                          "",
                                      style: textStyle),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : WithdrawMoneyController.to.state.bankInfo.type == 4
                        ? Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration:
                                WithdrawTheme().accountInfoCardDecoration,
                            child: Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text("账号类型:", style: textStyle),
                                      Text(
                                          WithdrawMoneyController.to.state
                                                  .bankInfo.bankkaihu ??
                                              "",
                                          style: textStyle),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text("钱包地址:", style: textStyle),
                                      Text(
                                          WithdrawMoneyController
                                                  .to.state.bankInfo.bankcard ??
                                              "",
                                          style: textStyle),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(height: 5),
            state.mbankList.value.isEmpty
                ? GestureDetector(
                    onTap: () {
                      var state = CardManagerChildLogic.to.state;
                      state.headerSelIndex =
                          WithdrawMoneyController.to.activeTypeIndex;
                      state.isEditable = false;
                      CardManagerChildLogic.to.editData();
                      
                      // Get.dialog(
                      //   WillPopScope(
                      //       onWillPop: () async {
                      //         print("刷新卡片");
                      //         WithdrawMoneyController.to.getBankList();
                      //         return false;
                      //       },
                      //       child: const AddBankDialog(),
                      //     ),
                      //     barrierDismissible: false,
                      //     );
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return WillPopScope(
                            onWillPop: () async {
                              print("刷新卡片");
                              WithdrawMoneyController.to.getBankList();
                              return false;
                            },
                            child: AddBankDialog(),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: ScreenUtil().screenWidth,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 0),
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      decoration:
                          AoneAppTheme.appTheme.addAccountButtonDecoration,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle,
                              color: AoneAppTheme
                                  .appTheme.addAccountButtonTextColor),
                          Text("新增账户",
                              style: TextStyle(
                                  color: AoneAppTheme
                                      .appTheme.addAccountButtonTextColor)),
                        ],
                      ),
                    ),
                  )
                : SizedBox(
                    width: 5,
                  )
          ],
        ),
      );
    });
  }

  Widget _balance() {
    final currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol;
    final _userState = UserService.to.state;
    WithdrawTheme _theme = WithdrawTheme();
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      height: 88.r,
      decoration: BoxDecoration(
          color: AoneAppTheme.appTheme.topBoxBgColor,
          // color: Colors.green,
          border: Border(
            top: BorderSide(
                color: AoneAppTheme.appTheme.topBoxBorderColor!, width: 1),
            bottom: BorderSide(
                color: AoneAppTheme.appTheme.topBoxBorderColor!, width: 1),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return RichText(
                  text: TextSpan(
                    text: '账户余额: ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AoneAppTheme.appTheme.mainTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text:
                            '$currencySymbol${decimalString(UserService.to.state.balance)}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AoneAppTheme.appTheme.withDrawalBalanceColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              RichText(
                text: TextSpan(
                  text: '洗码量还需: ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AoneAppTheme.appTheme.mainTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text:
                          WithdrawMoneyController.to.state.userInfo.xml == null
                              ? "--"
                              : WithdrawMoneyController.to.state.userInfo.xml
                                  .toString(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AoneAppTheme.appTheme.washTxtColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '今日免费提现次数: ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AoneAppTheme.appTheme.mainTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: WithdrawMoneyController.to
                          .getWithdrawFreeNum(_userState.userBank.txSCount!),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AoneAppTheme.appTheme.withDrawalBalanceColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              WithdrawMoneyController.to.reloadMoney();
            },
            child: Container(
              decoration: AoneAppTheme.appTheme.refreshButtonDecoration,
              width: 60.r,
              height: 30.r,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '刷新',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AoneAppTheme.appTheme.normalButtonTextColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _withdrawType() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("提现方式",
              style: TextStyle(color: AoneAppTheme.appTheme.inputLabelColor)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _typeButton(
                  "银行卡",
                  (ScreenUtil().screenWidth - 40) / 3.0,
                  WithdrawMoneyController.to.activeTypeIndex == 0
                      ? true
                      : false, () {
                WithdrawMoneyController.to.activeTypeIndex = 0;
                WithdrawMoneyController.to.getMList();
                WithdrawMoneyController.to.state.bankInfo = BankInfos();
              }),
              _typeButton(
                  "电子钱包",
                  (ScreenUtil().screenWidth - 40) / 3.0,
                  WithdrawMoneyController.to.activeTypeIndex == 1
                      ? true
                      : false, () {
                WithdrawMoneyController.to.activeTypeIndex = 1;
                WithdrawMoneyController.to.getMList();
                WithdrawMoneyController.to.state.bankInfo = BankInfos();
              }),
              _typeButton(
                  "虚拟币",
                  (ScreenUtil().screenWidth - 40) / 3.0,
                  WithdrawMoneyController.to.activeTypeIndex == 2
                      ? true
                      : false, () {
                WithdrawMoneyController.to.activeTypeIndex = 2;
                WithdrawMoneyController.to.getMList();
                WithdrawMoneyController.to.state.bankInfo = BankInfos();
              }),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _withdrawInfo() {
    final state = WithdrawMoneyController.to.state;
    final userInfo = state.userInfo;
    final _userState = UserService.to.state;
    return ThemeCard(
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 12.r),
              decoration: BoxDecoration(
                color: Color(0xFFDAE3F2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: const Text(
                '若需提现金额，请仔细核实以下银行信息是否准确，如出现疑问，请咨询在线客服',
                style: TextStyle(
                  color: Color(0xFF0000ff),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            _withdrawInfoCell('开户姓名:', userInfo.truename ?? ''),
            _withdrawInfoCell(state.withdrawCardType, state.withdrawBankCard),
            _withdrawInfoCell(
                '今日免费提现次数:',
                WithdrawMoneyController.to
                    .getWithdrawFreeNum(_userState.userBank.txSCount!)
                // _userState.userBank.txSCount.toString(),
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
            style: TextStyle(
              fontSize: 11.sp,
              color: const Color.fromRGBO(11, 33, 59, 0.7),
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: userService.state.xml.toString(),
                style: const TextStyle(color: Color(0xFFFF0000)),
              ),
              TextSpan(
                text: '可提现',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: const Color.fromRGBO(11, 33, 59, 0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      } else if (userService.state.xml == 0) {
        return const Text(
          '可提现',
          style: TextStyle(
            color: Color(0xFFFFFF00),
          ),
        );
      } else {
        return const Expanded(
          child: Text(
            '超过免费提现次数,洗码量不足时,都将收取提现手续费。',
            style: TextStyle(color: Color(0xffff0000)),
          ),
        );
      }
    } else {
      return const Text(
        '暂时不能提现请联系客服',
        style: TextStyle(color: Color(0xffff0000)),
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
              color: const Color.fromRGBO(11, 33, 59, 1),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 8.r,
          ),
          child ??
              Text(
                value ?? '',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: valueColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
        ],
      ),
    );
  }

  Widget _buildFootView() {
    final payMin = UserService.to.state.userBank.minTotal;
    final payMax = UserService.to.state.userBank.maxTotal;
    final currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '提现金额范围：',
            style: TextStyle(
              fontSize: 12.sp,
              color: AoneAppTheme.appTheme.withdrawTipTextColor,
            ),
          ),
          TextSpan(
            text: '$currencySymbol$payMin ~ $currencySymbol$payMax',
            style: TextStyle(
              fontSize: 12.sp,
              color: AoneAppTheme.appTheme.withdrawScopeMoneyTextColor,
            ),
          ),
          TextSpan(
            text: '\n请仔细核对提现账号是否正确，如有疑问请联系',
            style: TextStyle(
              fontSize: 12.sp,
              color: AoneAppTheme.appTheme.withdrawTipTextColor,
            ),
          ),
          TextSpan(
            text: '在线客服',
            style: TextStyle(
              fontSize: 12.sp,
              color: AoneAppTheme.appTheme.withdrawKfTextColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (!Get.isRegistered<AppBaseService>()) {
                  Get.put(AppBaseService());
                }
                AppBaseService.to.openUrl(SpStorage.getCustomeUrl);
              },
          ),
        ],
      ),
    );
  }

  Widget _typeButton(
      String text, double width, bool isActive, VoidCallback onTap) {
    return Container(
      width: width,
      height: 36.r,
      decoration: isActive
          ? AoneAppTheme.appTheme.withDrawalNormalBntDecoration
          : AoneAppTheme.appTheme.lightButtonDecoration,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5.r,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive
                ? AoneAppTheme.appTheme.normalButtonTextColor
                : AoneAppTheme.appTheme.lightButtonTextColor,
          ),
        ),
      ),
    );
  }
}
