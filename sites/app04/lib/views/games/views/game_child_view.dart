import 'package:aone_common/common.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/views/games/controllers/game_category_controller.dart';
import 'package:app04/views/games/widgets/game_category_gridview_widget.dart';
import 'package:app04/views/games/widgets/game_category_listview_widget.dart';
import 'package:app04/views/games/widgets/game_category_title_widget.dart';
import 'package:app04/views/general/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../widgets/like_history_drawer_view.dart';

class GameChildView extends StatelessWidget {
  const GameChildView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteLogic());
    Get.put(GameCategoryController());
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 8.r,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                stringToColor('13805E'),
                stringToColor('06C285'),
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
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
                color: AppTheme.backgroundColor,
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
              gradient: LinearGradient(colors: [
            stringToColor('13805E'),
            stringToColor('06C285'),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
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
        Container(
          height: 50.r,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            stringToColor('13805E'),
            stringToColor('06C285'),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  height: 30.w,
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
          // decoration: BoxDecoration(
          //   color: controller.state.activeSubClass == idx
          //       ? Colors.blue
          //       : const Color.fromRGBO(215, 225, 241, 1),
          //   borderRadius: BorderRadius.circular(4),
          // ),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: controller.state.activeSubClass == idx
                    ? Colors.white
                    : AppTheme.hintColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    });
  }
}
