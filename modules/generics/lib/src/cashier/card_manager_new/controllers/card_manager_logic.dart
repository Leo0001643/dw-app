import 'dart:async';

import 'package:aone_common/controllers/mine/card_management_new/card_management_logic_new.dart';
import 'package:aone_common/controllers/mine/card_management_new/card_management_state.dart';
import 'package:aone_common/controllers/withdrawal_new/withdrawal_logic_new.dart';
import 'package:aone_common/core/event_bus.dart';
import 'package:aone_common/data/model/dto/user/binding_bank.dart';
import 'package:aone_common/data/model/entities/user/get_bank_list.dart';
import 'package:aone_common/data/model/entities/user/get_user.dart';
import 'package:aone_common/data/model/entities/user/mybankInfo_list.dart';
import 'package:aone_common/data/remote/providers/site_config_provider.dart';
import 'package:aone_common/data/remote/providers/user_wallet_provider.dart';
import 'package:aone_common/data/remote/providers/withdrawal_provider.dart';
import 'package:aone_common/services/user/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:generics/src/cashier/withdraw_new/controller/withdraw_money_controller.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import '../../../game/persistent_storage.dart';
import 'card_manager_state.dart';

class CardManagerChildLogic extends CardManagerLogicNew {
  static CardManagerChildLogic get to => Get.find();

  @override
  CardManagerState state = CardManagerState();

  final UserService _userService = UserService.to;

