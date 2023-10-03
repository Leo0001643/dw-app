import 'package:aone_common/common.dart';
import 'package:app04/views/user/user_center/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import '../../../theme/color_schema.dart';
import '../../../widget/form/theme_text_input.dart';
import '../controller/login_widget_controller.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginWidgetController());
    final state = LoginWidgetController.to.state;
    final formFields = LoginWidgetController.to.formFields;
    final _userService = UserService.to;
    return Obx(() {
      return FormBuilder(
          key: state.loginFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Column(
              children: [
                ThemeTextInput(
                  name: controller.formFields.username,
                  label: '用户名',
                  labelWidth: 50.w,
                  initialValue: state.initialState?[formFields.username],
                  // validator: controller.validators.username(),
                  hintText: '请输入用户名'.tr,
                  styleType: 1,
                  showBorder: false,
                ),
                ThemeTextInput(
                  name: controller.formFields.password,
                  label: '密码',
                  labelWidth: 50.w,
                  marginBottom: 10.w,
                  obscureText: controller.state.passwordInputVisible,
                  initialValue: state.initialState?[controller.formFields.password],
                  // validator: controller.validators.password(),
                  hintText: 'login.password.hinttext'.tr,
                  styleType: 1,
                  showBorder: false,
                  suffixIcon: IconButton(
                    icon: controller.state.passwordInputVisible ? closeEyesIcon() : openEyesIcon(),
                    onPressed: () {
                      controller.state.passwordInputVisible = !controller.state.passwordInputVisible;
                      print('眼睛状态 == ${controller.state.passwordInputVisible}');
                      controller.update();
                    },
                  ),
                  // obscureText: true,
                ),

                //登录按钮
                Container(
                    height: 36,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.transparent,
                    margin: const EdgeInsets.only(top: 23),
                    // alignment: Alignment.center,

                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: TextButton(
                      // onPressed: controller.loginAction,
                      onPressed: () {
                        controller.login();
                      },
                      child: const Text(
                        '登录',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    )),
                Container(
                    height: 36,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.transparent,
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r), color: Color(0xffE0E1E2)),
                    child: TextButton(
                      onPressed: () {
                        Get.offAndToNamed(Routes.userReg);
                      },
                      child: const Text(
                        '注册',
                        style: TextStyle(color: Color.fromRGBO(141, 141, 141, 1), fontSize: 14),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          UserService.to.trialMode();
                          Get.back();
                          UserController.to.juegeTrial();
                          SmartDialog.showToast('您已进入试玩模式');
                        },
                        child: const Text(
                          "免费试玩",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () =>
                      //   {
                      //     controller.toggleRemember(controller.state.rememberMe)
                      //   },
                      //   child: Row(
                      //     children: [
                      //       Obx(() {
                      //         return controller.state.rememberMe == true
                      //             ? Container(
                      //           child: SvgPicture.asset(
                      //             "assets/images/login/agreement_sel_green.svg",
                      //             fit: BoxFit.fill,
                      //             width: 15.h,
                      //             height: 15.h,),
                      //         )
                      //             : Container(
                      //           child: SvgPicture.asset(
                      //             "assets/images/login/agreement_unsel_black.svg",
                      //             fit: BoxFit.fill,
                      //             width: 15.h,
                      //             height: 15.h,
                      //           ),
                      //         );
                      //       }),
                      //       Container(
                      //         margin: EdgeInsets.only(left: 2, bottom: 2),
                      //         child: const Text(
                      //           "记住密码",
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(
                      //               color: Colors.white, fontSize: 13),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.forgetPwd, arguments: 1);
                        },
                        child: const Text(
                          "忘记密码？",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }

  Widget _item(String title, String hintText, {bool isNeed = false, bool isBtn = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: [
          if (isNeed)
            const TextSpan(
              text: '* ',
              style: TextStyle(color: Color.fromRGBO(255, 0, 0, 1), fontSize: 14, fontWeight: FontWeight.bold),
            ),
          TextSpan(
            text: title,
            style: const TextStyle(color: Color.fromRGBO(11, 33, 59, 1), fontSize: 14, fontWeight: FontWeight.bold),
          )
        ])),
        GestureDetector(
          // onTap: isBtn ? _didClickSelectedGender : null,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(border: Border.all(width: 1, color: const Color.fromRGBO(47, 115, 245, 0.2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: TextField(
                    decoration:
                        InputDecoration(contentPadding: const EdgeInsets.only(left: 10, top: 0, bottom: 10, right: 10), hintText: hintText, border: InputBorder.none, enabled: isBtn ? false : true),
                  ),
                )),
                if (isBtn)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Image.asset(
                      'assets/images/login/down_icon.png',
                    ),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget openEyesIcon() {
    return SvgPicture.asset(
      "assets/images/login/ice_off.svg",
      width: 15.w,
      height: 15.w,
    );
  }

  Widget closeEyesIcon() {
    return SvgPicture.asset(
      "assets/images/login/ice_on.svg",
      width: 15.w,
      height: 15.w,
    );
  }
}
