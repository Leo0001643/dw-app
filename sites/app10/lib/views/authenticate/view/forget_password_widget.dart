import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app_service.dart';
import '../../../widget/form/theme_text_input_for_register.dart';
import '../controller/forget_password_controller.dart';

class ForgetPasswordWidget extends GetView<ForgetPasswordController> {
  const ForgetPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(builder: (_) {
      return ThemeScaffold(
        appBar: AppBar(
          title: Text(
            '忘记密码',
            style: TextStyle(
              fontSize: 18.w,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: const Color(0xfff3f4f5),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.w),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildTextList(),
                buildDetText(),
                _buildFootButton(),
              ]),
        ),
      );
    });
  }

  buildTextList() {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Obx(() {
          return FormBuilder(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ThemeTextInputForRegister(
                  name: 'user_name',
                  label: '会员账号:'.tr,
                  labelColor: Colors.black,
                  hintText: 'input_sure_placehold'.tr,
                  isReadOnly: controller.step != 1,
                ),
                if (controller.step == 2) ...[
                  ThemeTextInputForRegister(
                    name: 'wen',
                    isReadOnly: true,
                    label: "${'security.question'.tr}:",
                  ),
                  ThemeTextInputForRegister(
                    name: 'reg_wen_d',
                    hintText: 'reg.hint.security.answer'.tr,
                    label: "${'security.question.answer'.tr}:",
                  ),
                  ThemeTextInputForRegister(
                    name: 'wen_t',
                    isReadOnly: true,
                    label: "${'security.question.hint'.tr}:",
                  ),
                ],
                if (controller.step == 3)
                  ThemeTextInputForRegister(
                    name: 'login_pass',
                    label: "${'password'.tr}:",
                  ),
              ],
            ),
          );
        }));
  }

  buildDetText() {
    return Container(
      margin: EdgeInsets.only(top: 20.w),
      child: RichText(
        text: TextSpan(
            text: '若忘记所有信息，请联系',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.w,
            ),
            children: [
              TextSpan(
                text: '在线客服',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.w,
                ),
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
      () {
        Timer? _debounce;

        return Container(
          margin: EdgeInsets.only(top: 35.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (controller.step != 1) ...[
                Expanded(
                  child: _flatTextButton(
                    controller.step == 1 ? '返回' : 'step.previous'.tr,
                    () => controller.stepHandler(false),
                  ),
                ),
                SizedBox(width: 76.w),
              ],
              Expanded(
                child: Visibility(
                  child: _flatTextButton(
                      controller.step == 3 ? 'submit'.tr : 'step.next'.tr, () {
                    if (_debounce?.isActive ?? false) _debounce?.cancel();
                    _debounce = Timer(const Duration(milliseconds: 1000), () {
                      controller.stepHandler(true);
                    });
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _flatTextButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.w,
        decoration: const BoxDecoration(
            color: Color(0xffC89D42),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.w,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
