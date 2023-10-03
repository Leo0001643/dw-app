import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../common.dart';

class ChangeUserinfoState {
  GlobalKey<FormBuilderState> userinfoFormKey = GlobalKey<FormBuilderState>();
  final RxList<String> questionList = RxList<String>([]);
  RxList<CommonFormField> formField =
      RxList<CommonFormField>(userinfoFormFields);
}

final _userState = UserService.to.state;
// 修改个人信息
List<CommonFormField> userinfoFormFields = [
  CommonFormField(
    beforeText: _userState.qq,
    name: 'reg_qq',
    validator: FormBuilderValidators.required(),
    label: 'qq',
    hintText: 'QQ_input_placehold',
  ),
  CommonFormField(
    beforeText: _userState.wechat,
    name: 'reg_weixin',
    validator: FormBuilderValidators.required(),
    label: 'wechat',
    hintText: 'wechat_input_placehold',
  ),
  CommonFormField(
    beforeText: _userState.regQuestion,
    name: 'reg_wen',
    validator: FormBuilderValidators.required(),
    label: 'security.question',
    fieldType: FieldType.select,
    hintText: 'user.center.pwd.safe',
  ),
  CommonFormField(
    beforeText: _userState.regAnser,
    name: 'reg_wen_d',
    validator: FormBuilderValidators.required(),
    label: 'security.question.answer',
    hintText: 'user.center.pwd.resultHit',
  ),
  CommonFormField(
    beforeText: _userState.regWenT,
    name: 'reg_wen_t',
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.min(4),
    ]),
    label: 'security.question.hint',
    hintText: 'user.ceter.pwd.tipHit',
  )
];
