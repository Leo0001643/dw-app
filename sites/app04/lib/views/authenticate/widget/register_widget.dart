import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/register/register_form_fields.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:app04/widget/form/theme_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../theme/color_schema.dart';
import '../../../theme/theme_scaffold.dart';

import '../../../widget/form/theme_text_input_register_new.dart';
import '../../../widget/home_notice_widget.dart';
import '../../activities/widgets/show_html_dialog.dart';
import '../controller/register_widget_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterWidget extends StatelessWidget {
  final RegisterType? registerType;

  RegisterWidget({Key? key, this.registerType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterWidgetController(
      registerType: registerType ?? RegisterType.member,
    ));

    final state = controller.state;
    return Obx(() {
      return ThemeScaffold(
        appBar: AppBar(
          leadingWidth: 89.r,
          leading: GestureDetector(
            onTap: () {
              // Scaffold.of(context)
              //     .openDrawer();
            },
            child: Container(
              margin: EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: AppTheme.primary,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  '首页',
                  style:
                      TextStyle(color: stringToColor('80F8F1F1'), fontSize: 14),
                ),
              ),
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left: 25.r),
            child: Image(
              width: AppTheme.logoWidth,
              height: AppTheme.logoHeight,
              image: AssetImage(
                'assets/images/home/${AppTheme.siteTag}_logo.png',
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: Color(0x80F8F1F1),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: TextButton(
                onPressed: () {
                  Get.offAndToNamed(Routes.login);
                },
                child: Text(
                  '登录',
                  style: TextStyle(color: AppTheme.primary, fontSize: 14),
                ),
              ),
            )
          ],
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: FormBuilder(
                key: state.regFormKey,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 160,
                        width: ScreenUtil().screenWidth,
                        child: Stack(
                          children: [
                            Image(
                              height: 120,
                              width: ScreenUtil().screenWidth,
                              fit: BoxFit.fill,
                              image: const AssetImage(
                                'assets/images/register/register_banner.png',
                              ),
                            ),
                            Positioned(
                              top: 100,
                              width: ScreenUtil().screenWidth,
                              child: HomeNoticeWidget(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.r,
                      ),
                      ...controller.formFields.map((e) {
                        if (e.fieldType == FieldType.select) {
                          return Stack(
                            children: [
                              ThemeTextInputNew(
                                label: e.label.tr,
                                hintText: e.remarks.tr,
                                name: e.key,
                                isDark: false,
                                isRequired: e.required,
                                isReadOnly: true,
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey,
                                ),
                              ),
                              Positioned(
                                left: 85,
                                top: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    _onClickItem(
                                        context,
                                        e.key == 'bankname'
                                            ? controller.state.bankList
                                            : controller.state.questionList,
                                        e,
                                        e.label.tr);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: Get.width,
                                    color: Colors.transparent,
                                  ),
                                ),
                              )
                            ],
                          );
                          return Stack(
                            children: [
                              ThemeTextInput(
                                label: e.label.tr,
                                hintText: e.remarks.tr,
                                name: e.key,
                                isRequired: e.required,
                                isReadOnly: true,
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromRGBO(246, 204, 150, 1),
                                ),
                              ),
                              Positioned(
                                left: 85,
                                top: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    _onClickItem(
                                        context,
                                        e.key == 'bankname'
                                            ? controller.state.bankList
                                            : controller.state.questionList,
                                        e,
                                        e.label.tr);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: Get.width,
                                    color: Colors.transparent,
                                  ),
                                ),
                              )
                            ],
                          );
                        }

                        if (e.fieldType == FieldType.checkbox) {
                          return _agreement(controller);
                        }
                        return ObxValue<RxInt>(
                          (strength) {
                            final val = strength.value;
                            return ValueBuilder<bool?>(
                              initialValue: false,
                              builder: (value, updateFn) {
                                if (e.fieldType == FieldType.password) {
                                  printInfo(info: "e.key  ${e.key}");
                                  if (e.key == "repassword") {
                                    e.label = "确认密码";
                                  }
                                  return ObxValue<RxBool>((pv) {
                                    final passwordVis = pv.value;
                                    return ValueBuilder<bool?>(
                                        initialValue: false,
                                        builder: (value, updateFn) {
                                          return Column(
                                            children: [
                                              ThemeTextInputNew(
                                                  name: e.key,
                                                  label: e.label.tr,
                                                  isRequired: e.required,
                                                  hintText: e.remarks.tr,
                                                  suffixIcon: GestureDetector(
                                                    onTap: () {
                                                      pv.value = !pv.value;
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5),
                                                      child: Icon(
                                                        pv.value == true
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off,
                                                        size: 16.sp,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (controller
                                                                .state
                                                                .regFormKey
                                                                .currentState
                                                                ?.instantValue[
                                                            "user_name"] ==
                                                        value) {
                                                      return "password.hint.new.not.equal_account"
                                                          .tr;
                                                    }
                                                    String? validateResult =
                                                        FormBuilderValidators.match(
                                                                r"(?!^\d+$)(?!^[A-Za-z]+$)(?!^[^A-Za-z0-9]+$)(?!^.*[\u4E00-\u9FA5].*$)^\S{6,20}$",
                                                                errorText:
                                                                    'password.hint.new.different_type'
                                                                        .tr)
                                                            .call(value);
                                                    if (validateResult
                                                            ?.isNotEmpty ==
                                                        true) {
                                                      return validateResult;
                                                    }
                                                    return e.validator
                                                        .call(value);
                                                  },
                                                  obscureText: e.fieldType ==
                                                          FieldType.password &&
                                                      passwordVis == false,
                                                  isDark: false,
                                                  onChange: (value) {
                                                    controller
                                                        .showPasswordconditionsub(
                                                            value ?? '');
                                                    strength.value =
                                                        passwordStrengthChecker(
                                                            value ?? '');
                                                  },
                                                  onFocusChanged: (focusIn) {
                                                    updateFn(focusIn);
                                                    value = focusIn;
                                                  }),
                                              Visibility(
                                                visible: value == true &&
                                                    e.key != "repassword",
                                                child: getPasswordWidget(val),
                                              ),
                                            ],
                                          );
                                        });
                                  }, false.obs);
                                } else {
                                  return ThemeTextInputNew(
                                    name: e.key,
                                    label: e.label.tr,
                                    isRequired: e.required,
                                    hintText: e.remarks.tr,
                                    validator: (value) {
                                      return e.validator.call(value);
                                    },
                                    obscureText:
                                        e.fieldType == FieldType.password,
                                    isDark: false,
                                    onChange: (value) => strength.value =
                                        passwordStrengthChecker(value ?? ''),
                                  );
                                }
                              },
                            );
                          },
                          0.obs,
                        );
                      }).toList(),
                      // _agreement(controller),
                      _registButton(),
                      SizedBox(
                        height: 10.r,
                      ),
                      // _agentWidget(),
                      // SizedBox(
                      //   height: 50.r,
                      // )
                    ],
                  ),
                )),
          ),
        ),
      );
    });
  }

  Column getPasswordWidget(int val) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 22),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/images/register/red_warning.svg',
                      fit: BoxFit.fill,
                      width: 12.r,
                      height: 12.r,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "password.lengthLimit".tr,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/images/register/red_warning.svg',
                      fit: BoxFit.fill,
                      width: 12.r,
                      height: 12.r,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "password.hint.new.different_type".tr,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/images/register/red_warning.svg',
                      fit: BoxFit.fill,
                      width: 12.r,
                      height: 12.r,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "password.hint.new.not.equal_account".tr,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ]),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: PasswordStrengthIndicator(
            strengthLevel: val,
          ),
        ),
      ],
    );
  }

  void _onClickItem(
      BuildContext context, var data, RegisterFormField formfield, String title,
      {String? label}) {
    Pickers.showSinglePicker(
      context,
      data: data,
      title: title,
      pickerStyle: RaisedPickerStyle(color: AppTheme.primary),
      suffix: label,
      onConfirm: (p, position) {
        RegisterWidgetController.to.onSelectClose(p, formfield);
      },
    );
  }

  //协议相关
  Widget _agreement(RegisterWidgetController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 24, right: 24),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        GestureDetector(
          onTap: () => {
            RegisterWidgetController.to.agreeSelect.value =
                !RegisterWidgetController.to.agreeSelect.value
          },
          child: Obx(() {
            return RegisterWidgetController.to.agreeSelect == true
                ? SvgPicture.asset(
                    "assets/images/common/agreement_sel.svg",
                    color: AppTheme.primary,
                  )
                : SvgPicture.asset("assets/images/common/agreement_unsel.svg");
          }),
        ),
        const Text(
          " 我已阅读并同意注册协议",
          style: TextStyle(),
        ),
        GestureDetector(
          onTap: () => {
            Get.dialog(ShowHtmlDialog(
              title: '用户协议',
              showContent: controller.state.agreement,
            ))
          },
          child: Text(
            " 注册协议 ",
            style: TextStyle(color: AppTheme.primary),
          ),
        )
      ]),
    );
  }

  Widget _registButton() {
    return Container(
      margin:  EdgeInsets.only(top: 30, left: 25.r, right: 25.r),
      height: 36.h,
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: TextButton(
        onPressed: () {
          RegisterWidgetController.to.handleSubmit();
        },
        child: const Text(
          '确认注册',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class PasswordStrengthIndicator extends StatelessWidget {
  final int strengthLevel;
  static Map<int, Color> colors = {
    1: Colors.red,
    2: Colors.orange,
    3: Colors.green,
  };
  static Map<int, String> strengthText = {
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: const Text(
              '密码强弱：',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ...List.filled(3, 0).mapIndexed((e, i) {
            final int index = i + 1;
            Color color = Colors.grey;
            if (index <= strengthLevel) {
              color = colors[strengthLevel]!;
            }
            return Container(
              margin: const EdgeInsets.only(left: 4),
              width: 30.r,
              height: 8.r,
              color: color,
            );
          }),
          Container(
            margin: const EdgeInsets.only(left: 6),
            child: Text(
              (strengthText[strengthLevel] ?? '').tr,
              style: TextStyle(
                color: colors[strengthLevel],
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
