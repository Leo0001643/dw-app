import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeTextInput extends StatefulWidget {
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
  final TextInputType textInputType;
  final bool obscureText;
  final void Function(bool)? onFocusChanged;

  const ThemeTextInput({
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
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.onFocusChanged,
  }) : super(key: key);

  @override
  State<ThemeTextInput> createState() => _ThemeTextInputState();
}

class _ThemeTextInputState extends State<ThemeTextInput> {
  late FocusNode focusNode;
  bool isFocused = false;
  late Color borderColor;
  late OutlineInputBorder borderStyle;
  late bool isPassword;
  late TextInputType inputType;
  late bool passwordVisible;

  @override
  void initState() {
    super.initState();

    isPassword = widget.obscureText;
    passwordVisible = widget.obscureText;

    borderColor = widget.isDark
        ? const Color.fromRGBO(40, 39, 45, 1)
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
          isFocused = widget.isReadOnly ? false : focusNode.hasFocus;
        });
        if (widget.onFocusChanged != null) {
          widget.onFocusChanged!(isFocused);
        }
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
      margin: EdgeInsets.only(bottom: widget.marginBottom.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          if (widget.label != null)
            Container(
              alignment: Alignment.centerRight,
              width: widget.labelWidth.r,
              child: Text.rich(
                TextSpan(
                  children: [
                    if (widget.isRequired!)
                      TextSpan(
                        text: "*",
                        style: TextStyle(
                            color: stringToColor('EB3323'), fontSize: 12.sp),
                      ),
                    TextSpan(
                      text: widget.label!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (widget.label != null)
            SizedBox(
              width: 12.r,
            ),
          Expanded(
            child: FormBuilderTextField(
              name: widget.name,
              key: Key(widget.name),
              focusNode: focusNode,
              validator: widget.validator,
              initialValue: widget.initialValue,
              readOnly: widget.isReadOnly,
              enabled: !widget.disable,
              style: const TextStyle(
                color: Colors.white,
              ),
              obscureText: passwordVisible,
              onChanged: widget.onChange,
              keyboardType: widget.textInputType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  height: 1.2,
                  fontSize: 10.sp,
                ),
                suffixIconConstraints: BoxConstraints(maxHeight: 50.r),
                prefixIconConstraints: BoxConstraints(maxHeight: 30.r),
                isDense: true,
                fillColor: widget.disable
                    ? const Color.fromRGBO(63, 63, 63, 1)
                    : const Color.fromRGBO(11, 11, 11, 1),
                filled: true,
                focusColor: Colors.black,
                suffixIcon: isPassword
                    ? Padding(
                        padding: EdgeInsets.only(right: 5.r),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          child: Icon(
                            passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : widget.suffixIcon,
                contentPadding: EdgeInsets.all(5.r),
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
                  color: const Color.fromRGBO(255, 255, 255, 0.3),
                  fontSize: 12.sp,
                ),
                // hi
                // border: InputBorder.none,
              ),
              cursorColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
