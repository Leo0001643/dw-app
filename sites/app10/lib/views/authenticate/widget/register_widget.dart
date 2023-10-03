import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/register/register_form_fields.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/theme/theme_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import '../../../widget/form/theme_new_text_input.dart';
import '../../activities/widgets/show_html_dialog.dart';
import '../controller/register_widget_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterWidget extends GetView<RegisterWidgetController> {
  final RegisterType? registerType;

  const RegisterWidget({Key? key, this.registerType}) : super(key: key);

  String? _iconSelectUser(String index) {
    printInfo(info: "select  index  ${index}");
    String? iconName = null;
    if (index == "bankname") {
      iconName = 'assets/images/login/icon_bank.png';
    } else if (index == "reg_wen") {
      iconName = 'assets/images/login/icon_security.png';
    }
    return iconName;
  }

  String _iconUser(int index) {
    String iconName = "ic_username.png";

    if (index == 5) {
      iconName = "icon_qq.png";
    } else if (index == 6) {
      iconName = "icon_weixin.png";
    } else if (index == 7) {
      iconName = "icon_skype.png";
    } else if (index == 8) {
      iconName = "icon_email.png";
    } else if (index == 9 || index == 10) {
      iconName = "icon_bank.png";
    } else if (index == 11) {
      iconName = "icon_security.png";
    } else if (index == 12 || index == 13) {
      iconName = "icon_tishi.png";
    } else if (index == 14) {
      iconName = "icon_qukuan.png";
    }
    if (index == 15) {
      iconName = "icon_qukuan.png";
    } else if (index == 16) {
      iconName = "icon_phone.png";
    }
    return "assets/images/login/$iconName";
  }

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
              Expanded(
                child: CupertinoScrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: controller.formFields.isEmpty
                          ? [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: context.height * 0.4),
                                child: Center(
                                  child: SizedBox(
                                    width: 40.r,
                                    height: 40.r,
                                    child: const CircularProgressIndicator(
                                      color: AppTheme.progressBgColor,
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          : [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: Column(
                                  children: [
                                    ...controller.formFields.mapIndexed(
                                      (e, childIndex) {
                                        if (e.config == 'reg_xieyi') {
                                          return const SizedBox.shrink();
                                        }
                                        var remarks = e.remarks.tr;
                                        //
                                        // print('iconicon:' + e.icon.toString());
                                        // print('labellabel:' + e.label.toString());
                                        // print('configconfig:' +
                                        //     e.config.toString());
                                        // print('remarksremarks:' +
                                        //     e.remarks.toString());

                                        if (e.key == "user_name") {
                                          remarks = "(会员账号)6-20位数字、字母";
                                        }
                                        if (e.key == "password") {
                                          remarks = "6-20个任意字母或数字组成";
                                        }

                                        if (e.fieldType == FieldType.select) {
                                          return ThemeNewTextInput(
                                            hintText: remarks,
                                            name: e.key,
                                            isRequired: e.required,
                                            styleType: 0,
                                            isReadOnly: true,
                                            icon: _iconSelectUser(e.key),
                                            suffixIcon: Icon(
                                              Icons.arrow_drop_down,
                                              color: AppTheme.primary,
                                            ),
                                            validator: e.validator,
                                            onClick: () {
                                              _onClickItem(
                                                  context,
                                                  e.key == 'bankname'
                                                      ? controller
                                                          .state.bankList
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
                                          return ObxValue((data) {
                                            return ThemeNewTextInput(
                                              name: e.key,
                                              isRequired: e.required,
                                              hintText: remarks,
                                              validator: e.validator,
                                              onChange: (v) => {
                                                data.value = [v ?? "", data[1]]
                                              },
                                              obscureText: data[1] == false,
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.w),
                                                child: Image.asset(
                                                  'assets/images/login/ic_password.png',
                                                  width: 18.w,
                                                  height: 18.w,
                                                ),
                                              ),
                                              suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    data.value = [
                                                      data[0],
                                                      data[1] == true
                                                          ? false
                                                          : true
                                                    ];
                                                  },
                                                  child: Image.asset(
                                                    data[1] == true
                                                        ? 'assets/images/login/open.png'
                                                        : 'assets/images/login/close.png',
                                                    width: 16,
                                                  )),
                                            );
                                          }, ["", false].obs);
                                        }

                                        if (e.fieldType == FieldType.checkbox) {
                                          // return _builfAgreement();
                                        }
                                        var suffixIconWidget =
                                            Container(width: 1);
                                        if (e.key == "reg_mobilecode") {
                                          ///强行修改为必填
                                          e.required = true;
                                          suffixIconWidget = Container(
                                            child: controller.time.value == 0
                                                ? GestureDetector(
                                                    onTap: () {
                                                      controller.runTimer();
                                                    },
                                                    child: const Text(
                                                      "获取验证码",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffC89D42),
                                                          fontSize: 14),
                                                    ),
                                                  )
                                                : Text(
                                                    "${controller.time.value}s后获取",
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xffC89D42),
                                                        fontSize: 14),
                                                  ),
                                          );
                                        }
                                        return ThemeNewTextInput(
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
                                          prefixIcon: Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            child: Image.asset(
                                              'assets/images/login/${e.icon}.png',
                                              width: 18.w,
                                              height: 18.w,
                                            ),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ],
                                ),
                              ),
                            ],
                    ),
                  ),
                ),
              ),
              _builfAgreement(),
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
    return Container(
        height: 56.w,
        width: Get.width,
        margin:
            EdgeInsets.only(top: 20.w, left: 16.w, right: 16.w, bottom: 30.w),
        decoration: BoxDecoration(
          color: const Color(0xffC89D42),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextButton(
          onPressed: () {
            if (RegisterWidgetController.to.agreeSelect == false) {
              SmartDialog.showToast('需要勾选已同意相关条款和隐私协议');
              return;
            }
            RegisterWidgetController.to.handleSubmit(needPragmaCallBack: () {
              SmartDialog.showToast('信息不全请完成填写资料后注册');
            });
          },
          child: Text(
            '立即注册',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.w,
            ),
          ),
        ));
  }

  _builfAgreement() {
    return Container(
      margin: EdgeInsets.only(top: 15.r, left: 20.r),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              RegisterWidgetController.to.agreeSelect.value =
                  !RegisterWidgetController.to.agreeSelect.value;
            },
            child: Obx(() {
              return RegisterWidgetController.to.agreeSelect.value == true
                  ? Icon(
                      Icons.check_circle,
                      color: const Color(0xffC89D42),
                      size: 18.w,
                    )
                  : Icon(
                      Icons.radio_button_unchecked,
                      color: const Color(0xffC89D42),
                      size: 18.w,
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
            child: const Text(
              "我已阅读并同意相关条款和隐私协议 ",
              style: TextStyle(color: AppTheme.normalTextColor),
            ),
          )
        ],
      ),
    );
  }

  Widget openEyesIcon() {
    return Image.asset(
      "assets/images/login/ice_on_ICON.png",
      width: 20.w,
      height: 20.w,
    );
  }

  Widget closeEyesIcon() {
    return Image.asset(
      "assets/images/login/ice_ICON.png",
      width: 20.w,
      height: 20.w,
    );
  }
}
