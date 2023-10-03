import 'package:flutter/cupertino.dart';


// class FormFields {
//   final String name;
//   final String label;
//   final FormFieldValidator validator;
//   final List<String>? options;
//   final FieldType fieldType;

//   CardManagementFormFields({
//     required this.name,
//     required this.validator,
//     required this.label,
//     this.options,
//     this.fieldType = FieldType.text,
//   });
// }

// 银行卡
// List<CardManagementFormFields> bankFormFields = [
//   CardManagementFormFields(
//     name: 'truename',
//     validator: FormBuilderValidators.required(),
//     label: 'fullName',
//   ),
//   CardManagementFormFields(
//     name: 'bankname',
//     validator: FormBuilderValidators.required(),
//     label: 'bank.name.withdraw',
//     fieldType: FieldType.select,
//   ),
//   CardManagementFormFields(
//     name: 'bankkaihu',
//     validator: FormBuilderValidators.compose([
//       FormBuilderValidators.required(),
//       FormBuilderValidators.min(4),
//       FormBuilderValidators.max(20),
//     ]),
//     label: 'bank.branch',
//   ),
