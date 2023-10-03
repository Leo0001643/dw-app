import 'package:aone_common/common.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeDropDown<T> extends StatefulWidget {
  final String? label;
  final double labelWidth;
  final String? hintText;
  final String name;
  final double radius;
  final Widget? suffixIcon;
  final double marginBottom;
  final String? initialValue;
  final bool isDark;
  final FormFieldValidator<T>? validator;
  final ValueChanged<dynamic>? onChange;
  final List<T>? items;
  final List<DropdownMenuItem<T>>? dropdownList;
  final T? defaultValue;
  final bool isRequired;
  final bool isExpanded;

  const ThemeDropDown({
    Key? key,
    this.label,
    this.hintText,
    this.labelWidth = 80,
    this.radius = 5,
    this.suffixIcon,
    this.marginBottom = 10,
    required this.name,
    this.initialValue,
    this.isDark = true,
    this.validator,
    this.items,
    this.defaultValue,
    this.isRequired = false,
    this.onChange,
    this.dropdownList,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<ThemeDropDown> createState() => _ThemeDropDownState<T>();
}

class _ThemeDropDownState<T> extends State<ThemeDropDown> {
  bool isFocused = false;
  late Color borderColor;
  late OutlineInputBorder borderStyle;

  @override
  void initState() {
    super.initState();
    borderColor = widget.isDark
        ? const Color.fromRGBO(40, 39, 45, 1)
        : const Color.fromRGBO(113, 96, 47, 1);
    borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: BorderSide(
        color: borderColor,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
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
                    if (widget.isRequired)
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
          Flexible(
            child: FormBuilderField(
              name: widget.name,
              validator: widget.validator,
              initialValue: widget.defaultValue,
              builder: (FormFieldState field) {
                return DropdownButtonFormField2<T>(
                  items: widget.dropdownList != null
                      ? widget.dropdownList as List<DropdownMenuItem<T>>
                      : widget.items
                          ?.map(
                            (e) => DropdownMenuItem<T>(
                              value: e,
                              child: Text(
                                e,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Color.fromRGBO(127, 127, 127, 1),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                  key: Key(widget.name),
                  isExpanded: widget.isExpanded,
                  value: field.value,
                  buttonPadding: EdgeInsets.zero,
                  iconSize:20,
                  iconEnabledColor: const Color.fromRGBO(201, 168, 116, 1),
                  buttonHeight: 20,
                  itemHeight: 30,
                  dropdownMaxHeight: 150.r,
                  hint: Text(
                    widget.hintText ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 0.3),
                      height: 1.5,
                      fontSize: 12.sp,
                    ),
                  ),
                  style: TextStyle(
                    color: isFocused ? Colors.black : Colors.white,
                  ),
                  onChanged: (dynamic val) {
                    field.didChange(val);
                    if (widget.onChange != null) {
                      widget.onChange!(val);
                    }
                  },
                  dropdownDecoration: BoxDecoration(
                    color: const Color.fromRGBO(11, 11, 12, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      height: 1.2,
                      fontSize: 10.sp,
                    ),
                    isDense: true,
                    fillColor: const Color.fromRGBO(11, 11, 11, 1),
                    filled: true,
                    focusColor: Colors.black,
                    suffixIcon: widget.suffixIcon,
                    contentPadding: EdgeInsets.only(
                      top: 5.r,
                      bottom: 5.r,
                      left: 5.r,
                      right: 5.r,
                    ),
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
                    // border: InputBorder.none,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
