import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          stringToColor('3F3F3F'),
          stringToColor('000000'),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      padding: EdgeInsets.only(left: 14.r, top: 10.r),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: Get.mediaQuery.padding.top),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(12.w),
              child: Image.asset(
                'assets/images/user/close.png',
                width: 16.w,
                height: 16.w,
              ),
            ),
          ),
          drawerItem(context, '回到首页', 'assets/images/user/drawer_item1.png', 0),
          drawerItem(
              context, 'USDT充值教程', 'assets/images/user/drawer_item2.png', 1),
          drawerItem(
              context, '优惠办理大厅', 'assets/images/user/drawer_item3.png', 2),
          drawerItem(context, '金管家', 'assets/images/user/drawer_item4.png', 3),
          drawerItem(context, '摇钱树', 'assets/images/user/drawer_item5.png', 4),
          drawerItem(context, '代理介绍', 'assets/images/user/drawer_item6.png', 5),
          drawerItem(context, '代理加盟', 'assets/images/user/drawer_item7.png', 6),
          drawerItem(context, '代理登录', 'assets/images/user/drawer_item8.png', 7),
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

        ///todo
        // MainTabbarController.to.contentListClick(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 42.w,
            padding: EdgeInsets.only(left: 20.w),
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
                  width: 10.w,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            height: 1.w,
            color: const Color(0XFF504D4D),
          )
        ],
      ),
    );
  }
}
