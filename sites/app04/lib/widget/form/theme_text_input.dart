import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeTextInput extends StatefulWidget {
  final String? label;
  final double labelWidth;
  final double height;
  final Alignment? labelAlignment;
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
  final Color? lableColor;
  final int styleType;
  final void Function(bool?)? onFocusChanged;
  final bool showBorder;

  const ThemeTextInput({
    Key? key,
    this.label,
    this.labelAlignment,
    this.hintText,
    this.labelWidth = 100,
    this.height = 40,
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
    this.showBorder = false,
  }) : super(key: key);

  @override
  State<ThemeTextInput> createState() => _ThemeTextInputState();
}

class _ThemeTextInputState extends State<ThemeTextInput> {
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
    return Stack(
      children: [
        Container(
          height: widget.height.r,
          width: ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
            color: widget.styleType == 1
                ? Colors.white
                : const Color.fromRGBO(233, 240, 253, 0.5),
            //圆角半径
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            border: Border.all(
              width: 1,
              color: const Color.fromRGBO(113, 96, 47, 1),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(
              bottom: widget.marginBottom.h,
            ),
            padding: const EdgeInsets.all(2),
            width: ScreenUtil.defaultSize.width,
            child: widget.styleType == 0 || widget.styleType == 1
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      if (widget.label != null) _label(),
                      // if (widget.label != null)
                      Expanded(
                          child: Container(
                              constraints: BoxConstraints(
                                  maxHeight: (widget.height - 4).r),
                              child: _inputField()))
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
      ],
    );
  }

  Widget _label() {
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      alignment: widget.labelAlignment ?? Alignment.centerLeft,
      width: widget.labelWidth.r,
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
    return Center(
      child: FormBuilderTextField(
        name: widget.name,
        key: Key(widget.name),
        focusNode: focusNode,
        validator: widget.validator,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: widget.initialValue,
        readOnly: widget.isReadOnly,
        enabled: !widget.disable,
        style: TextStyle(
            color: isFocused ? Colors.black : Colors.black,
            fontSize: 14.w,
            height: 1.7),
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
          filled: true,
          focusColor: Colors.black,
          suffixIcon: widget.suffixIcon,
          contentPadding: const EdgeInsets.only(left: 5, bottom: 10, right: 5),
          border: widget.showBorder ? borderStyle : InputBorder.none,
          enabledBorder: widget.showBorder ? borderStyle : InputBorder.none,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(
              color: Color.fromRGBO(38, 38, 40, 1),
            ),
          ),
          focusedBorder: widget.showBorder ? borderStyle : InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: stringToColor('cccccc'),
            fontSize: widget.styleType == 1 ? 10.sp : 12.sp,
          ),
          // border: InputBorder.none,
        ),
        cursorColor: Colors.black,
      ),
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
