import 'package:aone_common/common.dart';
import 'package:app04/views/user/user_center/controller/user_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import '../../../app_service.dart';
import '../../../theme/color_schema.dart';
import '../../../widget/form/theme_text_input.dart';
import '../../../widget/form/theme_text_input_for_register.dart';
import '../controller/forget_password_controller.dart';
import '../controller/login_widget_controller.dart';

class ForgetVipWidget extends StatelessWidget {
  ForgetPasswordController controller;

  ForgetVipWidget(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTextList(),
          buildDetText(),
          _buildFootButton(),
        ]);
  }

  buildTextList() {
    return Container(
        decoration: BoxDecoration(
            // color: stringToColor('f2f5f8'),
            borderRadius: BorderRadius.circular(10)),
        child: Obx(() {
          return FormBuilder(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ThemeTextInputForRegister(
                  name: 'user_name',
                  label: '会员账号：'.tr,
                  labelColor: Colors.black,
                  labelWidth: 90,
                  hintText: 'input_sure_placehold'.tr,
                  isReadOnly: controller.step != 1,
                  marginBottom: 0.0,
                  // validator: FormBuilderValidators.required(
                  //     errorText: 'username.required'.tr),
                  // isDark: false,
                ),
                if (controller.step == 2) ...[
                  ThemeTextInputForRegister(
                    name: 'wen',
                    marginBottom: 0.0,

                    // isDark: false,
                    isReadOnly: true,
                    label: 'security.question'.tr,
                  ),
                  ThemeTextInputForRegister(
                    name: 'reg_wen_d',
                    marginBottom: 0.0,

                    // isDark: false,
                    hintText: 'reg.hint.security.answer'.tr,
                    // validator: FormBuilderValidators.required(
                    //   errorText: 'security.question.answer'.tr + 'mustFill'.tr,
                    // ),
                    label: 'security.question.answer'.tr,
                  ),
                  ThemeTextInputForRegister(
                    name: 'wen_t',
                    marginBottom: 0.0,
                    isReadOnly: true,
                    label: 'security.question.hint'.tr,
                  ),
                ],
                if (controller.step == 3)
                  ThemeTextInputForRegister(
                    name: 'login_pass',
                    // isDark: false,
                    label: 'password'.tr,
                    // validator: FormBuilderValidators.required(
                    //   errorText: 'password.required'.tr,
                    // ),
                  ),
              ],
            ),
          );
        }));
  }

  buildDetText() {
    return Container(
      margin: EdgeInsets.only(top: 10.r),
      child: RichText(
        text: TextSpan(
            text: '若忘记所有信息，请联系',
            style: TextStyle(color: Colors.grey, fontSize: 13),
            children: [
              TextSpan(
                text: '在线客服',
                style: TextStyle(color: Colors.red, fontSize: 13),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    AppService.to.toCustomerService();
                  },
              )
            ]),
      ),
    );
  }

  _buildFootButton() {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (controller.step != 1)
              SizedBox(
                width: 150.r,
                child: Visibility(
                  // visible: controller.step != 1,
                  child: _flatTextButton(
                    controller.step == 1 ? '返回' : 'step.previous'.tr,
                    () => controller.stepHandler(false),
                  ),
                ),
              ),
            SizedBox(
              width: controller.step == 1
                  ? ScreenUtil().screenWidth - 24.r
                  : 150.r,
              child: Visibility(
                child: _flatTextButton(
                  controller.step == 3 ? 'submit'.tr : 'step.next'.tr,
                  () => controller.stepHandler(true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _flatTextButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36.r,
        decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
      ),
    );
  }
}
