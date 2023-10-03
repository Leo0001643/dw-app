import 'package:aone_common/common.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/login_widget_controller.dart';
import 'login_text_input.dart';
 
class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginWidgetController());
    final state = LoginWidgetController.to.state;
    final formFields = LoginWidgetController.to.formFields;
    return FormBuilder(
        key: state.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // SizedBox(
            //   height: 20.w,
            // ),

            Container(
              padding:const EdgeInsets.only(top: 27.5, left: 16, bottom: 16,right: 16),
              decoration:const BoxDecoration(
                   image: DecorationImage(image: 
                     AssetImage('assets/images/login_and_register/login_content_bg.png'),fit: BoxFit.fill
                   )
              ),
              child:  Column(

                children: <Widget>[
                     
                        Obx(
              () => ThemeNewTextInput(
                name: controller.formFields.username,
                initialValue: state.initialState?[formFields.username],
                paddingVertical: 10.w,
                validator: controller.validators.username(),
                hintText: 'login.account.hinttext'.tr,
                cursorColor:AoneAppTheme.appTheme.primary,
                styleType: 1,
                prefixIcon: Image.asset(
                  'assets/images/login_and_register/account.png',
                ),
                suffixIcon: InkWell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Icon(
                      Icons.cancel_outlined,
                      size: 20.w,
                      color: controller.state.showdeleteIcon
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  ),
                  onTap: () {
                    controller.state.showdeleteIcon = false;
                    state
                        .loginFormKey.currentState!.fields[formFields.username]!
                        .didChange("");
                  },
                ),
                onChange: (text) {
                  controller.state.showdeleteIcon = true;
                  if (text.toString().isEmpty) {
                    controller.state.showdeleteIcon = false;
                  }
                },
              ),
            ),
            // const SizedBox(
            //   height: 16,
            // ),
            Obx(() {
              return ThemeNewTextInput(
                name: controller.formFields.password,
                onChange: (v) => {
                  // data.value = [v ?? "", data[1]]
                },
                paddingVertical: 10.w,
                obscureText:  controller.loginObscureTextState,
                initialValue:
                    state.initialState?[controller.formFields.password],
                validator: controller.validators.password(),
                hintText: 'login.password.hinttext'.tr,
                styleType: 1,
                prefixIcon: Image.asset(
                  'assets/images/login_and_register/password.png',
                  // width: 20.w,
                  // height: 20.w,
                ),
                suffixIcon: GestureDetector(
                    onTap: () {
                      controller.loginObscureTextState = !controller.loginObscureTextState;
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Image.asset(
                        controller.loginObscureTextState
                            ? 'assets/images/login_and_register/eye_close.png'
                            : 'assets/images/login_and_register/eye_open.png',
                  
                        width: 16,
                        // color: Colors.white,
                      ),
                    )),
              );
            }),
            Padding(
              padding: EdgeInsets.only(top: 15.w),
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
                                  Icons.check_circle_rounded,
                                  color: AoneAppTheme.appTheme.primary,
                                  size: 22.w,
                                )
                              : Icon(
                                  Icons.radio_button_unchecked,
                                  color:const Color(0xFFEAEAEA) ,
                                  size: 22.w,
                                );
                        }),
                        SizedBox(width: 5.w),
                        Text(
                          "记住密码",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AoneAppTheme.appTheme.greyColor,
                            fontSize: 14.w,
                          ),
                        ),
                      ],
                    ),
                  ),

                 GestureDetector(
                    onTap: () => {
                        Get.toNamed(Routes.forgetPwd, arguments: 1)                 
                    },
                    child:Text(
                          "忘记密码",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AoneAppTheme.appTheme.primary,
                            fontSize: 14.w,
                          ),
                        ),
                  ),
                ],
              ),
            ),
                ],
              ),
            ),
         
            GestureDetector(
              onTap: () => {controller.handleSubmit()},
              child: Container(
                height: 38.w,
                alignment: Alignment.center,
                margin:const EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6.w)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  '立即登录',
                  style: TextStyle(fontSize: 14.sp, color: AoneAppTheme.appTheme.primary),
                ),
              ),
            ),
            
          ],
        ));
  }
}
