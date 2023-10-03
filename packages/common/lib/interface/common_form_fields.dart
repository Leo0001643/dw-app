import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';

class CommonFormField {
  final String name;
  final String label;
  final String? hintText;
  final String? beforeText;
  final FormFieldValidator validator;
  final List<String>? options;
  final FieldType fieldType;

  CommonFormField({
    required this.name,
    required this.validator,
    required this.label,
    this.hintText,
    this.options,
    this.beforeText,
    this.fieldType = FieldType.text,
  });
}