  //银行列表 bankList
  SiteConfigProvider siteConfigProvider = SiteConfigProvider();
  UserWalletProvider _userWalletProvider = UserWalletProvider();

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
    super.onInit();
    state.true_name = TextEditingController(text: _userService.state.trueName);
    // await initDialogBankTypeList();
    await initHeaderListr();
    await initMyBankList();
    await initCnyTypeList();
    await initDialogHeaderList();
    await getBankList();
    await getUserMoney();
    // state.isEditable = _userService.state.userBank.bankUp!;
    // state.formKey.currentState!.reset();
    stopLoading();
  }

  @override
  void onReady() {
    editData();
    super.onReady();
  }

  editData() async {
    if (state.isEditable && _userService.state.userBank.bankUp!) {
      print("isEditable");
      if (state.banks.isNotEmpty) {
        var data = state.banks[state.selIndex];
        state.bank_card = TextEditingController(text: data.bankcard);
        state.bank_name = TextEditingController(text: data.bankname);
        state.bank_kaihu = TextEditingController(text: data.bankkaihu);
        state.usdt_address = TextEditingController(text: data.bankcard);
        state.usdt_type =
            TextEditingController(text: data.bankkaihu.toString());
        state.digtal_address = TextEditingController(text: data.bankcard);
        state.digtal_type = TextEditingController(text: data.bankkaihu);
      }
    } else {
      print("isNotEditable");
      state.bank_card = TextEditingController(text: '');
      state.bank_name = TextEditingController(text: '');
      state.bank_kaihu = TextEditingController(text: '');
      state.usdt_address = TextEditingController(text: '');
      state.usdt_type = TextEditingController(text: '');
      state.digtal_address = TextEditingController(text: '');
      state.digtal_type = TextEditingController(text: '');
    }
    state.true_name = TextEditingController(text: _userService.state.trueName);
  }

  initHeaderListr() async {
    state.headerList.add(Tuple2('CNY', 0));
  }

  initCnyTypeList() async {
    Banks banks = Banks(name: "银行卡", names: "银行卡");
    state.cnyTypeList.add(banks);
  }

  // initDialogBankTypeList() async {
  //   Banks banks = Banks(name: "银行卡", names: "银行卡");
  //   state.dialogBankTypeList.add(banks);
  // }

  initDialogHeaderList() async {
    state.dialogHeaderList.add(Tuple2('银行卡', 0));
    state.dialogHeaderList.add(Tuple2('电子钱包', 1));
    state.dialogHeaderList.add(Tuple2('虚拟币', 2));
  }

  Future<void> getBankList() async {
    bool isFromSP = false;
    final spRes =
        await SharePreferencesUtils.readFromLocalMap('BankListEntity');
    if (spRes != null) {
      state.getBankListEntity = GetBankListEntity.fromJson(spRes);
      state.bankItems = state.getBankListEntity.items ?? [];
      state.bankItems2 = state.getBankListEntity.items2 ?? [];
      state.bankItems3 = state.getBankListEntity.items3 ?? [];
      int index = 0;
      for (var element in state.bankItems2) {
        index++;
        state.headerList.add(Tuple2(element.names, index));
      }
      for (var element in state.bankItems3) {
        state.cnyTypeList.add(element);
      }
      isFromSP = true;
      print('xxx from sp');
    }
    fetchHandler<GetBankListEntity>(siteConfigProvider.getBankList(),
        onSuccess: (res) async {
      if (!isFromSP) {
        state.getBankListEntity = res;
        state.bankItems = state.getBankListEntity.items ?? [];
        state.bankItems2 = state.getBankListEntity.items2 ?? [];
        state.bankItems3 = state.getBankListEntity.items3 ?? [];
        int index = 0;
        for (var element in state.bankItems2) {
          index++;
          state.headerList.add(Tuple2(element.names, index));
        }
        for (var element in state.bankItems3) {
          state.cnyTypeList.add(element);
        }
      }
      SharePreferencesUtils.saveToLocalMap('BankListEntity', res);
      print('xxx from net');
    });
  }

  Future<void> initMyBankList() async {
    fetchHandler<MyBankListInfoEntity>(
      _userWalletProvider.myBankList(),
      onSuccess: (res) {
        state.banks = res.banks;
      },
    );
  }

  Future<void> postBindingBankDataChild({bool? isEdit}) async {
    debugPrint(state.bank_card.text);
    debugPrint(state.true_name.text);
    debugPrint(state.bank_name.text);
    debugPrint(state.usdt_type.text); //对应bank_kaihu
    debugPrint(state.usdt_address.text); //对应bank_card

    final BindingBankDto dto = BindingBankDto();
    if (isEdit ?? false) {
      //编辑卡片
      var data = state.banks[state.selIndex];
      if (data.type == 1) {
        dto.banktype = state.bankType.toString();
        dto.bankcard = state.bank_card.text;
        dto.bankkaihu = state.bank_kaihu.text;
        dto.bankname = state.bank_name.text;
      } else if (data.type == 4) {
        //电子钱包
        dto.bankkaihu = state.digtal_type.text;
        dto.bankcard = state.digtal_address.text;
        dto.bankname = "";
        dto.banktype = "4";
      } else if (data.type == 2) {
        //虚拟币
        dto.bankname = "";
        dto.bankcard = state.usdt_address.text;
        dto.banktype = '2';
        dto.bankkaihu = state.usdt_type.text;
      }
      dto.postid = data.id.toString();
    } else {
      dto.truename = state.true_name.text;
      if (state.headerSelIndex == 0) {
        dto.banktype = state.bankType.toString();
        dto.bankcard = state.bank_card.text;
        dto.bankkaihu = state.bank_kaihu.text;
        dto.bankname = state.bank_name.text;
      } else if (state.headerSelIndex == 1) {
        //电子钱包
        dto.bankkaihu = state.cnyTypeSelect.name ?? "";
        dto.bankcard = state.digtal_address.text;
        dto.bankname = "";
        dto.banktype = state.bankType.toString();
      } else {
        dto.bankname = "";
        dto.bankcard = state.usdt_address.text; //虚拟币
        dto.banktype = '2';
        dto.bankkaihu = state.usdtTypeSelect.name;
      }
      dto.postid = state.formType.typeInt.toString();
    }
    String dtoStr = dto.toJson().toString();
    print("param is $dtoStr");
    await fetchHandler(userWalletProvider.bindingBankCard(dto),
        onSuccess: (_) async {
      Get.back();
      if (isEdit ?? false) {
        onModifySuccess();
      } else {
        onAddSuccess();
      }
      await _userService.getUserBankInfo();
      await initMyBankList();
      state.bankFormKey.currentState?.reset();
      EventBus.emit(EventType.onBindCardSuccess);
    });
  }

// 获取用户余额及信息
  Future<void> getUserMoney() async {
    WithdrawalProvider provider = WithdrawalProvider();
    await fetchHandler<MoneyInfoEntity>(
      provider.getUserMoney(),
    ).then((value) => state.userInfo = value);
  }

//绑定成功

}
