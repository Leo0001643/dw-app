import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../interface/common_form_fields.dart';
import '../../controllers.dart';

class ChangePasswordState {
  LabeledGlobalKey<FormBuilderState> passwordFormKey =
      LabeledGlobalKey<FormBuilderState>('login');
  final withdrawFormKey = LabeledGlobalKey<FormBuilderState>('withdraw');
  final List<List<CommonFormField>> passwordFields = formField;
}

List<List<CommonFormField>> formField = [
  [
    CommonFormField(
        name: 'oldpassword',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.min(6),
          FormBuilderValidators.max(20),
        ]),
        hintText: 'reg.hint.loginpassword',
        label: 'password.login'),
    CommonFormField(
        name: 'password',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.min(6),
          FormBuilderValidators.max(20),
        ]),
        hintText: 'password.hint.new.login',
        label: 'password.new.login'),
  ],
  [
    CommonFormField(
        name: 'password',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.min(6),
          FormBuilderValidators.max(20),
        ]),
        hintText: 'reg.hint.loginpassword',
        label: 'password.login'),
    CommonFormField(
        name: 'oldqkpass',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.max(6),
        ]),
        hintText: 'password.hint.old.withdraw',
        label: 'password.old.withdraw'),
    CommonFormField(
        name: 'qkpass',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.max(6),
        ]),
        hintText: 'reg.hint.password.withdraw',
        label: 'password.new.withdraw'),
  ]
];
