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
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
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

  @override
  Future<void> deleteCard(BankInfos item) async {
    SmartDialog.showToast('暂不支持删除银行卡');

    return;
  }

  Future<void> _request() async {
    await getUserMoney();
    await initHeaderListr();
    state.true_name =
        TextEditingController(text: state.userInfo.truename.toString());
    printInfo(info: "--------------->2 ${state.userInfo.truename}");
  }

  @override
  Future<void> onInit() async {
    startLoading();
    await initMyBankList();
    super.onInit();
    printInfo(info: "--------------->1");

    _request();
    printInfo(info: "--------------->3");
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
        state.banks = res.banks;
        update();
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
      printInfo(info: "数据 ${state.bank_card.text}");
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
      state.bankFormKey.currentState?.reset();
    });
  }

  // 获取用户余额及信息
  Future<void> getUserMoney() async {
    WithdrawalProvider provider = WithdrawalProvider();
    await fetchHandler<MoneyInfoEntity>(
      provider.getUserMoney(),
    ).then((value) => state.userInfo = value);
  }
}
