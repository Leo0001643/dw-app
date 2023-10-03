import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../../../generated/game_assets.dart';
import '../../cashier/utils/dj_image.dart';
import '../controllers/game_category_controller.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/game_category_gridview_widget.dart';
import '../widgets/game_category_listview_widget.dart';
import '../widgets/game_category_title_widget.dart';
import '../widgets/like_history_drawer_view.dart';

Widget gameCategoryTitleWidget() {
  var controller = GameCategoryController.to;
  return Container(
    decoration: AoneAppTheme.appTheme.categoryAppBarDecoration ??
        AoneAppTheme.appTheme.gameAppBarDecoration,
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
                  color: AoneAppTheme.appTheme.categoryAppBarIconColor,
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
                  GameAssets.search,
                  height: 20.w,
                  fit: BoxFit.fitHeight,
                  color: AoneAppTheme.appTheme.categoryAppBarIconColor,
                  package: 'generics',
                )),
            GestureDetector(
              onTap: () {
                controller.isNormalListView.value =
                    !controller.isNormalListView.value;
                print(
                    "-------->controller.isNormalListView.value  ${controller.isNormalListView.value}");
              },
              child: Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Image.asset(
                  controller.isNormalListView.value
                      ? GameAssets.menu
                      : GameAssets.menuList,
                  height: 20.w,
                  fit: BoxFit.fitHeight,
                  color: AoneAppTheme.appTheme.categoryAppBarIconColor,
                  package: 'generics',
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
  );
}

Widget gameCategoryCheckWidget() {
  var controller = GameCategoryController.to;
  return Obx(
    ()=> GameCategoryController.to.showDialogOpen
        ? Column(
            children: [
              Container(
                color:AoneAppTheme.appTheme.categoryCheckBg?? Colors.transparent,
                alignment: Alignment.topCenter,
                child: Container(
                    width: Get.width,
                    height: 389 - ScreenUtil().statusBarHeight,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.w),
                    decoration:
                        AoneAppTheme.appTheme.categoryTitleWidgetDecoration ??
                            AoneAppTheme.appTheme.gameAppBarDecoration,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: GameCategoryController.to.type == 2
                          ? GameCategoryController
                              .to.navconfigCategory.subChildren!.length
                          : GameCategoryController
                                  .to.navconfigCategory.subChildren!.length +
                              1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 15.w,
                        crossAxisSpacing: 7.w,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Get.back();
                            GameCategoryController.to.showDialogOpen =
                                !GameCategoryController.to.showDialogOpen;
                            if (index == 0) {
                              Get.back();
                              Get.toNamed(Routes.strongActivity);
                              return;
                            }
                            print('1111-222222-33333.index:$index');
                            // print(GameCategoryController.to.argsments);

                            int realIndex = index;
                            if (controller.type == 6) {
                              realIndex = index - 1;
                            }
                            GameCategoryController.to.argsments =
                                GameCategoryController
                                    .to.navconfigCategory.subChildren![realIndex];

                            GameCategoryController.to
                                .refreshNewFactoryTotalData();
                            // GameCategoryController.to.state.pagingController.refresh();
                          },
                          child: Opacity(
                            opacity: index == 0
                                ? 1
                                : GameCategoryController
                                            .to
                                            .navconfigCategory
                                            .subChildren![
                                                GameCategoryController.to.type ==
                                                        2
                                                    ? index
                                                    : index - 1]
                                            .gameTag ==
                                        GameCategoryController
                                            .to.argsments.gameTag!
                                    ? 1
                                    : 1,
                            child: Column(
                              children: [
                                Container(
                                  width: 65.w,
                                  height: 40.w,
                                  child: DjImage.network(
                                    GameCategoryController.to.gainImageUrl(index),
                                    fit: BoxFit.contain,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const GFLoader();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  index == 0
                                      ? "强档活动"
                                      : GameCategoryController
                                          .to
                                          .navconfigCategory
                                          .subChildren![
                                              GameCategoryController.to.type == 2
                                                  ? index
                                                  : index - 1]
                                          .nameCn!,
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: index == 0
                                          ? AoneAppTheme
                                              .appTheme.categoryTitleWidgetColor
                                          : GameCategoryController
                                                      .to
                                                      .navconfigCategory
                                                      .subChildren![
                                                          GameCategoryController
                                                                      .to.type ==
                                                                  2
                                                              ? index
                                                              : index - 1]
                                                      .gameTag ==
                                                  GameCategoryController
                                                      .to.argsments.gameTag!
                                              ? Colors.white
                                              : AoneAppTheme.appTheme
                                                  .categoryTitleWidgetColor
                                      // : AppTheme.hintColor
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ),
              Expanded(
                  child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  GameCategoryController.to.showDialogOpen = false;
                },
                child: Container(),
              ))
            ],
          )
        : Container(),
  );
}

Widget gameCategoryContentWidget() {
  var controller = GameCategoryController.to;
  print(
      "-------->controller.isNormalListView.value  ${controller.isNormalListView.value}");

  return Obx(() =>  Column(
    children: [
      Container(
        height: 50.r,
        alignment: Alignment.bottomCenter,
        decoration: AoneAppTheme.appTheme.categoryAppBarDecoration ??
            AoneAppTheme.appTheme.gameAppBarDecoration,
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
                      return _menuBtn(
                          controller.state.gameSubClasses[index].name
                              .toString(),
                          index == 0 ? 0 : 8.w,
                          index);
                    }),
              ),
            ),
          ],
        ),
      ),
      Obx(() => Expanded(
            child: controller.isNormalListView.value
                ? const GameCategoryGridviewWidget()
                : const GameCategoryListviewWidget(),
          )),
    ],
  ));
}

//菜单按钮
Widget _menuBtn(String title, double width, int idx) {
  var controller = GameCategoryController.to;

  return Obx(() {
    return GestureDetector(
      onTap: () {
        controller.state.activeSubClass = idx;
        controller.onSelectSubClass(controller.state.gameSubClasses[idx], idx);
        if (UserService.to.state.isRegularUser) {
          FavoriteLogic.to.getFavoriteList();
        }
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
                    color: AoneAppTheme.appTheme.categoryTabIndicatorColor ??
                        Colors.white,
                  ),
                )
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.w,
            color: AoneAppTheme.appTheme.categoryTabTitleColor,
          ),
        ),
      ),
    );
  });
}
