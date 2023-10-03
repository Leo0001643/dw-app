import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/generics.dart';
import 'package:generics/src/cashier/widgets/theme_card.dart';

class ChargeCellInput extends StatefulWidget {
  final String? label;
  final TextStyle? labelStyle;
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
  const ChargeCellInput(
      {Key? key,
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
      this.labelStyle})
      : super(key: key);

  @override
  State<ChargeCellInput> createState() => _CardCellInputState();
}

class _CardCellInputState extends State<ChargeCellInput> {
  final _theme = RechargeTheme();
  @override
  Widget build(BuildContext context) {
    return ThemeCard(
      title: widget.label,
      textStyle: widget.labelStyle ??
          TextStyle(fontSize: 14.sp, color: _theme.subTextColor),
      child: Container(
        height: 44.r,
        width: double.infinity,
        decoration: BoxDecoration(
            color: _theme.inputFieldColor,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: _theme.borderColor!)),
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
            fontSize: 18.sp,
            color: _theme.mainTextColor,
          ),
          decoration: InputDecoration(
            filled: false,
            contentPadding: EdgeInsets.fromLTRB(12.r, 0, 12.r, 0),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: _theme.neutralColor,
            ),
            hintText: widget.hintText,
            // border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
