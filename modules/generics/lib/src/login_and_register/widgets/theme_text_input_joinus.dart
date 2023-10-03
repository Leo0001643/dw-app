import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeTextInputJoinUs extends StatefulWidget {
  final String? label;
  final double labelWidth;
  final double height;
  final String? hintText;
  final Color? focusColor;
  final Color? unFocusColor;
  final double leftMargin;
  final String name;
  final Color? labelColor;
  final double radius;
  final Widget? prefixIcon;
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
  final bool showBorder;
  final Color? fillColor;

  const ThemeTextInputJoinUs({
    Key? key,
    this.label,
    this.hintText,
    this.focusColor = Colors.black,
    this.unFocusColor = Colors.black,
    this.labelWidth = 80,
    this.height = 40,
    this.leftMargin = 0,
    this.radius = 5,
    this.prefixIcon,
    this.suffixIcon,
    this.onChange,
    this.marginBottom = 15,
    required this.name,
    this.initialValue,
    this.isReadOnly = false,
    this.disable = false,
    this.isRequired = false,
    this.labelColor = Colors.black,
    this.isDark = true,
    this.validator,
    this.obscureText = false,
    this.lableColor = Colors.black,
    this.styleType = 0,
    this.onFocusChanged,
    this.showBorder = true,
    this.fillColor,
  }) : super(key: key);

  @override
  State<ThemeTextInputJoinUs> createState() => _ThemeTextInputJoinUsState();
}

class _ThemeTextInputJoinUsState extends State<ThemeTextInputJoinUs> {
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
    return Container(
        margin: EdgeInsets.only(bottom: widget.marginBottom.w),
        width: ScreenUtil().screenWidth,
        child: Center(child: _inputField()));
  }

  Widget _label() {
    return Row(
      children: [
        if (widget.isRequired ?? false) ...[
          Icon(
            Icons.star_rounded,
            color: const Color(0xffFF0000),
            size: 15.w,
          ),
          SizedBox(width: 10.w),
        ],
        Text(
          widget.label ?? '',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.w,
          ),
        ),
      ],
    );
  }

  Widget _inputField() {
    return FormBuilderTextField(
      textAlignVertical: TextAlignVertical.center,
      name: widget.name,
      key: Key(widget.name),
      focusNode: focusNode,
      validator: widget.validator,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      readOnly: widget.isReadOnly,
      enabled: !widget.disable,
      style: TextStyle(
        color: isFocused ? widget.focusColor : widget.unFocusColor,
        fontSize: 16.w,
      ),
      obscureText: widget.obscureText,
      onChanged: widget.onChange,
      decoration: InputDecoration(
        isCollapsed: true,
        prefixIcon: widget.label != null
            ? Container(
                alignment: Alignment.centerLeft,
                width: widget.labelWidth.r,
                margin: EdgeInsets.only(left: 10.w),
                child: Text.rich(
                  TextSpan(
                    children: [
                      if (widget.isRequired!)
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14.w,
                          ),
                        ),
                      TextSpan(
                        text: widget.label!,
                        style: TextStyle(
                          color: widget.labelColor,
                          fontSize: 14.w,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
        fillColor: widget.fillColor,
        filled: true,
        focusColor: Colors.white,
        suffixIcon: widget.suffixIcon,
        contentPadding: EdgeInsets.zero,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(
            color: Color.fromRGBO(38, 38, 40, 1),
          ),
        ),
        focusedBorder: borderStyle,
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: const Color.fromRGBO(117, 117, 117, 1),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
        // border: InputBorder.none,
      ),
      cursorColor: Colors.white,
    );
  }
}
