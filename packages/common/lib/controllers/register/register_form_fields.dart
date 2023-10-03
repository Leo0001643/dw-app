import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../common.dart';

class RegisterFormField {
  String? focusValueY;
  String? focusValueN;
  int? sortLevel;
  String label; // 名称
  String key; // dto 字段
  String remarks; // 提示信息
  bool required; // 是否必填
  bool isDefault; // 是否为默认 默认则必须展示
  String? icon;
  bool isEyeOpen = true; //密码是否睁开
  String? config; // 站点配置字段
  TextInputType inputType; // 键盘类型
  FieldType fieldType; // 输入类型
  FormFieldValidator<String?> Function(bool, String) validate; //验证
  RegisterFormField({
    this.focusValueY,
    this.focusValueN,
    this.sortLevel,
    required this.label,
    required this.key,
    required this.remarks,
    required this.required,
    this.isDefault = false,
    this.icon,
    this.config,
    this.inputType = TextInputType.text,
    this.fieldType = FieldType.text,
    required this.validate,
  });

  get validator => validate(required, label);
}

//会员
final List<RegisterFormField> registerFormField = [
  RegisterFormField(
    label: 'reference',
    key: "tuijian_name",
    remarks: 'reg.hint.reference',
    required: false,
    icon: 'icon-user',
    config: 'reg_tuijianren',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'username',
    key: "user_name",
    remarks: 'reg.hint.username',
    required: true,
    isDefault: true,
    icon: 'icon-user',
    config: 'user_name',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
      if (isRequired)
        FormBuilderValidators.minLength(6,
            errorText: 'username.lengthLimit'.tr),
      if (isRequired)
        FormBuilderValidators.maxLength(20,
            errorText: 'username.lengthLimit'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'password',
    key: "password",
    remarks: 'reg.hint.password',
    inputType: TextInputType.visiblePassword,
    fieldType: FieldType.password,
    required: true,
    isDefault: true,
    icon: 'icon-mima',
    config: 'password',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
      FormBuilderValidators.minLength(6, errorText: 'password.lengthLimit'.tr),
      FormBuilderValidators.maxLength(20, errorText: 'password.lengthLimit'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'password.retype',
    key: "repassword",
    remarks: 'reg.hint.password.retype',
    inputType: TextInputType.visiblePassword,
    fieldType: FieldType.password,
    required: true,
    icon: 'icon-mima',
    isDefault: true,
    config: 'repassword',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
      FormBuilderValidators.minLength(6,
          errorText: 'password.retype.lengthLimit'.tr),
      FormBuilderValidators.maxLength(20,
          errorText: 'password.retype.lengthLimit'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'fullName',
    key: "truename",
    icon: 'icon-user',
    remarks: 'reg.hint.fullName',
    config: 'reg_truename',
    required: false,
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'qq',
    key: "reg_qq",
    remarks: 'reg.hint.qq',
    inputType: const TextInputType.numberWithOptions(signed: true),
    required: false,
    icon: 'icon-qq1',
    config: 'reg_qq',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'wechat',
    key: "reg_weixin",
    remarks: 'reg.hint.wechat',
    required: false,
    icon: 'icon-weixin',
    config: 'reg_weixin',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'skype',
    key: "reg_skype",
    remarks: 'reg.hint.skype',
    required: false,
    icon: 'icon-skype',
    config: 'reg_skype',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'email',
    key: "reg_email",
    remarks: 'reg.hint.email',
    inputType: TextInputType.emailAddress,
    required: false,
    icon: 'icon-youxiang',
    config: 'reg_email',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'bank.name.withdraw',
    key: "bankname",
    remarks: 'reg.hint.bank.name',
    icon: 'icon-yinhang',
    fieldType: FieldType.select,
    required: false,
    config: 'reg_bank',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'bank.branch',
    key: "bankkaihu",
    icon: 'icon-yinhang',
    remarks: 'reg.hint.branch.name',
    required: false,
    config: 'reg_bank',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'account.number',
    key: "bankcard",
    remarks: 'reg.hint.account.number',
    icon: 'icon-yinhang',
    required: false,
    config: 'reg_bank',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'security.question',
    key: "reg_wen",
    remarks: 'reg.hint.security.question',
    required: false,
    icon: 'icon-wenti',
    config: 'reg_custom',
    fieldType: FieldType.select,
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'security.question.answer',
    key: "reg_wen_d",
    remarks: 'reg.hint.security.answer',
    icon: 'icon-daan',
    required: false,
    config: 'reg_custom',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'security.question.hint',
    key: "reg_wen_t",
    remarks: 'reg.hint.security.hint',
    icon: 'icon-daan',
    required: false,
    config: 'reg_custom',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'password.withdraw',
    key: "qkpass",
    remarks: 'reg.hint.password.withdraw',
    required: false,
    icon: 'icon-mima',
    config: 'reg_qkpass',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'invitation.code',
    key: "invitation_code",
    remarks: 'reg.hint.invitation.code',
    required: false,
    icon: 'icon-code',
    config: 'invitation_code',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'phone.num',
    key: "reg_phone",
    remarks: 'reg.hint.phone.num',
    required: false,
    icon: 'icon-shouji',
    config: 'reg_phone',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'phone.code',
    key: "reg_mobilecode",
    remarks: 'reg.hint.verification.code',
    required: false,
    icon: 'icon-code',
    config: 'reg_mobilecode',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'reg_xieyi',
    key: "reg_xieyi",
    remarks: '',
    required: true,
    isDefault: true,
    icon: 'icon-code',
    config: 'reg_xieyi',
    fieldType: FieldType.checkbox,
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      FormBuilderValidators.equal(
        true,
        errorText: 'You must accept terms and conditions to continue',
      )
    ]),
  ),
];

//代理
final List<RegisterFormField> agentregisterFormField = [
  RegisterFormField(
    label: 'reference',
    key: "tuijiana_name",
    remarks: 'reg.hint.reference',
    required: false,
    icon: 'icon-user',
    config: 'reg_tuijianren',
    validate: (bool isRequired, String label) =>
        FormBuilderValidators.compose([]),
  ),
  RegisterFormField(
    label: 'ausername',
    key: "agent_name",
    remarks: 'reg.hint.username',
    required: true,
    isDefault: true,
    icon: 'icon-user',
    config: 'user_name',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
      FormBuilderValidators.minLength(2, errorText: 'ausername.lengthLimit'.tr),
      FormBuilderValidators.maxLength(20,
          errorText: 'ausername.lengthLimit'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'password',
    key: "password",
    remarks: 'reg.hint.password',
    inputType: TextInputType.visiblePassword,
    fieldType: FieldType.password,
    required: true,
    isDefault: true,
    icon: 'icon-mima',
    config: 'password',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
      FormBuilderValidators.minLength(6, errorText: 'password.lengthLimit'.tr),
      FormBuilderValidators.maxLength(20, errorText: 'password.lengthLimit'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'password.retype',
    key: "repassword",
    remarks: 'reg.hint.password.retype',
    inputType: TextInputType.visiblePassword,
    fieldType: FieldType.password,
    required: true,
    icon: 'icon-mima',
    isDefault: true,
    config: 'repassword',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
      FormBuilderValidators.minLength(6,
          errorText: 'password.retype.lengthLimit'.tr),
      FormBuilderValidators.maxLength(20,
          errorText: 'password.retype.lengthLimit'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'fullName',
    key: "truename",
    icon: 'icon-user',
    remarks: 'reg.hint.fullName',
    config: 'rega_truename',
    required: false,
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'phone.num',
    key: "rega_phone",
    remarks: 'reg.hint.phone.num',
    required: false,
    icon: 'icon-shouji',
    config: 'rega_phone',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'phone.code',
    key: "reg_mobilecode",
    remarks: 'reg.hint.verification.code',
    required: false,
    icon: 'icon-code',
    config: 'reg_mobilecode',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'qq',
    key: "rega_qq",
    remarks: 'reg.hint.qq',
    inputType: const TextInputType.numberWithOptions(signed: true),
    required: false,
    icon: 'icon-qq1',
    config: 'rega_qq',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'wechat',
    key: "rega_weixin",
    remarks: 'reg.hint.wechat',
    required: false,
    icon: 'icon-weixin',
    config: 'rega_weixin',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'skype',
    key: "rega_skype",
    remarks: 'reg.hint.skype',
    required: false,
    icon: 'icon-skype',
    config: 'rega_skype',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'email',
    key: "rega_email",
    remarks: 'reg.hint.email',
    inputType: TextInputType.emailAddress,
    required: false,
    icon: 'icon-youxiang',
    config: 'rega_email',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'bank.name.withdraw',
    key: "bankname",
    remarks: 'reg.hint.bank.name',
    icon: 'icon-yinhang',
    fieldType: FieldType.select,
    required: false,
    config: 'rega_bank',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'bank.branch',
    key: "bankkaihu",
    icon: 'icon-yinhang',
    remarks: 'reg.hint.branch.name',
    required: false,
    config: 'rega_bank',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'account.number',
    key: "bankcard",
    remarks: 'reg.hint.account.number',
    icon: 'icon-yinhang',
    required: false,
    config: 'rega_bank',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'security.question',
    key: "rega_wen",
    remarks: 'reg.hint.security.question',
    required: false,
    fieldType: FieldType.select,
    icon: 'icon-wenti',
    config: 'rega_custom',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'security.question.answer',
    key: "rega_wen_d",
    remarks: 'reg.hint.security.answer',
    icon: 'icon-daan',
    required: false,
    config: 'rega_custom',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'security.question.hint',
    key: "rega_wen_t",
    remarks: 'reg.hint.security.hint',
    icon: 'icon-daan',
    required: false,
    config: 'rega_custom',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'password.withdraw',
    key: "rega_qkpass",
    remarks: 'reg.hint.password.withdraw',
    required: false,
    inputType: TextInputType.visiblePassword,
    fieldType: FieldType.password,
    icon: 'icon-mima',
    config: 'rega_qkpass',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
      FormBuilderValidators.maxLength(6,
          errorText: 'password.withdraw.lengthLimit'.tr),
      FormBuilderValidators.min(6,
          errorText: 'password.withdraw.lengthLimit'.tr)
    ]),
  ),
  RegisterFormField(
    label: 'invitation.code',
    key: "invitation_code",
    remarks: 'reg.hint.invitation.code',
    required: false,
    icon: 'icon-code',
    config: 'invitation_code',
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      if (isRequired)
        FormBuilderValidators.required(errorText: label.tr + 'mustFill'.tr),
    ]),
  ),
  RegisterFormField(
    label: 'reg_xieyi',
    key: "reg_xieyi",
    remarks: '',
    required: true,
    isDefault: true,
    icon: 'icon-mima',
    config: 'reg_xieyi',
    fieldType: FieldType.checkbox,
    validate: (bool isRequired, String label) => FormBuilderValidators.compose([
      FormBuilderValidators.equal(
        true,
        errorText: 'terms.message'.tr,
      )
    ]),
  ),
];
