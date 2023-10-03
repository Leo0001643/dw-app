 import 'package:aone_common/controllers/register/register_form_fields.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
 import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
 
import 'package:get/get.dart';

 import '../../controllers/register_widget_controller.dart';
import '../login_text_input.dart';

class RegisterInputSelectWidget extends StatelessWidget {
  RegisterFormField e;
  RegisterWidgetController controller;
  String remarks;
  RegisterInputSelectWidget(this.controller, this.e, this.remarks, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeNewTextInput(
      marginBottom: 20.w,
      fillColor: Colors.black.withOpacity(0.4),
      boderColor: Colors.black.withOpacity(0.4),
      paddingVertical: 10.w,
      hintText: remarks,
      name: e.key,
      isRequired: e.required,
      styleType: 1,
      isReadOnly: true,
      suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
          ),
          child: Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
            size: 20.w,
          )),
      prefixIcon: Image.asset(
        controller.iconUser(e.key),
        width: 20.w,
        height: 20.w,
      ),
      validator: e.validator,
      onClick: () {
        _onClickItem(
            context,
            e.key == 'bankname'
                ? controller.state.bankList
                : controller.state.questionList,
            e,
            e.label.tr);
      },
    );
  }

  void _onClickItem(
      BuildContext context, var data, RegisterFormField formfield, String title,
      {String? label}) {
    Pickers.showSinglePicker(
      context,
      data: data,
      title: title,
      canSearch: true,
      pickerStyle: DefaultPickerStyle(),
      suffix: label,
      onConfirm: (p, position) {
        RegisterWidgetController.to.onSelectClose(p, formfield);
      },
    );
  }
}
