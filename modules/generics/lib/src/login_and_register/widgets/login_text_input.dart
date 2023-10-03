import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


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
  final double paddingVertical;
  final Widget? prefixIcon;
  final Color? fillColor;
  final Color? boderColor;
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
  final Color? focusColor;
  final Color? unFocusColor;
  final bool showBorder;
  const ThemeNewTextInput(
      {Key? key,
      this.icon,
      this.paddingVertical = 0,
      this.label,
      this.hintText,
      this.inputTips,
      this.focusColor = const Color(0xFF888888),
      this.unFocusColor = const Color(0xFF888888),
      this.showBorder = true,
      this.containerWidth,
      this.labelWidth = 85,
      this.radius = 40,
      this.prefixIcon,
      this.fillColor = Colors.white,
      this.boderColor = const Color(0xFFEAEAEA),
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
      this.cursorColor = const Color(0xFF888888),
      this.suffixIcon})
      : super(key: key);

  @override
  State<ThemeNewTextInput> createState() => _ThemeNewTextInputState();
}

class _ThemeNewTextInputState extends State<ThemeNewTextInput> {
  late FocusNode focusNode;
  bool isFocused = false;
  late Color borderColor;
  // late UnderlineInputBorder borderStyle;
  late OutlineInputBorder borderStyle;

  @override
  void initState() {
    super.initState();
    // borderStyle = UnderlineInputBorder(
    //   borderRadius: BorderRadius.circular(widget.radius),
    //   borderSide: BorderSide(
    //     color: widget.boderColor ?? AoneAppTheme.appTheme.primary!,
    //   ),
    // );

     borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: BorderSide(
        color: widget.boderColor! ,
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
        color: isFocused ? widget.focusColor : widget.unFocusColor,
        fontSize: 16.w,
      ),
      obscureText: widget.obscureText,
      onChanged: widget.onChange,
      onTap: widget.onClick,
      decoration: InputDecoration(
        isDense: true,
        isCollapsed: true,
        prefixIconConstraints: BoxConstraints(maxHeight: 30.w),
        suffixIconConstraints: BoxConstraints(maxHeight: 30.w),
        fillColor: widget.fillColor,
        filled: true,
        focusColor: Colors.white,
        prefixIcon: widget.prefixIcon == null
            ? null
            : Container(
                margin: EdgeInsets.only(left: 14.w, right: 7.w),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    widget.prefixIcon!,
                    if (widget.isRequired)
                      Positioned(
                        left: -8.w,
                        top: 4.w,
                        child: SvgPicture.asset(
                          'assets/images/login/asterisk.svg',
                          width: 8,
                          height: 8,
                        ),
                      ),
                  ],
                ),
              ),
        suffixIcon: widget.suffixIcon,
        contentPadding:
            EdgeInsets.symmetric(vertical: widget.paddingVertical.w),
        border: borderStyle,
        enabledBorder: borderStyle,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
         disabledBorder: borderStyle,
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(widget.radius),
        //   borderSide: const BorderSide(
        //     color: Color.fromRGBO(38, 38, 40, 1),
        //   ),
        // ),
        focusedBorder: borderStyle,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: const Color(0xff757575),
          fontSize: 14.w,
        ),
        // border: InputBorder.none,
      ),
      cursorColor: widget.cursorColor,
      controller: widget.controller,
    );
  }
}
