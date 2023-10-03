import 'package:aone_common/common.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';
import '../widget/login_widget.dart';
import '../widget/register_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        autoRemove: true,
        builder: (_) {
          return ThemeScaffold(
              backgroundColor: Colors.black,
              resizeToAvoidBottomInset: true,
              body: SafeArea(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/login/account_bg.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    _contentView(context),
                  ],
                ),
              ));
        });
  }

  Widget _contentView(BuildContext context) {
    return Obx(
      () => Align(
        alignment: Alignment.center,
        child: Container(
          constraints: BoxConstraints(minHeight: 0.6.sh, maxHeight: 0.8.sh),
          margin: EdgeInsets.only(left: 16.w, right: 16.w),

          ///下面这种约束，如果键盘弹出，会导致意外的布局错误
          // margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.r),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: const Color(0xffC8C8C8),
                      width: 1.w,
                    ),
                  )),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.changeItem(0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 54.w,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text(
                                  '登录',
                                  style: TextStyle(
                                    fontSize: 20.w,
                                    color: controller.isLogin.value
                                        ? const Color(0xffC89D42)
                                        : const Color(0xff666666),
                                  ),
                                ),
                              ),
                              if (controller.isLogin.value)
                                Positioned(
                                  bottom: 1.w,
                                  child: Container(
                                    width: 60.w,
                                    height: 3.w,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffC89D42),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.changeItem(1),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 54.w,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text(
                                  '注册',
                                  style: TextStyle(
                                    fontSize: 20.w,
                                    color: !controller.isLogin.value
                                        ? const Color(0xffC89D42)
                                        : const Color(0xff666666),
                                  ),
                                ),
                              ),
                              if (!controller.isLogin.value)
                                Positioned(
                                  bottom: 1.w,
                                  child: Container(
                                    width: 60.w,
                                    height: 3.w,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffC89D42),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  // height: 400.r,
                  constraints: BoxConstraints(maxHeight: 450.r),
                  child: controller.isLogin.value
                      ? const LoginWidget()
                      : const RegisterWidget(
                          registerType: RegisterType.member,
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
