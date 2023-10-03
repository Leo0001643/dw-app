import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/register/register_form_fields.dart';
import 'package:aone_widget/picker/pickers.dart';
import 'package:aone_widget/picker/style/default_style.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:app10/views/authenticate/controller/join_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../theme/color_schema.dart';
import '../../../widget/form/theme_text_input.dart';
import '../../../widget/form/theme_text_input_for_register.dart';
import '../../activities/widgets/show_html_dialog.dart';

class JoinUsView extends GetView<JoinUsController> {
  const JoinUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JoinUsController>(builder: (_) {
      return ThemeScaffold(
        appBar: AppBar(
          title: Text(
            '代理加盟',
            style: TextStyle(
              fontSize: 18.w,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff0c0c0c),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 28.w),
                child: Obx(() {
                  return FormBuilder(
                    key: controller.state.regFormKey,
                    child: Column(
                      children: <Widget>[
                        ...controller.formFields.map(
                          (e) {
                            var remarks = e.remarks.tr;
                            if (e.key == "password") {
                              remarks = "6-20个任意字母或数字组成";
                            }
                            if (e.fieldType == FieldType.select) {
                              return ThemeTextInputForRegister(
                                label: e.label.tr,
                                labelColor: Colors.white,
                                hintText: remarks,
                                name: e.key,
                                isRequired: e.required,
                                isReadOnly: true,
                                cursorColor: Colors.white,
                                fillColor: const Color(0xff151515),
                                valueColor: Colors.white,
                                borderColor: const Color(0xff404040),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      _onClickItem(
                                          context,
                                          e.key == 'bankname'
                                              ? controller.state.bankList
                                              : controller.state.questionList,
                                          e);
                                    },
                                    child: const Icon(
                                      Icons.arrow_drop_down,
                                      color: AppTheme.dateSelectorBorderColor,
                                      size: 30,
                                    )),
                              );
                            }

                            if (e.fieldType == FieldType.checkbox) {
                              return _builfAgreement();
                            }
                            return ObxValue<RxInt>((strength) {
                              final val = strength.value;
                              return ValueBuilder<bool?>(
                                  initialValue: false,
                                  builder: (value, updateFen) {
                                    var suffixIconWidget = Container(width: 1);
                                    if (e.key == "reg_mobilecode") {
                                      suffixIconWidget = Container(
                                        width: 80.r,
                                        alignment: Alignment.centerRight,
                                        padding: EdgeInsets.only(right: 10.r),
                                        child: controller.time.value == 0
                                            ? GestureDetector(
                                                onTap: () {
                                                  controller.runTimer();
                                                },
                                                child: const Text(
                                                  "获取验证码",
                                                  style: TextStyle(
                                                      color: Color(0xffC89D42),
                                                      fontSize: 13),
                                                ),
                                              )
                                            : Text(
                                                "${controller.time.value}s后获取",
                                                style: const TextStyle(
                                                    color: Color(0xffC89D42),
                                                    fontSize: 14),
                                              ),
                                      );
                                    }

                                    return ThemeTextInputForRegister(
                                        name: e.key,
                                        label: e.key == 'password'
                                            ? '代理密码'
                                            : e.label.tr,
                                        labelColor: Colors.white,
                                        isRequired: e.required,
                                        cursorColor: Colors.white,
                                        hintText: remarks,
                                        fillColor: const Color(0xff151515),
                                        valueColor: Colors.white,
                                        suffixIcon: suffixIconWidget,
                                        borderColor: const Color(0xff404040),
                                        // onFocusChanged: (focusIn) {
                                        //   updateFen(focusIn);
                                        //   value = focusIn;
                                        // },
                                        onChange: (value) {
                                          if (e.key == "rega_phone") {
                                            if (value != null) {
                                              controller.phone.value = value;
                                            } else {
                                              controller.phone.value = "";
                                            }
                                          }

                                          strength.value =
                                              passwordStrengthChecker(
                                                  value ?? '');
                                        }

                                        // inputTips: Visibility(
                                        //   visible: value == true,
                                        //   child: Padding(
                                        //     padding: EdgeInsets.only(
                                        //         left: 25, bottom: 10),
                                        //     child: e.key == 'password'
                                        //         ? getPasswordWidget(val)
                                        //         : Row(
                                        //             children: [
                                        //               SvgPicture.asset(
                                        //                 "assets/images/common/common_waring.svg",
                                        //                 width: 15.h,
                                        //                 height: 15.h,
                                        //               ),
                                        //               SizedBox(
                                        //                 width: 5,
                                        //               ),
                                        //               Text(
                                        //                 e.remarks.tr,
                                        //                 style: TextStyle(
                                        //                     color: Colors.red,
                                        //                     fontSize: 12),
                                        //               )
                                        //             ],
                                        //           ),
                                        //   ),
                                        // ),
                                        );
                                  });
                            }, 0.obs);
                          },
                        ).toList(),
                        // _builfAgreement(),
                      ],
                    ),
                  );
                }),
              ),
            ),
            _buildButtonView(),
          ],
        ),
      );
    });
  }

  void _onClickItem(BuildContext context, var data, RegisterFormField formfield,
      {String? label}) {
    Pickers.showSinglePicker(
      context,
      data: data,
      pickerStyle: DefaultPickerStyle(),
      suffix: label,
      onConfirm: (p, position) {
        JoinUsController.to.onSelectClose(p, formfield);
      },
    );
  }

  _item(String title, String placeholder, String key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: stringToColor('0b213b'),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        Container(
          height: 40,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/user/join_ustext_ground.png'),
                  fit: BoxFit.fill)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: 10, top: 0, bottom: 10, right: 10),
                  hintText: placeholder,
                  border: InputBorder.none,
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }

  _builfAgreement() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              controller.clickAgreement();
            },
            child: controller.selAgreementState
                ? Icon(
                    Icons.check_circle,
                    color: const Color(0xffC89D42),
                    size: 18.w,
                  )
                : Icon(
                    Icons.radio_button_unchecked,
                    color: const Color(0xffC89D42),
                    size: 18.w,
                  ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () => {
              Get.dialog(ShowHtmlDialog(
                title: '用户协议',
                showContent: controller.state.agreement,
              ))
            },
            child: Text(
              "我已阅读并同意相关条款和隐私协议 ",
              style: TextStyle(color: AppTheme.mainTextColor),
            ),
          )
        ],
      ),
    );
  }

  _buildButtonView() {
    return Container(
        height: 48.w,
        margin:
            EdgeInsets.only(top: 30.w, left: 18.w, right: 18.w, bottom: 40.w),
        decoration: BoxDecoration(
          color: const Color(0xffC89D42),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: () {
            controller.handleSubmit();
          },
          child: Text(
            '提交申请',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.w,
            ),
          ),
        ));
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 26, right: 26),
      height: 36.h,
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: TextButton(
        onPressed: () {
          controller.handleSubmit();
        },
        child: const Text(
          '免费开户',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  //密码提示
  Column getPasswordWidget(int val) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              val > 0
                  ? 'assets/images/register/black_warning.svg'
                  : 'assets/images/register/red_warning.svg',
              fit: BoxFit.fill,
              width: 12.r,
              height: 12.r,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "password.lengthLimit".tr,
              style: TextStyle(
                  color: val > 0 ? Colors.black : Colors.red, fontSize: 12),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              val > 1
                  ? 'assets/images/register/black_warning.svg'
                  : 'assets/images/register/red_warning.svg',
              fit: BoxFit.fill,
              width: 12.r,
              height: 12.r,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "password.hint.new.different_type".tr,
              style: TextStyle(
                  color: val > 1 ? Colors.black : Colors.red, fontSize: 12),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              val > 2
                  ? 'assets/images/register/black_warning.svg'
                  : 'assets/images/register/red_warning.svg',
              fit: BoxFit.fill,
              width: 12.r,
              height: 12.r,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "password.hint.new.not.equal_account".tr,
              style: TextStyle(
                  color: val > 2 ? Colors.black : Colors.red, fontSize: 12),
            ),
          ],
        ),
        PasswordStrengthIndicator(
          strengthLevel: val,
        ),
      ],
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
            child: const Text(
              '密码强度：',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
          ...List.filled(3, 0).mapIndexed((e, i) {
            final int index = i + 1;
            Color color = Colors.red;
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
