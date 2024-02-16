import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeAutoComplete<V, O extends Object> extends StatefulWidget {
  final String? label;
  final double labelWidth;
  final String? hintText;
  final String name;
  final double radius;
  final Widget? suffixIcon;
  final double marginBottom;
  final V? initialValue;
  final bool isReadOnly;
  final bool disable;
  final bool? isRequired;
  final void Function(String?)? onChange;
  final bool isDark;
  final FormFieldValidator<V>? validator;
  final TextInputType textInputType;
  final FutureOr<Iterable<O>> Function(TextEditingValue) optionsBuilder;
  final String Function(Object) displayStringForOption;

  const ThemeAutoComplete({
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
    required this.optionsBuilder,
    required this.displayStringForOption,
  }) : super(key: key);

  @override
  State<ThemeAutoComplete> createState() => _ThemeAutoCompleteState<V, O>();
}

class _ThemeAutoCompleteState<V, O extends Object>
    extends State<ThemeAutoComplete> {
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
                    if (widget.isRequired!)
                      TextSpan(
                        text: "*",
                        style: TextStyle(
                            color:Colors.grey, fontSize: 12.sp),
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
            child: LayoutBuilder(builder: (context, constraint) {
              return FormBuilderField<V>(
                name: widget.name,
                key: Key(widget.name),
                validator: widget.validator,
                initialValue: widget.initialValue,
                builder: (formState) {
                  return Autocomplete<O>(
                    optionsViewBuilder: (
                      BuildContext context,
                      AutocompleteOnSelected<O> onSelected,
                      Iterable<O> options,
                    ) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 4.0,
                          child: SizedBox(
                            height: 125,
                            width: constraint.maxWidth,
                            child: ListView.builder(
                              padding: const EdgeInsets.all(8.0),
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final O option = options.elementAt(index);
                                return GestureDetector(
                                  onTap: () {
                                    onSelected(option);
                                    formState.didChange(widget.displayStringForOption(option) as V);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.r, vertical: 5.r),
                                    child: Text(
                                      widget.displayStringForOption(option),
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    displayStringForOption: widget.displayStringForOption,
                    optionsBuilder: widget.optionsBuilder
                        as FutureOr<Iterable<O>> Function(TextEditingValue),
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController textEditingController,
                        FocusNode focusNode,
                        VoidCallback onFieldSubmitted) {
                      return TextField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        minLines: null,
                        maxLines: null,
                        onEditingComplete: () {
                          onFieldSubmitted();
                        },
                        cursorColor: Colors.grey,
                        readOnly: widget.isReadOnly,
                        enabled: !widget.disable,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        onChanged: widget.onChange,
                        keyboardType: widget.textInputType,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            height: 1.2,
                            fontSize: 10.sp,
                          ),
                          suffixIconConstraints:
                              BoxConstraints(maxHeight: 30.r),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 30.r),
                          isDense: true,
                          fillColor: widget.disable
                              ? const Color.fromRGBO(63, 63, 63, 1)
                              : const Color.fromRGBO(11, 11, 11, 1),
                          filled: true,
                          focusColor: Colors.black,
                          suffixIcon: widget.suffixIcon,
                          contentPadding: EdgeInsets.only(
                              top: 5.r, bottom: 5.r, left: 5.r, right: 5.r),
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
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
