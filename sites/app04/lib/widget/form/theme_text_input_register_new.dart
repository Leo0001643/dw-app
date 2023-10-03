import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/color_schema.dart';

class ThemeTextInputNew extends StatefulWidget {
  final String? icon;
  final String? label;
  final double? containerWidth;
  final double height;
  final double labelWidth;
  final String? hintText;
  final Widget? inputTips;
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
  final Color? lableColor;
  final int styleType;
  final void Function(bool?)? onFocusChanged;
  final TextEditingController? controller;

  const ThemeTextInputNew({
    Key? key,
    this.icon,
    this.label,
    this.hintText,
    this.inputTips,
    this.height = 44,
    this.containerWidth,
    this.labelWidth = 95,
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
    this.lableColor = Colors.black,
    this.styleType = 0,
    this.onFocusChanged,
    this.controller,
  }) : super(key: key);

  @override
  State<ThemeTextInputNew> createState() => _ThemeTextInputNewState();
}

class _ThemeTextInputNewState extends State<ThemeTextInputNew> {
  late FocusNode focusNode;
  bool isFocused = false;
  late Color borderColor;
  late OutlineInputBorder borderStyle;

  @override
  void initState() {
    super.initState();

    borderColor = widget.isDark
        ? const Color.fromRGBO(47, 115, 245, 0.2)
        : const Color.fromRGBO(113, 96, 47, 1);

    borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: BorderSide(
        color: borderColor,
      ),
    );

    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus != isFocused) {
        setState(() {
          isFocused = focusNode.hasFocus;
        });
      }
      if (widget.onFocusChanged != null) {
        widget.onFocusChanged!(isFocused);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: EdgeInsets.only(bottom: widget.marginBottom.h, left: 15.r, right: 15.r),
            width: widget.containerWidth,
            child: widget.styleType == 0
                ? Row(
                    children: [
                      // if (widget.icon != null) _icon(),
                      // if (widget.label != null) _label(),
                      Expanded(child: _inputField())
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.label != null) _label(),
                      SizedBox(
                        height: 5.h,
                      ),
                      _inputField(),
                    ],
                  )),
        widget.inputTips ?? Container(),
      ],
    );
  }

  Widget _icon() {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Image.asset(
        widget.icon.toString(),
        width: 22,
        height: 22,
      ),
    );
  }

  Widget _label() {
    return Container(
      alignment: Alignment.centerRight,
      width: widget.labelWidth.r,
      margin: const EdgeInsets.only(right: 10),
      child: Text.rich(
        TextSpan(
          children: [
            if (widget.isRequired!)
              const TextSpan(
                text: "*",
                style: TextStyle(
                    color: Color.fromRGBO(255, 0, 0, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            TextSpan(
              text: widget.label!,
              style: TextStyle(
                  // color: widget.lableColor,
                  color: Colors.black,
                  fontSize: widget.styleType == 0 ? 13.sp : 15.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField() {
    Widget? prefixWidget = null;
    if (widget.icon != null) prefixWidget = _icon();
    if (widget.label != null) prefixWidget = _label();

    return FormBuilderTextField(
      name: widget.name,
      key: Key(widget.name),
      focusNode: focusNode,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      readOnly: widget.isReadOnly,
      enabled: !widget.disable,
      style: TextStyle(
        color: isFocused ? Colors.black : Colors.black,
      ),
      obscureText: widget.obscureText,
      onChanged: widget.onChange,

      decoration: InputDecoration(
        suffixIconConstraints:
            BoxConstraints(maxHeight: (widget.height - 10).r),
        prefixIconConstraints:
            BoxConstraints(maxHeight: (widget.height - 10).r),
        fillColor: widget.styleType == 0
            ? const Color.fromRGBO(233, 240, 253, 0.5)
            : Colors.white,
        isCollapsed: true,
        filled: true,
        focusColor: Colors.black,
        prefixIcon: prefixWidget,
        suffixIcon: widget.suffixIcon,
        contentPadding: const EdgeInsets.only(top: 8, bottom: 8, left: 5),
        border: borderStyle,
        enabledBorder: borderStyle,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(
            color: Color.fromRGBO(38, 38, 40, 1),
          ),
        ),
        focusedBorder: borderStyle,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: const Color(0xFFcccccc),
          fontSize: 12.sp,
        ),
        // border: InputBorder.none,
      ),
      cursorColor: Colors.black,
      controller: widget.controller,
    );
  }

}
