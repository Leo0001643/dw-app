import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ThemeTextInputForgetRegister extends StatefulWidget {
  final String? label;
  final Color? labelColor;
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
  final Color fillColor;
  final Color valueColor;
  final Color borderColor;
  final Color? cursorColor;

  const ThemeTextInputForgetRegister(
      {Key? key,
      this.label,
      this.hintText,
      this.labelWidth = 100,
      this.radius = 5,
      this.suffixIcon,
      this.onChange,
      this.marginBottom = 10,
      required this.name,
      this.initialValue,
      this.labelColor = Colors.black,
      this.isReadOnly = false,
      this.disable = false,
      this.isRequired = false,
      this.isDark = true,
      this.validator,
      this.obscureText = false,
      this.fillColor = Colors.white,
      this.valueColor = Colors.black,
      this.borderColor = const Color(0xffDEDEDF),
      this.cursorColor = Colors.black})
      : super(key: key);

  @override
  State<ThemeTextInputForgetRegister> createState() => _ThemeTextInputState();
}

class _ThemeTextInputState extends State<ThemeTextInputForgetRegister> {
  late FocusNode focusNode;
  bool isFocused = false;
  late OutlineInputBorder borderStyle;

  @override
  void initState() {
    super.initState();

    borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: BorderSide(
        color: widget.borderColor,
      ),
    );

    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus != isFocused) {
        setState(() {
          isFocused = focusNode.hasFocus;
        });
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
    // printInfo(info: " widget.label  ${widget.label}   ");
    return Container(
        margin: EdgeInsets.only(bottom: widget.marginBottom.w),
        width: ScreenUtil().screenWidth,
        child: Center(
          child: FormBuilderTextField(
            textAlignVertical: TextAlignVertical.center,
            name: widget.name,
            key: Key(widget.name),
            focusNode: focusNode,
            validator: widget.validator,
            initialValue: widget.initialValue,
            readOnly: widget.isReadOnly,
            enabled: !widget.disable,
            style: TextStyle(
              color: widget.valueColor,
              fontSize: 14.w,
            ),
            obscureText: widget.obscureText,
            onChanged: widget.onChange,
            decoration: InputDecoration(
              isCollapsed: true,
              fillColor: widget.fillColor,
              filled: true,
              focusColor: Colors.black,
              suffixIcon: widget.suffixIcon,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.r, horizontal: 11.r),
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
                  color: const Color.fromRGBO(117, 117, 117, 1),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              // border: InputBorder.none,
            ),
            cursorColor: widget.cursorColor,
          ),
        ));
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
            height: 60.h,
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
