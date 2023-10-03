import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../misc/theme_card.dart';

class CardCellInput extends StatefulWidget {
  final String? label;
  final double labelWidth;
  final String? hintText;
  final String name;
  final double radius;
  final Widget? suffixIcon;
  final double marginBottom;
  final String? initialValue;
  final bool isReadOnly;
  final bool disable;
  final bool? isRequired;
  final void Function(String?)? onChange;
  final bool isDark;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final EdgeInsetsGeometry? textMargin;

  const CardCellInput({
    Key? key,
    this.label,
    this.hintText,
    this.labelWidth = 80,
    this.radius = 5,
    this.suffixIcon,
    this.onChange,
    this.marginBottom = 10,
    required this.name,
    this.initialValue,
    this.isReadOnly = false,
    this.disable = false,
    this.isRequired = false,
    this.isDark = true,
    this.validator,
    this.obscureText = false,
    this.textMargin,
  }) : super(key: key);

  @override
  State<CardCellInput> createState() => _CardCellInputState();
}

class _CardCellInputState extends State<CardCellInput> {
  @override
  Widget build(BuildContext context) {
    return ThemeCard(
      margin: widget.textMargin ?? EdgeInsets.symmetric(horizontal: 12.r),
      title: widget.label,
      textStyle: TextStyle(
        fontSize: 14.sp,
      ),
      child: Container(
        height: 44.r,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            border: Border.all(color: AppTheme.undeer_line_color)),
        child: FormBuilderTextField(
          name: widget.name,
          key: Key(widget.name),
          validator: widget.validator,
          initialValue: widget.initialValue,
          readOnly: widget.isReadOnly,
          enabled: !widget.disable,
          obscureText: widget.obscureText,
          onChanged: widget.onChange,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppTheme.blackTextColor,
          ),
          decoration: InputDecoration(
            filled: false,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.r),
            border: InputBorder.none,
            hintStyle: const TextStyle(
              color: AppTheme.neutral2,
            ),
            hintText: widget.hintText,
            // border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
