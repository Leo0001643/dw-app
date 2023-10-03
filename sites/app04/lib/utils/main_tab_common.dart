import 'package:aone_common/data/model/enum/auth_level.dart';
import 'package:aone_common/router/routes.dart';
import 'package:aone_common/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../tab/controllers/main_tabbar_controller.dart';
import '../theme/color_schema.dart';
import '../theme/custom_theme.dart';

///底部tab start
Widget getBottomNavigationBar(BuildContext context){
  return DecoratedBox(
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: AppTheme.neutral.withAlpha(40),
        blurRadius: 10,
        // spreadRadius: 20x
      ),
    ]),
    child: Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppTheme.onBottomNavigationBar,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: context.mediaQueryViewPadding.bottom,
      ),
      child: Obx(
            () => Theme(
          data: CustomTheme.lightTheme.copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: SizedBox(
            height: kBottomNavigationBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _tabBarItem('home', '首页', 0),
                _tabBarItem('activity', '优惠', 1),
                _tabBarItem('activity', '充值', 2),
                _tabBarItem('service', '客服', 3),
                // _tabBarItem('mine', '我的', 4)
                UserService.to.state.authLevel == AuthLevel.regular ||
                    UserService.to.state.authLevel == AuthLevel.trial
                    ? _tabBarItem('mine', '我的', 4)
                    : _tabBarItem('mine', '登录', 4),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
Widget _tabBarItem(String imgPath, String title, int index) {
  return Expanded(
    child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (index != 3) {
          Get.until((route) =>
          (route as GetPageRoute).settings.name == Routes.main);
        }
        MainTabbarController.to.jumpToPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          index == 2
              ? Container(
            height: 21.w,
            width: 14.w,
          )
              : AnimatedContainer(
            duration: const Duration(milliseconds: 375),
            width: 18.r,
            height: 18.r,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/tabbar/$imgPath.png',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.5.r),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF757575),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
Widget getFloatingButton() {
  //使用GestureDetector包裹按钮，达到点击响应效果
  return GestureDetector(
      onTap: () {
        if (UserService.to.state.isTrial) {
          SmartDialog.showToast('请登录正式账号');
          return;
        }
        Get.until((route) => (route as GetPageRoute).settings.name == Routes.main);
        MainTabbarController.to.jumpToPage(2);
      },
      //将中间黑色大按钮形状改变
      child: SizedBox(
          width: 90,
          height: 90,
          child: Image.asset(
            'assets/images/home/${AppTheme.siteTag}_zhuanzhang.png',
            width: 80,
            height: 80,
          )));
}
///底部tab end