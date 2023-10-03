import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'withdrawal_state_new.dart';

class WithdrawalLogicNew extends BaseController {
  static WithdrawalLogicNew get to => Get.find();

  WithdrawalStateNew state = WithdrawalStateNew();

  final PageController pageController = PageController();

  WithdrawalProvider provider = WithdrawalProvider();
  final UserWalletProvider userWalletProvider = UserWalletProvider();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    startLoading();
    await UserService.to.getUserBankInfo();
    await factorNeed();
    // await getBankList();
    await getUserMoney();
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
    ).then((value) => state.bankList.addAll(value!.banks!));
    update();
  }

  // 提现
  Future<void> tixian() async {
    TixianDto tixianDto = TixianDto();
    state.withdrawFormKey.currentState?.save();
    var form = state.withdrawFormKey.currentState!.value;
    tixianDto.txTotal = form[WithdrawalFormFields.money];
    tixianDto.qkpass = form[WithdrawalFormFields.password];
    tixianDto.bankcard = state.bankInfo.bankcard;
    tixianDto.id = state.bankInfo.id;
    tixianDto.mfCount = 1;
    if (double.parse(UserService.to.state.balance) <
        double.parse(tixianDto.txTotal ?? "0")) {
      SmartDialog.showToast("金额少于${tixianDto.txTotal ?? '0'}元");
      return;
    }
    // tixianDto.phoneCode = "666666"; //暂时写死

    await fetchHandler<YongJinEntity>(
      provider.tixian(tixianDto),
      onSuccess: (item) {
        SmartDialog.showToast("提现订单申请成功");
        state.withdrawFormKey.currentState?.reset();
        UserService.to.getUserBankInfo();
        UserService.to.getUserMoney();
        Get.back(result: [
          {"backValue": "one"}
        ]);
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
        state.mbankList.firstWhere((element) => '${element.id}' == value);
    if (target.bankname != null) {
      state.withdrawFormKey.currentState?.save();
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
