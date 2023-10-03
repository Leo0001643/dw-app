import 'dart:ffi';

import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/register/register_form_fields.dart';
import 'package:aone_common/controllers/register/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

/// 代理登录和用户登录共用一个Logic
/// 如果代理注册和用户注册同时存在一个页面内
/// 需使用Get.create初始化而非Get.put
class RegisterLogic extends CaptchaController {
  static RegisterLogic get to => Get.find();

  RxList<RegisterFormField> memberformFields = RxList();

  final UserService _userService = UserService.to;

  AuthenticateProvider provider = AuthenticateProvider();
  SiteConfigProvider siteConfigProvider = SiteConfigProvider();

  RegisterLogicState state = RegisterLogicState();

  RxList<RegisterFormField> formFields = RxList([]);

  Map<String, dynamic>? _validateString;

  final RegisterType registerType;

  ///子类做个标识用来处理一些定制话需求
  var siteTag = "".obs;

  //验证码sign
  String captureSign = '';

  RegisterLogic({required this.registerType});

  @override
  void onInit() {
    startLoading();
    initFormField();
    initBankList();
    stopLoading();
    super.onInit();
  }

  void onSelectClose(String value, RegisterFormField formField) {
    state.regFormKey.currentState!.fields[formField.key]!.didChange(value);
  }

  ///发送验证码(待同一)
  Future<bool> sendSMSCode(String phone) async {
    Map? result = await provider.sendSMSCode(phone);
    // print('sendSMSCodesendSMSCode');
    if (result != null) {
      bool success = result['success'];
      //记录capture sign
      captureSign = result['sign'].toString();
      // print('successsuccess:$success');
      // print('captureSigncaptureSign:$captureSign');
      return success;
    }
    return false;
  }

  Future<void> initFormField({Bool? loading}) async {
    await fetchHandler<RegisterConfigEntity>(
      provider.registerConfig(),
      onSuccess: (res) {
        state.questionList.addAll(res.ques!);
        state.mRegisterConfigEntity.value = res;
        Map<String, dynamic> info;
        Map<String, dynamic> requires;
        if (registerType == RegisterType.agent) {
          info = res.ainfo!.toJson();
          requires = requires = res.abt!.toJson();
          state.agreement = info['rega_tiaokuan'].toString();
          print('代理条款 == ${state.agreement}');
          formFields.addAll(state.agentFormFields);
        } else {
          info = res.info!.toJson();
          requires = requires = res.bt!.toJson();
          state.agreement = info['reg_tiaokuan'].toString();
          formFields.addAll(state.memberformFields);
        }

        formFields.removeWhere(
          (element) =>
              info[element.config] != '1' && element.isDefault == false,
        );

        for (var element in formFields) {
          if (element.isDefault != true && element.config != 'reg_tuijianren') {
            element.required = requires[element.config] == 1;
          }
          if (element.fieldType == FieldType.password ||
              element.fieldType == FieldType.passwordText) {
            element.fieldType = FieldType.password;
            element.isEyeOpen = false;
          }
        }

        update();
      },
    );
  }

  Future<void> initBankList() async {
    await fetchHandler<BankListEntity>(
      siteConfigProvider.bankList(),
      onSuccess: (res) => state.bankList.addAll(res.banks!.map((e) => e.name!)),
    );
    update();
  }

  void handleSubmit(
      {
      //参数不全提醒
      VoidCallback? needPragmaCallBack}) {
    var result = state.regFormKey.currentState!.validate();
    if (result) {
      state.regFormKey.currentState!.save();
      verify(1);
    } else {
      if (needPragmaCallBack != null) {
        needPragmaCallBack();
      }
    }
  }

  void handleSubmitZ01() {
    var result = state.regFormKey.currentState!.validate();
    if (result) {
      state.regFormKey.currentState!.save();
      var isTip = false;
      var form =
          Map.of(state.regFormKey.currentState?.value ?? <String, String>{});
      form.forEach((key, value) {
        for (var e in registerFormField) {
          if (e.required) {
            if (e.key == key) {
              if (value == null || value == '') {
                isTip = true;
              }
            }
          }
        }
      });

      if (isTip) {
        SmartDialog.showToast('请输入所有带 * 的内容'.tr);
      } else {
        verify(1);
      }
    }
  }

