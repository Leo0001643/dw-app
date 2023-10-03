import 'package:aone_common/common.dart';
import 'package:app04/tab/controllers/main_tabbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../../theme/color_schema.dart';
import '../controllers/home_page_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        leadingWidth: 45.r,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              MainTabbarController.to.scaffoldKey.currentState?.openDrawer();
            },
            child: Icon(
              Icons.menu,
              size: 25.w,
              color: Colors.white,
            )),
        title: Container(
          margin: EdgeInsets.only(left: 25.r),
          child:  Image(
            width: AppTheme.logoWidth,
            height: AppTheme.logoHeight,
            image: AssetImage(
              'assets/images/home/${AppTheme.siteTag}_logo.png',
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
          ),
        ),
        actions: authGuardValue<List<Widget> Function()>(
          regular: alreadyLoginWidget,
          visitor: alreadyLoginWidget,
        )(),
      ),
    );
  }

  List<Widget> alreadyLoginWidget() {
    return [
      Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
        child: GestureDetector(
          child: Icon(
            Icons.search,
            size: 35.r,
            color: Colors.white,
          ),
          onTap: () {
            Get.toNamed(Routes.gameSearch);
          },
        ),
      ),
    ];
  }

  List<Widget> loginWidget() {
    return [
      Container(
        margin: EdgeInsets.only(right: 12.r),
        height: 28.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/activity/balanceBG.png"),
              fit: BoxFit.contain,
            ),
            color: Colors.transparent),
        child: Row(
          children: [
            GestureDetector(
              child: Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GFAnimation(
                    turnsAnimation: HomePageController.to.animation,
                    controller: HomePageController.to.animationController,
                    type: GFAnimationType.rotateTransition,
                    alignment: Alignment.center,
                    child: Container(),
                  ),
                ],
              ),
              onTap: () {
                HomePageController.to.reloadMoney();
              },
            ),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              child: Container(),
              onTap: () {},
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> unloginWidget() {
    return [
      Center(
        child: SizedBox(
          width: 48.r,
          height: 23.r,
          child: GFButton(
            onPressed: () {
              HomePageController.to.loginClick();
            },
            child: const Text('登录', style: TextStyle(color: GFColors.WHITE)),
            color: GFColors.PRIMARY,
            shape: GFButtonShape.pills,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: Center(
          child: SizedBox(
            width: 48.r,
            height: 23.r,
            child: GFButton(
              onPressed: () {
                HomePageController.to.registerClick();
              },
              child: const Text('注册', style: TextStyle(color: GFColors.WHITE)),
              color: GFColors.PRIMARY,
              shape: GFButtonShape.pills,
            ),
          ),
        ),
      ),
    ];
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
