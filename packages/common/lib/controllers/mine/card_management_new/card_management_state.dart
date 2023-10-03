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

  GlobalKey<FormBuilderState> bankFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> qkpassFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> regphoneFormKey = GlobalKey<FormBuilderState>();

  static final Map<int, List<CardManagementFormFields>> _fields = {
    1: bankFormFields,
    2: cryptoFormFields,
    4: digitalFormFields,
  };

  Map<int, String> cardTypes = {
    1: 'card.type.1',
    2: 'card.type.2',
    4: 'card.type.3',
  };

  final RxBool _isEditable = false.obs;
  bool get isEditable => _isEditable.value;
  set isEditable(bool value) => _isEditable.value = value;

  final RxInt _currentType = 1.obs;
  int get currentType =>  _currentType.value;
  set currentType(int value) => _currentType.value = value;

  final Rx<CardFormType> _formType = CardFormType.add.obs;
  CardFormType get formType =>  _formType.value;
  set formType(CardFormType value) => _formType.value = value;

  List<CardManagementFormFields> get formFields => _fields[_currentType.value]!;

  final RxList<String> bankList = RxList<String>([]);
}


enum CardFormType {
  add,
  edit,
  readOnly
}

extension CardFormEnumExt on CardFormType {

  get typeInt {
    switch (this) {
      case CardFormType.add:
        return 0;
      case CardFormType.edit:
        return 1;
      case CardFormType.readOnly:
        return 2;
    }
  }
}