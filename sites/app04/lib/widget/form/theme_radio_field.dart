import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/color_schema.dart';

class ThemeRadioField<T> extends StatefulWidget {
  final String? label;
  final double labelWidth;
  final String name;
  final double marginBottom;
  final bool disable;
  final bool? isRequired;
  final FormFieldValidator<T>? validator;
  final List<FormBuilderFieldOption<T>> options;
  final void Function(T)? onChange;
  final WrapAlignment wrapAlignment;
  final T? initialValue;
  final bool enable;
  final List<T>? disabled;

  const ThemeRadioField({
    Key? key,
    this.label,
    this.labelWidth = 80,
    this.onChange,
    this.marginBottom = 10,
    required this.name,
    this.initialValue,
    this.disable = false,
    this.isRequired = false,
    this.validator,
    required this.options,
    this.wrapAlignment = WrapAlignment.start,
    this.enable = true,
    this.disabled,
  }) : super(key: key);

  @override
  State<ThemeRadioField> createState() => _ThemeRadioFieldState<T>();
}

class _ThemeRadioFieldState<T> extends State<ThemeRadioField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: FormBuilderRadioGroup<T>(
              enabled: widget.enable,
              disabled: widget.disabled as List<T>?,
              initialValue: widget.initialValue,
              wrapAlignment: widget.wrapAlignment,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              decoration: InputDecoration(
                isDense: true,
                fillColor: Colors.red,
                hoverColor: Colors.red,
                // fillColor:
                //     AoneAppTheme.appTheme.activityDialogSubTitleTextColor,
                contentPadding: EdgeInsets.zero,
                iconColor: Colors.white,
                suffixIconColor: Colors.white,
                border: InputBorder.none,
              ),
              hoverColor: Colors.green,
              activeColor: Colors.blue,
              focusColor: Colors.blue,
              onChanged: (value) => value != null && widget.onChange != null
                  ? widget.onChange!(value)
                  : null,
              options: widget.options as List<FormBuilderFieldOption<T>>,
              name: widget.name,
            ),
          ),
        ],
      ),
    );
  }
}
