import 'package:aone_common/data/model/entities/user/get_bank_list.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../data/model/entities/user/get_user.dart';
import 'card_management_form_fields.dart';

class CardManagementState {
  late final Rx<MoneyInfoEntity> _userInfo = Rx(MoneyInfoEntity());
  MoneyInfoEntity get userInfo => _userInfo.value;
  set userInfo(value) => _userInfo.value = value;
  var bank_kaihu = TextEditingController();
  GlobalKey<FormBuilderState> bankFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> qkpassFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> regphoneFormKey = GlobalKey<FormBuilderState>();

  static var _allowDelete = false.obs;
  bool get allowDelete => _allowDelete.value;
  set allowDelete(val) => _allowDelete.value = val;

  var _bankSelect = 0.obs;

  int get bankSelect => _bankSelect.value;

  set bankSelect(value) => _bankSelect.value = value;

  static final Map<int, List<CardManagementFormFields>> _fields = {
    1: bankFormFields,
    2: cryptoFormFields,
    3: visaFormFields,
  };

  Map<int, String> cardTypes = {
    1: 'card.type.1',
    2: 'card.type.2',
    3: 'card.type.3',
  };

  final RxBool _isEditable = false.obs;
  bool get isEditable => _isEditable.value;
  set isEditable(bool value) => _isEditable.value = value;

  final RxBool _isSearch = false.obs;
  bool get isSearch => _isSearch.value;
  set isSearch(bool value) => _isSearch.value = value;

  final RxInt _currentType = 1.obs;
  int get currentType => _currentType.value;
  set currentType(int value) => _currentType.value = value;

  final RxInt _currentBankTypeXin = 0.obs;
  int get currentBankTypeXin => _currentBankTypeXin.value;
  set currentBankTypeXin(int value) => _currentBankTypeXin.value = value;

  final RxInt _currentBankType = 0.obs;
  int get currentBankType => _currentBankType.value;
  set currentBankType(int value) => _currentBankType.value = value;

  final RxInt _currentWalletType = 0.obs;
  int get currentWalletType => _currentWalletType.value;
  set currentWalletType(int value) => _currentWalletType.value = value;

  final Rx<CardFormType> _formType = CardFormType.add.obs;
  CardFormType get formType => _formType.value;
  set formType(CardFormType value) => _formType.value = value;

  List<CardManagementFormFields> get formFields => _fields[_currentType.value]!;

  final RxList<String> bankList = RxList<String>([]);

  final RxList<String> selectBankList = RxList<String>([]);

  final Rx<GetBankListEntity> _getBankListEntity = GetBankListEntity().obs;
  GetBankListEntity get getBankListEntity => _getBankListEntity.value;
  set getBankListEntity(GetBankListEntity value) =>
      _getBankListEntity.value = value;
}

enum CardFormType { add, edit, readOnly }

extension CardFormEnumExt on CardFormType {
  get typeInt {
    switch (this) {
      case CardFormType.add:
        return 0;
      case CardFormType.edit:
        return 1;
      case CardFormType.readOnly:
        return 1;
    }
  }
}
