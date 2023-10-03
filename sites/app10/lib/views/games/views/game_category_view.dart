import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/views/games/controllers/game_category_controller.dart';
import 'package:app10/views/games/widgets/game_category_gridview_widget.dart';
import 'package:app10/views/games/widgets/game_category_listview_widget.dart';
import 'package:app10/views/games/widgets/game_category_title_widget.dart';
import 'package:app10/views/general/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../widgets/like_history_drawer_view.dart';

class GameCategoryView extends StatelessWidget {
  const GameCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteLogic());
    Get.put(GameCategoryController());
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: AppTheme.primaryOne,
      drawer: const LikeHistoryDrawerView(),
      endDrawerEnableOpenDragGesture: false,
      drawerEnableOpenDragGesture: false,
      endDrawer: const GFDrawer(
        child: DrawerWidget(),
      ),
      // key: controller.scaffoldKey,
      body: Builder(builder: (BuildContext context1) {
        final controller = GameCategoryController.to;
        return SafeArea(
            bottom: false,
            child: Column(
              children: [
                _topMenus(),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _leftMenuView(),
                      Obx(() => Expanded(
                            child: controller.isNormalListView.value ? const GameCategoryGridviewWidget() : const GameCategoryListviewWidget(),
                          )),
                    ],
                  ),
                ),
              ],
            ));
      }),
    );
  }

  _appBar(BuildContext context) {
    final controller = GameCategoryController.to;
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: SizedBox(
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 25.w,
            color: Colors.white,
          ),
        ),
      ),
      flexibleSpace: Container(
        color: AppTheme.primaryOne,
      ),
      title: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Get.toNamed(Routes.gameSearch);
        },
        child: Container(
          padding: EdgeInsets.only(left: 15.r, right: 15.r),
          alignment: Alignment.center,
          height: 30.r,
          width: double.infinity,
          child: Row(
            children: [
              Image.asset(
                'assets/images/game_init/search.png',
                width: 15,
              ),
              SizedBox(width: 10.r),
              Text(
                '游戏名称搜索',
                style: TextStyle(fontSize: 15.sp, color: const Color(0xFF464646)),
              )
            ],
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            controller.isNormalListView.value = !controller.isNormalListView.value;
          },
          child: Container(
            margin: EdgeInsets.only(left: 10.w),
            child: Obx(() => Image.asset(
                  controller.isNormalListView.value ? 'assets/images/home/menu.png' : 'assets/images/home/list_icon.png',
                  width: 20.w,
                  fit: BoxFit.fitWidth,
                )),
          ),
        ),
      ],
    );
  }

  _topMenus() {
    final ctrl = GameCategoryController.to;
    return Container(
      height: 50.r,
      alignment: Alignment.bottomCenter,
      color: AppTheme.primaryOne,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              child: Obx(() => ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: ctrl.state.gameSubClasses.length,
                  itemBuilder: (ctx, index) {
                    if (index > ctrl.state.gameSubClasses.length - 1) {
                      return Container();
                    }
                    GameSubClassItem item = ctrl.state.gameSubClasses[index];
                    return _menuBtn(item.name.toString(), index == 0 ? 0 : 8.w, index);
                  })),
            ),
          ),
        ],
      ),
    );
  }

  _leftMenuView() {
    final ctrl = GameCategoryController.to;

    return Container(
      width: 84.r,
      height: Get.height,
      alignment: Alignment.topCenter,
      child: ListView.builder(
        itemCount: ctrl.navconfigCategory.subChildren?.length,
        // itemCount: ctrl.state.providers.length,
        itemBuilder: (context, index) {
          return _leftMenuItem(index);
        },
      ),
    );
  }

  _leftMenuItem(int index) {
    return Obx(() {
      final ctrl = GameCategoryController.to;
      SubChildren? children = ctrl.navconfigCategory.subChildren?[index];
      bool isActive = ctrl.selectedMenuIndex == index;
      return GestureDetector(
          onTap: () {
            if (index == 0) {
              Get.toNamed(Routes.strongActivity);
              return;
            }
            ctrl.selectedMenuIndex = index;
            GameCategoryController.to.argsments = GameCategoryController.to.navconfigCategory.subChildren![index];
            GameCategoryController.to.refreshNewFactoryTotalData();

            // ctrl.state.activeSubClass = idx;
            // ctrl.onSelectSubClass(
            //     ctrl.state.gameSubClasses[idx], idx);
          },
          child: Container(
            height: 80.r,
            width: 90.r,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 5.r),
            decoration: BoxDecoration(
                color: isActive ? AppTheme.primaryOne : AppTheme.itemBgColor, border: Border(left: BorderSide(width: 2, color: isActive ? AppTheme.gameHighlightColor : Colors.transparent))),
            child: Text(
              children?.nameCn ?? '',
              // index.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isActive ? AppTheme.gameHighlightColor : AppTheme.gameTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          )

          // Obx(
          //   () {
          //     bool isActive = ctrl.selectedMenuIndex == index;
          //     return Container(
          //       height: 80.r,
          //       width: 90.r,
          //       alignment: Alignment.center,
          //       padding: EdgeInsets.symmetric(horizontal: 5.r),
          //       decoration: BoxDecoration(
          //           color: isActive ? AppTheme.primaryOne : AppTheme.itemBgColor,
          //           border: Border(
          //               left: BorderSide(
          //                   width: 2,
          //                   color: isActive
          //                       ? AppTheme.gameHighlightColor
          //                       : Colors.transparent))),
          //       child: Text(
          //         children?.nameCn ?? '',
          //         // index.toString(),
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           color: isActive
          //               ? AppTheme.gameHighlightColor
          //               : AppTheme.gameTextColor,
          //           fontSize: 14.sp,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     );
          //   },
          //

          );
      // );
    });
  }

  //bar栏及以下
  Widget _barView(BuildContext context) {
    var controller = GameCategoryController.to;
    printInfo(info: "   controller.isNormalListView.value  ${controller.isNormalListView.value}");
    return Container(
      color: AppTheme.primaryOne,
      child: Column(
        children: [
          Container(
            color: AppTheme.primaryOne,
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 12.r,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20.w,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const GameCategoryTitleWidget(),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          controller.barBtnClick(4);
                        },
                        child: Image.asset(
                          'assets/images/home/search.png',
                          height: 20.w,
                          fit: BoxFit.fitHeight,
                        )),
                    GestureDetector(
                      onTap: () {
                        controller.isNormalListView.value = !controller.isNormalListView.value;
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: Image.asset(
                          controller.isNormalListView.value ? 'assets/images/home/menu.png' : 'assets/images/home/list_icon.png',
                          height: 20.w,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.r,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 50.r,
            alignment: Alignment.bottomCenter,
            color: AppTheme.primaryOne,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.state.gameSubClasses.length,
                        itemBuilder: (ctx, index) {
                          return _menuBtn(controller.state.gameSubClasses[index].name.toString(), index == 0 ? 0 : 8.w, index);
                        }),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: controller.isNormalListView.value ? const GameCategoryGridviewWidget() : const GameCategoryListviewWidget(),
          ),
        ],
      ),
    );
  }

  //菜单按钮
  Widget _menuBtn(String title, double width, int idx) {
    var controller = GameCategoryController.to;
    return Obx(() {
      return GestureDetector(
        onTap: () {
          controller.state.activeSubClass = idx;
          controller.onSelectSubClass(controller.state.gameSubClasses[idx], idx);
          // FavoriteLogic.to.getFavoriteList();
        },
        child: Container(
          margin: EdgeInsets.only(left: width),
          width: 72.w,
          height: 28.w,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 10.w),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: controller.state.activeSubClass == idx
                ? Border(
                    bottom: BorderSide(
                      width: 2.w,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.w,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
