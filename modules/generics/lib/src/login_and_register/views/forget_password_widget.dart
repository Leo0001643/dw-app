import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:aone_common/theme/theme_scaffold.dart';
  import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

 import '../controllers/forget_password_controller.dart';
import '../widgets/forget_text_input.dart';

class AoneForgetPasswordWidget extends GetView<ForgetPasswordController> {
  const AoneForgetPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(builder: (_) {
      return ThemeScaffold(
        appBar: AppBar(
          // backgroundColor:AoneAppTheme.appTheme.primary,
          title: Text(
            '忘记密码',
            style: TextStyle(
              fontSize: 18.w,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              )),
        ),
        backgroundColor: Colors.white,
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
                _getTitle('会员账号:'.tr),
                ThemeTextInputForgetRegister(
                  name: 'user_name',
                  labelColor: Colors.black,
                  hintText: 'input_sure_placehold'.tr,
                  isReadOnly: controller.step != 1,
                ),
                if (controller.step == 2) ...[
                  _getTitle("${'security.question'.tr}:"),
                  const ThemeTextInputForgetRegister(
                    name: 'wen',
                    isReadOnly: true,
                  ),
                  _getTitle("${'security.question.answer'.tr}:"),
                  ThemeTextInputForgetRegister(
                    name: 'reg_wen_d',
                    hintText: 'reg.hint.security.answer'.tr,
                  ),
                  _getTitle("${'security.question.hint'.tr}:"),
                  const ThemeTextInputForgetRegister(
                    name: 'wen_t',
                    isReadOnly: true,
                  ),
                ],
                if (controller.step == 3) _getTitle("${'password'.tr}:"),
                if (controller.step == 3)
                  const ThemeTextInputForgetRegister(
                    name: 'login_pass',
                  ),
              ],
            ),
          );
        }));
  }

  Widget _getTitle(String data) {
    return Container(
      margin: EdgeInsets.only(bottom: 9.r),
      child: Text(
        data,
        style: TextStyle(color: Colors.black, fontSize: 14.sp),
      ),
    );
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
                    // AppService.to.toCustomerService();
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
              // if (controller.step != 1) ...[
              //   Expanded(
              //     child: _flatTextButton(
              //       controller.step == 1 ? '返回' : 'step.previous'.tr,
              //       () => controller.stepHandler(false),
              //     ),
              //   ),
              //   SizedBox(width: 76.w),
              // ],
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
        margin: EdgeInsets.symmetric(horizontal: 57.r),
        decoration: BoxDecoration(
            gradient: AoneAppTheme.appTheme.fsAppbarGradient,
            borderRadius: BorderRadius.all(Radius.circular(100.r))),
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
