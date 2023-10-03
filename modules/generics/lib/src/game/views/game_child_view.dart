import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../controllers/game_category_controller.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/game_category_gridview_widget.dart';
import '../widgets/game_category_listview_widget.dart';
import '../widgets/game_category_title_widget.dart';
import '../widgets/game_child_widget.dart';
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
      body: Builder(builder: (BuildContext context1) {
        var controller = GameCategoryController.to;
        return SafeArea(
            bottom: false,
            child: Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    //title
                    gameChildTitleWidget(),
                    //选择table
                    gameChildTableWidget(),
                    //游戏列表
                    Expanded(
                      child: controller.isNormalListView.value ? const GameCategoryGridviewWidget() : const GameCategoryListviewWidget(),
                    ),
                  ],
                )));
      }),
    );
  }
}
