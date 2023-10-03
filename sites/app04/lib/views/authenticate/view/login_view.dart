import 'package:aone_common/common.dart';
import 'package:app04/views/authenticate/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../tab/controllers/main_tabbar_controller.dart';
import '../../../theme/color_schema.dart';
import '../widget/login_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
    return GetBuilder<LoginController>(
        autoRemove: true,
        builder: (_) {
          return Scaffold(
              body: Stack(
            children: <Widget>[
              Builder(
                builder: (BuildContext ctx) {
                  return Stack(
                    children: [
                      Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(width: ScreenUtil().screenWidth,height: ScreenUtil().screenHeight,
                            decoration: BoxDecoration(
                              gradient:  AppTheme.primaryGradient,
                            ),
                          )),
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        actions: [
                          GestureDetector(
                            child:  SvgPicture.asset(
                              "assets/images/login/home_white.svg",
                              width: 20.w,
                              height: 20.w,
                            ),
                            onTap: (){
                              //首页
                              MainTabbarController.to.jumpToPage(0);
                              Get.back();
                            },
                          ),

                       const SizedBox(width: 10,)],
                      ),
                      Positioned(
                          left: 8.5,
                          right: 8.5,
                          bottom: 0,
                          top: 110,
                          child: _contentView()),
                    ],
                  );
                },
              ),
            ],
          ));
        });
  }

  Widget _contentView() {
    return ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(width: ScreenUtil().screenWidth,

              alignment: Alignment.topCenter,
              child:  Image.asset(
                'assets/images/home/${AppTheme.siteTag}_logo.png',
                fit: BoxFit.contain,
                width: AppTheme.logoWidth,
                height: AppTheme.logoHeight,
              ),
            ),
            Container(
              height: 10,
            ),
            LoginWidget(),
            Container(
              height: 20,
            )
          ],
        );
  }
}