  void postUserRegisterData() async {
    var form =
        Map.of(state.regFormKey.currentState?.value ?? <String, String>{});
    form.removeWhere((key, value) => value == null);
    form.addAll(_validateString!);
    print('打印 == ${form.toString()}');
    final payload = UserRegisterDto.fromJson(form);
    payload.dev = 'production';
    payload.regXieyi = 1;
    payload.tuijianName = SpStorage.invitePerson;

    if (captureSign.isNotEmpty) {
      payload.sign = captureSign;
    }

    await fetchHandler<UserRegisterEntity>(
      provider.userRegister(payload),
      loading: true,
      onSuccess: (res) {
        if (siteTag.value != "z01") {
          SmartDialog.showToast('注册成功！'.tr);
        }
        SpStorage.setUserName(payload.userName!);
        SpStorage.setPassword(payload.password!);
        _userService.initializeRegularUser(token: res.accessToken);
        onSuccess();
      },
    );
  }

  void postAgentRegisterData() async {
    var form = Map.of(state.regFormKey.currentState!.value);
    print('代理 == ${form}');
    form.removeWhere((key, value) => value == null);
    form.addAll(_validateString!);
    final payload = UserRegisterDto.fromJson(form);
    print('代理密码 == ${payload.regaQkpass}');

    payload.dev = 'production';
    payload.regXieyi = 1;
    payload.qkpass = payload.regaQkpass ?? '';
    payload.regPhone = payload.regaPhone;
    if (captureSign.isNotEmpty) {
      payload.sign = captureSign;
    }
    await fetchHandler<UserRegisterEntity>(
      provider.agentRegister(payload),
      onSuccess: (res) {
        if (siteTag.value != "z01") {
          SmartDialog.showToast('代理账号注册成功');
        }
        SpStorage.setUserName(payload.userName!);
        SpStorage.setPassword(payload.password!);
        onSuccess();
      },
    );
  }

  void _onValidateSuccess(Map<String, String> captchaInfo) async {
    _validateString = captchaInfo;
    if (registerType == RegisterType.agent) {
      postAgentRegisterData();
    } else {
      postUserRegisterData();
    }
  }

  @override
  Future<void> validateCaptchaResult(Map<String, String> result) async {
    if(result["loginType"]=="1"){
      Map<String, String> result1=<String, String>{};
      result.forEach((key, value) {
         if(key!="loginType"){
           result1[key]=value;
         }
      });
      _onValidateSuccess(result1);
    }
    print("regist  9999999999999999validateCaptchaResult:" + result.toString());


  }

  void onSuccess() {
    throw UnimplementedError();
  }

  showPasswordcondition() {
    state.passwordListOne = false;
    state.passwordListTow = false;
    state.passwordListThree = false;
    state.regFormKey.currentState!.save();
    var form =
        Map.of(state.regFormKey.currentState?.value ?? <String, String>{});
    print('password == ${form["password"]}');
    print('agent_name == ${form["agent_name"]}');
    // form["password"] = null ?? '';
    if (form["password"] == null) {
      form["password"] = '';
    }
    if ((form["password"].length >= 6) & (form["password"].length <= 20)) {
      state.passwordListOne = true;
    }

    if (form["password"].contains(state.numReg) &&
        form["password"].contains(state.letterReg)) {
      state.passwordListTow = true;
    }

    if (registerType == RegisterType.agent) {
      if ((form["agent_name"] != form["password"]) &
          (form["password"].isNotEmpty)) {
        print('进来了跟账号不同的判断agent_name');
        state.passwordListThree = true;
      }
    } else {
      if ((form["user_name"] != form["password"]) &
          (form["password"].isNotEmpty)) {
        print('进来了跟账号不同的判断user_name');
        state.passwordListThree = true;
      }
    }
  }
}
