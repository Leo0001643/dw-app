import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:generics/generics.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:keframe/keframe.dart';

import '../../cashier/card_manager_new/widget/no_data.dart';
import '../controllers/game_category_controller.dart';
import 'game_girlview.dart';

class GameCategoryGridviewWidget extends StatelessWidget {
  const GameCategoryGridviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeCacheWidget(
      child: AnimationLimiter(
        child: PagedGridView(
          padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 15.r),
          physics: const BouncingScrollPhysics(),
          pagingController: GameCategoryController.to.state.pagingController,
          showNewPageErrorIndicatorAsGridChild: false,
          showNewPageProgressIndicatorAsGridChild: false,
          showNoMoreItemsIndicatorAsGridChild: false,
          cacheExtent: 1000,
          builderDelegate: PagedChildBuilderDelegate<AllGameItem>(
            transitionDuration: const Duration(milliseconds: 175),
            itemBuilder: (BuildContext context, item, int index) {
              return AnimationConfiguration.staggeredGrid(
                columnCount: ResponsiveValue<int>({
                      smallLandscapeScreenScope: 2,
                      largeLandscapeScreenScope: 3,
                    }).resolve(context) ??
                    2,
                position: index,
                duration: const Duration(milliseconds: 375),
                child: FadeInAnimation(
                  child: ScaleAnimation(
                    scale: 0.5,
                    child: GestureDetector(
                      child: GameGridSpan(item),
                      onTap: () {
                        if (item.state == 3) return;
                        GameCategoryController.to
                            .addhistoryCollection(item.toJson());
                        onBeforeGameInit(
                          onGameParams: item,
                        );
                      },
                    ),
                  ),
                ),
              );
            },
            firstPageProgressIndicatorBuilder: (_) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                  valueColor: AlwaysStoppedAnimation(
                      // AppTheme.primary
                      Colors.blue),
                ),
              );
            },
            newPageProgressIndicatorBuilder: (_) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                  valueColor: AlwaysStoppedAnimation(
                      // AppTheme.primary
                      Colors.blue),
                ),
              );
            },
            noItemsFoundIndicatorBuilder: (_) {
              return Center(
                child: SizedBox(
                  height: 200.r,
                  child: Center(
                    child: NoData(
                      title: '该分类下暂无匹配内容',
                      titleColor: AoneAppTheme.appTheme.gameNoDataTitleColor,
                    ),
                  ),
                ),
              );
            },
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.77,
            crossAxisSpacing: 5.r,
            mainAxisSpacing: 15.r,
            crossAxisCount: ResponsiveValue<int>({
                  smallLandscapeScreenScope: 5,
                  largeLandscapeScreenScope: 3,
                }).resolve(context) ??
                4,
          ),
        ),
      ),
    );
  }
}
