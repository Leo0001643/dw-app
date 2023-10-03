import 'package:app10/tab/controllers/main_tabbar_controller.dart';
import 'package:app10/theme/background_wrapper.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/theme/custom_theme.dart';
import 'package:app10/utils/will_pop_guard.dart';
import 'package:app10/views/general/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class MainTabBarView extends GetView<MainTabbarController> {
  const MainTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainTabbarController());
    return WillPopGuard(
        child: BackgroundWrapper(
            child: Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: SizedBox(
        width: Get.width / 2,
        child: const GFDrawer(
          child: DrawerWidget(),
        ),
      ),
      key: controller.scaffoldKey,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: controller.bodyList,
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppTheme.primaryOne,
        ),
        child: Obx(
          () => Theme(
            data: CustomTheme.lightTheme.copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: SizedBox(
              height: kBottomNavigationBarHeight +
                  context.mediaQueryViewPadding.bottom,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _tabBarItem('home', 0),
                  _tabBarItem('huodong', 1),
                  _tabBarItem('chongzhi', 2),
                  _tabBarItem('kefu', 3),
                  _tabBarItem('mine', 4),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    )));
  }

  Widget _tabBarItem(String imgPath, int index) {
    bool active = false;
    active = controller.selectIndex == index;
    var img = active ? '${imgPath}_select' : imgPath;
    var size = active ? 36 : 36;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          controller.jumpToPage(index);
          printInfo(info: "----->");
        },
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 375),
                width: size.r,
                height: size.r,
                child: Image.asset(
                  'assets/images/tabbar/$img.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
