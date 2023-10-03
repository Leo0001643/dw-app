import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeTextInputNew extends StatefulWidget {
  final String? label;
  final double labelWidth;
  final double height;
  final String? hintText;
  final Color? focusColor;
  final Color? unFocusColor;
  final String name;
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

  const ThemeTextInputNew({
    Key? key,
    this.label,
    this.hintText,
    this.focusColor = Colors.black,
    this.unFocusColor = Colors.black,
    this.labelWidth = 80,
    this.height = 40,
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
    return Stack(
      children: [
        Container(
          height: widget.height.w,
          width: ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: widget.marginBottom.w,
          ),
          width: ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.label != null) _label(),
              SizedBox(
                height: 5.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                child: _inputField(),
              ),
            ],
          ),
        ),
      ],
    );
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
        suffixIconConstraints:
            BoxConstraints(maxHeight: (widget.height - 10).r),
        prefixIconConstraints:
            BoxConstraints(maxHeight: (widget.height - 10).r),
        fillColor: widget.fillColor ?? Colors.white,
        filled: true,
        focusColor: Colors.black,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        contentPadding: EdgeInsets.only(left: 15.w, right: 15.w),
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
          color: stringToColor('C6C5C5'),
          fontSize: 16.w,
        ),
        // border: InputBorder.none,
      ),
      cursorColor: Colors.black,
    );
  }
}
