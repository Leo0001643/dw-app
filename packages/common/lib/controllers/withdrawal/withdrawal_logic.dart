import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'withdrawal_state.dart';

class WithdrawalLogic extends BaseController {
  static WithdrawalLogic get to => Get.find();

  WithdrawalState state = WithdrawalState();

  final PageController pageController = PageController();

  WithdrawalProvider provider = WithdrawalProvider();
  final UserWalletProvider userWalletProvider = UserWalletProvider();

  @override
  Future<void> onInit() async {
    startLoading();
    await UserService.to.getUserBankInfo();
    await factorNeed();
    await getBankList();
    await getUserMoney();
    super.onInit();
    stopLoading();
  }
 

  // 获取用户余额及信息
  Future<void> getUserMoney() async {
    await fetchHandler<MoneyInfoEntity>(
      provider.getUserMoney(),
    ).then((value) => state.userInfo = value);
  }

  //我的卡包
  Future<void> getBankList() async {
    state.bankList.clear();
    await fetchHandler<MyBankListInfoEntity>(
      provider.getBankList(),
    ).then((value) {
      state.bankList.addAll(value!.banks!);
    });
    update();
  }

  // 提现
  Future<void> tixian({String? password}) async {
    final currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol;
    final payMin = UserService.to.state.userBank.minTotal ?? 0;
    printInfo(
        info:
            "jett---->password: ${password}    currencySymbol  ${currencySymbol}  total ${UserService.to.state.balance}");

    TixianDto tixianDto = TixianDto();
    state.formKey.currentState?.save();
    var form = state.formKey.currentState!.value;
    tixianDto.txTotal = form[WithdrawalFormFields.money];
    tixianDto.qkpass = password ?? form[WithdrawalFormFields.password];
    tixianDto.bankcard = state.bankInfo.bankcard;
    tixianDto.id = state.bankInfo.id;
    tixianDto.mfCount = 1;
    if (double.parse(UserService.to.state.balance) < payMin.toDouble()) {
      SmartDialog.showToast("金额少于${payMin ?? '0'}元",
          alignment: Alignment.center);
      return;
    }

    // if(double.parse(UserService.to.state.balance) < 100){
    //   SmartDialog.showToast("金额少于100元",alignment:Alignment.center);
    //   return;
    // }
    await fetchHandler<YongJinEntity>(
      provider.tixian(tixianDto),
      onSuccess: (item) {
        print('item.message:${item.message}');
        SmartDialog.showToast(item.message!);
        state.formKey.currentState?.reset();
        UserService.to.getUserBankInfo();
        UserService.to.getUserMoney();
      },
    );
  }

  Future<void> factorNeed() async {
    await fetchHandler<FactorNeedEntity>(
      provider.factorNeed(),
      onSuccess: (res) {
        state.needEntity = res;
      },
    );
  }

  void onSelectClose(String value) {
    final target =
        state.bankList.firstWhere((element) => '${element.id}' == value);

    if (target.bankname != null) {
      state.formKey.currentState?.save();
      state.selectedBankValue = target.bankname!;
      state.bankInfo = target;
    }
  }

  String selectedBankFormatter(BankInfos bankInfo) {
    var bankName =
        bankInfo.type == 1 ? bankInfo.bankname! : bankInfo.bankkaihu!;
    var bankCardLast4Num = bankInfo.bankcard!.substring(
      bankInfo.bankcard!.length - 4,
    );
    return "$bankName ($bankCardLast4Num)";
  }
}

class WithdrawalFormFields {
  static String money = 'money';
  static String password = 'password';
}
