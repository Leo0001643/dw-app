import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../controllers/game_category_controller.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/game_category_widget.dart';
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
        elevation: 0,
        flexibleSpace: Container(decoration: AoneAppTheme.appTheme.categoryAppBarDecoration ?? AoneAppTheme.appTheme.gameAppBarDecoration),
      ),
      backgroundColor: Colors.transparent,
      drawer: const LikeHistoryDrawerView(),
      endDrawerEnableOpenDragGesture: false,
      drawerEnableOpenDragGesture: false,
      endDrawer: const GFDrawer(child: DrawerWidget()),
      body: Builder(builder: (BuildContext context1) {
        return Container(
            color: AoneAppTheme.appTheme.categoryBg,
            child: Column(
              children: [
                //游戏列表头部
                gameCategoryTitleWidget(),
                Expanded(
                  child: Stack(
                    children: [
                      //游戏列表内容
                      gameCategoryContentWidget(),
                      //厂商选择
                      gameCategoryCheckWidget()
                    ],
                  ),
                )
              ],
            ));
      }),
    );
  }
}
