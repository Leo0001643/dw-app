import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../common.dart';
import '../../../data/model/entities/user/get_bank_list.dart';
import '../../withdrawal/withdrawal_logic.dart';
import 'card_management_state.dart';

class CardManagerLogic extends BaseController {
  UserWalletProvider _userWalletProvider = UserWalletProvider();

  static CardManagerLogic get to => Get.find();

  final UserService _userService = UserService.to;

  final CardManagementState state = CardManagementState();

  final SiteConfigProvider siteConfigProvider = SiteConfigProvider();
  final UserWalletProvider userWalletProvider = UserWalletProvider();

  String bankName = "";

  void setBankValue(String value) {
    //state.bankFormKey.currentState!.fields['bankname'] = value;
    bankName = value;
  }

  Future<void> postBindingBankData({String? bandListId}) async {
    state.bankFormKey.currentState!.save();
    final form = state.bankFormKey.currentState!.value;
    final BindingBankDto dto = BindingBankDto.fromJson(form);
    dto.postid = state.formType.typeInt.toString();
    dto.banktype = state.currentType.toString();
    if (bandListId != null) {
      dto.postid = bandListId;
    }
    await fetchHandler(userWalletProvider.bindingBankCard(dto),
        onSuccess: (_) async {
      onAddSuccess();
      await _userService.getUserBankInfo();
      state.bankFormKey.currentState?.reset();
    });
  }

  Future<void> deleteCard(BankInfos item) async {
    // if (UserService.to.state.userCardList.length == 1) {
    //   SmartDialog.showToast('亲，至少保留一张银行卡');
    //   return;
    // }

    await fetchHandler(userWalletProvider.deleteBankCard(item),
        onSuccess: (_) async {
      await _userService.getUserBankInfo();

      onDeleteSuccess();
    });
  }

  Future<void> initBankList() async {
    await fetchHandler<BankListEntity>(siteConfigProvider.bankList(),
        onSuccess: (res) {
      state.bankList
        ..clear()
        ..addAll(res.banks!.map((e) => e.name!));
    });
  }

  Future<void> getBankList() async {
    await fetchHandler<GetBankListEntity>(siteConfigProvider.getBankList(),
        onSuccess: (res) => {
              state.getBankListEntity = res,
            });
  }

  void onDeleteSuccess() {
    SmartDialog.showToast('删除成功'.tr);
  }

  void onAddSuccess() {
    SmartDialog.showToast('绑定成功'.tr);
  }

  @override
  void onInit() async {
    await _userService.getUserBankInfo();
    await initBankList();
    initMyBankList();
    // await getBankList();
    state.isEditable = _userService.state.userBank.bankUp!;
    debugPrint("_userService.state.userBank.bankUp!" +
        _userService.state.userBank.bankUp!.toString());
    super.onInit();
  }

  Future<void> initMyBankList() async {
    printInfo(info: "res.initMyBankList---->  ");

    await fetchHandler<MyBankListInfoEntity>(
      _userWalletProvider.myBankList(),
      onSuccess: (res) {
        printInfo(info: "res.bankUp---->1  ${res.bankUp}");
        state.allowDelete = res.bankUp ?? false;
        printInfo(
            info:
                "res.bankUp---->2  ${state.allowDelete}  hashcode  ${state.hashCode}");
        update();
      },
    );
  }

  Future<void> factorTixian(FactorNeedEntity needEntity) async {
    BindingBankCheckingDto checkingDto = BindingBankCheckingDto();
    BindingBankDto dto = BindingBankDto();
    BindingBankCheckingQkpassDto qkpassDto = BindingBankCheckingQkpassDto();
    BindingBankCheckingRegphoneDto regphoneDto =
        BindingBankCheckingRegphoneDto();
    if (needEntity.bankCard == false) {
      if (state.bankFormKey.currentState!.mounted) {
        state.bankFormKey.currentState!.save();
        final form = state.bankFormKey.currentState!.value;

        dto = BindingBankDto.fromJson(form);
      }
    }
    if (needEntity.qktrue == false) {
      if (state.qkpassFormKey.currentState!.mounted) {
        state.qkpassFormKey.currentState!.save();
        final qkpassform = state.qkpassFormKey.currentState!.value;

        qkpassDto = BindingBankCheckingQkpassDto.fromJson(qkpassform);
      }
    }
    if (needEntity.regPhone == false) {
      if (state.regphoneFormKey.currentState!.mounted) {
        state.regphoneFormKey.currentState!.save();

        final regphoneform = state.regphoneFormKey.currentState!.value;

        regphoneDto = BindingBankCheckingRegphoneDto.fromJson(regphoneform);
      }
    }

    checkingDto.bankname = dto.bankname;
    if (bankName.isNotEmpty) {
      checkingDto.bankname = bankName;
    }
    checkingDto.truename = dto.truename;
    checkingDto.bankcard = dto.bankcard;
    checkingDto.bankkaihu = dto.bankkaihu;
    checkingDto.banktype = dto.banktype;
    checkingDto.expire = dto.expire;
    checkingDto.cvv = dto.cvv;
    checkingDto.postid = dto.postid;
    checkingDto.userid = dto.userid;
    checkingDto.qkpass = qkpassDto.qkpass;
    checkingDto.regphone = regphoneDto.regphone;
    checkingDto.postid = state.formType.typeInt.toString();
    checkingDto.banktype = state.currentType.toString();
    await fetchHandler(userWalletProvider.initBinding(checkingDto),
        onSuccess: (_) async {
      await _userService.getUserBankInfo();
      factorTixianSuccess(needEntity);
      state.bankFormKey.currentState?.reset();
      Get.offNamed(Routes.withdraw);
    });
  }

  void factorTixianSuccess(FactorNeedEntity needEntity) {
    SmartDialog.showToast('绑定成功'.tr);
    final logIC = WithdrawalLogic.to;
    logIC.factorNeed();
  }
}
