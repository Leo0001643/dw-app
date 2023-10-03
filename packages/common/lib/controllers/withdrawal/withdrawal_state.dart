import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class WithdrawalState {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  final RxList<String> numbers =
      RxList<String>(['全部'.tr, '100', '300', '500', '1000', '3000', '5000']);
  ValueNotifier<String> currentValueAmount = ValueNotifier('');
  RxList<BankInfos> bankList = RxList([]);

  String get withdrawCardType {
    return bankInfo.type == 2 ? '区块链地址'.tr : '收款银行'.tr;
  }

  String? get withdrawBankCard {
    if (bankInfo.id != null) {
      var bankName =
      (bankInfo.type == 1||bankInfo.type == 3) ? '${bankInfo.bankname!}' +'尾号'.tr : bankInfo.bankkaihu!;
      var bankCardLast4Num = bankInfo.bankcard!.substring(
        bankInfo.bankcard!.length - 4,
      );
      return "$bankName ($bankCardLast4Num)";
    }
    return null;
  }

  final RxInt selIndex = 0.obs;

  final RxString _selectedBankValue = '请选择'.tr.obs;
  String get selectedBankValue => _selectedBankValue.value;
  set selectedBankValue(String val) => _selectedBankValue.value = val;

  late final Rx<MoneyInfoEntity> _userInfo = Rx(MoneyInfoEntity());
  MoneyInfoEntity get userInfo => _userInfo.value;
  set userInfo(value) => _userInfo.value = value;

  late final Rx<BankInfos> _bankInfo = Rx(BankInfos());
  BankInfos get bankInfo => _bankInfo.value;
  set bankInfo(BankInfos value) => _bankInfo.value = value;

  final RxInt _activeTabIndex = 0.obs;
  int get activeTabIndex => _activeTabIndex.value;
  set activeTabIndex(int value) => _activeTabIndex.value = value;

  late final Rx<FactorNeedEntity> _needEntity = Rx(FactorNeedEntity());
  FactorNeedEntity get needEntity => _needEntity.value;
  set needEntity(FactorNeedEntity value) => _needEntity.value = value;

  final RxInt _selShow = 9999.obs;
  int get selShow => _selShow.value;
  set selShow(int value) => _selShow.value = value;

  final RxInt _gridSel = 0.obs;
  int get gridSel => _gridSel.value;
  set gridSel(int value) => _gridSel.value = value;

  final RxString _currentAmount = ''.obs;
  String get currentAmount => _currentAmount.value;
  set currentAmount(String val) => _currentAmount.value = val;
}
