import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class LoginLogicState {
  GlobalKey<FormBuilderState> loginFormKey = GlobalKey<FormBuilderState>();

  Map<String, dynamic>? initialState;

  final RxBool _rememberMe = true.obs;
  set rememberMe(bool value) => _rememberMe.value = value;
  bool get rememberMe => _rememberMe.value;

//密码的可视状态
  final _passwordInputVisible = true.obs;
  get passwordInputVisible => _passwordInputVisible.value;
  set passwordInputVisible(val) => _passwordInputVisible.value = val;

  final _showdeleteIcon = true.obs;
  get showdeleteIcon => _showdeleteIcon.value;
  set showdeleteIcon(val) => _showdeleteIcon.value = val;

  final RxString _userName = ''.obs;
  String get userName => _userName.value;
  set userName(String val) => {_userName.value = val};
}

class LoginFormFields {
  String username = 'username';
  String user_name = 'user_name';
  String password = 'password';
  String password_login = 'password_login';
}
