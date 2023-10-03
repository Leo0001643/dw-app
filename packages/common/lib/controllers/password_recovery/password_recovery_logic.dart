import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class PasswordRecoveryLogic extends BaseController {
  final AuthenticateProvider provider = AuthenticateProvider();

  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  final RxInt _step = 1.obs;

  int get step => _step.value;

  set step(int val) => _step.value = val;

  ///z01未设置安全问题要单独的错误UI
  var showErrWidget = false.obs;

  final RxBool _isInput = false.obs;

  bool get isInput => _isInput.value;

  set isInput(bool val) => _isInput.value = val;


   var isInput2=false.obs;
   var isInput3=false.obs;

  String answer = '';

  Future<void> stepHandler(bool next, {bool showToast = true}) async {
    if (next) {
      final isValid = formKey.currentState!.saveAndValidate();
      if (isValid) {
        switch (step) {
          case 1:
            checkUserName(showToast: showToast);
            break;
          case 2:
            checkQuestion();
            break;
          case 3:
            createNewPassword();
            break;
        }
      }
    } else {
      if (step == 2) {
        // formKey.currentState!.reset();
      } else if (step == 1) {
        goToBack();
      }

      step--;
    }
  }

  Future<void> checkUserName({bool showToast = true}) async {
    final username = formKey.currentState!.value['user_name'] ?? '';
    await fetchHandler<ForgetPasswordEntity>(
        provider.forgetPassConfig(username), onSuccess: (res) {
      if (res.wen!.isNotEmpty) {
        step++;
        Timer.periodic(
          const Duration(milliseconds: 200),
          (timer) {
            if (formKey.currentState?.fields.length == 4) {
              formKey.currentState?.patchValue(res.toJson());
              timer.cancel();
            }
          },
        );
      } else {
        if (showToast) {
          SmartDialog.showToast('未设置安全问题，请联系在线客服');
        } else {
          showErrWidget.value = true;
        }
      }
    });
  }

  Future<void> checkQuestion() async {
    final dto = CheckSecQuestionDto.fromJson(formKey.currentState!.value);
    await fetchHandler(provider.checkSecurityQuestion(dto), onSuccess: (_) {
      answer = formKey.currentState!.value['reg_wen_d'];
      step++;
    });
  }

  Future<void> createNewPassword() async {
    final dto = CheckOkUserDto.fromJson(formKey.currentState!.value);
    dto.regWenD = answer;
    await fetchHandler(
      provider.checkOkUser(dto),
      onSuccess: (_) => onSuccess(),
    );
  }

  void checkUserNameSuccess(ForgetPasswordEntity forgetPasswordEntity) {
    throw UnimplementedError('');
  }

  void onSuccess() {
    throw UnimplementedError('');
  }

  void goToBack() {
    // throw UnimplementedError('');
  }
}
