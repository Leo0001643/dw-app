import 'package:aone_common/controllers/register/register_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../common.dart';

class RegisterLogicState {
  RxList<RegisterFormField> memberformFields =
      RxList<RegisterFormField>(registerFormField);

  RxList<RegisterFormField> agentFormFields =
      RxList<RegisterFormField>(agentregisterFormField);

  GlobalKey<FormBuilderState> regFormKey = GlobalKey<FormBuilderState>();

  final RxString _agreement = ''.obs;
  String get agreement => _agreement.value;
  set agreement(String value) => _agreement.value = value;



  final RxBool _isShow =false.obs;
  bool get isShow => _isShow.value;
  set isShow(bool value) => _isShow.value = value;


  final RxList<String> bankList = RxList([]);

  final RxList<String> questionList = RxList([]);

  final Rx<RegisterConfigEntity> mRegisterConfigEntity = RegisterConfigEntity().obs;


 //密码强度逻辑
  final RxBool _passwordListOne = false.obs;
  get passwordListOne => _passwordListOne.value;
  set passwordListOne(val) => _passwordListOne.value = val;

  final RxBool _passwordListTow = false.obs;
  get passwordListTow => _passwordListTow.value;
  set passwordListTow(val) => _passwordListTow.value = val;

  final RxBool _passwordListThree = false.obs;
  get passwordListThree => _passwordListThree.value;
  set passwordListThree(val) => _passwordListThree.value = val;
  final RegExp numReg = RegExp(r".*[0-9].*");
  final RegExp letterReg = RegExp(r".*[A-Za-z].*");
}
