import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/color_schema.dart';

class ThemeNewTextInput extends StatefulWidget {
  final String? icon;
  final String? label;
  final double? containerWidth;
  final double labelWidth;
  final String? hintText;
  final Widget? inputTips;
  final String name;
  final double radius;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double marginBottom;
  final String? initialValue;
  final bool isReadOnly;
  final bool disable;
  final bool isRequired;
  final void Function(String?)? onChange;
  final bool isDark;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final Color? lableColor;
  final int styleType;
  final void Function(bool?)? onFocusChanged;
  final TextEditingController? controller;
  final void Function()? onClick;
  final Color? cursorColor;

  const ThemeNewTextInput(
      {Key? key,
      this.icon,
      this.label,
      this.hintText,
      this.inputTips,
      this.containerWidth,
      this.labelWidth = 85,
      this.radius = 5,
      this.prefixIcon,
      this.suffixIcon,
      this.onClick,
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
      this.cursorColor})
      : super(key: key);

  @override
  State<ThemeNewTextInput> createState() => _ThemeNewTextInputState();
}

class _ThemeNewTextInputState extends State<ThemeNewTextInput> {
  late FocusNode focusNode;
  bool isFocused = false;
  late Color borderColor;
  late UnderlineInputBorder borderStyle;

  @override
  void initState() {
    super.initState();

    borderColor =
        widget.isDark ? AppTheme.dateSelectorBorderColor : AppTheme.border;

    borderStyle = UnderlineInputBorder(
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
            margin: EdgeInsets.only(bottom: widget.marginBottom.w),
            width: widget.containerWidth,
            child: widget.styleType == 0
                ? Row(
                    children: [
                      if (widget.icon != null) _icon(),
                      if (widget.label != null) _label(),
                      // if (widget.label != null)
                      Expanded(child: _inputField())
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.label != null) _label(),
                      SizedBox(
                        height: 5.w,
                      ),
                      _inputField(),
                    ],
                  )),
        widget.inputTips ?? Container(),
      ],
    );
  }

  Widget _icon() {
    var left1 = 0.r;
    if (widget.icon != null && widget.suffixIcon != null) {}
    return Container(
      margin: EdgeInsets.only(right: 8.r, left: left1),
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
      width: widget.labelWidth.r,
      padding: EdgeInsets.only(right: 10),
      child: Text.rich(
        TextSpan(
          children: [
            if (widget.isRequired)
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
                  fontSize: widget.styleType == 0 ? 14.sp : 16.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField() {
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
      onTap: widget.onClick,
      decoration: InputDecoration(
        isCollapsed: true,
        prefixIconConstraints: BoxConstraints(maxHeight: 30.w),
        suffixIconConstraints: BoxConstraints(maxHeight: 30.w),
        fillColor: Colors.white,
        filled: true,
        focusColor: Colors.black,
        prefixIcon: widget.prefixIcon == null
            ? null
            : Stack(
                clipBehavior: Clip.none,
                children: [
                  widget.prefixIcon!,
                  if (widget.isRequired)
                    Positioned(
                      left: -4.w,
                      top: -4.w,
                      child: SvgPicture.asset(
                        'assets/images/login/asterisk.svg',
                        width: 8,
                        height: 8,
                      ),
                    ),
                ],
              ),
        suffixIcon: widget.suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 17.5.w),
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
          color: const Color(0xff757575),
          fontSize: 14.w,
        ),
        // border: InputBorder.none,
      ),
      cursorColor: widget.cursorColor ?? Colors.black,
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
