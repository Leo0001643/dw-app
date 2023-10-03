import 'package:aone_common/data/model/enum/auth_level.dart';
import 'package:aone_common/services/user/user_service.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:app04/tab/controllers/main_tabbar_controller.dart';
import 'package:app04/theme/background_wrapper.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/theme/custom_theme.dart';
import 'package:app04/utils/will_pop_guard.dart';
import 'package:app04/views/general/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class MainTabBarView extends GetView<MainTabbarController> {
  const MainTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('statusBarHeight == ${Get.statusBarHeight / 2}');
    print('mediaQueryViewPadding == ${context.mediaQueryViewPadding.top}');

    Get.put(MainTabbarController());
    return WillPopGuard(
        child: BackgroundWrapper(
            child: Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: Container(
        margin: EdgeInsets.only(
            top: context.mediaQueryViewPadding.top +
                kToolbarHeight),
        width: Get.width / 2,
        child: const GFDrawer(
          child: DrawerWidget(),
        ),
      ),
      key: controller.scaffoldKey,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: controller.bodyList,
        controller: controller.pageController,
      ),
      bottomNavigationBar: DecoratedBox(
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
                    _tabBarItem('activity', '活动', 1),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0.0,
        highlightElevation: 20.0,
        child: getFloatingButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    )));
  }

  ///设置底部居中大按钮
  Widget getFloatingButton() {
    //使用GestureDetector包裹按钮，达到点击响应效果
    return GestureDetector(
        onTap: () {
          if (UserService.to.state.isTrial) {
            SmartDialog.showToast('请登录正式账号');
            return;
          }
          controller.jumpToPage(2);
          print("圆形按钮被点击了");
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

  Widget _tabBarItem(String imgPath, String title, int index) {
    var active = controller.selectIndex == index;
    var img = active ? '${AppTheme.siteTag}_${imgPath}_select' : '${AppTheme.siteTag}_${imgPath}';
    var size = active ? 18 : 18;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          controller.jumpToPage(index);
          printInfo(info: "----->");
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
                    width: size.r,
                    height: size.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/tabbar/$img.png',
                        ),
                      ),
                    ),
                  ),
            active
                ? Padding(
                    padding: EdgeInsets.only(top: 2.5.r),
                    child: Text(
                      title,
                      style:  TextStyle(
                        fontSize: 12,
                        color: AppTheme.primary,
                      ),
                    ),
                  )
                : Padding(
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
}
