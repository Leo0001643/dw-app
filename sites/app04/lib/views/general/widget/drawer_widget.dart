import 'package:aone_common/common.dart';
import 'package:app04/tab/controllers/main_tabbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';

import '../../../theme/color_schema.dart';
import '../controllers/home_page_controller.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
      ),
      padding: EdgeInsets.only(left: 14.r, top: 10.r),
      child: Column(
        children: [
          drawerItem(context, '会员中心', 'assets/images/user/drawer_item1.png', 0),
          drawerItem(context, '代理注册', 'assets/images/user/drawer_item1.png', 1),
          drawerItem(context, '代理登录', 'assets/images/user/drawer_item1.png', 2),
          drawerItem(context, '大转盘', 'assets/images/user/drawer_item0.png', 3),
          drawerItem(context, '抢红包', 'assets/images/user/drawer_item2.png', 4),
          drawerItem(context, '在线客服', 'assets/images/user/drawer_item4.png', 6),
          drawerItem(context, '版本升级', 'assets/images/user/drawer_item5.png', 7),
        ],
      ),
    );
  }

  Widget loginoutWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: const Color.fromRGBO(255, 57, 57, 1),
        ),
        margin: EdgeInsets.only(top: 48.w, right: 10.w),
        padding: EdgeInsets.only(
            left: 15.5.w, top: 14.5.w, bottom: 14.5.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget drawerItem(
      BuildContext context, String title, String icon_str, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        MainTabbarController.to.contentListClick(index);
      },
      child: Container(
        margin: EdgeInsets.only(top: 12.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              width: 18.r,
              height: 18.r,
              image: AssetImage(
                icon_str,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18.sp, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
