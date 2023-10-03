import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import '../../../widget/form/theme_new_text_input.dart';
import '../controller/login_widget_controller.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginWidgetController());
    final state = LoginWidgetController.to.state;
    final formFields = LoginWidgetController.to.formFields;
    return SingleChildScrollView(
        child: FormBuilder(
            key: state.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: ThemeNewTextInput(
                    name: controller.formFields.username,
                    initialValue: state.initialState?[formFields.username],
                    validator: controller.validators.username(),
                    hintText: 'login.account.hinttext'.tr,
                    styleType: 1,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Image.asset(
                        'assets/images/login/icon-user.png',
                        width: 18.w,
                        height: 18.w,
                      ),
                    ),
                  ),
                ),
                ObxValue((data) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: ThemeNewTextInput(
                      name: controller.formFields.password,
                      onChange: (v) => {
                        data.value = [v ?? "", data[1]]
                      },
                      obscureText: data[1] == false,
                      initialValue:
                          state.initialState?[controller.formFields.password],
                      validator: controller.validators.password(),
                      hintText: 'login.password.hinttext'.tr,
                      styleType: 1,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Image.asset(
                          'assets/images/login/icon-mima.png',
                          width: 18.w,
                          height: 18.w,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            data.value = [
                              data[0],
                              data[1] == true ? false : true
                            ];
                          },
                          child: Image.asset(
                            data[1] == true
                                ? 'assets/images/login/open.png'
                                : 'assets/images/login/close.png',
                            width: 16,
                          )),
                    ),
                  );
                }, ["", false].obs),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 17.5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => {
                          controller.toggleRemember(controller.state.rememberMe)
                        },
                        child: Row(
                          children: [
                            Obx(() {
                              return controller.state.rememberMe == true
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
                            SizedBox(width: 5.w),
                            Text(
                              "记住密码",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xff757575),
                                fontSize: 14.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.forgetPwd, arguments: 1);
                        },
                        child: Text(
                          "忘记密码？",
                          style: TextStyle(
                            color: const Color(0xff757575),
                            fontSize: 14.w,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 56.w,
                    margin: EdgeInsets.only(top: 18.w, left: 16.w, right: 16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xffC89D42),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: () {
                        controller.handleSubmit();
                      },
                      child: Text(
                        '立即登录',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.w,
                        ),
                      ),
                    )),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w)
                          .copyWith(bottom: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "先去逛逛",
                          style: TextStyle(
                              color: const Color(0xff715F33), fontSize: 14.w),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          UserService.to.trialMode();
                          Get.back();
                          // UserController.to.juegeTrial();
                          SmartDialog.showToast('您已进入试玩模式');
                        },
                        child: Text(
                          "免费试玩",
                          style: TextStyle(
                              color: const Color(0xff715F33), fontSize: 14.w),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
