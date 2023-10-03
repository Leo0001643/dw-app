import 'package:aone_common/common.dart';
import 'package:app10/tab/controllers/main_tabbar_controller.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/widget/dialog/easy_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widget/dialog/easy_dialog.dart';
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
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/home/home_menu.png',
                width: 20,
                fit: BoxFit.fitWidth,
              ),
            )),
        title: Container(
            margin: EdgeInsets.only(left: 25.r, right: 25.r),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: GlobalService.to.state.siteItems.logoRect!,
                height: 40.r,
                width: 150.r,
                fit: BoxFit.fill,
              ),
            )),
        flexibleSpace: Container(decoration: const BoxDecoration(color: AppTheme.blackColor)),
        actions: authGuardValue<List<Widget> Function()>(
          regular: alreadyLoginWidget,
          visitor: unloginWidget,
        )(),
      ),
    );
  }

//    //    GlobalService globalService = GlobalService.to;

  List<Widget> alreadyLoginWidget() {
    return [
      GestureDetector(
        child: const Image(
          width: 22,
          fit: BoxFit.fitWidth,
          image: AssetImage(
            'assets/images/home/home_logout.png',
          ),
        ),
        onTap: () {
          Get.dialog(
            EasyDialog(
              title: '确认要退出登陆?',
              onConfirm: () {
                Get.back();
                HomePageController.to.logout();
              },
            ),
          );
        },
      ),
      SizedBox(
        width: 12.r,
      ),
    ];
  }

  List<Widget> unloginWidget() {
    return [
      Container(
        child: GestureDetector(
          child: const Image(
            width: 22,
            fit: BoxFit.fitWidth,
            image: AssetImage(
              'assets/images/home/home_login.png',
            ),
          ),
          onTap: () {
            HomePageController.to.loginClick();
          },
        ),
      ),
      SizedBox(
        width: 12.r,
      ),
    ];
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
