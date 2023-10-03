import 'dart:async';

import 'package:aone_common/controllers/mine/card_management/card_management_logic.dart';
import 'package:aone_common/controllers/mine/card_management/card_management_state.dart';
import 'package:aone_common/data/model/dto/user/binding_bank.dart';
import 'package:aone_common/data/model/entities/user/get_user.dart';
import 'package:aone_common/data/model/entities/user/mybankInfo_list.dart';
import 'package:aone_common/data/remote/providers/site_config_provider.dart';
import 'package:aone_common/data/remote/providers/user_wallet_provider.dart';
import 'package:aone_common/data/remote/providers/withdrawal_provider.dart';
import 'package:aone_common/services/user/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import 'card_manager_state.dart';

class CardManagerChildLogic extends CardManagerLogic {
  static CardManagerChildLogic get to => Get.find();

  @override
  CardManagerState state = CardManagerState();

  final UserService _userService = UserService.to;

  //银行列表 bankList
  SiteConfigProvider siteConfigProvider = SiteConfigProvider();
  UserWalletProvider _userWalletProvider = UserWalletProvider();

  final _allowDelete = false.obs;
  get allowDelete => _allowDelete.value;
  set allowDelete(val) => _allowDelete.value = val;

  @override
  Future<void> deleteCard(BankInfos item) async {
    await fetchHandler(userWalletProvider.deleteBankCard(item),
        onSuccess: (_) async {
      await _userService.getUserBankInfo();
      await initMyBankList();
      onDeleteSuccess();
    });
  }

  @override
  Future<void> onInit() async {
    startLoading();
    state.isPerfectDrawInfoPage = Get.arguments ?? false;
    await initHeaderListr();
    await initMyBankList();
    await getUserMoney();
    super.onInit();
    final String name = state.userInfo.truename.toString();
    if (name.isNotEmpty && name != '0') {
      //后台trueName为空返回的0
      state.true_name.text = state.userInfo.truename.toString();
    }
    stopLoading();
  }

  initHeaderListr() async {
    state.headerList.add(Tuple2('银行卡', state.selIndex == 0));
    state.headerList.add(Tuple2('区块链', state.selIndex == 1));
  }

  Future<void> initMyBankList() async {
    await fetchHandler<MyBankListInfoEntity>(
      _userWalletProvider.myBankList(),
      onSuccess: (res) {
        _allowDelete.value = res.bankUp ?? false;
        state.banks = res.banks;
      },
    );
  }

  Future<void> postBindingBankDataChild() async {
    debugPrint(state.bank_card.text);
    debugPrint(state.true_name.text);
    debugPrint(state.bank_name.text);
    debugPrint(state.usdt_type.text); //对应bank_kaihu
    debugPrint(state.usdt_address.text); //对应bank_card

    final BindingBankDto dto = BindingBankDto();
    dto.truename = state.true_name.text;
    if (state.selIndex == 0) {
      dto.bankcard = state.bank_card.text;
    } else {
      dto.bankcard = state.usdt_address.text;
    }
    dto.bankname = state.bank_name.text;
    if (state.selIndex == 0) {
      dto.bankkaihu = state.bank_kaihu.text;
      dto.banktype = state.currentType.toString();
    } else {
      dto.bankkaihu = state.usdt_type.text;
      dto.banktype = "2";
    }

    dto.postid = state.formType.typeInt.toString();

    await fetchHandler(userWalletProvider.bindingBankCard(dto),
        onSuccess: (_) async {
      onAddSuccess();
      await _userService.getUserBankInfo();
      await initMyBankList();
      state.bankFormKey.currentState?.reset();
    });
    Get.back();
  }

  // 获取用户余额及信息
  Future<void> getUserMoney() async {
    WithdrawalProvider provider = WithdrawalProvider();
    await fetchHandler<MoneyInfoEntity>(
      provider.getUserMoney(),
    ).then((value) => state.userInfo = value);
  }
}
