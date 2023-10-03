import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CardManagementFormFields {
  final String name;
  final String label;
  final String? hintText;
  final FormFieldValidator validator;
  final List<String>? options;
  final FieldType fieldType;

  CardManagementFormFields({
    required this.name,
    required this.validator,
    required this.label,
    this.hintText,
    this.options,
    this.fieldType = FieldType.text,
  });
}

// 银行卡
List<CardManagementFormFields> bankFormFields = [
  CardManagementFormFields(
    name: 'truename',
    validator: FormBuilderValidators.required(),
    label: 'fullName',
  ),
  CardManagementFormFields(
    name: 'bankname',
    validator: FormBuilderValidators.required(),
    label: 'bank.name.withdraw',
    hintText: 'reg.hint.bank.name',
    fieldType: FieldType.select,
  ),
  CardManagementFormFields(
    name: 'bankcard',
    hintText: 'card.hint.bankcar.num',
    validator: FormBuilderValidators.required(),
    label: 'withdrawal.bank.card.number',
  ),
  CardManagementFormFields(
    name: 'bankkaihu',
    hintText: 'card.hint.branch.branch',
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.min(4),
      FormBuilderValidators.max(20),
    ]),
    label: 'bank.branch',
  ),
];
// 'card.hint.bankcar.num': '请输入银行卡号',
// 'card.hint.branch.branch':
// 区块链
List<CardManagementFormFields> cryptoFormFields = [
  CardManagementFormFields(
    name: 'bankcard',
    hintText: 'crypto.hint.address',
    validator: FormBuilderValidators.required(),
    label: 'crypto.address',
  ),
  CardManagementFormFields(
    name: 'bankkaihu',
    hintText: 'crypto.hint.type',
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.min(4),
      FormBuilderValidators.max(20),
    ]),
    label: 'crypto.type',
  ),
];

// Visa/Master
// todo:
List<CardManagementFormFields> visaFormFields = [
  CardManagementFormFields(
    name: 'truename',
    validator: FormBuilderValidators.required(),
    label: '',
  ),
  CardManagementFormFields(
    name: 'bankname',
    validator: FormBuilderValidators.required(),
    label: '',
  ),
  CardManagementFormFields(
    name: 'bankkaihu',
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.min(4),
      FormBuilderValidators.max(20),
    ]),
    label: '',
  ),
  CardManagementFormFields(
    name: 'bankcard',
    validator: FormBuilderValidators.required(),
    label: '',
  ),
  CardManagementFormFields(
    name: 'bank_type',
    validator: FormBuilderValidators.required(),
    label: '',
  ),
];

