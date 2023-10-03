import 'package:aone_common/common.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
 import '../controllers/login_controller.dart';
 import '../widgets/login_widget.dart';
// import '../widgets/register_widget.dart';
import '../widgets/regist/register_new_widget.dart';
 
class AoneLoginView extends GetView<LoginController> {
  const AoneLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'assets/images/${AppEnv.config.siteTag}/login_and_register/login_background.png',
              width: Get.width,
              fit: BoxFit.fill,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 60.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    Container(
                      height: kToolbarHeight,
                      padding:const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Color(0xFFBBBBBB),
                          )),
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Image.asset(
                      'assets/images/${AppEnv.config.siteTag}/login_and_register/login_logo.png',
                      width: 193.w,
                      height: 42.w,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 35.w,
                    ),
                    _contentView(context),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10.h,
              left: 0,
              right: 0,
              height: 50.h,
              child: Container(
                // color: Colors.blue,
                margin: EdgeInsets.symmetric(horizontal: 75.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child:
                      Row(children: [
                        Image.asset(
                                    'assets/images/login_and_register/look_around.png',
                                    width: 18,
                                    height: 18,
                                  ),
                        const SizedBox(width: 6,),
                        Text(
                        "随便逛逛",
                        style: TextStyle(color: Colors.white, fontSize: 14.w),
                      ),
                      ],)
                      
                    ),
                    Container(
                      width: 1,
                      height: 35,
                      decoration:const  BoxDecoration(
                        color: Colors.white,

                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        UserService.to.trialMode();
                        Get.back();
                        SmartDialog.showToast('您已进入试玩模式');
                      },
                      child:
                      Row(children: [
                        Image.asset(
                                    'assets/images/login_and_register/free_trial.png',
                                    width: 18,
                                    height: 18,
                                  ),
                        const SizedBox(width: 6,),
                        Text(
                        "免费试玩",
                        style: TextStyle(color: Colors.white, fontSize: 14.w),
                      ),
                      ],)
                       
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.toNamed(Routes.forgetPwd, arguments: 1);
                    //   },
                    //   child: Text(
                    //     "忘记密码？",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 14.w,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _contentView(BuildContext context) {
    return Obx(
      () => Align(
        alignment: Alignment.bottomRight,
        child: Container(
         margin: EdgeInsets.symmetric(horizontal: 24.w),
         padding:
              EdgeInsets.only(top: 10.w, bottom: 10.w, ),
          constraints: BoxConstraints(minHeight: 0.3.sh),
          decoration: BoxDecoration(
            // color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.all(Radius.circular(7.w)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40.w,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.changeItem(0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 40.w,
                              alignment: Alignment.center,
                             
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Text(
                                '会员登录',
                                style: TextStyle(
                                  fontSize: 16.sp, color:controller.isLogin.value ? AoneAppTheme.appTheme.primary :AoneAppTheme.appTheme.greyColor),
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
                              height: 40.w,
                              alignment: Alignment.center,
                              
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Text(
                                '注册账号',
                                style: TextStyle(
                                    fontSize: 16.sp,  color:controller.isLogin.value ? AoneAppTheme.appTheme.greyColor :AoneAppTheme.appTheme.primary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              controller.isLogin.value
                  ? const LoginWidget()
                  // ? const TLoginView()
                  : const RegisterWidget(
                      registerType: RegisterType.member,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
