import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/register/register_form_fields.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
  import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

 import '../../controllers/register_widget_controller.dart';
import '../login_text_input.dart';

class RegisterColumnWidget extends StatelessWidget {
  RegisterWidgetController controller;

  RegisterColumnWidget(this.controller, {Key? key}) : super(key: key);
  Widget _geLoading() {
    return Container(
      height: 200.w,
      alignment: Alignment.center,
      child:  CircularProgressIndicator(
        color: AoneAppTheme.appTheme.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: controller.formFields.isEmpty
            ? [_geLoading()]
            : [
                Padding(
                    padding: EdgeInsets.only(top: 20.w),
                    child: Column(
                      children: [
                        ...controller.formFields.mapIndexed(
                          (e, childIndex) {
                            print('xxx ${e.key}');
                            if (e.config == 'reg_xieyi') {
                              return const SizedBox.shrink();
                            }
                            var remarks = e.remarks.tr;
                            if (e.key == "user_name") {
                              remarks = "(会员账号)6-20位数字、字母";
                            }
                            if (e.key == "password") {
                              remarks = "6-20个任意字母或数字组成";
                            }

                            if (e.fieldType == FieldType.select) {
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

                            if (e.fieldType == FieldType.password ||
                                e.fieldType == FieldType.passwordText) {
                              return ObxValue((data) {
                                return ThemeNewTextInput(
                                  marginBottom: 20.w,
                                  fillColor: Colors.black.withOpacity(0.4),
                                  boderColor: Colors.black.withOpacity(0.4),
                                  paddingVertical: 10.w,
                                  name: e.key,
                                  isRequired: e.required,
                                  hintText: remarks,
                                  validator: e.validator,
                                  onChange: (v) => {
                                    // data.value = [v ?? "", data[1]]
                                  },
                                  // obscureText: data[1] == false,
                                   obscureText: false,

                                  prefixIcon: Image.asset(
                                    controller.iconUser(e.key),
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        // data.value = [
                                        //   data[0],
                                        //   data[1] == true ? false : true
                                        // ];
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 14.w),
                                        child: Image.asset(
                                          // data[1] == true
                                          //     ? 'assets/images/login/open.png'
                                          //     : 'assets/images/login/close.png',
                                          'assets/images/login/open.png' ,
                                          width: 16,
                                        ),
                                      )),
                                );
                              }, ["", false].obs);
                            }

                            if (e.fieldType == FieldType.checkbox) {
                              // return _builfAgreement();
                            }
                            var suffixIconWidget = Container(width: 1);
                            if (e.key == "reg_mobilecode") {
                              suffixIconWidget = Container(
                                child: controller.time.value == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          controller.runTimer();
                                        },
                                        child: const Text(
                                          "获取验证码",
                                          style: TextStyle(
                                              color: Color(0xffFFDC5F),
                                              fontSize: 14),
                                        ),
                                      )
                                    : Text(
                                        "${controller.time.value}s后获取",
                                        style: const TextStyle(
                                            color: Color(0xffFFDC5F),
                                            fontSize: 14),
                                      ),
                              );
                            }
                            return ThemeNewTextInput(
                              marginBottom: 20.w,
                              fillColor: Colors.black.withOpacity(0.4),
                              boderColor: Colors.black.withOpacity(0.4),
                              paddingVertical: 10.w,
                              name: e.key,
                              isRequired: e.required,
                              hintText: remarks,
                              validator: e.validator,
                              onChange: (v) {
                                if (e.key == "reg_phone" ||
                                    e.key == "rega_phone") {
                                  if (v != null) {
                                    controller.phone.value = v;
                                  } else {
                                    controller.phone.value = "";
                                  }
                                }
                              },
                              suffixIcon: suffixIconWidget,
                              prefixIcon: Image.asset(
                                controller.iconUser(e.key),
                                width: 20.w,
                                height: 20.w,
                              ),
                            );
                          },
                        ).toList(),
                      ],
                    ))
              ]);
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
