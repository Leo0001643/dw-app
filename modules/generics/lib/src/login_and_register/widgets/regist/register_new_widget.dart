import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/register/register_form_fields.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../controllers/register_widget_controller.dart';
import '../common_text_input.dart.dart';
import '../login_text_input.dart';
import '../show_html_dialog.dart';

class RegisterWidget extends GetView<RegisterWidgetController> {
  final RegisterType? registerType;

  const RegisterWidget({Key? key, this.registerType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterWidgetController(
      registerType: registerType ?? RegisterType.member,
    ));

    final state = controller.state;

    return Obx(() {
      return FormBuilder(
          key: state.regFormKey,
          child: Column(
            children: [
              Container(
               padding:const EdgeInsets.only(top: 27.5, left: 16, bottom: 16,right: 16),

                decoration:const BoxDecoration(
                               image: DecorationImage(image: 
                                AssetImage('assets/images/login_and_register/register_content_bg.png'),fit: BoxFit.fill
                                )
                 ),
                constraints: BoxConstraints(
                  minHeight: 0.3.sh,
                  maxHeight: 0.4.sh,
                ),
                child: Column(children: [
                Expanded(child: 
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: controller.formFields.isEmpty
                        ? [
                            Container(
                              height: 200.w,
                              alignment: Alignment.center,
                              child:  CircularProgressIndicator(
                                color: AoneAppTheme.appTheme.primary
                              ),
                            ),
                          ]
                        : [
                            SizedBox(     
                              child: Column(
                                children: [
                                  ...controller.formFields.mapIndexed(
                                    (e, childIndex) {
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
                                   /*
                                      if (e.fieldType == FieldType.select) {
                                        return ThemeNewTextInput(
                                          marginBottom: 16,
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
                                                color: AoneAppTheme.appTheme.greyColor,
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
                                                    : controller
                                                        .state.questionList,
                                                e,
                                                e.label.tr);
                                          },
                                        );
                                      }

                                      if (e.fieldType == FieldType.password ||
                                          e.fieldType ==
                                              FieldType.passwordText) {
                                        return Obx(() {
                                          return ThemeNewTextInput(
                                            marginBottom: 16,
                                            paddingVertical: 10.w,
                                            name: e.key,
                                            isRequired: e.required,
                                            hintText: remarks,
                                            validator: e.validator,
                                            onChange: (v) => {

              
                                            },
                                            obscureText: controller.registerObscureTextState,
                                            prefixIcon: Image.asset(
                                              controller.iconUser(e.key),
                                              width: 20.w,
                                              height: 20.w,
                                            ),
                                            suffixIcon: GestureDetector(
                                                onTap: () {
                                                 controller.registerObscureTextState = !controller.registerObscureTextState;
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 14.w),
                                                  child: Image.asset(
                                                   controller.registerObscureTextState == true
                                                        ? 'assets/images/login_and_register/eye_close.png'
                                                         : 'assets/images/login_and_register/eye_open.png',
                                                    width: 16,
                                                  ),
                                                )),
                                          );
                                        });
                                      }*/
                              if (e.fieldType == FieldType.password ||
                                    e.fieldType == FieldType.passwordText) {
                                  return ObxValue<RxInt>(
                                    (strength) {
                                      final val = strength.value;
                                      return ValueBuilder<bool?>(
                                        initialValue: false,
                                        builder: (value, updateFn) {
                                          if (e.fieldType ==
                                              FieldType.password) {
                                             return ObxValue<RxBool>((pv) {
                                              final passwordVis = pv.value;
                                              return ValueBuilder<bool?>(
                                                  initialValue: false,
                                                  builder: (value, updateFn) {
                                                    return Column(
                                                      children: [
                                                        ThemeNewTextInput(
                                                            name: e.key,
                                                            paddingVertical:10.w,
                                                            prefixIcon: Padding(
                                                              padding: EdgeInsets.symmetric(
                                                                horizontal: 2.w,
                                                              ),
                                                              child:Image.asset(
                                                                controller.iconUser(e.key),
                                                                width: 18.w,
                                                                height: 18.w,
                                                              ),
                                                            ),
                                                            // focusColor:Colors.white,
                                                            // unFocusColor:Colors.white,
                                                            isRequired:e.required,
                                                            hintText:e.remarks.tr,
                                                            styleType: 0,
                                                            showBorder: false,
                                                            suffixIcon: GestureDetector(
                                                              onTap: () {
                                                                pv.value = !pv.value;
                                                              },
                                                              child: Padding(
                                                                padding: EdgeInsets.only(
                                                                        right: 15.w),
                                                                child: pv.value? openEyesIcon(): closeEyesIcon(),
                                                              ),
                                                            ),
                                                            validator: (value) {
                                                              if (controller.state.regFormKey.currentState
                                                                      ?.instantValue["user_name"] == value) {
                                                                return "password.hint.new.not.equal_account".tr;
                                                              }
                                                              String?validateResult = FormBuilderValidators.match(
                                                                          r"(?!^\d+$)(?!^[A-Za-z]+$)(?!^[^A-Za-z0-9]+$)(?!^.*[\u4E00-\u9FA5].*$)^\S{6,20}$",
                                                                          errorText: 'password.hint.new.different_type'.tr).call(value);
                                                              if (validateResult?.isNotEmpty == true) {
                                                                return validateResult;
                                                              } 
                                                              return e.validator.call(value);
                                                            },
                                                            obscureText: e.fieldType == FieldType.password && passwordVis ==false,
                                                            isDark: false,
                                                            onChange: (value) {
                                                              if (e.fieldType == FieldType.password) {
                                                                controller.password.value = value ?? "";
                                                              }

                                                              strength.value = passwordStrengthChecker( value ?? '');
                                                            },
                                                            onFocusChanged:(focusIn) {
                                                              updateFn(focusIn);
                                                              value = focusIn;
                                                            }),
                                                        Visibility(
                                                          visible: value == true && e.key != "repassword",
                                                          child:getPasswordWidget(val,controller),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            }, false.obs);
                                                } else {
                                                  return ThemeTextInputNew(
                                                    styleType: -1,
                                                    name: e.key,
                                                    label: e.label.tr,
                                                    isRequired: e.required,
                                                    hintText: e.remarks.tr,
                                                    focusColor: Colors.white,
                                                    validator: (value) {
                                                      return e.validator
                                                          .call(value);
                                                    },
                                                    obscureText: e.fieldType ==
                                                        FieldType.password,
                                                    isDark: false,
                                                    showBorder: false,
                                                    onChange: (value) => strength
                                                            .value =
                                                        passwordStrengthChecker(
                                                            value ?? ''),
                                                  );
                                                }
                                              },
                                            );
                                          },
                                          0.obs,
                                        );
                                        
                                      }
                                      if (e.fieldType == FieldType.checkbox) {
                                        // return _builfAgreement();
                                      }
                                      var suffixIconWidget =
                                          Container(width: 1);
                                      if (e.key == "reg_mobilecode") {
                                        suffixIconWidget = Container(
                                          padding:const EdgeInsets.only(right: 12),
                                          child: controller.time.value == 0
                                              ? GestureDetector(
                                                  onTap: () {
                                                    controller.runTimer();
                                                  },
                                                  child:  Text(
                                                    "获取验证码",
                                                    style: TextStyle(
                                                        color:
                                                            AoneAppTheme.appTheme.primary,
                                                        fontSize: 14),
                                                  ),
                                                )
                                              : Text(
                                                  "${controller.time.value}s后获取",
                                                  style:  TextStyle(
                                                      color: AoneAppTheme.appTheme.primary,
                                                      fontSize: 14),
                                                ),
                                        );
                                      }
                                      return ThemeNewTextInput(
                                        marginBottom: 16,
                                         
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
                              ),
                            ),

                          ],
                          
                  ),
                )),
                 _builfAgreement(),
                ],)
              ),
              _registerButton(),
             
            ],
          ));
    });
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

  Widget _registerButton() {
    return GestureDetector(
      onTap: () {
        if (RegisterWidgetController.to.agreeSelect == false) {
          SmartDialog.showToast('需要勾选已同意相关条款和隐私协议');
          return;
        }
        RegisterWidgetController.to.handleSubmit();
      },
      child: Container(
        height: 40.w,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Text(
          '立即注册',
          style: TextStyle(fontSize: 16.sp, color: AoneAppTheme.appTheme.primary),
        ),
      ),
    );
  }

  _builfAgreement() {
    return Container(
      margin: EdgeInsets.only(top: 5.w),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              RegisterWidgetController.to.agreeSelect.value =
                  !RegisterWidgetController.to.agreeSelect.value;
            },
            child: Obx(() {
              return Icon(
                RegisterWidgetController.to.agreeSelect.value == true
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: AoneAppTheme.appTheme.primary,
                size: 22.w,
              );
            }),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () => {
              Get.dialog(ShowHtmlDialog(
                title: '用户协议',
                showContent: RegisterWidgetController.to.state.agreement,
              ))
            },
            child: Row(
              children:  [
                Text(
                  "我已阅读并同意相关条款和",
                  style: TextStyle(color: AoneAppTheme.appTheme.greyColor),
                ),
                Text(
                  "隐私协议",
                  style: TextStyle(color: AoneAppTheme.appTheme.primary),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget openEyesIcon() {
    return Image.asset(
      "assets/images/login_and_register/eye_open.png",
      width: 20.w,
      height: 20.w,
    );
  }

  Widget closeEyesIcon() {
    return Image.asset(
      "assets/images/login_and_register/eye_close.png",
      width: 20.w,
      height: 20.w,
    );
  }

  Widget getPasswordWidget(int val, RegisterWidgetController controller) {
    final RegExp _numReg = RegExp(r".*[0-9].*");
    final RegExp _letterReg = RegExp(r".*[A-Za-z].*");
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  controller.password.value.length > 5 &&
                          controller.password.value.length < 21
                      ? 'assets/images/register/green_warning.svg'
                      : 'assets/images/register/red_warning.svg',
                  fit: BoxFit.fill,
                  width: 15.w,
                  height: 15.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "password.lengthLimit".tr,
                  style: TextStyle(
                    color: controller.password.value.length > 5 &&
                            controller.password.value.length < 21
                        ? const Color(0xff3DC070)
                        : const Color(0xffFF0000),
                    fontSize: 12.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.w),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  controller.password.value.contains(_numReg) &&
                          controller.password.value.contains(_letterReg)
                      ? 'assets/images/register/green_warning.svg'
                      : 'assets/images/register/red_warning.svg',
                  fit: BoxFit.fill,
                  width: 15.w,
                  height: 15.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "password.hint.new.different_type".tr,
                  style: TextStyle(
                    color: controller.password.value.contains(_numReg) &&
                            controller.password.value.contains(_letterReg)
                        ? const Color(0xff3DC070)
                        : const Color(0xffFF0000),
                    fontSize: 12.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.w),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  controller.password.value != controller.account.value
                      ? 'assets/images/register/green_warning.svg'
                      : 'assets/images/register/red_warning.svg',
                  fit: BoxFit.fill,
                  width: 15.w,
                  height: 15.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "password.hint.new.not.equal_account".tr,
                  style: TextStyle(
                    color: controller.password.value != controller.account.value
                        ? const Color(0xff3DC070)
                        : const Color(0xffFF0000),
                    fontSize: 12.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.w),
            PasswordStrengthIndicator(
              strengthLevel: val,
            )
          ],
        ));
  }
}

class PasswordStrengthIndicator extends StatelessWidget {
  final int strengthLevel;
  static Map<int, Color> colors = {
    1: const Color(0xFFBB1100),
    2: const Color(0xFFFFA110),
    3: const Color(0xFF00A010),
  };
  static Map<int, String> strengthText = {
    0: 'weak',
    1: 'weak',
    2: 'medium',
    3: 'strong',
  };

  const PasswordStrengthIndicator({
    Key? key,
    required this.strengthLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              '密码强度：',
              style: TextStyle(color: AoneAppTheme.appTheme.greyColor, fontSize: 12),
            ),
          ),
          ...List.filled(3, 0).mapIndexed((e, i) {
            final int index = i + 1;
            Color color =  const Color(0xFFBBBBBB);
            if (index <= strengthLevel) {
              color = colors[strengthLevel]!;
            }
            return Container(
              margin: const EdgeInsets.only(left: 6),
              width: 35.r,
              height: 15.r,
              color: color,
            );
          }),
          Container(
            margin: const EdgeInsets.only(left: 6),
            child: Text(
              (strengthText[strengthLevel] ?? '').tr,
              style: TextStyle(
                // color: colors[strengthLevel],
                color: AoneAppTheme.appTheme.greyColor,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

