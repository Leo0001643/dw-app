import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/color_schema.dart';

class ActivityTextInput extends StatefulWidget {
  final String? icon;
  final String? label;
  final double? containerWidth;
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
  final void Function()? onClick;
  final EdgeInsets? padding;
  final Color? hintColor;

  const ActivityTextInput(
      {Key? key,
      this.icon,
      this.label,
      this.hintText,
      this.inputTips,
      this.containerWidth,
      this.labelWidth = 85,
      this.radius = 5,
      this.suffixIcon,
      this.onChange,
      this.marginBottom = 5,
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
      this.onClick,
      this.padding,
      this.hintColor})
      : super(key: key);

  @override
  State<ActivityTextInput> createState() => _ActivityTextInputState();
}

class _ActivityTextInputState extends State<ActivityTextInput> {
  late FocusNode focusNode;
  bool isFocused = false;
  late Color borderColor;
  late OutlineInputBorder borderStyle;

  @override
  void initState() {
    super.initState();

    borderColor = widget.isDark
        ? AppTheme.dateSelectorBorderColor
        : AppTheme.filterBorderColor;

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
            padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 12),
            margin: EdgeInsets.only(bottom: widget.marginBottom.h),
            width: widget.containerWidth,
            child: widget.styleType == 0
                ? Row(
                    children: [
                      if (widget.icon != null) _icon(),
                      if (widget.label != null) _label(),
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
                      _inputField()
                    ],
                  )),
        // widget.inputTips ?? Container(),
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
      alignment: Alignment.centerLeft,
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
                  color: widget.lableColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField() {
    return FormBuilderTextField(
      textAlign: TextAlign.left,
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
      onTap: widget.onClick,
      decoration: InputDecoration(
        isCollapsed: true,
        fillColor:
            isFocused ? const Color.fromRGBO(233, 240, 253, 1) : Colors.white,
        filled: true,
        focusColor: Colors.black,
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
          color: widget.hintColor ?? AppTheme.hintColor,
          fontSize: 12.sp,
        ),
        // border: InputBorder.none,
      ),
      cursorColor: AppTheme.primary,
      controller: widget.controller,
    );
  }

  Widget _item(String title, String hintText,
      {bool isNeed = false, bool isBtn = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: [
          if (isNeed)
            const TextSpan(
              text: '* ',
              style: TextStyle(
                  color: Color.fromRGBO(255, 0, 0, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          TextSpan(
            text: title,
            style: const TextStyle(
                color: Color.fromRGBO(11, 33, 59, 1),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )
        ])),
        GestureDetector(
          // onTap: isBtn ? _didClickSelectedGender : null,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(47, 115, 245, 0.2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 10, top: 0, bottom: 10, right: 10),
                        hintText: hintText,
                        border: InputBorder.none,
                        enabled: isBtn ? false : true),
                  ),
                )),
                if (isBtn)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Image.asset(
                      'assets/images/login/down_icon.png',
                    ),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
