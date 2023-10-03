import 'package:aone_common/common.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/views/games/controllers/game_category_controller.dart';
import 'package:app04/views/games/widgets/game_category_gridview_widget.dart';
import 'package:app04/views/games/widgets/game_category_listview_widget.dart';
import 'package:app04/views/games/widgets/game_category_title_widget.dart';
import 'package:app04/views/games/widgets/home_tap_widget.dart';
import 'package:app04/views/general/widget/drawer_widget.dart';
import 'package:app04/widget/misc/dj_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../../../widget/misc/background_wrapper.dart';
import '../../../widget/tool/light_text.dart';
import '../../general/controllers/home_page_controller.dart';
import '../widgets/like_history_drawer_view.dart';

class GameCategoryView extends StatelessWidget {
  const GameCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteLogic());
    Get.put(GameCategoryController());
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 8.r,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
            ),
          )),
      backgroundColor: Colors.transparent,
      drawer: const LikeHistoryDrawerView(),
      endDrawerEnableOpenDragGesture: false,
      drawerEnableOpenDragGesture: false,
      endDrawer: const GFDrawer(
        child: DrawerWidget(),
      ),

      // key: controller.scaffoldKey,
      body: Builder(builder: (BuildContext context1) {
        return SafeArea(
            bottom: false,
            child: Container(
                color: const Color(0xffF3F4F5),
                child: Column(
                  children: [
                    Obx(() {
                      return Expanded(
                        child: _barView(context1),
                      );
                    }),
                  ],
                )));
      }),
    );
  }

  //bar栏及以下
  Widget _barView(BuildContext context) {
    var controller = GameCategoryController.to;
    printInfo(
        info:
            "   controller.isNormalListView.value  ${controller.isNormalListView.value}");
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
          ),
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
                        size: 25.w,
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
                      child: Container(
                        child: Image.asset(
                          'assets/images/home/search.png',
                        ),
                      )),
                  GestureDetector(
                    onTap: () {
                      controller.isNormalListView.value =
                          !controller.isNormalListView.value;
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 6.w),
                      width: 18.w,
                      height: 18.w,
                      child: Image.asset(
                        controller.isNormalListView.value
                            ? 'assets/images/home/menu.png'
                            : 'assets/images/home/list_icon.png',
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
        Expanded(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 50.r,
                    decoration: BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50.w,
                            child: ListView.builder(
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
                  Expanded(
                    child: controller.isNormalListView.value
                        ? const GameCategoryGridviewWidget()
                        : const GameCategoryListviewWidget(),
                  ),
                ],
              ),
              if (HomePageController.to.showDialogOpen)
                Container(
                    width: Get.width,
                    height: 339.w,
                    decoration: BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: GameCategoryController.to.type == 2
                          ? GameCategoryController
                              .to.navconfigCategory.subChildren!.length
                          : GameCategoryController
                                  .to.navconfigCategory.subChildren!.length +
                              1,
                      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 15.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 15.w,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            HomePageController.to.showDialogOpen =
                                !HomePageController.to.showDialogOpen;
                            if (index == 0) {
                              Get.back();
                              Get.toNamed(Routes.strongActivity);
                              return;
                            }
                            print('1111-222222-33333');
                            print(GameCategoryController.to.argsments);

                            GameCategoryController.to.argsments =
                                GameCategoryController
                                    .to.navconfigCategory.subChildren![index];

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
                                            .subChildren![GameCategoryController
                                                        .to.type ==
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
                                DjImage.network(
                                  GameCategoryController.to
                                      .gainImageUrl(index),
                                  width: 40.w,
                                  height: 40.w,
                                  fit: BoxFit.contain,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const GFLoader();
                                  },
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                LightText.buildColorFont(
                                    index == 0
                                        ? "强档活动"
                                        : GameCategoryController
                                            .to
                                            .navconfigCategory
                                            .subChildren![GameCategoryController
                                                        .to.type ==
                                                    2
                                                ? index
                                                : index - 1]
                                            .nameCn!,
                                    index == 0
                                        ? AppTheme.filterTextColor
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
                                            : AppTheme.filterTextColor,
                                    12.w)
                              ],
                            ),
                          ),
                        );
                      },
                    )),
            ],
          ),
        ),
      ],
    );
  }

  //菜单按钮
  Widget _menuBtn(String title, double width, int idx) {
    var controller = GameCategoryController.to;
    return Obx(() {
      return GestureDetector(
        onTap: () {
          controller.state.activeSubClass = idx;
          controller.onSelectSubClass(
              controller.state.gameSubClasses[idx], idx);
          FavoriteLogic.to.getFavoriteList();
        },
        child: Container(
          margin: EdgeInsets.only(left: width),
          width: 72.w,
          height: 28.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: controller.state.activeSubClass == idx
                ? Border(bottom: BorderSide(color: Colors.white, width: 2.r))
                : null,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: controller.state.activeSubClass == idx
                  ? Colors.white
                  : const Color(0xffCCCCCC),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    });
  }
}
