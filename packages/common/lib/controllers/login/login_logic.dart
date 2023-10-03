import 'dart:async';
import 'dart:ffi';

import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/login/login_form_validators.dart';
import 'package:aone_common/core/fetch/exception/base_api_exception.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'login_state.dart';

class LoginLogic extends CaptchaController {
  static LoginLogic get to => Get.find();
  final UserService _userService = UserService.to;

  LoginLogicState state = LoginLogicState();

  // field validators 表单验证
  LoginFormValidators validators = LoginFormValidators();

  // form fields
  LoginFormFields formFields = LoginFormFields();

  AuthenticateProvider provider = AuthenticateProvider();

  // 可根据站点需求复写
  final bool isAlwaysRemember = false; // 始终记住我

  @override
  void onInit() {
    state.initialState = SpStorage.getRememberMe ?? {};
    if (!isAlwaysRemember) {
      state.rememberMe = SpStorage.isLastRemember;
    }
    super.onInit();
  }

  // 可复写 overridable
  void onSuccess() {
    if (state.rememberMe) {
      state.loginFormKey.currentState!.save();
    } else {
      state.loginFormKey.currentState!.reset();
    }
    SmartDialog.showToast('login.success'.tr);
  }

  void toggleRemember(bool? value) {
    state.rememberMe = value ?? !state.rememberMe;
  }

  void handleSubmit() {
    print('9999999999oclick login bittom');
    var result = state.loginFormKey.currentState!.validate();
    if (result) {
      //if(state.rememberMe) {
      state.loginFormKey.currentState!.save();
      //}
      verify(0);

      // _goToLogin(); //非验证码
    }
  }

  void _onValidateSuccess(Map<String, String> captchaInfo) async {
    var form = state.loginFormKey.currentState!.value;
    print('username == ${form['username']}');
    var payloadMap = {}
      ..addAll(form)
      ..addAll(captchaInfo);
    payloadMap['sign_token'] = payloadMap['pass_token'];

    print('9999999999_onValidateSuccess');
    LoginDto loginDto = LoginDto.fromJson(payloadMap.cast<String, dynamic>());
    SmartDialog.showLoading();
    await fetchHandler<LoginEntity>(
      provider.userLogin(loginDto),
      loading: true,
      onSuccess: (res) async {
        await _userService.initializeRegularUser(
          token: res.accessToken!,
        );
        if (state.rememberMe) {
          SpStorage.setRememberMe(form);
        }
        SpStorage.setUserName(loginDto.username!);
        SpStorage.setPassword(loginDto.password!);
        if (!isAlwaysRemember) {
          SpStorage.isLastRemember = state.rememberMe;
        }
        onSuccess();
        SmartDialog.dismiss();
      },
      onError: (error) {
        SmartDialog.dismiss();
        if (error is! BaseApiException) {
          SmartDialog.showToast(error.message);
        }
      },
    );
  }



  @override
  Future<void> validateCaptchaResult(Map<String, String> result) async {
    if (result["loginType"] == "0") {
      Map<String, String> result1 = <String, String>{};
      result.forEach((key, value) {
        if (key != "loginType") {
          result1[key] = value;
        }
      });
      _onValidateSuccess(result1);
      print("9999999999999999validateCaptchaResult:" + result.toString());
    }
  }

  //非验证码登录
  void _goToLogin() async {
    var form = state.loginFormKey.currentState!.value;

    LoginDto loginDto = LoginDto.fromJson(form.cast<String, dynamic>());

    await fetchHandler<LoginEntity>(
      provider.userLogin(loginDto),
      loading: true,
      onSuccess: (res) async {
        await _userService.initializeRegularUser(
          token: res.accessToken!,
        );
        if (state.rememberMe) {
          SpStorage.setRememberMe(form);
        }

        if (!isAlwaysRemember) {
          SpStorage.isLastRemember = state.rememberMe;
        }
        onSuccess();
      },
      onError: (error) {
        if (error is! BaseApiException) {
          SmartDialog.showToast(error.message);
        }
      },
    );
  }
}
